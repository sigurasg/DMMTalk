/*
 * main.c
 *
 *  Created on: Jun 2, 2015
 *      Author: siggi
 */

#include <msp430.h>
#include <isr_compat.h>
#include <stdint.h>

#include "buttons.h"
#include "ports.h"
#include "serial.h"
#include "timer.h"

void InitClock() {
  // 16MHz DCO for main clock.
  BCSCTL1 = CALBC1_16MHZ;
  DCOCTL = CALDCO_16MHZ;
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
  InitTimer();
  InitSerial();
  InitButtons();

  // Enable interrupts and go to sleep.
  __enable_interrupt();

  // LPM1 is just right, as it keeps the DCO going.
  LPM1;

  return 0;
}
