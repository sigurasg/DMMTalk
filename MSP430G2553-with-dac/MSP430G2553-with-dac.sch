EESchema Schematic File Version 2
LIBS:MSP430G2553-with-dac-rescue
LIBS:DMMTalk
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
LIBS:MSP430G2553-with-dac-cache
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
L MSP430G2553IN20 U1
U 1 1 55495E5B
P 4100 2450
F 0 "U1" H 2600 3050 40  0000 C CNN
F 1 "MSP430G2553IN20" H 5350 1900 40  0000 C CNN
F 2 "Housings_DIP:DIP-20__300_ELL" H 2650 1900 35  0001 C CIN
F 3 "" H 4050 2450 60  0000 C CNN
	1    4100 2450
	1    0    0    -1  
$EndComp
$Comp
L MCP4922-E/P U2
U 1 1 55495EAF
P 8100 3350
F 0 "U2" H 7700 3750 50  0000 L CNN
F 1 "MCP4922-E/P" H 8250 3750 50  0000 L CNN
F 2 "Housings_DIP:DIP-14__300_ELL" H 8100 3350 50  0001 C CIN
F 3 "" H 8100 3350 50  0000 C CNN
	1    8100 3350
	1    0    0    -1  
$EndComp
$Comp
L MX25L4006E IC1
U 1 1 55496635
P 8150 1650
F 0 "IC1" H 7850 2100 40  0000 C CNN
F 1 "MX25L4006E" H 8450 1200 40  0000 C CNN
F 2 "Housings_DIP:DIP-8__300_ELL" H 8150 1650 30  0001 C CIN
F 3 "" H 8150 1650 60  0000 C CNN
	1    8150 1650
	1    0    0    -1  
$EndComp
$Comp
L Battery BT1
U 1 1 55496743
P 1300 4200
F 0 "BT1" H 1400 4250 50  0000 L CNN
F 1 "Battery" H 1400 4150 50  0000 L CNN
F 2 "Connect:bornier2" V 1300 4240 60  0001 C CNN
F 3 "" V 1300 4240 60  0000 C CNN
	1    1300 4200
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X06 P1
U 1 1 55496BAD
P 1300 5200
F 0 "P1" H 1300 5550 50  0000 C CNN
F 1 "DEBUG" V 1400 5200 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06" H 1300 5200 60  0001 C CNN
F 3 "" H 1300 5200 60  0000 C CNN
	1    1300 5200
	1    0    0    -1  
$EndComp
Text Label 1100 4950 2    60   ~ 0
VCC
Text Label 1100 5150 2    60   ~ 0
RST#
Text Label 1100 5050 2    60   ~ 0
TEST
Text Label 1100 5250 2    60   ~ 0
RXD
Text Label 1100 5350 2    60   ~ 0
TXD
$Comp
L VCC #PWR01
U 1 1 554A98B8
P 1300 3950
F 0 "#PWR01" H 1300 3800 50  0001 C CNN
F 1 "VCC" H 1300 4100 50  0000 C CNN
F 2 "" H 1300 3950 60  0000 C CNN
F 3 "" H 1300 3950 60  0000 C CNN
	1    1300 3950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 554A98D1
P 1300 4450
F 0 "#PWR02" H 1300 4200 50  0001 C CNN
F 1 "GND" H 1300 4300 50  0000 C CNN
F 2 "" H 1300 4450 60  0000 C CNN
F 3 "" H 1300 4450 60  0000 C CNN
	1    1300 4450
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR03
U 1 1 554A9971
P 8150 1100
F 0 "#PWR03" H 8150 950 50  0001 C CNN
F 1 "VCC" H 8150 1250 50  0000 C CNN
F 2 "" H 8150 1100 60  0000 C CNN
F 3 "" H 8150 1100 60  0000 C CNN
	1    8150 1100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 554A99D5
P 8150 2200
F 0 "#PWR04" H 8150 1950 50  0001 C CNN
F 1 "GND" H 8150 2050 50  0000 C CNN
F 2 "" H 8150 2200 60  0000 C CNN
F 3 "" H 8150 2200 60  0000 C CNN
	1    8150 2200
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR05
U 1 1 554A9A6B
P 4100 1750
F 0 "#PWR05" H 4100 1600 50  0001 C CNN
F 1 "VCC" H 4100 1900 50  0000 C CNN
F 2 "" H 4100 1750 60  0000 C CNN
F 3 "" H 4100 1750 60  0000 C CNN
	1    4100 1750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 554A9A93
P 4100 3100
F 0 "#PWR06" H 4100 2850 50  0001 C CNN
F 1 "GND" H 4100 2950 50  0000 C CNN
F 2 "" H 4100 3100 60  0000 C CNN
F 3 "" H 4100 3100 60  0000 C CNN
	1    4100 3100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 554A9AE0
P 8000 3850
F 0 "#PWR07" H 8000 3600 50  0001 C CNN
F 1 "GND" H 8000 3700 50  0000 C CNN
F 2 "" H 8000 3850 60  0000 C CNN
F 3 "" H 8000 3850 60  0000 C CNN
	1    8000 3850
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR08
U 1 1 554A9AF9
P 8000 2850
F 0 "#PWR08" H 8000 2700 50  0001 C CNN
F 1 "VCC" H 8000 3000 50  0000 C CNN
F 2 "" H 8000 2850 60  0000 C CNN
F 3 "" H 8000 2850 60  0000 C CNN
	1    8000 2850
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR09
U 1 1 554A9B12
P 8200 2850
F 0 "#PWR09" H 8200 2700 50  0001 C CNN
F 1 "VCC" H 8200 3000 50  0000 C CNN
F 2 "" H 8200 2850 60  0000 C CNN
F 3 "" H 8200 2850 60  0000 C CNN
	1    8200 2850
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR010
U 1 1 554A9B2B
P 8200 3850
F 0 "#PWR010" H 8200 3700 50  0001 C CNN
F 1 "VCC" H 8200 4000 50  0000 C CNN
F 2 "" H 8200 3850 60  0000 C CNN
F 3 "" H 8200 3850 60  0000 C CNN
	1    8200 3850
	-1   0    0    1   
$EndComp
Text Label 2400 2000 2    60   ~ 0
RST#
Text Label 5800 2000 0    60   ~ 0
TEST
$Comp
L R R1
U 1 1 554AA555
P 1200 6000
F 0 "R1" V 1280 6000 50  0000 C CNN
F 1 "47K" V 1200 6000 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 1130 6000 30  0001 C CNN
F 3 "" H 1200 6000 30  0000 C CNN
	1    1200 6000
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 554AA576
P 1200 6450
F 0 "C1" H 1225 6550 50  0000 L CNN
F 1 "1n" H 1225 6350 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 1238 6300 30  0001 C CNN
F 3 "" H 1200 6450 60  0000 C CNN
	1    1200 6450
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR011
U 1 1 554AA5A5
P 1200 5850
F 0 "#PWR011" H 1200 5700 50  0001 C CNN
F 1 "VCC" H 1200 6000 50  0000 C CNN
F 2 "" H 1200 5850 60  0000 C CNN
F 3 "" H 1200 5850 60  0000 C CNN
	1    1200 5850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR012
U 1 1 554AA5C9
P 1200 6600
F 0 "#PWR012" H 1200 6350 50  0001 C CNN
F 1 "GND" H 1200 6450 50  0000 C CNN
F 2 "" H 1200 6600 60  0000 C CNN
F 3 "" H 1200 6600 60  0000 C CNN
	1    1200 6600
	1    0    0    -1  
$EndComp
Text Label 1200 6250 2    60   ~ 0
RST#
$Comp
L PEL12T SW1
U 1 1 554AAFA4
P 8100 4950
F 0 "SW1" H 8100 5350 60  0000 C CNN
F 1 "PEL12T" H 8100 4550 60  0000 C CNN
F 2 "Footprints:PEL12T" H 8100 4950 60  0000 C CNN
F 3 "" H 8100 4950 60  0000 C CNN
	1    8100 4950
	1    0    0    -1  
$EndComp
Text Label 5800 2550 0    60   ~ 0
SCK
Text Label 7500 3150 2    60   ~ 0
SDI
Text Label 7500 3250 2    60   ~ 0
SCK
Text Label 7500 3350 2    60   ~ 0
DACCS#
$Comp
L GND #PWR013
U 1 1 554AB11E
P 7400 3650
F 0 "#PWR013" H 7400 3400 50  0001 C CNN
F 1 "GND" H 7400 3500 50  0000 C CNN
F 2 "" H 7400 3650 60  0000 C CNN
F 3 "" H 7400 3650 60  0000 C CNN
	1    7400 3650
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR014
U 1 1 554AB16E
P 7300 3500
F 0 "#PWR014" H 7300 3350 50  0001 C CNN
F 1 "VCC" H 7300 3650 50  0000 C CNN
F 2 "" H 7300 3500 60  0000 C CNN
F 3 "" H 7300 3500 60  0000 C CNN
	1    7300 3500
	1    0    0    -1  
$EndComp
Text Label 5800 2350 0    60   ~ 0
SDI
Text Label 5800 2250 0    60   ~ 0
SDO
Text Label 7550 1750 2    60   ~ 0
SCK
Text Label 7550 1850 2    60   ~ 0
SDI
Text Label 7550 1950 2    60   ~ 0
SDO
Text Label 7550 1550 2    60   ~ 0
FLASHCS#
$Comp
L VCC #PWR015
U 1 1 554AC56B
P 7450 1200
F 0 "#PWR015" H 7450 1050 50  0001 C CNN
F 1 "VCC" H 7450 1350 50  0000 C CNN
F 2 "" H 7450 1200 60  0000 C CNN
F 3 "" H 7450 1200 60  0000 C CNN
	1    7450 1200
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 554ACC55
P 7400 4750
F 0 "R2" V 7480 4750 50  0000 C CNN
F 1 "220" V 7400 4750 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 7330 4750 30  0001 C CNN
F 3 "" H 7400 4750 30  0000 C CNN
	1    7400 4750
	0    1    1    0   
$EndComp
$Comp
L R R3
U 1 1 554ACC81
P 7400 4850
F 0 "R3" V 7480 4850 50  0000 C CNN
F 1 "220" V 7400 4850 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 7330 4850 30  0001 C CNN
F 3 "" H 7400 4850 30  0000 C CNN
	1    7400 4850
	0    1    1    0   
$EndComp
$Comp
L R R4
U 1 1 554ACCD7
P 7400 5050
F 0 "R4" V 7480 5050 50  0000 C CNN
F 1 "220" V 7400 5050 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 7330 5050 30  0001 C CNN
F 3 "" H 7400 5050 30  0000 C CNN
	1    7400 5050
	0    1    1    0   
$EndComp
$Comp
L VCC #PWR016
U 1 1 554ACD1D
P 6850 4700
F 0 "#PWR016" H 6850 4550 50  0001 C CNN
F 1 "VCC" H 6850 4850 50  0000 C CNN
F 2 "" H 6850 4700 60  0000 C CNN
F 3 "" H 6850 4700 60  0000 C CNN
	1    6850 4700
	1    0    0    -1  
$EndComp
Text Label 7250 4750 2    60   ~ 0
RLED
Text Label 7250 4850 2    60   ~ 0
GLED
Text Label 7250 5050 2    60   ~ 0
BLED
Text Label 7550 4950 2    60   ~ 0
BUTTON
$Comp
L GND #PWR017
U 1 1 554ACF6A
P 9000 5050
F 0 "#PWR017" H 9000 4800 50  0001 C CNN
F 1 "GND" H 9000 4900 50  0000 C CNN
F 2 "" H 9000 5050 60  0000 C CNN
F 3 "" H 9000 5050 60  0000 C CNN
	1    9000 5050
	1    0    0    -1  
$EndComp
Text Label 8700 4800 0    60   ~ 0
Q_A
Text Label 8700 5100 0    60   ~ 0
Q_B
Text Label 5800 2650 0    60   ~ 0
PH_IN
Text Label 2400 2150 2    60   ~ 0
RXD
Text Label 2400 2250 2    60   ~ 0
TXD
Text Label 2400 2350 2    60   ~ 0
Q_A
Text Label 2400 2450 2    60   ~ 0
Q_B
Text Label 2400 2550 2    60   ~ 0
BUTTON
Text Label 2400 2650 2    60   ~ 0
RLED
Text Label 2400 2750 2    60   ~ 0
GLED
Text Label 2400 2850 2    60   ~ 0
BLED
Text Label 5800 2150 0    60   ~ 0
DACCS#
Text Label 5800 2450 0    60   ~ 0
FLASHCS#
$Comp
L CONN_01X03 P2
U 1 1 554AF0A3
P 2000 5100
F 0 "P2" H 2000 5300 50  0000 C CNN
F 1 "OUT" V 2100 5100 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03" H 2000 5100 60  0001 C CNN
F 3 "" H 2000 5100 60  0000 C CNN
	1    2000 5100
	1    0    0    -1  
$EndComp
Text Label 8700 3150 0    60   ~ 0
A_OUT
Text Label 8700 3550 0    60   ~ 0
B_OUT
Text Label 1800 5000 2    60   ~ 0
A_OUT
Text Label 1800 5100 2    60   ~ 0
B_OUT
$Comp
L VCC #PWR018
U 1 1 554AF510
P 1850 3950
F 0 "#PWR018" H 1850 3800 50  0001 C CNN
F 1 "VCC" H 1850 4100 50  0000 C CNN
F 2 "" H 1850 3950 60  0000 C CNN
F 3 "" H 1850 3950 60  0000 C CNN
	1    1850 3950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR019
U 1 1 554AF530
P 1850 4450
F 0 "#PWR019" H 1850 4200 50  0001 C CNN
F 1 "GND" H 1850 4300 50  0000 C CNN
F 2 "" H 1850 4450 60  0000 C CNN
F 3 "" H 1850 4450 60  0000 C CNN
	1    1850 4450
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 554AF55C
P 1850 4200
F 0 "C2" H 1875 4300 50  0000 L CNN
F 1 "100n" H 1875 4100 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 1888 4050 30  0001 C CNN
F 3 "" H 1850 4200 60  0000 C CNN
	1    1850 4200
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 554AF584
P 2150 4200
F 0 "C3" H 2175 4300 50  0000 L CNN
F 1 "100n" H 2175 4100 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 2188 4050 30  0001 C CNN
F 3 "" H 2150 4200 60  0000 C CNN
	1    2150 4200
	1    0    0    -1  
$EndComp
$Comp
L C C4
U 1 1 554AF5A9
P 2500 4200
F 0 "C4" H 2525 4300 50  0000 L CNN
F 1 "100n" H 2525 4100 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 2538 4050 30  0001 C CNN
F 3 "" H 2500 4200 60  0000 C CNN
	1    2500 4200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR020
U 1 1 554B20B7
P 1750 5250
F 0 "#PWR020" H 1750 5000 50  0001 C CNN
F 1 "GND" H 1750 5100 50  0000 C CNN
F 2 "" H 1750 5250 60  0000 C CNN
F 3 "" H 1750 5250 60  0000 C CNN
	1    1750 5250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR021
U 1 1 554B20E9
P 1000 5500
F 0 "#PWR021" H 1000 5250 50  0001 C CNN
F 1 "GND" H 1000 5350 50  0000 C CNN
F 2 "" H 1000 5500 60  0000 C CNN
F 3 "" H 1000 5500 60  0000 C CNN
	1    1000 5500
	1    0    0    -1  
$EndComp
$Comp
L Q_PNP_CBE-RESCUE-MSP430G2553-with-dac Q1
U 1 1 554B34B6
P 4500 4950
F 0 "Q1" H 4800 5000 50  0000 R CNN
F 1 "2N3906" H 5000 4900 50  0000 R CNN
F 2 "Housings_SOT-23_SOT-143_TSOT-6:SOT-23_Handsoldering" H 4700 5050 29  0001 C CNN
F 3 "" H 4500 4950 60  0000 C CNN
	1    4500 4950
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X02 P3
U 1 1 554B3571
P 5000 5300
F 0 "P3" H 5000 5450 50  0000 C CNN
F 1 "PHOTODIODE" V 5100 5300 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 5000 5300 60  0001 C CNN
F 3 "" H 5000 5300 60  0000 C CNN
	1    5000 5300
	1    0    0    -1  
$EndComp
$Comp
L R R6
U 1 1 554B35F7
P 4800 4700
F 0 "R6" V 4880 4700 50  0000 C CNN
F 1 "100K" V 4800 4700 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 4730 4700 30  0001 C CNN
F 3 "" H 4800 4700 30  0000 C CNN
	1    4800 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 6300 1200 6150
Wire Wire Line
	7400 3650 7400 3450
Wire Wire Line
	7400 3450 7500 3450
Wire Wire Line
	7500 3550 7300 3550
Wire Wire Line
	7300 3550 7300 3500
Wire Wire Line
	7450 1450 7550 1450
Wire Wire Line
	7450 1200 7450 1450
Wire Wire Line
	7550 1350 7450 1350
Connection ~ 7450 1350
Wire Wire Line
	7550 5150 6850 5150
Wire Wire Line
	6850 5150 6850 4700
Wire Wire Line
	8700 4950 9000 4950
Wire Wire Line
	9000 4950 9000 5050
Wire Wire Line
	1300 3950 1300 4050
Wire Wire Line
	1300 4350 1300 4450
Wire Wire Line
	1850 4350 1850 4450
Wire Wire Line
	1850 4400 2500 4400
Wire Wire Line
	2500 4400 2500 4350
Wire Wire Line
	2150 4350 2150 4400
Connection ~ 2150 4400
Connection ~ 1850 4400
Wire Wire Line
	1850 4050 1850 3950
Wire Wire Line
	1850 4000 2500 4000
Wire Wire Line
	2500 4000 2500 4050
Connection ~ 1850 4000
Wire Wire Line
	2150 4050 2150 4000
Connection ~ 2150 4000
Wire Wire Line
	1800 5200 1750 5200
Wire Wire Line
	1750 5200 1750 5250
Wire Wire Line
	1000 5500 1000 5450
Wire Wire Line
	1000 5450 1100 5450
Wire Wire Line
	4800 4850 4800 5250
Wire Wire Line
	4800 4950 4700 4950
Wire Wire Line
	4400 4750 4400 4450
Wire Wire Line
	4400 4450 4800 4450
Wire Wire Line
	4800 4450 4800 4550
$Comp
L R R5
U 1 1 554B3739
P 4400 5450
F 0 "R5" V 4480 5450 50  0000 C CNN
F 1 "100K" V 4400 5450 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 4330 5450 30  0001 C CNN
F 3 "" H 4400 5450 30  0000 C CNN
	1    4400 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 5300 4400 5150
Wire Wire Line
	4400 5600 4400 5800
Wire Wire Line
	4800 5800 4800 5350
Connection ~ 4800 4950
Wire Wire Line
	4400 5800 4800 5800
$Comp
L GND #PWR022
U 1 1 554B3939
P 4400 5800
F 0 "#PWR022" H 4400 5550 50  0001 C CNN
F 1 "GND" H 4400 5650 50  0000 C CNN
F 2 "" H 4400 5800 60  0000 C CNN
F 3 "" H 4400 5800 60  0000 C CNN
	1    4400 5800
	1    0    0    -1  
$EndComp
Text Label 4400 5250 2    60   ~ 0
PH_IN
NoConn ~ 5800 2750
NoConn ~ 5800 2850
$Comp
L PWR_FLAG #FLG023
U 1 1 554B68AE
P 1650 3400
F 0 "#FLG023" H 1650 3495 50  0001 C CNN
F 1 "PWR_FLAG" H 1650 3580 50  0000 C CNN
F 2 "" H 1650 3400 60  0000 C CNN
F 3 "" H 1650 3400 60  0000 C CNN
	1    1650 3400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR024
U 1 1 554B6981
P 1650 3400
F 0 "#PWR024" H 1650 3150 50  0001 C CNN
F 1 "GND" H 1650 3250 50  0000 C CNN
F 2 "" H 1650 3400 60  0000 C CNN
F 3 "" H 1650 3400 60  0000 C CNN
	1    1650 3400
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR025
U 1 1 554B6C6A
P 1350 3350
F 0 "#PWR025" H 1350 3200 50  0001 C CNN
F 1 "VCC" H 1350 3500 50  0000 C CNN
F 2 "" H 1350 3350 60  0000 C CNN
F 3 "" H 1350 3350 60  0000 C CNN
	1    1350 3350
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG026
U 1 1 554B6C91
P 1350 3350
F 0 "#FLG026" H 1350 3445 50  0001 C CNN
F 1 "PWR_FLAG" H 1350 3530 50  0000 C CNN
F 2 "" H 1350 3350 60  0000 C CNN
F 3 "" H 1350 3350 60  0000 C CNN
	1    1350 3350
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR027
U 1 1 554B6F75
P 4400 4450
F 0 "#PWR027" H 4400 4300 50  0001 C CNN
F 1 "VCC" H 4400 4600 50  0000 C CNN
F 2 "" H 4400 4450 60  0000 C CNN
F 3 "" H 4400 4450 60  0000 C CNN
	1    4400 4450
	1    0    0    -1  
$EndComp
$EndSCHEMATC
