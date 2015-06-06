/*
 * timer.h
 *
 *  Created on: Jun 6, 2015
 *      Author: siggi
 */

#ifndef TIMER_H_
#define TIMER_H_

#include <stdint.h>

typedef int32_t ticks_t;

struct Timer {
  ticks_t ticks;
  void (*exec)(struct Timer*);
  struct Timer* next;
};

extern ticks_t GetTicks();
extern void Schedule(struct Timer* t);

extern void OnTimerInterrupt();
extern void OnTimerOverflow();

#endif /* TIMER_H_ */
