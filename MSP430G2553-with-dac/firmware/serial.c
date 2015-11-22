/*
 * serial.c
 *
 *  Created on: 2015-11-01
 *      Author: siggi
 */
#include "serial.h"
#include "ports.h"

void InitSerial() {
  // Timer 1 is used for soft serial in/out,
  // set it up for continuous up counting.
  TA1CTL = TASSEL_2 |  // Use SMCLK.
      ID_0 |  // Divide by 1.
      MC_2;   // Continuous mode.
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

