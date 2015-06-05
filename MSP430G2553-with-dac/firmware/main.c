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

uint32_t GetTime() {
  uint16_t hi;
  uint16_t lo;
  for (;;) {
      hi = rolls;
      lo = TA0R;

      if (hi == rolls)
	break;
  }

  return (uint32_t)hi << 16 | lo;
}

struct Timer {
  uint32_t time;
  void (*exec)(struct Timer*);
  struct Timer* next;
};

struct Timer* first;

void Schedule(struct Timer* t) {
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
	    t->time = curr->next;
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

  __enable_interrupt();
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

void BlinkLEDs(struct Timer* t) {
  P2OUT ^= (RLED | GLED | BLED);

  t->time += 8000000;
  Schedule(t);
}

struct Timer led_timer = { 0, BlinkLEDs, nullptr };

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
}
