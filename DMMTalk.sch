EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:msp430
LIBS:ftdi
LIBS:DMMTalk-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MSP430G2553IPW20 U?
U 1 1 55343200
P 3550 5200
F 0 "U?" H 2050 5800 40  0000 C CNN
F 1 "MSP430G2553IPW20" H 4800 4650 40  0000 C CNN
F 2 "20PW" H 2100 4650 35  0000 C CIN
F 3 "" H 3500 5200 60  0000 C CNN
	1    3550 5200
	1    0    0    -1  
$EndComp
$Comp
L BATTERY BT?
U 1 1 55343241
P 1200 1700
F 0 "BT?" H 1200 1900 50  0000 C CNN
F 1 "BATTERY" H 1200 1510 50  0000 C CNN
F 2 "" H 1200 1700 60  0000 C CNN
F 3 "" H 1200 1700 60  0000 C CNN
	1    1200 1700
	0    1    1    0   
$EndComp
$Comp
L USB-MINI-B CON?
U 1 1 5534343A
P 9650 2850
F 0 "CON?" H 9400 3300 60  0000 C CNN
F 1 "USB-MICRO-B" H 9600 2350 60  0000 C CNN
F 2 "" H 9650 2850 60  0000 C CNN
F 3 "" H 9650 2850 60  0000 C CNN
	1    9650 2850
	-1   0    0    -1  
$EndComp
$Comp
L MCP4921-E/MS U?
U 1 1 55343564
P 4700 1950
F 0 "U?" H 4700 2300 40  0000 L BNN
F 1 "MCP4921-E/MS" H 4700 2250 40  0000 L BNN
F 2 "MSOP8" H 4700 1950 30  0000 C CIN
F 3 "" H 4700 1950 60  0000 C CNN
	1    4700 1950
	1    0    0    -1  
$EndComp
$Comp
L SPEAKER SP?
U 1 1 553436B7
P 7800 2050
F 0 "SP?" H 7700 2300 70  0000 C CNN
F 1 "SPEAKER" H 7700 1800 70  0000 C CNN
F 2 "" H 7800 2050 60  0000 C CNN
F 3 "" H 7800 2050 60  0000 C CNN
	1    7800 2050
	1    0    0    -1  
$EndComp
$Comp
L MOSFET_P Q?
U 1 1 5534372E
P 2450 2100
F 0 "Q?" H 2450 2290 60  0000 R CNN
F 1 "MOSFET_P" H 2450 1920 60  0000 R CNN
F 2 "" H 2450 2100 60  0000 C CNN
F 3 "" H 2450 2100 60  0000 C CNN
	1    2450 2100
	0    -1   -1   0   
$EndComp
$Comp
L DOUBLE_SCH_KCOM D?
U 1 1 553437CF
P 1850 1300
F 0 "D?" H 2000 1175 60  0000 C CNN
F 1 "DOUBLE_SCH_KCOM" H 1850 1450 60  0000 C CNN
F 2 "" H 1850 1300 60  0000 C CNN
F 3 "" H 1850 1300 60  0000 C CNN
	1    1850 1300
	1    0    0    -1  
$EndComp
$Comp
L FT230XS U?
U 1 1 5534398E
P 9900 5350
F 0 "U?" H 9400 4800 60  0000 C CNN
F 1 "FT230XS" H 10250 5900 60  0000 C CNN
F 2 "SSOP-16" H 9900 5350 60  0000 C CNN
F 3 "" H 9900 5350 60  0000 C CNN
	1    9900 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	10200 3150 10200 3400
Wire Wire Line
	7250 2550 7050 2550
Wire Wire Line
	7250 2150 7500 2150
Wire Wire Line
	7500 1950 7250 1950
Wire Wire Line
	7250 1950 7250 1550
Wire Wire Line
	7250 1550 7050 1550
Text Label 3550 4500 0    60   ~ 0
POW
$Comp
L GND #PWR?
U 1 1 55343F04
P 10200 3400
F 0 "#PWR?" H 10200 3400 30  0001 C CNN
F 1 "GND" H 10200 3330 30  0001 C CNN
F 2 "" H 10200 3400 60  0000 C CNN
F 3 "" H 10200 3400 60  0000 C CNN
	1    10200 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 6050 10000 6050
Wire Wire Line
	9900 6050 9900 6150
Connection ~ 9900 6050
$Comp
L GND #PWR?
U 1 1 5534409B
P 9900 6150
F 0 "#PWR?" H 9900 6150 30  0001 C CNN
F 1 "GND" H 9900 6080 30  0001 C CNN
F 2 "" H 9900 6150 60  0000 C CNN
F 3 "" H 9900 6150 60  0000 C CNN
	1    9900 6150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 553440C3
P 6450 1950
F 0 "#PWR?" H 6450 1950 30  0001 C CNN
F 1 "GND" H 6450 1880 30  0001 C CNN
F 2 "" H 6450 1950 60  0000 C CNN
F 3 "" H 6450 1950 60  0000 C CNN
	1    6450 1950
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR?
U 1 1 553440D7
P 9150 4950
F 0 "#PWR?" H 9150 4910 30  0001 C CNN
F 1 "+3.3V" H 9150 5060 30  0000 C CNN
F 2 "" H 9150 4950 60  0000 C CNN
F 3 "" H 9150 4950 60  0000 C CNN
	1    9150 4950
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR?
U 1 1 55344447
P 1200 2000
F 0 "#PWR?" H 1200 2000 30  0001 C CNN
F 1 "GND" H 1200 1930 30  0001 C CNN
F 2 "" H 1200 2000 60  0000 C CNN
F 3 "" H 1200 2000 60  0000 C CNN
	1    1200 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 1400 1200 1300
Wire Wire Line
	1200 1300 1450 1300
Wire Wire Line
	1850 1500 1850 2450
Wire Wire Line
	1850 2000 2250 2000
$Comp
L +3.3V #PWR?
U 1 1 55344A27
P 2250 1300
F 0 "#PWR?" H 2250 1260 30  0001 C CNN
F 1 "+3.3V" H 2250 1410 30  0000 C CNN
F 2 "" H 2250 1300 60  0000 C CNN
F 3 "" H 2250 1300 60  0000 C CNN
	1    2250 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 1700 2500 1700
Connection ~ 1850 1700
$Comp
L VCC #PWR?
U 1 1 55344AB9
P 2500 1700
F 0 "#PWR?" H 2500 1800 30  0001 C CNN
F 1 "VCC" H 2500 1800 30  0000 C CNN
F 2 "" H 2500 1700 60  0000 C CNN
F 3 "" H 2500 1700 60  0000 C CNN
	1    2500 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 2000 2900 2000
$Comp
L VAA #PWR?
U 1 1 55344B2A
P 2900 2000
F 0 "#PWR?" H 2900 2060 30  0001 C CNN
F 1 "VAA" H 2900 2110 30  0000 C CNN
F 2 "" H 2900 2000 60  0000 C CNN
F 3 "" H 2900 2000 60  0000 C CNN
	1    2900 2000
	1    0    0    -1  
$EndComp
$Comp
L VAA #PWR?
U 1 1 55344B3E
P 4600 1550
F 0 "#PWR?" H 4600 1610 30  0001 C CNN
F 1 "VAA" H 4600 1660 30  0000 C CNN
F 2 "" H 4600 1550 60  0000 C CNN
F 3 "" H 4600 1550 60  0000 C CNN
	1    4600 1550
	1    0    0    -1  
$EndComp
$Comp
L LM358 U?
U 2 1 55344B83
P 6550 2550
F 0 "U?" H 6500 2750 60  0000 L CNN
F 1 "LM358" H 6500 2300 60  0000 L CNN
F 2 "" H 6550 2550 60  0000 C CNN
F 3 "" H 6550 2550 60  0000 C CNN
	2    6550 2550
	1    0    0    -1  
$EndComp
$Comp
L LM358 U?
U 1 1 55344BCB
P 6550 1550
F 0 "U?" H 6500 1750 60  0000 L CNN
F 1 "LM358" H 6500 1300 60  0000 L CNN
F 2 "" H 6550 1550 60  0000 C CNN
F 3 "" H 6550 1550 60  0000 C CNN
	1    6550 1550
	1    0    0    -1  
$EndComp
$Comp
L VAA #PWR?
U 1 1 55344C02
P 6450 1150
F 0 "#PWR?" H 6450 1210 30  0001 C CNN
F 1 "VAA" H 6450 1260 30  0000 C CNN
F 2 "" H 6450 1150 60  0000 C CNN
F 3 "" H 6450 1150 60  0000 C CNN
	1    6450 1150
	1    0    0    -1  
$EndComp
$Comp
L VAA #PWR?
U 1 1 55344C16
P 6450 2150
F 0 "#PWR?" H 6450 2210 30  0001 C CNN
F 1 "VAA" H 6450 2260 30  0000 C CNN
F 2 "" H 6450 2150 60  0000 C CNN
F 3 "" H 6450 2150 60  0000 C CNN
	1    6450 2150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 55344C34
P 6450 2950
F 0 "#PWR?" H 6450 2950 30  0001 C CNN
F 1 "GND" H 6450 2880 30  0001 C CNN
F 2 "" H 6450 2950 60  0000 C CNN
F 3 "" H 6450 2950 60  0000 C CNN
	1    6450 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 2150 7250 2550
$Comp
L GND #PWR?
U 1 1 55344DD3
P 4600 2350
F 0 "#PWR?" H 4600 2350 30  0001 C CNN
F 1 "GND" H 4600 2280 30  0001 C CNN
F 2 "" H 4600 2350 60  0000 C CNN
F 3 "" H 4600 2350 60  0000 C CNN
	1    4600 2350
	1    0    0    -1  
$EndComp
$Comp
L VAA #PWR?
U 1 1 55344E55
P 4800 2350
F 0 "#PWR?" H 4800 2410 30  0001 C CNN
F 1 "VAA" H 4800 2460 30  0000 C CNN
F 2 "" H 4800 2350 60  0000 C CNN
F 3 "" H 4800 2350 60  0000 C CNN
	1    4800 2350
	-1   0    0    1   
$EndComp
$Comp
L R R?
U 1 1 55344FB0
P 2200 2450
F 0 "R?" V 2280 2450 40  0000 C CNN
F 1 "R" V 2207 2451 40  0000 C CNN
F 2 "" V 2130 2450 30  0000 C CNN
F 3 "" H 2200 2450 30  0000 C CNN
	1    2200 2450
	0    1    1    0   
$EndComp
Wire Wire Line
	2450 2450 2450 2300
Wire Wire Line
	1850 2450 1950 2450
Connection ~ 1850 2000
$Comp
L VCC #PWR?
U 1 1 553452DF
P 3550 4500
F 0 "#PWR?" H 3550 4600 30  0001 C CNN
F 1 "VCC" H 3550 4600 30  0000 C CNN
F 2 "" H 3550 4500 60  0000 C CNN
F 3 "" H 3550 4500 60  0000 C CNN
	1    3550 4500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 55345308
P 3550 5850
F 0 "#PWR?" H 3550 5850 30  0001 C CNN
F 1 "GND" H 3550 5780 30  0001 C CNN
F 2 "" H 3550 5850 60  0000 C CNN
F 3 "" H 3550 5850 60  0000 C CNN
	1    3550 5850
	1    0    0    -1  
$EndComp
Text Label 10650 4950 0    60   ~ 0
TXD
Text Label 10650 5050 0    60   ~ 0
RXT
Text Label 10650 5150 0    60   ~ 0
RTS#
Text Label 10650 5250 0    60   ~ 0
CTS#
Text Label 10200 2550 0    60   ~ 0
VBUS
Wire Wire Line
	9100 2550 9100 3400
Connection ~ 9100 2700
Connection ~ 9100 3000
Text Label 10200 2700 0    60   ~ 0
USBD_N
Text Label 10200 2850 0    60   ~ 0
USBD_P
Connection ~ 9100 3150
$Comp
L GND #PWR?
U 1 1 55344769
P 9100 3400
F 0 "#PWR?" H 9100 3400 30  0001 C CNN
F 1 "GND" H 9100 3330 30  0001 C CNN
F 2 "" H 9100 3400 60  0000 C CNN
F 3 "" H 9100 3400 60  0000 C CNN
	1    9100 3400
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 553448B0
P 8900 5250
F 0 "R?" V 8980 5250 40  0000 C CNN
F 1 "27" V 8907 5251 40  0000 C CNN
F 2 "" V 8830 5250 30  0000 C CNN
F 3 "" H 8900 5250 30  0000 C CNN
	1    8900 5250
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 55344929
P 8900 5350
F 0 "R?" V 8980 5350 40  0000 C CNN
F 1 "27" V 8907 5351 40  0000 C CNN
F 2 "" V 8830 5350 30  0000 C CNN
F 3 "" H 8900 5350 30  0000 C CNN
	1    8900 5350
	0    1    1    0   
$EndComp
Text Label 8200 5250 2    60   ~ 0
USBD_N
Text Label 8200 5350 2    60   ~ 0
USBD_P
$Comp
L CP1 C?
U 1 1 55344F09
P 8650 4400
F 0 "C?" H 8700 4500 50  0000 L CNN
F 1 "47uF" H 8700 4300 50  0000 L CNN
F 2 "" H 8650 4400 60  0000 C CNN
F 3 "" H 8650 4400 60  0000 C CNN
	1    8650 4400
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 55344F5A
P 7650 4350
F 0 "C?" H 7650 4450 40  0000 L CNN
F 1 "10nF" H 7656 4265 40  0000 L CNN
F 2 "" H 7688 4200 30  0000 C CNN
F 3 "" H 7650 4350 60  0000 C CNN
	1    7650 4350
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 55344FA9
P 8950 4400
F 0 "C?" H 8950 4500 40  0000 L CNN
F 1 "100nF" H 8956 4315 40  0000 L CNN
F 2 "" H 8988 4250 30  0000 C CNN
F 3 "" H 8950 4400 60  0000 C CNN
	1    8950 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 4550 7650 4700
Wire Wire Line
	7650 4700 8950 4700
Wire Wire Line
	8650 4600 8650 4800
Wire Wire Line
	8950 4700 8950 4600
Connection ~ 8650 4700
$Comp
L GND #PWR?
U 1 1 553450CA
P 8650 4800
F 0 "#PWR?" H 8650 4800 30  0001 C CNN
F 1 "GND" H 8650 4730 30  0001 C CNN
F 2 "" H 8650 4800 60  0000 C CNN
F 3 "" H 8650 4800 60  0000 C CNN
	1    8650 4800
	1    0    0    -1  
$EndComp
$Comp
L FILTER FB?
U 1 1 553450FD
P 8100 4050
F 0 "FB?" H 8100 4200 60  0000 C CNN
F 1 "FILTER" H 8100 3950 60  0000 C CNN
F 2 "" H 8100 4050 60  0000 C CNN
F 3 "" H 8100 4050 60  0000 C CNN
	1    8100 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 4150 7650 4050
Wire Wire Line
	7550 4050 7750 4050
Wire Wire Line
	8450 4050 9800 4050
Wire Wire Line
	8950 4050 8950 4200
Wire Wire Line
	8650 4200 8650 4050
Connection ~ 8650 4050
$Comp
L +3.3V #PWR?
U 1 1 55345F52
P 9150 5550
F 0 "#PWR?" H 9150 5510 30  0001 C CNN
F 1 "+3.3V" H 9150 5660 30  0000 C CNN
F 2 "" H 9150 5550 60  0000 C CNN
F 3 "" H 9150 5550 60  0000 C CNN
	1    9150 5550
	0    -1   -1   0   
$EndComp
$Comp
L +3.3V #PWR?
U 1 1 55345F66
P 10000 4650
F 0 "#PWR?" H 10000 4610 30  0001 C CNN
F 1 "+3.3V" H 10000 4760 30  0000 C CNN
F 2 "" H 10000 4650 60  0000 C CNN
F 3 "" H 10000 4650 60  0000 C CNN
	1    10000 4650
	1    0    0    -1  
$EndComp
Connection ~ 7650 4050
Text Label 7550 4050 2    60   ~ 0
VBUS
Wire Wire Line
	9800 4050 9800 4650
Connection ~ 8950 4050
Wire Wire Line
	8200 5350 8650 5350
Wire Wire Line
	8650 5250 8200 5250
$Comp
L C C?
U 1 1 55346FDF
P 8300 5700
F 0 "C?" H 8300 5800 40  0000 L CNN
F 1 "47pF" H 8306 5615 40  0000 L CNN
F 2 "" H 8338 5550 30  0000 C CNN
F 3 "" H 8300 5700 60  0000 C CNN
	1    8300 5700
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 5534700A
P 8550 5700
F 0 "C?" H 8550 5800 40  0000 L CNN
F 1 "47pF" H 8556 5615 40  0000 L CNN
F 2 "" H 8588 5550 30  0000 C CNN
F 3 "" H 8550 5700 60  0000 C CNN
	1    8550 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 5500 8300 5250
Connection ~ 8300 5250
Wire Wire Line
	8550 5500 8550 5350
Connection ~ 8550 5350
$Comp
L GND #PWR?
U 1 1 553471BB
P 8550 5900
F 0 "#PWR?" H 8550 5900 30  0001 C CNN
F 1 "GND" H 8550 5830 30  0001 C CNN
F 2 "" H 8550 5900 60  0000 C CNN
F 3 "" H 8550 5900 60  0000 C CNN
	1    8550 5900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 553471F1
P 8300 5900
F 0 "#PWR?" H 8300 5900 30  0001 C CNN
F 1 "GND" H 8300 5830 30  0001 C CNN
F 2 "" H 8300 5900 60  0000 C CNN
F 3 "" H 8300 5900 60  0000 C CNN
	1    8300 5900
	1    0    0    -1  
$EndComp
$EndSCHEMATC
