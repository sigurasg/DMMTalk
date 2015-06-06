/*
 * main.c
 *
 *  Created on: Jun 2, 2015
 *      Author: siggi
 */

#include <msp430.h>
#include <isr_compat.h>
#include <stdint.h>

#define nullptr 0

static uint16_t rolls = 0;

typedef int32_t time_t;

time_t GetTime() {
  uint16_t hi;
  uint16_t lo;
  for (;;) {
      hi = rolls;
      lo = TA0R;

      if (hi == rolls)
	break;
  }

  return ((time_t)hi << 16) | lo;
}

struct Timer {
  time_t time;
  void (*exec)(struct Timer*);
  struct Timer* next;
};

struct Timer* first;

void Schedule(struct Timer* t) {
  __istate_t state = __get_interrupt_state();
  __disable_interrupt();

  if (!first || t->time < first->time) {
      t->next = first;
      first = t;

      // The first-in-line timer changed, schedule an interrupt to re-schedule.
      TA0CCTL0 |= CCIFG;
  } else {
      struct Timer* curr = first;
      // Pre: t->time >= first->time.
      for (; curr->next; curr = curr ->next) {
	  if (t->time < curr->next->time) {
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

// Hardware pins.
#define Q_A BIT2
#define Q_B BIT3
#define BUTTON BIT4

// The LEDs are inverted, pull-down to turn on.
#define RLED BIT5
#define GLED BIT6
#define BLED BIT7

void InitClock() {
  // 16MHz DCO for main clock.
  BCSCTL1 = CALBC1_16MHZ;
  DCOCTL = CALDCO_16MHZ;
}

void InitTimer0() {
  // Set timer0 up for regular interrupts.
  TA0CTL = TASSEL_2 |  // Use SMCLK.
	   ID_0 |  // Divide by 1.
	   MC_2 |  // Continuous mode.
	   TAIE;  // Enable overflow interrupts.
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

typedef struct RGB {
  uint8_t intens;
  uint8_t r, g, b;
} RGB;

RGB led = { 128, 127, 127, 127 };
uint8_t mode = 0;

static void BlinkLEDs(struct Timer* t);
struct LEDTimerSchedule {
  // The current state 0-3.
  uint8_t state;
  // Mask of the LEDs that are on at any stage, ends in a zero mask.
  uint8_t masks[4];
  // The delay to the next state.
  uint32_t delays[4];
};
struct LEDTimerSchedule led_schedule;
struct LEDTimerSchedule next_led_schedule = {
    0,
    { RLED | GLED | BLED, 0 },
    { 1250Ul * 127, 1250Ul * 128 }
};
struct Timer led_timer = { 0, BlinkLEDs, nullptr };

// Blink the LEDs 50 times/second.
const uint32_t period = 16000000 / 50;

static void SetLEDs(uint8_t mode, const RGB* led) {
  uint8_t values[3] = {0};
  uint8_t masks[3] = { RLED, GLED, BLED };
  uint8_t i, j, max;
  struct LEDTimerSchedule sch = {0};

  if (mode == 0 || mode == 1)
    values[0] = ((uint16_t)led->intens * led->r) >> 8;
  if (mode == 0 || mode == 2)
    values[1] = ((uint16_t)led->intens * led->g) >> 8;
  if (mode == 0 || mode == 3)
    values[2] = ((uint16_t)led->intens * led->b) >> 8;

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
	    sch.delays[j] = 1250ul * (values[i] - max);
	    sch.masks[j++] = masks[i];
	    max = values[i];
	  }
      }
  }
  sch.delays[j] = 1250ul * (256ul - max);

  next_led_schedule = sch;
}

static void BlinkLEDs(struct Timer* t) {
  uint8_t mask = led_schedule.masks[led_schedule.state];
  P2OUT &= ~(RLED | GLED | BLED);
  P2OUT |= (RLED | GLED | BLED) & ~mask;
  t->time += led_schedule.delays[led_schedule.state++];
  Schedule(t);

  if (mask == 0) {
      led_schedule = next_led_schedule;
      led_schedule.state = 0;
  }
}

static void ScheduleNextTimerInterrupt() {
  if (!first || (first->time >> 16) > rolls) {
      // Disable the CCR0 interrupt for now.
      TA0CCTL0 &= ~CCIE;
      return;
  }

  if ((first->time >> 16) < rolls) {
      TA0CCTL0 |= CCIE | CCIFG;
  } else {
      TA0CCTL0 |= CCIE;
      TA0CCR0 = first->time & 0xFFFF;
      if (TAR > TA0CCR0)
	TA0CCTL0 |= CCIFG;
  }
}

ISR(TIMER0_A1, TA0_INT) {
  if (TAIV == TA0IV_TAIFG) {
    // Overflow interrupt.
    ++rolls;

    ScheduleNextTimerInterrupt();
  }
}

ISR(TIMER0_A0, TA0CCR0_INT) {
  uint32_t time = (uint32_t)rolls << 16 | TA0R;

  while (first && time >= first->time) {
    struct Timer* curr = first;
    first = first->next;
    curr->exec(curr);
  }

  ScheduleNextTimerInterrupt();
}

void DebounceButton(struct Timer* timer) {
  // Re-enable the button interrupt.
  P2IE |= BUTTON;
}

struct Timer debounce_timer = { 0, DebounceButton };

void OnButtonPress() {
  P2IE &= ~BUTTON;
  // 100ms de-bounce.
  debounce_timer.time = GetTime() + 1600000;
  Schedule(&debounce_timer);


  ++mode;
  if (mode == 4)
    mode = 0;

  SetLEDs(mode, &led);
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

int main() {
  // Disable the watchdog.
  WDTCTL = WDTPW | WDTHOLD;

  InitClock();
  InitTimer0();
  InitLEDPort();
  InitButtons();

  Schedule(&led_timer);

  // Enable interrupts and go to sleep.
  __enable_interrupt();

  // LPM1 is just right, as it keeps the DCO going.
  LPM1;

  return 0;
}
