/*
 * buttons.c
 *
 *  Created on: 2015-10-24
 *      Author: siggi
 */
#include <msp430.h>
#include "ports.h"
#include "timer.h"
#include "led_pwm.h"

static RGB led = { 128, 127, 127, 127 };
static uint8_t mode = 0;

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

  InitLEDPWM();
}

static void DebounceButton(struct Timer* timer) {
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

static const int8_t dir[16] = {
    0,   // 00 00
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

static void Adjust(int adj, uint8_t* value) {
  if (adj == -1 && *value == 0)
    return;
  if (adj == 1 && *value == 255)
    return;
  *value += adj;
}

void OnEncoderInterrupt(uint8_t mask) {
  static uint8_t last_q = 0;
  uint8_t q = P2IN & (Q_A | Q_B);

  // Set up for the next quadrature change.
  P2IES = (P2IES & ~(Q_A | Q_B)) | q;

  int adj = dir[last_q | q];
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
