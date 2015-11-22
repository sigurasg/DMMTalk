/*
 * timer.c
 *
 *  Created on: Jun 6, 2015
 *      Author: siggi
 */

#include <msp430.h>
#include "timer.h"

#define nullptr (void*)0

// The low part of ticks is the TA0R register.
volatile static int16_t ticks_hi = 0;

// The first-in line timer, if any.
static struct Timer* first;

ticks_t GetTicks() {
  int16_t hi;
  uint16_t lo;
  for (;;) {
    hi = ticks_hi;
    lo = TA0R;

    if (hi == ticks_hi)
      break;
  }

  return ((ticks_t)hi << 16) | lo;
}

void Schedule(struct Timer* t) {
  __istate_t state = __get_interrupt_state();
  __disable_interrupt();

  if (!first || (t->ticks - first->ticks) < 0) {
    t->next = first;
    first = t;

    // The first-in-line timer changed. It may be scheduled for the past,
    // so fire an interrupt to potentially execute and re-schedule.
    TA0CCTL0 |= CCIFG;
  } else {
    struct Timer* curr = first;
    // Pre: t->time >= first->time.
    for (; curr->next; curr = curr ->next) {
      if ((t->ticks - curr->next->ticks) < 0) {
        t->next = curr->next;
        curr->next = t;
        curr = nullptr;
        break;
      }
    }

    if (curr != nullptr) {
      t->next = nullptr;
      curr->next = t;
    }
  }

  __set_interrupt_state (state);
}

void InitTimer() {
  // Timer 0 is used for the timer service,
  // set it up for regular interrupts.
  TA0CTL = TASSEL_2 |  // Use SMCLK.
      ID_0 |  // Divide by 1.
      MC_2 |  // Continuous mode.
      TAIE;  // Enable overflow interrupts.
}

static void ScheduleNextTimerInterrupt() {
  int16_t first_hi = first->ticks >> 16;
  if (!first || (first_hi - ticks_hi) > 0) {
    // Disable the CCR0 interrupt for now.
    TA0CCTL0 &= ~CCIE;
    return;
  }

  if ((first_hi - ticks_hi) == 0) {
    // The first task is in the immediate future, schedule a timer to run it.
    TA0CCTL0 |= CCIE;
    TA0CCR0 = first->ticks & 0xFFFF;
    if (TAR > TA0CCR0)
      TA0CCTL0 |= CCIFG;
  } else {
    // The first task is in the past, schedule an immediate interrupt.
    TA0CCTL0 |= CCIE | CCIFG;
  }
}

static void OnTimerOverflow() {
  // Overflow interrupt.
  ++ticks_hi;

  ScheduleNextTimerInterrupt();
}

static void OnTimerInterrupt() {
  ticks_t time = ((ticks_t)ticks_hi << 16) | TA0R;

  while (first && (time - first->ticks) >= 0) {
    struct Timer* curr = first;
    first = first->next;
    curr->exec(curr);
  }

  ScheduleNextTimerInterrupt();
}

ISR(TIMER0_A0, TA0CCR0_INT) {
  OnTimerInterrupt();
}

ISR(TIMER0_A1, TA0_INT) {
  if (TAIV == TA0IV_TAIFG)
    OnTimerOverflow();
}
