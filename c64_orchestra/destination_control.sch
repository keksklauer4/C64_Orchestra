EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 7
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 1800 1400 0    50   Input ~ 0
IO0
Text HLabel 1800 1500 0    50   Input ~ 0
IO1
Text HLabel 1800 1600 0    50   Input ~ 0
IO2
Text HLabel 1800 1700 0    50   Input ~ 0
IO3
Text HLabel 1800 1800 0    50   Input ~ 0
IO4
Text HLabel 1800 1900 0    50   Input ~ 0
IO5
Text HLabel 1800 2000 0    50   Input ~ 0
IO6
Text HLabel 1800 2100 0    50   Input ~ 0
IO7
Text HLabel 1800 3050 0    50   Input ~ 0
Select_dest1
Text HLabel 1800 3200 0    50   Input ~ 0
Select_dest2
Text HLabel 1800 3550 0    50   Input ~ 0
CPU_CLK
Text GLabel 1800 3800 0    50   Input ~ 0
Global_VCC
Text GLabel 1800 4000 0    50   Input ~ 0
Global_GND
$Comp
L 74xx:74HC374 U?
U 1 1 5F9DAC92
P 5650 1900
F 0 "U?" H 5650 2881 50  0000 C CNN
F 1 "74HC374" H 5650 2790 50  0000 C CNN
F 2 "" H 5650 1900 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/cd74hct374.pdf" H 5650 1900 50  0001 C CNN
	1    5650 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 3950 4250 3950
Wire Wire Line
	4250 3950 4250 2100
Connection ~ 4250 2100
Wire Wire Line
	4250 2100 5150 2100
Wire Wire Line
	5150 3850 4300 3850
Wire Wire Line
	4300 3850 4300 2000
Connection ~ 4300 2000
Wire Wire Line
	4300 2000 5150 2000
Wire Wire Line
	5150 3750 4350 3750
Wire Wire Line
	4350 3750 4350 1900
Connection ~ 4350 1900
Wire Wire Line
	4350 1900 5150 1900
Wire Wire Line
	5150 3650 4400 3650
Wire Wire Line
	4400 3650 4400 1800
Connection ~ 4400 1800
Wire Wire Line
	4400 1800 5150 1800
$Comp
L 74xx:74HC374 U?
U 1 1 5F9DEED7
P 5650 3750
F 0 "U?" H 5650 4731 50  0000 C CNN
F 1 "74HC374" H 5650 4640 50  0000 C CNN
F 2 "" H 5650 3750 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/cd74hct374.pdf" H 5650 3750 50  0001 C CNN
	1    5650 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 3550 4450 3550
Wire Wire Line
	4450 3550 4450 1700
Connection ~ 4450 1700
Wire Wire Line
	4450 1700 5150 1700
Wire Wire Line
	5150 3450 4500 3450
Wire Wire Line
	4500 3450 4500 1600
Wire Wire Line
	4500 1600 5150 1600
Wire Wire Line
	5150 3350 4550 3350
Wire Wire Line
	4550 3350 4550 1500
Connection ~ 4550 1500
Wire Wire Line
	4550 1500 5150 1500
Wire Wire Line
	5150 3250 4600 3250
Wire Wire Line
	4600 3250 4600 1400
Connection ~ 4600 1400
Wire Wire Line
	4600 1400 5150 1400
Wire Wire Line
	5650 2950 4950 2950
Wire Wire Line
	4950 2950 4950 1100
Wire Wire Line
	4950 1100 5650 1100
Wire Wire Line
	4950 2950 4950 3800
Connection ~ 4950 2950
Wire Wire Line
	1800 4000 2250 4000
Wire Wire Line
	5050 2700 5150 2700
Wire Wire Line
	5050 2700 5050 4250
Wire Wire Line
	5050 4550 5650 4550
Wire Wire Line
	4000 4150 5150 4150
Wire Wire Line
	4800 2300 5150 2300
Wire Wire Line
	5150 2700 5150 2400
Connection ~ 5150 2700
Wire Wire Line
	5150 2700 5650 2700
Wire Wire Line
	5050 4250 5150 4250
Connection ~ 5050 4250
Wire Wire Line
	5050 4250 5050 4550
Wire Wire Line
	1800 1400 4600 1400
Wire Wire Line
	1800 1500 4550 1500
Wire Wire Line
	1800 1600 4500 1600
Connection ~ 4500 1600
Wire Wire Line
	1800 1700 4450 1700
Wire Wire Line
	1800 1800 4400 1800
Wire Wire Line
	1800 2000 4300 2000
Wire Wire Line
	1800 1900 4350 1900
Wire Wire Line
	1800 2100 4250 2100
Wire Wire Line
	5050 4550 2250 4550
Wire Wire Line
	2250 4550 2250 4000
Connection ~ 5050 4550
Wire Wire Line
	1800 3800 4950 3800
$Comp
L 74xx_IEEE:7408 U?
U 1 1 5FA382F7
P 2900 2800
F 0 "U?" H 2900 3216 50  0000 C CNN
F 1 "7408" H 2900 3125 50  0000 C CNN
F 2 "" H 2900 2800 50  0001 C CNN
F 3 "" H 2900 2800 50  0001 C CNN
	1    2900 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 3050 2050 3050
Wire Wire Line
	2050 3050 2050 2700
Wire Wire Line
	2050 2700 2350 2700
$Comp
L 74xx_IEEE:7408 U?
U 2 1 5FA3A92D
P 2900 3350
F 0 "U?" H 2900 3766 50  0000 C CNN
F 1 "7408" H 2900 3675 50  0000 C CNN
F 2 "" H 2900 3350 50  0001 C CNN
F 3 "" H 2900 3350 50  0001 C CNN
	2    2900 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 3200 2250 3200
Wire Wire Line
	2250 3250 2350 3250
Wire Wire Line
	2250 3200 2250 3250
Wire Wire Line
	2350 2900 2100 2900
Wire Wire Line
	2100 2900 2100 3450
Wire Wire Line
	2100 3550 1800 3550
Wire Wire Line
	2100 3450 2350 3450
Connection ~ 2100 3450
Wire Wire Line
	2100 3450 2100 3550
Wire Wire Line
	3450 2800 4800 2800
Wire Wire Line
	3450 3350 4000 3350
Wire Wire Line
	4000 3350 4000 4150
Wire Wire Line
	4800 2300 4800 2800
Text GLabel 7300 1400 2    50   Output ~ 0
Dest0
Text GLabel 7300 1500 2    50   Output ~ 0
Dest1
Text GLabel 7300 1600 2    50   Output ~ 0
Dest2
Text GLabel 7300 1700 2    50   Output ~ 0
Dest3
Text GLabel 7300 1800 2    50   Output ~ 0
Dest4
Text GLabel 7300 1900 2    50   Output ~ 0
Dest5
Text GLabel 7300 2000 2    50   Output ~ 0
Dest6
Text GLabel 7300 2100 2    50   Output ~ 0
Dest7
Text GLabel 7400 3250 2    50   Output ~ 0
Dest8
Text GLabel 7400 3350 2    50   Output ~ 0
Dest9
Wire Wire Line
	6150 1400 7300 1400
Wire Wire Line
	6150 1500 7300 1500
Wire Wire Line
	7300 1600 6150 1600
Wire Wire Line
	6150 1700 7300 1700
Wire Wire Line
	7300 1800 6150 1800
Wire Wire Line
	6150 1900 7300 1900
Wire Wire Line
	7300 2000 6150 2000
Wire Wire Line
	6150 2100 7300 2100
Text GLabel 7400 3450 2    50   Output ~ 0
Dest10
Text GLabel 7400 3550 2    50   Output ~ 0
Dest11
Text GLabel 7400 3650 2    50   Output ~ 0
Dest12
Text GLabel 7400 3750 2    50   Output ~ 0
Dest13
Text GLabel 7400 3850 2    50   Output ~ 0
Dest14
Text GLabel 7400 3950 2    50   Output ~ 0
Dest15
Wire Wire Line
	6150 3250 7400 3250
Wire Wire Line
	7400 3350 6150 3350
Wire Wire Line
	6150 3450 7400 3450
Wire Wire Line
	7400 3550 6150 3550
Wire Wire Line
	6150 3650 7400 3650
Wire Wire Line
	7400 3750 6150 3750
Wire Wire Line
	7400 3950 6150 3950
Wire Wire Line
	6150 3850 7400 3850
$EndSCHEMATC
