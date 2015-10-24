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
#include "buttons.h"

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

ISR(TIMER0_A0, TA0CCR0_INT) {
  OnTimerInterrupt();
}

ISR(TIMER0_A1, TA0_INT) {
  if (TAIV == TA0IV_TAIFG)
    OnTimerOverflow();
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
