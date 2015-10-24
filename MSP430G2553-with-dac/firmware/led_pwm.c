/*
 * led_pwm.c
 *
 *  Created on: 2015-10-24
 *      Author: siggi
 */

#include <msp430.h>
#include <stdint.h>
#include "led_pwm.h"
#include "ports.h"
#include "timer.h"

static void PWMLEDs(struct Timer* t);
struct LEDTimerSchedule {
  // The current state 0-3.
  uint8_t state;
  // Mask of the LEDs that are on at any stage, ends in a zero mask.
  uint8_t masks[4];
  // The delay to the next state.
  uint32_t delays[4];
};
struct LEDTimerSchedule led_schedule;
struct LEDTimerSchedule next_led_schedule = { 0, { LEDMASK, 0 }, { 625Ul * 127,
    625Ul * 128 } };
struct Timer led_timer = { 0, PWMLEDs, nullptr };

void SetLEDs(uint8_t mode, const RGB* led) {
  uint8_t values[3] = { 0 };
  uint8_t masks[3] = { RLED, GLED, BLED };
  uint8_t i, j, max;
  struct LEDTimerSchedule sch = { 0 };

  if (mode == 0 || mode == 1)
    values[0] = ((uint16_t) led->intens * led->r) >> 8;
  if (mode == 0 || mode == 2)
    values[1] = ((uint16_t) led->intens * led->g) >> 8;
  if (mode == 0 || mode == 3)
    values[2] = ((uint16_t) led->intens * led->b) >> 8;

  for (i = 0; i < 2; ++i) {
    for (j = i; j < 3; ++j) {
      if (values[i] > values[j]) {
        uint8_t tmp = values[i];
        values[i] = values[j];
        values[j] = tmp;
        tmp = masks[i];
        masks[i] = masks[j];
        masks[j] = tmp;
      }
    }
  }

  masks[1] |= masks[2];
  masks[0] |= masks[1];

  j = 0;
  max = 0;
  for (i = 0; i < 3; ++i) {
    if (values[i]) {
      if (values[i] != max) {
        sch.delays[j] = 625ul * (values[i] - max);
        sch.masks[j++] = masks[i];
        max = values[i];
      }
    }
  }
  sch.delays[j] = 625ul * (256ul - max);

  next_led_schedule = sch;
}

static void PWMLEDs(struct Timer* t) {
  uint8_t mask = led_schedule.masks[led_schedule.state];
  P2OUT = (P2OUT & ~LEDMASK) | (LEDMASK & ~mask);
  t->ticks += led_schedule.delays[led_schedule.state++];
  Schedule(t);

  if (mask == 0) {
    led_schedule = next_led_schedule;
    led_schedule.state = 0;
  }
}

void InitLEDPWM() {
  // Init the LED output pins.
  P2SEL &= ~LEDMASK;
  P2DIR |= LEDMASK;
  P2OUT |= LEDMASK;

  Schedule(&led_timer);
}
