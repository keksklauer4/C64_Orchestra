EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 7
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 1000 4700 0    50   Input ~ 0
A0
Text HLabel 1000 4550 0    50   Input ~ 0
A1
Text HLabel 1000 4400 0    50   Input ~ 0
A2
Text HLabel 1000 3500 0    50   Input ~ 0
A3
Text HLabel 1000 3400 0    50   Input ~ 0
A4
Text HLabel 1000 3300 0    50   Input ~ 0
A5
Text HLabel 1000 3200 0    50   Input ~ 0
A6
Text HLabel 1000 3100 0    50   Input ~ 0
A7
Text HLabel 1000 2900 0    50   Input ~ 0
A8
Text HLabel 1000 2800 0    50   Input ~ 0
A9
Text HLabel 1000 2700 0    50   Input ~ 0
A10
Text HLabel 1000 2600 0    50   Input ~ 0
A11
Text HLabel 1000 2500 0    50   Input ~ 0
A12
Text HLabel 1000 2400 0    50   Input ~ 0
A13
Text HLabel 1000 2300 0    50   Input ~ 0
A14
Text HLabel 1000 2200 0    50   Input ~ 0
A15
Wire Wire Line
	1300 2200 1300 2100
Wire Wire Line
	1350 2300 1350 2200
Wire Wire Line
	1400 2400 1400 2300
Wire Wire Line
	1450 2500 1450 2400
Wire Wire Line
	1500 2600 1500 2500
Wire Wire Line
	1550 2700 1550 2600
Wire Wire Line
	1600 2800 1600 2700
Wire Wire Line
	1600 2700 1650 2700
Wire Wire Line
	1650 2900 1650 2800
Wire Wire Line
	2700 2450 2700 2850
Wire Wire Line
	2700 2850 2850 2850
Wire Wire Line
	2700 2450 2650 2450
Wire Wire Line
	2650 3450 2700 3450
Wire Wire Line
	2700 3450 2700 3050
Wire Wire Line
	2700 3050 2850 3050
Wire Wire Line
	1550 2600 1650 2600
Wire Wire Line
	1500 2500 1650 2500
Wire Wire Line
	1450 2400 1650 2400
Wire Wire Line
	1400 2300 1650 2300
Wire Wire Line
	1350 2200 1650 2200
Wire Wire Line
	1300 2100 1650 2100
$Comp
L 74xx_IEEE:7432 U?
U 1 1 5F9410F0
P 3400 2950
AR Path="/5F9410F0" Ref="U?"  Part="1" 
AR Path="/5F92A19D/5F9410F0" Ref="U3"  Part="1" 
F 0 "U3" H 3400 3366 50  0000 C CNN
F 1 "7432" H 3400 3275 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 3400 2950 50  0001 C CNN
F 3 "" H 3400 2950 50  0001 C CNN
	1    3400 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 2950 3950 3500
Wire Wire Line
	3950 3500 2750 3500
Wire Wire Line
	1000 2200 1300 2200
Wire Wire Line
	1000 2300 1350 2300
Wire Wire Line
	1000 2400 1400 2400
Wire Wire Line
	1000 2500 1450 2500
Wire Wire Line
	1000 2600 1500 2600
Wire Wire Line
	1000 2700 1550 2700
Wire Wire Line
	1000 2800 1600 2800
Wire Wire Line
	1000 2900 1650 2900
$Comp
L 74xx_IEEE:7430 U?
U 1 1 5F94109C
P 2150 3450
AR Path="/5F94109C" Ref="U?"  Part="1" 
AR Path="/5F92A19D/5F94109C" Ref="U2"  Part="1" 
F 0 "U2" H 2150 4066 50  0000 C CNN
F 1 "7430" H 2150 3975 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 2150 3450 50  0001 C CNN
F 3 "" H 2150 3450 50  0001 C CNN
	1    2150 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 3000 1650 3100
Wire Wire Line
	1650 3100 1000 3100
Connection ~ 1650 3100
Wire Wire Line
	1650 3200 1000 3200
Wire Wire Line
	1650 3300 1000 3300
Wire Wire Line
	1650 3400 1000 3400
Wire Wire Line
	1000 3500 1650 3500
Wire Wire Line
	1000 4400 1350 4400
Wire Wire Line
	1350 4400 1350 4650
Wire Wire Line
	1350 4650 2850 4650
Wire Wire Line
	1000 4550 2850 4550
Wire Wire Line
	1000 4700 1300 4700
Wire Wire Line
	1300 4700 1300 4450
Wire Wire Line
	1300 4450 2850 4450
Text HLabel 4850 3900 2    50   Output ~ 0
Dest1
Text HLabel 4850 4000 2    50   Output ~ 0
Dest2
Wire Wire Line
	4850 4100 3950 4100
Wire Wire Line
	3950 4000 4850 4000
Text HLabel 4850 4100 2    50   Output ~ 0
WCR
Text HLabel 4850 4200 2    50   Output ~ 0
SR1
Text HLabel 4850 4300 2    50   Output ~ 0
SR2
Wire Wire Line
	3950 4200 4850 4200
Wire Wire Line
	4850 4300 3950 4300
Wire Wire Line
	3950 4400 4850 4400
Text HLabel 4850 4400 2    50   Output ~ 0
Status
Wire Wire Line
	4850 3900 3950 3900
Text GLabel 1000 5000 0    50   Input ~ 0
Global_GND
Text GLabel 1000 5150 0    50   Input ~ 0
Global_VCC
Wire Wire Line
	1000 5150 1500 5150
Wire Wire Line
	1500 3800 1650 3800
Wire Wire Line
	1500 3800 1500 3700
Wire Wire Line
	1500 3600 1650 3600
Connection ~ 1500 3800
Wire Wire Line
	1500 3700 1650 3700
Connection ~ 1500 3700
Wire Wire Line
	1500 3700 1500 3600
Wire Wire Line
	1000 5000 1550 5000
$Comp
L 74xx_IEEE:74HC238 U?
U 1 1 5F8BC87D
P 3400 4100
F 0 "U?" H 3400 4616 50  0000 C CNN
F 1 "74HC238" H 3400 4525 50  0000 C CNN
F 2 "" H 3400 4100 50  0001 C CNN
F 3 "" H 3400 4100 50  0001 C CNN
	1    3400 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 3800 1500 4200
Wire Wire Line
	2850 4050 1550 4050
Wire Wire Line
	1550 4050 1550 5000
Wire Wire Line
	2850 4200 1500 4200
Connection ~ 1500 4200
Wire Wire Line
	1500 4200 1500 5150
Wire Wire Line
	2850 3900 2750 3900
Wire Wire Line
	2750 3900 2750 3500
Text Notes 1950 2050 0    50   ~ 0
upper address
$Comp
L 74xx_IEEE:7430 U?
U 1 1 5F9410EA
P 2150 2450
AR Path="/5F9410EA" Ref="U?"  Part="1" 
AR Path="/5F92A19D/5F9410EA" Ref="U1"  Part="1" 
F 0 "U1" H 2150 3066 50  0000 C CNN
F 1 "7430" H 2150 2975 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 2150 2450 50  0001 C CNN
F 3 "" H 2150 2450 50  0001 C CNN
	1    2150 2450
	1    0    0    -1  
$EndComp
$EndSCHEMATC
