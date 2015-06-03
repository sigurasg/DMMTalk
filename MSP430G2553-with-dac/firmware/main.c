/*
 * main.c
 *
 *  Created on: Jun 2, 2015
 *      Author: siggi
 */

#include <msp430.h>
#include <isr_compat.h>
#include <stdint.h>

#define Q_A BIT2
#define Q_B BIT3
#define BUTTON BIT4

#define RLED BIT5
#define GLED BIT6
#define BLED BIT7

void InitClock() {
  // 16MHz clock.
  BCSCTL1 = CALBC1_16MHZ;
  DCOCTL = CALDCO_16MHZ;
}

void InitTimer0() {
  // Set timer0 up for regular interrupts.
  TA0CTL = TASSEL_2 |  // Use SMCLK.
	   ID_0 |  // Divide by 1.
	   MC_2 ;  // Count to 0xFFFF.

  // Use CCR0 for LED blinking.
  // 16MHz/5000 = 3.2kHz interrupt rate.
  TA0CCR0 = 5000;

  // Compare mode, interrupt enabled.
  TA0CCTL0 = CCIE;
}

void InitLEDPort() {
  P2SEL	&= ~(RLED | GLED | BLED);
  P2DIR |= RLED | GLED | BLED;
  P2OUT |= RLED | GLED | BLED;
}

void InitButtons() {
  // Button and quadrature switches are inputs.
  P2DIR &= ~(Q_A | Q_B | BUTTON);
  // Enable pulldown resistor for the button, and pullups
  // for the quadrature switches.
  P2OUT &= ~BUTTON;
  P2OUT |= Q_A | Q_B;
  P2REN |= (Q_A | Q_B | BUTTON);

  // Set up for interrupt on button high->low transitions.
  P2IES |= BUTTON;

  // And for quadrature changes.
  P2IES |= (P2IN & (Q_A | Q_B)) ^ (Q_A | Q_B);

  // Enable the port interrupts.
  P2IE |= (Q_A | Q_B | BUTTON);
}

typedef struct RGB {
  uint8_t r, g, b;
} RGB;

RGB led = { 128, 128, 128 };
RGB save;
uint8_t mode = 0;
uint8_t interrupt_count = 0;

ISR(TIMER0_A0, TA0CCR0_INT) {
  // Set up the next interrupt.
  TA0CCR0 += 500;

  uint8_t state = ++interrupt_count;
  if (state == 0)
    P2OUT &= ~(RLED | GLED |BLED);

  if (state == led.r)
    P2OUT |= RLED;
  if (state == led.g)
    P2OUT |= GLED;
  if (state >= led.b)
    P2OUT |= BLED;
}

void OnButtonPress() {
  switch (mode) {
    case 0:
      save = led;
      led.g = led.b = 0;
      break;

    case 1:
      save.r = led.r;
      led.r = 0;
      led.g = save.g;
      break;

    case 2:
      save.g = led.g;
      led.g = 0;
      led.b = save.b;
      break;

    case 3:
      save.b = led.b;
      led = save;
      break;
  }

  ++mode;
  if (mode == 4)
    mode = 0;
}

static const int8_t dir[16] = {
    0,   // 0b0000
    -1,  // 0b0001
    1,   // 0b0010
    0,   // 0b0011
    1,   // 0b0100
    0,   // 0b0101
    0,   // 0b0110
    -1,  // 0b0111
    -1,  // 0b1000
    0,   // 0b1001
    0,   // 0b1010
    1,   // 0b1011
    0,   // 0b1100
    1,   // 0b1101
    -1,  // 0b1110
    0,   // 0b1111
};

void OnEncoderInterrupt(uint8_t mask) {
  static uint8_t last_q = 0;
  uint8_t q = P2IN & (Q_A | Q_B);

  // Set up for the next quadrature change.
  P2IES |=  q ^ (Q_A | Q_B);

  int adj = dir[last_q | q];
  last_q = q >> 2;


  switch (mode) {
    case 0:
      led.r += adj;
      led.g += adj;
      led.b += adj;
      break;
    case 1:
      led.r += adj;
      break;
    case 2:
      led.g += adj;
      break;
    case 3:
      led.b += adj;
      break;
  }
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

int main() {
  // Disable the watchdog.
  WDTCTL = WDTPW | WDTHOLD;

  InitClock();
  InitTimer0();
  InitLEDPort();
  InitButtons();

  // Enable interrupts and go to sleep.
  __enable_interrupt();
  LPM1;
}
