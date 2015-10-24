/*
 * main.c
 *
 *  Created on: Jun 2, 2015
 *      Author: siggi
 */

#include <msp430.h>
#include <isr_compat.h>
#include <stdint.h>

#include "timer.h"
#include "ports.h"
#include "led_pwm.h"

void InitClock() {
  // 16MHz DCO for main clock.
  BCSCTL1 = CALBC1_16MHZ;
  DCOCTL = CALDCO_16MHZ;
}

// Timer 0 is used for the timer service.
void InitTimer0() {
  // Set timer0 up for regular interrupts.
  TA0CTL = TASSEL_2 |  // Use SMCLK.
      ID_0 |  // Divide by 1.
      MC_2 |  // Continuous mode.
      TAIE;  // Enable overflow interrupts.
}

// Timer 1 is used for soft serial in/out.
void InitTimer1() {
  // Set timer0 up for regular interrupts.
  TA1CTL = TASSEL_2 |  // Use SMCLK.
      ID_0 |  // Divide by 1.
      MC_2;   // Continuous mode.
}

void InitButtons() {
  // Button and quadrature switches are inputs.
  P2DIR &= ~(Q_A | Q_B | BUTTON);
  // Enable pulldown resistor for the button, and pullups
  // for the quadrature switches.
  P2REN |= (Q_A | Q_B | BUTTON);
  P2OUT &= ~BUTTON;
  P2OUT |= Q_A | Q_B;

  // Set up for interrupt on button low->high transition.
  // The button is N/O, connected to VCC with a pulldown.
  P2IES &= ~BUTTON;

  // And for quadrature changes.
  P2IES = (P2IES & ~(Q_A | Q_B)) | (P2IN & (Q_A | Q_B));

  // Enable the port interrupts.
  P2IE |= (Q_A | Q_B | BUTTON);
}

ISR(TIMER0_A0, TA0CCR0_INT) {
  OnTimerInterrupt();
}

ISR(TIMER0_A1, TA0_INT) {
  if (TAIV == TA0IV_TAIFG)
    OnTimerOverflow();
}

static RGB led = { 128, 127, 127, 127 };
static uint8_t mode = 0;

void DebounceButton(struct Timer* timer) {
  // Re-enable the button interrupt.
  P2IE |= BUTTON;
  if ((P2IN & BUTTON) == 0)
    return;

  ++mode;
  if (mode == 4)
    mode = 0;

  SetLEDs(mode, &led);
}

struct Timer debounce_timer = { 0, DebounceButton };

void OnButtonPress() {
  // Disable the button interrupt.
  P2IE &= ~BUTTON;
  // 10ms de-bounce.
  debounce_timer.ticks = GetTicks() + 160000;
  Schedule(&debounce_timer);
}

static const int8_t dir[16] = { 0,   // 00 00
    -1,  // 00 01
    1,   // 00 10
    0,   // 00 11
    1,   // 01 00
    0,   // 01 01
    0,   // 01 10
    -1,  // 01 11
    -1,  // 10 00
    0,   // 10 01
    0,   // 10 10
    1,   // 10 11
    0,   // 11 00
    1,   // 11 01
    -1,  // 11 10
    0,   // 11 11
    };

uint32_t pos = 0;
uint32_t neg = 0;
uint32_t zero = 0;

static void Adjust(int adj, uint8_t* value) {
  if (adj == -1 && *value == 0)
    return;
  if (adj == 1 && *value == 255)
    return;
  *value += adj;
}

static void OnEncoderInterrupt(uint8_t mask) {
  static uint8_t last_q = 0;
  uint8_t q = P2IN & (Q_A | Q_B);

  // Set up for the next quadrature change.
  P2IES = (P2IES & ~(Q_A | Q_B)) | q;

  int adj = dir[last_q | q];
  switch (adj) {
    case -1:
      ++neg;
      break;
    case 1:
      ++pos;
      break;
    case 0:
      ++zero;
      break;
  }

  last_q = q >> 2;

  if (adj == 0)
    return;

  switch (mode) {
    case 0:
      Adjust(adj, &led.intens);
      break;
    case 1:
      Adjust(adj, &led.r);
      break;
    case 2:
      Adjust(adj, &led.g);
      break;
    case 3:
      Adjust(adj, &led.b);
      break;
  }

  SetLEDs(mode, &led);
}

ISR(PORT2, PORT2INT) {
  // Acknowledge the interrupt.
  uint8_t ports = P2IFG;
  P2IFG ^= ports;

  if (ports & BUTTON)
    OnButtonPress();
  else if (ports & (Q_A | Q_B))
    OnEncoderInterrupt(ports & (Q_A | Q_B));
}

#define BIT_CYCLES (16000000ul/9600)
static void TimerSerial(uint8_t character) {
  uint8_t bits;
  uint16_t now;

  __istate_t state = __get_interrupt_state();
  __disable_interrupt();

  // Set timer1 up for continuous up counting.
  TA1CTL = TASSEL_2 |  // Use SMCLK.
      ID_0 |  // Divide by 1.
      MC_2;  // Continuous mode.

  // Set the timer output bit high.
  TA1CCTL1 = OUTMOD_0 | OUT;

  // Setup P2.1 for outputting TA1.1.
  P2OUT |= TX;
  P2SEL |= TX;
  P2SEL2 &= ~TX;
  P2DIR |= TX;

  // Wait a bit time - then set the output low to begin the start bit.
  now = TA1R;
  TA1CCR1 = now + BIT_CYCLES;
  TA1CCTL1 = OUTMOD_5 | OUT;

  while ((TA1CCTL1 & CCIFG) == 0)
    ;

  for (bits = 0; bits < 8; ++bits) {
    TA1CCR1 += BIT_CYCLES;
    if (character & 0x1) {
      TA1CCTL1 = OUTMOD_1;
    } else {
      TA1CCTL1 = OUTMOD_5;
    }
    character >>= 1;
    // Wait a bit time.
    while ((TA1CCTL1 & CCIFG) == 0)
      ;
  }

  // Stop bit.
  TA1CCR1 += BIT_CYCLES;
  TA1CCTL1 = OUTMOD_1;
  while ((TA1CCTL1 & CCIFG) == 0)
    ;

  __set_interrupt_state(state);
}

static void BitBangSerial(uint8_t character) {
  uint8_t bits;

  __istate_t state = __get_interrupt_state();
  __disable_interrupt();

  // Set the output bit high.
  P2DIR |= TX;

  // Output the start bit.
  P2OUT &= ~TX;
  __delay_cycles(BIT_CYCLES);

  for (bits = 0; bits < 8; ++bits) {
    if (character & 0x1) {
      P2OUT |= TX;
    } else {
      P2OUT &= ~TX;
    }
    character >>= 1;
    __delay_cycles(BIT_CYCLES);
  }

  // Stop bit.
  P2OUT |= TX;
  __delay_cycles(BIT_CYCLES);

  __set_interrupt_state(state);
}

int main() {
  // Disable the watchdog.
  WDTCTL = WDTPW | WDTHOLD;

  InitClock();
  InitTimer0();
  InitButtons();

  InitLEDPWM();

  // Enable interrupts and go to sleep.
  __enable_interrupt();

  // LPM1 is just right, as it keeps the DCO going.
  LPM1;

  return 0;
}
