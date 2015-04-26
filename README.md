# DMMTalk

A battery-powered appendix to UNI-T 61E that speaks the settings and readings.

# TODO

* Add photodiode and amplifier for serial reception.
* Add button.
* Add volume control.
  * These two might take the form of a quadrature encoder with a button.
* Add headphone jack.
* Find a suitable SPI FLASH ROM.
  * Maybe [AT45DB081E
](http://www.adestotech.com/wp-content/uploads/DS-45DB081E_028.pdf)
  * Create a library component for same.
* Wire MSP430G2553 up.
  * RST/TEST go to RTS/CTS through resistors to allow BSL.
  * Need to find out how FT230 behaves without power, hopefully its outputs are
    3-state.
  * Even if it's tri-state, it'll conduct through the ESD protection diode, so
    this requires a switch to isolate the powered-down serial chip from
    the reset pin, as well as the TEST pin, to make sure in-circuit programming
    through the two-wire protocol works. Maybe something like
    http://www.onsemi.com/pub_link/Collateral/NL7WB66-D.PDF.
  * UCA0 or UCB0 drives the SPI bus.
  * One pin controls the analog power switch.
* Find suitable rail-to-rail op-amps.
  * Need 1.8V operating voltage at the bottom.
  * Need reasonable output current drive capability.
  * Maybe a bridge-drive headphone or speaker amp is better?
