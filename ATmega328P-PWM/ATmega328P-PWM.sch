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
LIBS:powerint
LIBS:Power_Management
LIBS:DMMTalk
LIBS:ATmega328P-PWM-cache
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
L ATMEGA328P-M IC1
U 1 1 56393F59
P 3650 2450
F 0 "IC1" H 2900 3700 40  0000 L BNN
F 1 "ATMEGA328P-M" H 4050 1050 40  0000 L BNN
F 2 "Housings_QFP:TQFP-32_7x7mm_Pitch0.8mm" H 3650 2450 30  0000 C CIN
F 3 "" H 3650 2450 60  0000 C CNN
	1    3650 2450
	1    0    0    -1  
$EndComp
$Comp
L CONN_02X03 P1
U 1 1 563E31FA
P 1450 1800
F 0 "P1" H 1450 2000 50  0000 C CNN
F 1 "AVR_ISP" H 1450 1600 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_2x03" H 1450 600 60  0001 C CNN
F 3 "" H 1450 600 60  0000 C CNN
	1    1450 1800
	1    0    0    -1  
$EndComp
Text Label 1200 1700 2    60   ~ 0
MISO
Text Label 1200 1800 2    60   ~ 0
SCK
Text Label 1200 1900 2    60   ~ 0
RESET
Text Label 1700 1700 0    60   ~ 0
VCC
Text Label 1700 1800 0    60   ~ 0
MOSI
Text Label 1700 1900 0    60   ~ 0
GND
Text Label 4650 1750 0    60   ~ 0
MISO
Text Label 4650 1650 0    60   ~ 0
MOSI
Text Label 4650 2800 0    60   ~ 0
/RESET
Text Label 4650 1850 0    60   ~ 0
SCK
Text Label 2750 3450 2    60   ~ 0
GND
Text Label 2750 3550 2    60   ~ 0
GND
Text Label 2750 3650 2    60   ~ 0
GND
Text Label 2750 1350 2    60   ~ 0
VCC
Text Label 2750 1450 2    60   ~ 0
VCC
$Comp
L Q_PMOS_GSD Q1
U 1 1 5651EA74
P 1900 6700
F 0 "Q1" V 2100 6750 50  0000 R CNN
F 1 "IRLML6401" V 1750 6900 50  0000 R CNN
F 2 "Housings_SOT-23_SOT-143_TSOT-6:SOT-23" H 2100 6800 29  0001 C CNN
F 3 "" H 1900 6700 60  0000 C CNN
	1    1900 6700
	0    1    -1   0   
$EndComp
Wire Wire Line
	1300 6600 1700 6600
Text Label 1300 6600 2    60   ~ 0
VCC
Wire Wire Line
	2100 6600 2300 6600
Text Label 2300 6600 0    60   ~ 0
VAUX
Wire Wire Line
	1550 6300 1550 6700
Connection ~ 1550 6600
$Comp
L R R1
U 1 1 56520480
P 1550 6850
F 0 "R1" V 1630 6850 50  0000 C CNN
F 1 "330K" V 1550 6850 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 1480 6850 30  0001 C CNN
F 3 "" H 1550 6850 30  0000 C CNN
	1    1550 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 7000 1550 7100
Wire Wire Line
	1550 7100 1900 7100
Wire Wire Line
	1900 6900 1900 7200
Connection ~ 1900 7100
Text Label 1900 7200 0    60   ~ 0
/VAUX_ON
$Comp
L R R2
U 1 1 565205B5
P 1900 6300
F 0 "R2" V 1980 6300 50  0000 C CNN
F 1 "0" V 1900 6300 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 1830 6300 30  0001 C CNN
F 3 "" H 1900 6300 30  0000 C CNN
	1    1900 6300
	0    1    1    0   
$EndComp
Wire Wire Line
	1750 6300 1550 6300
Wire Wire Line
	2050 6300 2200 6300
Wire Wire Line
	2200 6300 2200 6600
Connection ~ 2200 6600
$Comp
L PEC12R-2217F SW1
U 1 1 56520D20
P 8550 5450
F 0 "SW1" H 8550 5850 60  0000 C CNN
F 1 "PEC092320FS0015" H 8550 5025 60  0000 C CNN
F 2 "Footprints:PEC092320FS0015" H 8825 5450 60  0001 C CNN
F 3 "" H 8825 5450 60  0000 C CNN
	1    8550 5450
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 56520E41
P 7950 5050
F 0 "R4" V 8030 5050 50  0000 C CNN
F 1 "10K" V 7950 5050 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 7880 5050 30  0001 C CNN
F 3 "" H 7950 5050 30  0000 C CNN
	1    7950 5050
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 56520E7E
P 7400 5600
F 0 "C1" H 7425 5700 50  0000 L CNN
F 1 "0.01u" H 7425 5500 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 7438 5450 30  0001 C CNN
F 3 "" H 7400 5600 60  0000 C CNN
	1    7400 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 5750 7400 5850
$Comp
L GND #PWR01
U 1 1 56520EFD
P 7400 5850
F 0 "#PWR01" H 7400 5600 50  0001 C CNN
F 1 "GND" H 7400 5700 50  0000 C CNN
F 2 "" H 7400 5850 60  0000 C CNN
F 3 "" H 7400 5850 60  0000 C CNN
	1    7400 5850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 56520F21
P 8050 5650
F 0 "#PWR02" H 8050 5400 50  0001 C CNN
F 1 "GND" H 8050 5500 50  0000 C CNN
F 2 "" H 8050 5650 60  0000 C CNN
F 3 "" H 8050 5650 60  0000 C CNN
	1    8050 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 5550 8050 5650
Wire Wire Line
	7950 4900 7950 4800
$Comp
L VCC #PWR03
U 1 1 56520FBA
P 7950 4800
F 0 "#PWR03" H 7950 4650 50  0001 C CNN
F 1 "VCC" H 7950 4950 50  0000 C CNN
F 2 "" H 7950 4800 60  0000 C CNN
F 3 "" H 7950 4800 60  0000 C CNN
	1    7950 4800
	1    0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 56521077
P 9200 5000
F 0 "R5" V 9280 5000 50  0000 C CNN
F 1 "10K" V 9200 5000 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 9130 5000 30  0001 C CNN
F 3 "" H 9200 5000 30  0000 C CNN
	1    9200 5000
	1    0    0    -1  
$EndComp
$Comp
L R R6
U 1 1 565210BE
P 9450 5000
F 0 "R6" V 9530 5000 50  0000 C CNN
F 1 "10K" V 9450 5000 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 9380 5000 30  0001 C CNN
F 3 "" H 9450 5000 30  0000 C CNN
	1    9450 5000
	1    0    0    -1  
$EndComp
$Comp
L R R7
U 1 1 5652114D
P 9800 5350
F 0 "R7" V 9880 5350 50  0000 C CNN
F 1 "10K" V 9800 5350 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 9730 5350 30  0001 C CNN
F 3 "" H 9800 5350 30  0000 C CNN
	1    9800 5350
	0    1    1    0   
$EndComp
$Comp
L R R8
U 1 1 565211C6
P 9800 5550
F 0 "R8" V 9880 5550 50  0000 C CNN
F 1 "10K" V 9800 5550 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 9730 5550 30  0001 C CNN
F 3 "" H 9800 5550 30  0000 C CNN
	1    9800 5550
	0    1    1    0   
$EndComp
Wire Wire Line
	9050 5350 9650 5350
Wire Wire Line
	9200 5350 9200 5150
Connection ~ 9200 5350
Wire Wire Line
	9450 5150 9450 5550
Wire Wire Line
	9050 5550 9650 5550
Connection ~ 9450 5550
Wire Wire Line
	9950 5350 10450 5350
Wire Wire Line
	10050 5350 10050 5750
$Comp
L C C2
U 1 1 565213A9
P 10050 5850
F 0 "C2" H 10075 5950 50  0000 L CNN
F 1 "0.01u" H 10075 5750 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 10088 5700 30  0001 C CNN
F 3 "" H 10050 5850 60  0000 C CNN
	1    10050 5850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 565213EC
P 10050 6000
F 0 "#PWR04" H 10050 5750 50  0001 C CNN
F 1 "GND" H 10050 5850 50  0000 C CNN
F 2 "" H 10050 6000 60  0000 C CNN
F 3 "" H 10050 6000 60  0000 C CNN
	1    10050 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 4850 9200 4750
Wire Wire Line
	9200 4750 9450 4750
Wire Wire Line
	9450 4750 9450 4850
Text Label 9350 4750 0    60   ~ 0
ENC_HI
Wire Wire Line
	9050 5450 9050 5950
$Comp
L GND #PWR05
U 1 1 5652151E
P 9050 5950
F 0 "#PWR05" H 9050 5700 50  0001 C CNN
F 1 "GND" H 9050 5800 50  0000 C CNN
F 2 "" H 9050 5950 60  0000 C CNN
F 3 "" H 9050 5950 60  0000 C CNN
	1    9050 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9950 5550 10450 5550
$Comp
L C C3
U 1 1 565216C5
P 10350 5850
F 0 "C3" H 10375 5950 50  0000 L CNN
F 1 "0.01u" H 10375 5750 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 10388 5700 30  0001 C CNN
F 3 "" H 10350 5850 60  0000 C CNN
	1    10350 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	10350 5550 10350 5700
$Comp
L GND #PWR06
U 1 1 56521730
P 10350 6000
F 0 "#PWR06" H 10350 5750 50  0001 C CNN
F 1 "GND" H 10350 5850 50  0000 C CNN
F 2 "" H 10350 6000 60  0000 C CNN
F 3 "" H 10350 6000 60  0000 C CNN
	1    10350 6000
	1    0    0    -1  
$EndComp
Connection ~ 10050 5350
Connection ~ 10350 5550
Text Label 10450 5350 0    60   ~ 0
ENC_A
Text Label 10450 5550 0    60   ~ 0
ENC_B
Wire Wire Line
	7850 5350 8050 5350
Wire Wire Line
	7950 5350 7950 5200
Connection ~ 7950 5350
$Comp
L R R3
U 1 1 56521AE3
P 7700 5350
F 0 "R3" V 7780 5350 50  0000 C CNN
F 1 "10K" V 7700 5350 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 7630 5350 30  0001 C CNN
F 3 "" H 7700 5350 30  0000 C CNN
	1    7700 5350
	0    1    1    0   
$EndComp
Wire Wire Line
	7300 5350 7550 5350
Connection ~ 7400 5350
Text Label 7300 5350 2    60   ~ 0
ENC_BUT
Wire Wire Line
	7400 5350 7400 5450
$Comp
L AT25DF041B U1
U 1 1 56522866
P 6700 1650
F 0 "U1" H 6700 2150 60  0000 C CNN
F 1 "AT25DF041B" H 6700 1450 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 6600 1650 60  0001 C CNN
F 3 "" H 6600 1650 60  0000 C CNN
	1    6700 1650
	1    0    0    -1  
$EndComp
Text Label 7200 1550 0    60   ~ 0
SCK
Text Label 7200 1350 0    60   ~ 0
VAUX
Text Label 7200 1450 0    60   ~ 0
VAUX
Text Label 7200 1650 0    60   ~ 0
MOSI
Text Label 6200 1450 2    60   ~ 0
MISO
Text Label 6200 1350 2    60   ~ 0
/FLASH_CS
Text Label 6200 1550 2    60   ~ 0
VAUX
$Comp
L DRV8837 U2
U 1 1 56523390
P 6700 2900
F 0 "U2" H 6700 3400 60  0000 C CNN
F 1 "DRV8837" H 6700 2700 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 6600 2900 60  0001 C CNN
F 3 "" H 6600 2900 60  0000 C CNN
	1    6700 2900
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X06 P2
U 1 1 565234A2
P 1400 2850
F 0 "P2" H 1400 3200 50  0000 C CNN
F 1 "FTDI_HDR" V 1500 2850 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x06" H 1400 2850 60  0001 C CNN
F 3 "" H 1400 2850 60  0000 C CNN
	1    1400 2850
	-1   0    0    -1  
$EndComp
Text Label 1600 2600 0    60   ~ 0
GND
Text Label 1600 2800 0    60   ~ 0
VCC
Text Label 1600 2900 0    60   ~ 0
RX
Text Label 1600 3000 0    60   ~ 0
TX
Text Label 1600 3100 0    60   ~ 0
RST
Text Label 6200 2700 2    60   ~ 0
SPK1
Text Label 6200 2800 2    60   ~ 0
SPK2
Text Label 6200 2600 2    60   ~ 0
VAUX
Text Label 7200 2600 0    60   ~ 0
VAUX
Text Label 6200 2900 2    60   ~ 0
GND
$Comp
L CONN_01X02 P4
U 1 1 56523C89
P 1400 4650
F 0 "P4" H 1400 4800 50  0000 C CNN
F 1 "PHOTODIODE" V 1500 4650 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x02" H 1400 4650 60  0001 C CNN
F 3 "" H 1400 4650 60  0000 C CNN
	1    1400 4650
	-1   0    0    -1  
$EndComp
$Comp
L Q_PNP_BEC Q2
U 1 1 56523EB5
P 2400 4600
F 0 "Q2" H 2700 4650 50  0000 R CNN
F 1 "MMBT3906" H 3000 4550 50  0000 R CNN
F 2 "Housings_SOT-23_SOT-143_TSOT-6:SOT-23_Handsoldering" H 2600 4700 29  0001 C CNN
F 3 "" H 2400 4600 60  0000 C CNN
	1    2400 4600
	1    0    0    1   
$EndComp
$Comp
L R R12
U 1 1 5652400F
P 1900 4350
F 0 "R12" V 1980 4350 50  0000 C CNN
F 1 "100k" V 1900 4350 50  0000 C CNN
F 2 "" V 1830 4350 30  0001 C CNN
F 3 "" H 1900 4350 30  0000 C CNN
	1    1900 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 4200 1900 4100
Wire Wire Line
	1900 4100 2500 4100
Wire Wire Line
	2500 4100 2500 4400
Wire Wire Line
	1600 4600 2200 4600
Wire Wire Line
	1900 4500 1900 4850
Connection ~ 1900 4600
$Comp
L R R9
U 1 1 56524221
P 2500 5050
F 0 "R9" V 2580 5050 50  0000 C CNN
F 1 "100K" V 2500 5050 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 2430 5050 30  0001 C CNN
F 3 "" H 2500 5050 30  0000 C CNN
	1    2500 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 4800 2500 4900
Wire Wire Line
	2500 5200 2500 5300
$Comp
L GND #PWR07
U 1 1 565242FA
P 2500 5300
F 0 "#PWR07" H 2500 5050 50  0001 C CNN
F 1 "GND" H 2500 5150 50  0000 C CNN
F 2 "" H 2500 5300 60  0000 C CNN
F 3 "" H 2500 5300 60  0000 C CNN
	1    2500 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 4850 2700 4850
Connection ~ 2500 4850
Text Label 2700 4850 0    60   ~ 0
PHOTOD
Wire Wire Line
	1600 4700 1700 4700
Wire Wire Line
	1700 4700 1700 4800
$Comp
L GND #PWR08
U 1 1 565244A3
P 1700 4800
F 0 "#PWR08" H 1700 4550 50  0001 C CNN
F 1 "GND" H 1700 4650 50  0000 C CNN
F 2 "" H 1700 4800 60  0000 C CNN
F 3 "" H 1700 4800 60  0000 C CNN
	1    1700 4800
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR09
U 1 1 565249FE
P 2150 4100
F 0 "#PWR09" H 2150 3950 50  0001 C CNN
F 1 "VCC" H 2150 4250 50  0000 C CNN
F 2 "" H 2150 4100 60  0000 C CNN
F 3 "" H 2150 4100 60  0000 C CNN
	1    2150 4100
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 P3
U 1 1 56524AC2
P 3450 6700
F 0 "P3" H 3450 6850 50  0000 C CNN
F 1 "BAT" V 3550 6700 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x02" H 3450 6700 60  0001 C CNN
F 3 "" H 3450 6700 60  0000 C CNN
	1    3450 6700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3650 6750 3750 6750
Wire Wire Line
	3750 6750 3750 7000
$Comp
L GND #PWR010
U 1 1 56524B83
P 3750 7000
F 0 "#PWR010" H 3750 6750 50  0001 C CNN
F 1 "GND" H 3750 6850 50  0000 C CNN
F 2 "" H 3750 7000 60  0000 C CNN
F 3 "" H 3750 7000 60  0000 C CNN
	1    3750 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 6650 4600 6650
Wire Wire Line
	4600 6650 4600 6550
$Comp
L VCC #PWR011
U 1 1 56524C38
P 4600 6550
F 0 "#PWR011" H 4600 6400 50  0001 C CNN
F 1 "VCC" H 4600 6700 50  0000 C CNN
F 2 "" H 4600 6550 60  0000 C CNN
F 3 "" H 4600 6550 60  0000 C CNN
	1    4600 6550
	1    0    0    -1  
$EndComp
Text Label 6200 1650 2    60   ~ 0
GND
Text Label 7200 2700 0    60   ~ 0
VAUX
Text Label 7200 2800 0    60   ~ 0
PWM_1
Text Label 7200 2900 0    60   ~ 0
PWM_2
$Comp
L CONN_01X03 P5
U 1 1 56525619
P 6250 3650
F 0 "P5" H 6250 3850 50  0000 C CNN
F 1 "SPK" V 6350 3650 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x03" H 6250 3650 60  0001 C CNN
F 3 "" H 6250 3650 60  0000 C CNN
	1    6250 3650
	1    0    0    -1  
$EndComp
Text Label 6050 3550 2    60   ~ 0
SPK2
Text Label 6050 3650 2    60   ~ 0
SPK2
Wire Wire Line
	6050 3750 5950 3750
Wire Wire Line
	5950 3750 5950 3850
$Comp
L CP C4
U 1 1 56525959
P 5950 4000
F 0 "C4" H 5975 4100 50  0000 L CNN
F 1 "47u" H 5975 3900 50  0000 L CNN
F 2 "Capacitors_SMD:c_elec_6.3x5.7" H 5988 3850 30  0001 C CNN
F 3 "" H 5950 4000 60  0000 C CNN
	1    5950 4000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR012
U 1 1 565259AC
P 5950 4150
F 0 "#PWR012" H 5950 3900 50  0001 C CNN
F 1 "GND" H 5950 4000 50  0000 C CNN
F 2 "" H 5950 4150 60  0000 C CNN
F 3 "" H 5950 4150 60  0000 C CNN
	1    5950 4150
	1    0    0    -1  
$EndComp
$Comp
L R R10
U 1 1 5659FC34
P 2250 4850
F 0 "R10" V 2330 4850 50  0000 C CNN
F 1 "0" V 2250 4850 50  0000 C CNN
F 2 "" V 2180 4850 30  0001 C CNN
F 3 "" H 2250 4850 30  0000 C CNN
	1    2250 4850
	0    1    1    0   
$EndComp
Wire Wire Line
	1900 4850 2100 4850
$Comp
L Q_PMOS_GSD Q3
U 1 1 565A0480
P 4100 6750
F 0 "Q3" V 4300 6800 50  0000 R CNN
F 1 "IRLML6401" V 3950 6950 50  0000 R CNN
F 2 "Housings_SOT-23_SOT-143_TSOT-6:SOT-23" H 4300 6850 29  0001 C CNN
F 3 "" H 4100 6750 60  0000 C CNN
	1    4100 6750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3650 6650 3900 6650
$Comp
L GND #PWR013
U 1 1 565A08F1
P 4100 7000
F 0 "#PWR013" H 4100 6750 50  0001 C CNN
F 1 "GND" H 4100 6850 50  0000 C CNN
F 2 "" H 4100 7000 60  0000 C CNN
F 3 "" H 4100 7000 60  0000 C CNN
	1    4100 7000
	1    0    0    -1  
$EndComp
$Comp
L R R11
U 1 1 565A09EC
P 4100 6450
F 0 "R11" V 4180 6450 50  0000 C CNN
F 1 "0" V 4100 6450 50  0000 C CNN
F 2 "" V 4030 6450 30  0001 C CNN
F 3 "" H 4100 6450 30  0000 C CNN
	1    4100 6450
	0    1    1    0   
$EndComp
Wire Wire Line
	3950 6450 3850 6450
Wire Wire Line
	3850 6450 3850 6650
Connection ~ 3850 6650
Wire Wire Line
	4250 6450 4350 6450
Wire Wire Line
	4350 6450 4350 6650
Connection ~ 4350 6650
$Comp
L D D1
U 1 1 565A0CFA
P 4450 6850
F 0 "D1" H 4450 6950 50  0000 C CNN
F 1 "D" H 4450 6750 50  0000 C CNN
F 2 "Diodes_SMD:DD-PAK_TO263_SingleDiode" H 4450 6850 60  0001 C CNN
F 3 "" H 4450 6850 60  0000 C CNN
	1    4450 6850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4450 6700 4450 6650
Connection ~ 4450 6650
$Comp
L GND #PWR014
U 1 1 565A0DC6
P 4450 7000
F 0 "#PWR014" H 4450 6750 50  0001 C CNN
F 1 "GND" H 4450 6850 50  0000 C CNN
F 2 "" H 4450 7000 60  0000 C CNN
F 3 "" H 4450 7000 60  0000 C CNN
	1    4450 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 6950 4100 7000
Text Label 3600 6650 0    60   ~ 0
VBAT
$EndSCHEMATC
