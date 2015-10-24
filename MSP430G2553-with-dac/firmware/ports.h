#ifndef PORTS_H_
#define PORTS_H_

#define nullptr 0


// Port 2
// @{

// Hardware pins.
#define RX BIT0
#define TX BIT1

#define Q_A BIT2
#define Q_B BIT3
#define BUTTON BIT4

// The LEDs are inverted, pull down to turn LEDs on.
#define RLED BIT5
#define GLED BIT6
#define BLED BIT7
#define LEDMASK (RLED | GLED | BLED)

// @}

#endif PORTS_H_
