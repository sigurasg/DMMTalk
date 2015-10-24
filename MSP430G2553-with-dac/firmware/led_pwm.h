/*
 * led_pwm.h
 *
 *  Created on: 2015-10-24
 *      Author: siggi
 */

#ifndef LED_PWM_H_
#define LED_PWM_H_

typedef struct RGB {
  uint8_t intens;
  uint8_t r, g, b;
} RGB;

extern void InitLEDPWM();
extern void SetLEDs(uint8_t mode, const RGB* led);

#endif /* LED_PWM_H_ */
