EESchema Schematic File Version 4
LIBS:YATAC-cache
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 3 4
Title "Graphics Processing Unit"
Date "2019-10-19"
Rev "1.0.9"
Comp ""
Comment1 "(c) A J Hewitt 2019"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 1100 2300 0    50   Input ~ 0
~sle
Text GLabel 1500 2500 0    50   Input ~ 0
1
$Comp
L power:GNDD #PWR0110
U 1 1 5D7DF376
P 2000 2800
AR Path="/5DAA3954/5D7DF376" Ref="#PWR0110"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5D7DF376" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/5D7DF376" Ref="#PWR0155"  Part="1" 
F 0 "#PWR0155" H 2000 2550 50  0001 C CNN
F 1 "GNDD" H 2004 2645 50  0000 C CNN
F 2 "" H 2000 2800 50  0001 C CNN
F 3 "" H 2000 2800 50  0001 C CNN
	1    2000 2800
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0109
U 1 1 5D7D093F
P 2000 1300
AR Path="/5DAA3954/5D7D093F" Ref="#PWR0109"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5D7D093F" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/5D7D093F" Ref="#PWR0156"  Part="1" 
F 0 "#PWR0156" H 2000 1150 50  0001 C CNN
F 1 "VCC" H 2017 1473 50  0000 C CNN
F 2 "" H 2000 1300 50  0001 C CNN
F 3 "" H 2000 1300 50  0001 C CNN
	1    2000 1300
	1    0    0    -1  
$EndComp
Text GLabel 2500 2000 2    50   Output ~ 0
vblank
Text GLabel 2500 2100 2    50   Output ~ 0
vsync
Text GLabel 2850 2400 3    50   Input ~ 0
C[0..7]
Entry Wire Line
	2850 2100 2950 2000
Text Label 2950 2000 0    50   ~ 0
C3
Entry Wire Line
	2850 2200 2950 2100
Text Label 2950 2100 0    50   ~ 0
C7
Text Label 1300 1600 0    50   ~ 0
PD0
Text Label 1300 1700 0    50   ~ 0
PD1
Text Label 1300 1800 0    50   ~ 0
PD2
Text Label 1300 1900 0    50   ~ 0
PD3
Text Label 1300 2000 0    50   ~ 0
PD4
Text Label 1300 2100 0    50   ~ 0
PD5
Wire Wire Line
	1300 1600 1500 1600
Wire Wire Line
	1300 1700 1500 1700
Wire Wire Line
	1300 1800 1500 1800
Wire Wire Line
	1300 1900 1500 1900
Entry Wire Line
	1300 2100 1200 2000
Entry Wire Line
	1300 2000 1200 1900
Entry Wire Line
	1300 1700 1200 1600
Entry Wire Line
	1300 1800 1200 1700
Entry Wire Line
	1300 1900 1200 1800
Entry Wire Line
	1300 1600 1200 1500
Text GLabel 1200 1400 1    50   Input ~ 0
PD[0..7]
Wire Wire Line
	1300 2100 1500 2100
Wire Wire Line
	1300 2000 1500 2000
$Comp
L 74xx:74LS174 U32
U 1 1 5D7F51B8
P 2000 2000
AR Path="/5DAA3954/5D7F51B8" Ref="U32"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5D7F51B8" Ref="U?"  Part="1" 
AR Path="/5DA1E9BD/5D7F51B8" Ref="U32"  Part="1" 
F 0 "U32" H 2000 1900 50  0000 C CNN
F 1 "74F174" H 2000 1800 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 2000 2000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS174" H 2000 2000 50  0001 C CNN
	1    2000 2000
	1    0    0    -1  
$EndComp
Entry Wire Line
	4550 2300 4650 2200
Text Label 4350 2300 0    50   ~ 0
PA15
Wire Wire Line
	5400 1600 5500 1600
Wire Wire Line
	5500 1600 5500 1500
$Comp
L power:VCC #PWR0131
U 1 1 621DFBC5
P 3800 1300
AR Path="/5DAA3954/621DFBC5" Ref="#PWR0131"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/621DFBC5" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/621DFBC5" Ref="#PWR0158"  Part="1" 
F 0 "#PWR0158" H 3800 1150 50  0001 C CNN
F 1 "VCC" H 3817 1473 50  0000 C CNN
F 2 "" H 3800 1300 50  0001 C CNN
F 3 "" H 3800 1300 50  0001 C CNN
	1    3800 1300
	1    0    0    -1  
$EndComp
Text GLabel 3300 2200 0    50   Input ~ 0
mode0
$Comp
L power:GNDD #PWR0121
U 1 1 5F0FA20D
P 3800 2900
AR Path="/5DAA3954/5F0FA20D" Ref="#PWR0121"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5F0FA20D" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/5F0FA20D" Ref="#PWR0157"  Part="1" 
F 0 "#PWR0157" H 3800 2650 50  0001 C CNN
F 1 "GNDD" H 3804 2745 50  0000 C CNN
F 2 "" H 3800 2900 50  0001 C CNN
F 3 "" H 3800 2900 50  0001 C CNN
	1    3800 2900
	1    0    0    -1  
$EndComp
Text GLabel 4650 1400 1    50   Output ~ 0
PA[0..15]
Entry Wire Line
	4550 2100 4650 2000
Entry Wire Line
	4550 2200 4650 2100
Entry Wire Line
	4550 1600 4650 1500
Text Label 4350 2000 0    50   ~ 0
PA12
Text Label 4350 2100 0    50   ~ 0
PA13
Text Label 4350 2200 0    50   ~ 0
PA14
Entry Wire Line
	4550 1700 4650 1600
Entry Wire Line
	4550 1800 4650 1700
Entry Wire Line
	4550 1900 4650 1800
Entry Wire Line
	4550 2000 4650 1900
Text Label 4400 1600 0    50   ~ 0
PA8
Text Label 4400 1700 0    50   ~ 0
PA9
Text Label 4350 1800 0    50   ~ 0
PA10
Text Label 4350 1900 0    50   ~ 0
PA11
Text GLabel 3300 2300 0    50   Input ~ 0
1
Text GLabel 3300 2600 0    50   Input ~ 0
pclk
Text GLabel 3300 2500 0    50   Input ~ 0
hblank
$Comp
L 74xx:74LS541 U33
U 1 1 5E4BAE6E
P 3800 2100
AR Path="/5DAA3954/5E4BAE6E" Ref="U33"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5E4BAE6E" Ref="U?"  Part="1" 
AR Path="/5DA1E9BD/5E4BAE6E" Ref="U33"  Part="1" 
F 0 "U33" H 3800 1900 50  0000 C CNN
F 1 "74F541" H 3800 1800 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 3800 2100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS541" H 3800 2100 50  0001 C CNN
	1    3800 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Network08_US RN?
U 1 1 5D1C9541
P 5200 2000
AR Path="/5D1C9541" Ref="RN?"  Part="1" 
AR Path="/5DAA3954/5D1C9541" Ref="RN2"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5D1C9541" Ref="RN?"  Part="1" 
AR Path="/5DA1E9BD/5D1C9541" Ref="RN5"  Part="1" 
F 0 "RN5" V 4550 1900 50  0000 L CNN
F 1 "270" V 4650 1900 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 5675 2000 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 5200 2000 50  0001 C CNN
	1    5200 2000
	0    1    1    0   
$EndComp
Entry Wire Line
	4750 1700 4650 1600
Entry Wire Line
	4750 1600 4650 1500
Entry Wire Line
	4750 1900 4650 1800
Entry Wire Line
	4750 1800 4650 1700
Entry Wire Line
	4750 2100 4650 2000
Entry Wire Line
	4750 2000 4650 1900
Entry Wire Line
	4750 2300 4650 2200
Entry Wire Line
	4750 2200 4650 2100
Text Label 4750 1600 0    50   ~ 0
PA8
Text Label 4750 1700 0    50   ~ 0
PA9
Text Label 4750 1800 0    50   ~ 0
PA10
Text Label 4750 1900 0    50   ~ 0
PA11
Text Label 4750 2000 0    50   ~ 0
PA12
Text Label 4750 2100 0    50   ~ 0
PA13
Text Label 4750 2200 0    50   ~ 0
PA14
Text Label 4750 2300 0    50   ~ 0
PA15
$Comp
L power:VCC #PWR?
U 1 1 5D26EEC0
P 5500 1500
AR Path="/5D26EEC0" Ref="#PWR?"  Part="1" 
AR Path="/5DAA3954/5D26EEC0" Ref="#PWR0120"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5D26EEC0" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/5D26EEC0" Ref="#PWR0154"  Part="1" 
F 0 "#PWR0154" H 5500 1350 50  0001 C CNN
F 1 "VCC" H 5517 1673 50  0000 C CNN
F 2 "" H 5500 1500 50  0001 C CNN
F 3 "" H 5500 1500 50  0001 C CNN
	1    5500 1500
	1    0    0    -1  
$EndComp
Text GLabel 9500 2200 2    50   Output ~ 0
gb
Text GLabel 9500 1900 2    50   Output ~ 0
gg
Text GLabel 9500 1600 2    50   Output ~ 0
gr
Text GLabel 7100 2500 0    50   Input ~ 0
~cle
Wire Wire Line
	8100 2800 8500 2800
Text GLabel 8300 1400 1    50   Output ~ 0
C[0..7]
Wire Wire Line
	8400 2300 8500 2300
Wire Wire Line
	8400 2200 8500 2200
Wire Wire Line
	8400 2000 8500 2000
Wire Wire Line
	8400 1900 8500 1900
Wire Wire Line
	8400 1700 8500 1700
Wire Wire Line
	8400 1600 8500 1600
Wire Wire Line
	8100 2300 8200 2300
Wire Wire Line
	8100 2200 8200 2200
Wire Wire Line
	8100 2100 8200 2100
Wire Wire Line
	8100 2000 8200 2000
Wire Wire Line
	8100 1900 8200 1900
Wire Wire Line
	8100 1800 8200 1800
Wire Wire Line
	8100 1700 8200 1700
Wire Wire Line
	8100 1600 8200 1600
Text GLabel 8500 2900 0    50   Input ~ 0
vblank
$Comp
L 74xx:74LS574 U36
U 1 1 5E4BDEC4
P 7600 2100
AR Path="/5DAA3954/5E4BDEC4" Ref="U36"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5E4BDEC4" Ref="U?"  Part="1" 
AR Path="/5DA1E9BD/5E4BDEC4" Ref="U36"  Part="1" 
F 0 "U36" H 7600 1900 50  0000 C CNN
F 1 "74F574" H 7600 1800 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 7600 2100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 7600 2100 50  0001 C CNN
	1    7600 2100
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS157 U37
U 1 1 5CFB1097
P 9000 2200
AR Path="/5DAA3954/5CFB1097" Ref="U37"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5CFB1097" Ref="U?"  Part="1" 
AR Path="/5DA1E9BD/5CFB1097" Ref="U37"  Part="1" 
F 0 "U37" H 9000 2100 50  0000 C CNN
F 1 "74F157" H 9000 2000 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 9000 2200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS157" H 9000 2200 50  0001 C CNN
	1    9000 2200
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0130
U 1 1 621DEBCC
P 9000 1300
AR Path="/5DAA3954/621DEBCC" Ref="#PWR0130"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/621DEBCC" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/621DEBCC" Ref="#PWR0152"  Part="1" 
F 0 "#PWR0152" H 9000 1150 50  0001 C CNN
F 1 "VCC" H 9017 1473 50  0000 C CNN
F 2 "" H 9000 1300 50  0001 C CNN
F 3 "" H 9000 1300 50  0001 C CNN
	1    9000 1300
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0129
U 1 1 621DDA78
P 7600 1300
AR Path="/5DAA3954/621DDA78" Ref="#PWR0129"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/621DDA78" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/621DDA78" Ref="#PWR0151"  Part="1" 
F 0 "#PWR0151" H 7600 1150 50  0001 C CNN
F 1 "VCC" H 7617 1473 50  0000 C CNN
F 2 "" H 7600 1300 50  0001 C CNN
F 3 "" H 7600 1300 50  0001 C CNN
	1    7600 1300
	1    0    0    -1  
$EndComp
Text GLabel 8500 2500 0    50   Input ~ 0
1
Text GLabel 8500 2600 0    50   Input ~ 0
1
$Comp
L power:GNDD #PWR0128
U 1 1 60936E83
P 7600 2900
AR Path="/5DAA3954/60936E83" Ref="#PWR0128"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/60936E83" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/60936E83" Ref="#PWR0150"  Part="1" 
F 0 "#PWR0150" H 7600 2650 50  0001 C CNN
F 1 "GNDD" H 7604 2745 50  0000 C CNN
F 2 "" H 7600 2900 50  0001 C CNN
F 3 "" H 7600 2900 50  0001 C CNN
	1    7600 2900
	1    0    0    -1  
$EndComp
Text GLabel 6800 1400 1    50   Input ~ 0
PA[0..15]
Wire Wire Line
	6900 2300 7100 2300
Wire Wire Line
	6900 2200 7100 2200
Wire Wire Line
	6900 2100 7100 2100
Wire Wire Line
	6900 2000 7100 2000
Text Label 6900 2300 0    50   ~ 0
PA7
Text Label 6900 2200 0    50   ~ 0
PA6
Text Label 6900 2100 0    50   ~ 0
PA5
Text Label 6900 2000 0    50   ~ 0
PA4
Entry Wire Line
	6900 2300 6800 2200
Entry Wire Line
	6900 2200 6800 2100
Entry Wire Line
	6900 2100 6800 2000
Entry Wire Line
	6900 2000 6800 1900
Wire Wire Line
	6900 1900 7100 1900
Wire Wire Line
	6900 1800 7100 1800
Wire Wire Line
	6900 1700 7100 1700
Wire Wire Line
	6900 1600 7100 1600
Text Label 6900 1900 0    50   ~ 0
PA3
Text Label 6900 1800 0    50   ~ 0
PA2
Text Label 6900 1700 0    50   ~ 0
PA1
Text Label 6900 1600 0    50   ~ 0
PA0
Entry Wire Line
	6900 1900 6800 1800
Entry Wire Line
	6900 1800 6800 1700
Entry Wire Line
	6900 1700 6800 1600
Entry Wire Line
	6900 1600 6800 1500
NoConn ~ 9500 2500
Text GLabel 7100 2600 0    50   Input ~ 0
vblank
Text Label 8100 2100 0    50   ~ 0
C5
Text Label 8400 2300 0    50   ~ 0
C6
Text Label 8400 2200 0    50   ~ 0
C2
Text Label 8400 2000 0    50   ~ 0
C5
Text Label 8400 1900 0    50   ~ 0
C1
Text Label 8400 1700 0    50   ~ 0
C4
Text Label 8400 1600 0    50   ~ 0
C0
Text Label 8100 2300 0    50   ~ 0
C7
Text Label 8100 2200 0    50   ~ 0
C6
Text Label 8100 2000 0    50   ~ 0
C4
Text Label 8100 1900 0    50   ~ 0
C3
Text Label 8100 1800 0    50   ~ 0
C2
Text Label 8100 1700 0    50   ~ 0
C1
Text Label 8100 1600 0    50   ~ 0
C0
Entry Wire Line
	8300 2200 8200 2300
Entry Wire Line
	8300 2100 8200 2200
Entry Wire Line
	8300 1900 8200 2000
Entry Wire Line
	8300 1800 8200 1900
Entry Wire Line
	8300 1600 8200 1700
Entry Wire Line
	8300 1500 8200 1600
Entry Wire Line
	8300 1500 8400 1600
Entry Wire Line
	8300 2200 8400 2300
Entry Wire Line
	8300 2100 8400 2200
Entry Wire Line
	8200 2100 8300 2000
Entry Wire Line
	8300 1900 8400 2000
Entry Wire Line
	8300 1800 8400 1900
Entry Wire Line
	8200 1800 8300 1700
Entry Wire Line
	8300 1600 8400 1700
$Comp
L power:GNDD #PWR0126
U 1 1 5F1A79BE
P 9000 3200
AR Path="/5DAA3954/5F1A79BE" Ref="#PWR0126"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5F1A79BE" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/5F1A79BE" Ref="#PWR0149"  Part="1" 
F 0 "#PWR0149" H 9000 2950 50  0001 C CNN
F 1 "GNDD" H 9004 3045 50  0000 C CNN
F 2 "" H 9000 3200 50  0001 C CNN
F 3 "" H 9000 3200 50  0001 C CNN
	1    9000 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 1600 3300 1600
Wire Wire Line
	2500 1700 3300 1700
Wire Wire Line
	2500 1800 3300 1800
Wire Wire Line
	2500 1900 3300 1900
Wire Wire Line
	2950 2000 3300 2000
Wire Wire Line
	2950 2100 3300 2100
Wire Wire Line
	4300 1600 4550 1600
Wire Wire Line
	4300 1700 4550 1700
Wire Wire Line
	4300 1800 4550 1800
Wire Wire Line
	4300 1900 4550 1900
Wire Wire Line
	4300 2000 4550 2000
Wire Wire Line
	4300 2100 4550 2100
Wire Wire Line
	4300 2200 4550 2200
Wire Wire Line
	4300 2300 4550 2300
Wire Wire Line
	4750 2300 5000 2300
Wire Wire Line
	4750 2200 5000 2200
Wire Wire Line
	4750 2100 5000 2100
Wire Wire Line
	4750 2000 5000 2000
Wire Wire Line
	4750 1900 5000 1900
Wire Wire Line
	4750 1800 5000 1800
Wire Wire Line
	4750 1700 5000 1700
Wire Wire Line
	4750 1600 5000 1600
Connection ~ 1200 2300
Wire Wire Line
	1200 2300 1100 2300
Wire Wire Line
	1500 2300 1200 2300
Wire Wire Line
	8100 4200 8100 2800
Connection ~ 9750 3500
Wire Wire Line
	9750 3500 9850 3500
Wire Wire Line
	9500 4500 9750 4500
Wire Wire Line
	8500 4200 8100 4200
Text GLabel 6300 5400 2    50   Input ~ 0
~voe
Text GLabel 9850 3500 2    50   Output ~ 0
s1
Text GLabel 3700 4200 2    50   Output ~ 0
~gsync
$Comp
L 74xx:74LS86 U?
U 4 1 5E118661
P 3400 5200
AR Path="/5E118661" Ref="U?"  Part="4" 
AR Path="/5DA1E9BD/5E118661" Ref="U1"  Part="4" 
F 0 "U1" H 3400 5200 50  0000 C CNN
F 1 "74F86" H 3400 5434 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 3400 5200 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 3400 5200 50  0001 C CNN
	4    3400 5200
	1    0    0    -1  
$EndComp
Text GLabel 7100 5300 0    50   Input ~ 0
pclk
Connection ~ 1200 4200
Text GLabel 8300 5300 3    50   Output ~ 0
G[0..7]
Text GLabel 3700 5200 2    50   Output ~ 0
hblank
Wire Wire Line
	8400 5100 8500 5100
Wire Wire Line
	8400 5000 8500 5000
Wire Wire Line
	8400 4900 8500 4900
Wire Wire Line
	8400 4800 8500 4800
Wire Wire Line
	8400 4700 8500 4700
Wire Wire Line
	8400 4600 8500 4600
Wire Wire Line
	8400 4500 8500 4500
Wire Wire Line
	8400 4400 8500 4400
Wire Wire Line
	8100 5100 8200 5100
Wire Wire Line
	8100 5000 8200 5000
Wire Wire Line
	8100 4900 8200 4900
Wire Wire Line
	8100 4800 8200 4800
Wire Wire Line
	8100 4700 8200 4700
Wire Wire Line
	8100 4600 8200 4600
Wire Wire Line
	8100 4500 8200 4500
Wire Wire Line
	8100 4400 8200 4400
NoConn ~ 8500 4100
Entry Wire Line
	8300 4500 8200 4400
$Comp
L power:VCC #PWR?
U 1 1 5DC90855
P 5800 4100
AR Path="/5DAA3954/5DC90855" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5DC90855" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/5DC90855" Ref="#PWR0148"  Part="1" 
F 0 "#PWR0148" H 5800 3950 50  0001 C CNN
F 1 "VCC" H 5817 4273 50  0000 C CNN
F 2 "" H 5800 4100 50  0001 C CNN
F 3 "" H 5800 4100 50  0001 C CNN
	1    5800 4100
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5DC7B04C
P 5800 5700
AR Path="/5DAA3954/5DC7B04C" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5DC7B04C" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/5DC7B04C" Ref="#PWR0145"  Part="1" 
F 0 "#PWR0145" H 5800 5450 50  0001 C CNN
F 1 "GNDD" H 5804 5545 50  0000 C CNN
F 2 "" H 5800 5700 50  0001 C CNN
F 3 "" H 5800 5700 50  0001 C CNN
	1    5800 5700
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS299 U35
U 1 1 5E4BD098
P 9000 4600
AR Path="/5DAA3954/5E4BD098" Ref="U35"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5E4BD098" Ref="U?"  Part="1" 
AR Path="/5DA1E9BD/5E4BD098" Ref="U35"  Part="1" 
F 0 "U35" H 9000 4700 50  0000 C CNN
F 1 "74F299" H 8950 4600 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 9000 4600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS299" H 9000 4600 50  0001 C CNN
	1    9000 4600
	-1   0    0    -1  
$EndComp
Text GLabel 3100 5300 0    50   Input ~ 0
1
$Comp
L 74xx:74LS32 U4
U 2 1 5DD6E82E
P 3400 3700
F 0 "U4" H 3400 3700 50  0000 C CNN
F 1 "74F32" H 3400 3934 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 3400 3700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 3400 3700 50  0001 C CNN
	2    3400 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 4950 3750 4700
Wire Wire Line
	3050 4950 3750 4950
Wire Wire Line
	3050 5100 3050 4950
Wire Wire Line
	3100 5100 3050 5100
Connection ~ 3750 4700
$Comp
L 74xx:74LS08 U?
U 3 1 5D985775
P 5000 3500
AR Path="/5CDEEC9F/5D985775" Ref="U?"  Part="3" 
AR Path="/5DAA5CD8/5D985775" Ref="U?"  Part="3" 
AR Path="/5D985775" Ref="U?"  Part="3" 
AR Path="/5DA1E9BD/5D985775" Ref="U2"  Part="3" 
F 0 "U2" H 5000 3500 50  0000 C CNN
F 1 "74F08" H 5000 3300 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5000 3500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 5000 3500 50  0001 C CNN
	3    5000 3500
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U?
U 4 1 5D98576F
P 4200 3600
AR Path="/5DAA3954/5D98576F" Ref="U?"  Part="4" 
AR Path="/5DAA5CD8/5D98576F" Ref="U?"  Part="4" 
AR Path="/5D98576F" Ref="U?"  Part="4" 
AR Path="/5DA1E9BD/5D98576F" Ref="U2"  Part="4" 
F 0 "U2" H 4200 3600 50  0000 C CNN
F 1 "74F08" H 4200 3400 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4200 3600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 4200 3600 50  0001 C CNN
	4    4200 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 3800 2900 3800
Entry Wire Line
	2900 3800 2800 3900
Wire Wire Line
	3750 4450 3750 4700
Wire Wire Line
	3050 4300 3050 4450
Wire Wire Line
	3050 4450 3750 4450
Wire Wire Line
	3050 4300 3100 4300
Wire Wire Line
	1200 4200 1500 4200
Wire Wire Line
	1500 6450 1200 6450
Wire Wire Line
	1350 6650 1500 6650
Wire Wire Line
	5200 5950 5200 5850
Wire Wire Line
	5100 5950 5200 5950
Wire Wire Line
	3700 4700 3750 4700
Text Label 2900 4800 0    50   ~ 0
H7
Text Label 2900 4600 0    50   ~ 0
H6
Wire Wire Line
	2900 4800 3100 4800
Wire Wire Line
	2900 4600 3100 4600
Entry Wire Line
	2900 4600 2800 4700
Entry Wire Line
	2900 4800 2800 4900
Text GLabel 6300 5300 2    50   Input ~ 0
~vle
Wire Wire Line
	6300 5100 6500 5100
Text Label 8400 5100 0    50   ~ 0
G7
Text Label 8400 5000 0    50   ~ 0
G6
Text Label 8400 4900 0    50   ~ 0
G5
Text Label 8400 4800 0    50   ~ 0
G4
Text Label 8400 4700 0    50   ~ 0
G3
Text Label 8400 4600 0    50   ~ 0
G2
Text Label 8400 4500 0    50   ~ 0
G1
Text Label 8400 4400 0    50   ~ 0
G0
Text Label 8100 5100 0    50   ~ 0
G7
Text Label 8100 5000 0    50   ~ 0
G6
Text Label 8100 4900 0    50   ~ 0
G5
Text Label 8100 4800 0    50   ~ 0
G4
Text Label 8100 4700 0    50   ~ 0
G3
Text Label 8100 4600 0    50   ~ 0
G2
Text Label 8100 4500 0    50   ~ 0
G1
Text Label 8100 4400 0    50   ~ 0
G0
Entry Wire Line
	8300 5100 8400 5000
Entry Wire Line
	8300 5000 8400 4900
Entry Wire Line
	8300 4900 8400 4800
Entry Wire Line
	8300 4800 8400 4700
Entry Wire Line
	8300 4700 8400 4600
Entry Wire Line
	8300 4600 8400 4500
Entry Wire Line
	8300 4500 8400 4400
Entry Wire Line
	8300 5200 8400 5100
Entry Wire Line
	8300 4600 8200 4500
Entry Wire Line
	8300 4700 8200 4600
Entry Wire Line
	8300 4800 8200 4700
Entry Wire Line
	8300 4900 8200 4800
Entry Wire Line
	8300 5000 8200 4900
Entry Wire Line
	8300 5100 8200 5000
Entry Wire Line
	8300 5200 8200 5100
Text GLabel 9500 4200 2    50   Input ~ 0
1
Text GLabel 9500 4100 2    50   Input ~ 0
1
Text GLabel 9500 4400 2    50   Input ~ 0
1
Text GLabel 9500 5200 2    50   Input ~ 0
1
Text GLabel 9500 4800 2    50   Input ~ 0
1
Text GLabel 9500 4700 2    50   Input ~ 0
1
Text GLabel 9500 5000 2    50   Input ~ 0
dclk
Wire Wire Line
	6300 5000 6500 5000
Wire Wire Line
	6300 4900 6500 4900
Wire Wire Line
	6300 4800 6500 4800
Wire Wire Line
	6300 4700 6500 4700
Wire Wire Line
	6300 4600 6500 4600
Wire Wire Line
	6300 4500 6500 4500
Wire Wire Line
	6300 4400 6500 4400
Wire Wire Line
	4150 4400 4150 4300
Wire Wire Line
	4250 4400 4150 4400
$Comp
L power:VCC #PWR0133
U 1 1 5E732E82
P 4150 4300
AR Path="/5DAA3954/5E732E82" Ref="#PWR0133"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5E732E82" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/5E732E82" Ref="#PWR0166"  Part="1" 
F 0 "#PWR0166" H 4150 4150 50  0001 C CNN
F 1 "VCC" H 4167 4473 50  0000 C CNN
F 2 "" H 4150 4300 50  0001 C CNN
F 3 "" H 4150 4300 50  0001 C CNN
	1    4150 4300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS163 U28
U 1 1 5E4B7483
P 2000 4200
AR Path="/5DAA3954/5E4B7483" Ref="U28"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5E4B7483" Ref="U?"  Part="1" 
AR Path="/5DA1E9BD/5E4B7483" Ref="U28"  Part="1" 
F 0 "U28" H 2000 4200 50  0000 C CNN
F 1 "74F163" H 2050 4100 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 2000 4200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS163" H 2000 4200 50  0001 C CNN
	1    2000 4200
	1    0    0    -1  
$EndComp
Text Label 2600 4000 0    50   ~ 0
H3
Text Label 2600 3900 0    50   ~ 0
H2
Text Label 2600 3800 0    50   ~ 0
H1
Text Label 2600 3700 0    50   ~ 0
H0
Wire Wire Line
	2500 3700 2700 3700
Wire Wire Line
	2500 3800 2700 3800
Wire Wire Line
	2500 3900 2700 3900
Wire Wire Line
	2500 4000 2700 4000
$Comp
L power:GNDD #PWR0105
U 1 1 5E4DB628
P 2000 5000
AR Path="/5DAA3954/5E4DB628" Ref="#PWR0105"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5E4DB628" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/5E4DB628" Ref="#PWR0165"  Part="1" 
F 0 "#PWR0165" H 2000 4750 50  0001 C CNN
F 1 "GNDD" H 2004 4845 50  0000 C CNN
F 2 "" H 2000 5000 50  0001 C CNN
F 3 "" H 2000 5000 50  0001 C CNN
	1    2000 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 4200 2600 4200
$Comp
L power:VCC #PWR0108
U 1 1 5E4ED6D8
P 2000 3400
AR Path="/5DAA3954/5E4ED6D8" Ref="#PWR0108"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5E4ED6D8" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/5E4ED6D8" Ref="#PWR0164"  Part="1" 
F 0 "#PWR0164" H 2000 3250 50  0001 C CNN
F 1 "VCC" H 2017 3573 50  0000 C CNN
F 2 "" H 2000 3400 50  0001 C CNN
F 3 "" H 2000 3400 50  0001 C CNN
	1    2000 3400
	1    0    0    -1  
$EndComp
Text GLabel 1500 3900 0    50   Input ~ 0
0
Text GLabel 1500 3700 0    50   Input ~ 0
0
Text GLabel 1500 3800 0    50   Input ~ 0
1
Text GLabel 1500 4000 0    50   Input ~ 0
1
Text GLabel 1500 4300 0    50   Input ~ 0
1
Text GLabel 1500 4400 0    50   Input ~ 0
1
Text GLabel 1500 4500 0    50   Input ~ 0
qclk
Text GLabel 1500 4700 0    50   Input ~ 0
1
Wire Wire Line
	4650 5100 4900 5100
Wire Wire Line
	4650 5000 4900 5000
Wire Wire Line
	4650 4900 4900 4900
Wire Wire Line
	4650 4800 4900 4800
Wire Wire Line
	4650 4700 4900 4700
Wire Wire Line
	4650 4600 4900 4600
Wire Wire Line
	4650 4500 4900 4500
Wire Wire Line
	4650 4400 4900 4400
$Comp
L Device:R_Network08_US RN4
U 1 1 5D1C1196
P 4450 4800
AR Path="/5DAA3954/5D1C1196" Ref="RN4"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5D1C1196" Ref="RN?"  Part="1" 
AR Path="/5DA1E9BD/5D1C1196" Ref="RN4"  Part="1" 
F 0 "RN4" V 3800 4750 50  0000 L CNN
F 1 "270" V 3900 4750 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 4925 4800 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 4450 4800 50  0001 C CNN
	1    4450 4800
	0    -1   1    0   
$EndComp
Text Label 4900 5100 2    50   ~ 0
DA15
$Comp
L 74xx:74LS574 U34
U 1 1 5E4BEA85
P 7600 4900
AR Path="/5DAA3954/5E4BEA85" Ref="U34"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5E4BEA85" Ref="U?"  Part="1" 
AR Path="/5DA1E9BD/5E4BEA85" Ref="U34"  Part="1" 
F 0 "U34" H 7600 4700 50  0000 C CNN
F 1 "74F574" H 7600 4600 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 7600 4900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 7600 4900 50  0001 C CNN
	1    7600 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 4400 7100 4400
Wire Wire Line
	6900 4500 7100 4500
Wire Wire Line
	6900 4600 7100 4600
Wire Wire Line
	6900 4700 7100 4700
Wire Wire Line
	6900 4800 7100 4800
Wire Wire Line
	6900 4900 7100 4900
Wire Wire Line
	6900 5000 7100 5000
Wire Wire Line
	6900 5100 7100 5100
Entry Wire Line
	6800 5200 6900 5100
Entry Wire Line
	6800 4500 6900 4400
Entry Wire Line
	6800 4600 6900 4500
Entry Wire Line
	6800 4700 6900 4600
Entry Wire Line
	6800 4800 6900 4700
Entry Wire Line
	6800 4900 6900 4800
Entry Wire Line
	6800 5000 6900 4900
Entry Wire Line
	6800 5100 6900 5000
Text Label 6900 4400 0    50   ~ 0
FD0
Text Label 6900 4500 0    50   ~ 0
FD1
Text Label 6900 4600 0    50   ~ 0
FD2
Text Label 6900 4700 0    50   ~ 0
FD3
Text Label 6900 4800 0    50   ~ 0
FD4
Text Label 6900 4900 0    50   ~ 0
FD5
Text Label 6900 5000 0    50   ~ 0
FD6
Text Label 6900 5100 0    50   ~ 0
FD7
$Comp
L power:GNDD #PWR0123
U 1 1 5F160896
P 9000 5500
AR Path="/5DAA3954/5F160896" Ref="#PWR0123"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5F160896" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/5F160896" Ref="#PWR0162"  Part="1" 
F 0 "#PWR0162" H 9000 5250 50  0001 C CNN
F 1 "GNDD" H 9004 5345 50  0000 C CNN
F 2 "" H 9000 5500 50  0001 C CNN
F 3 "" H 9000 5500 50  0001 C CNN
	1    9000 5500
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0124
U 1 1 5F161314
P 7600 4100
AR Path="/5DAA3954/5F161314" Ref="#PWR0124"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5F161314" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/5F161314" Ref="#PWR0161"  Part="1" 
F 0 "#PWR0161" H 7600 3950 50  0001 C CNN
F 1 "VCC" H 7617 4273 50  0000 C CNN
F 2 "" H 7600 4100 50  0001 C CNN
F 3 "" H 7600 4100 50  0001 C CNN
	1    7600 4100
	1    0    0    -1  
$EndComp
Text GLabel 7100 5400 0    50   Input ~ 0
0
$Comp
L power:VCC #PWR0125
U 1 1 5F174359
P 9000 3800
AR Path="/5DAA3954/5F174359" Ref="#PWR0125"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5F174359" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/5F174359" Ref="#PWR0160"  Part="1" 
F 0 "#PWR0160" H 9000 3650 50  0001 C CNN
F 1 "VCC" H 9017 3973 50  0000 C CNN
F 2 "" H 9000 3800 50  0001 C CNN
F 3 "" H 9000 3800 50  0001 C CNN
	1    9000 3800
	1    0    0    -1  
$EndComp
Text GLabel 6800 5400 3    50   Input ~ 0
FD[0..7]
$Comp
L power:VCC #PWR0112
U 1 1 5D1C11D4
P 5200 5850
AR Path="/5DAA3954/5D1C11D4" Ref="#PWR0112"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5D1C11D4" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/5D1C11D4" Ref="#PWR0153"  Part="1" 
F 0 "#PWR0153" H 5200 5700 50  0001 C CNN
F 1 "VCC" H 5217 6023 50  0000 C CNN
F 2 "" H 5200 5850 50  0001 C CNN
F 3 "" H 5200 5850 50  0001 C CNN
	1    5200 5850
	1    0    0    -1  
$EndComp
Text Label 4900 4400 2    50   ~ 0
DA8
Text Label 4900 4500 2    50   ~ 0
DA9
Text Label 4900 4600 2    50   ~ 0
DA10
Text Label 4900 4700 2    50   ~ 0
DA11
Text Label 4900 4800 2    50   ~ 0
DA12
Text Label 4900 4900 2    50   ~ 0
DA13
Text Label 4900 5000 2    50   ~ 0
DA14
Text Label 4500 6650 0    50   ~ 0
DA7
Text Label 4500 6550 0    50   ~ 0
DA6
Text Label 4500 6450 0    50   ~ 0
DA5
Text Label 4500 6350 0    50   ~ 0
DA4
Text Label 4500 6250 0    50   ~ 0
DA3
Text Label 4500 6150 0    50   ~ 0
DA2
Text Label 4500 6050 0    50   ~ 0
DA1
Text Label 4500 5950 0    50   ~ 0
DA0
Wire Wire Line
	4500 6650 4700 6650
Wire Wire Line
	4500 6550 4700 6550
Wire Wire Line
	4500 6450 4700 6450
Wire Wire Line
	4500 6350 4700 6350
Wire Wire Line
	4500 6250 4700 6250
Wire Wire Line
	4500 6150 4700 6150
Wire Wire Line
	4500 6050 4700 6050
Wire Wire Line
	4500 5950 4700 5950
Entry Wire Line
	4900 4500 5000 4600
Entry Wire Line
	4900 4400 5000 4500
Entry Wire Line
	4900 4700 5000 4800
Entry Wire Line
	4900 4600 5000 4700
Entry Wire Line
	4900 4900 5000 5000
Entry Wire Line
	4900 4800 5000 4900
Entry Wire Line
	4900 5100 5000 5200
Entry Wire Line
	4900 5000 5000 5100
Entry Wire Line
	4400 6550 4500 6450
Entry Wire Line
	4400 6650 4500 6550
Entry Wire Line
	4400 6350 4500 6250
Entry Wire Line
	4400 6450 4500 6350
Entry Wire Line
	4400 6150 4500 6050
Entry Wire Line
	4400 6250 4500 6150
Entry Wire Line
	4400 6750 4500 6650
Entry Wire Line
	4400 6050 4500 5950
$Comp
L Device:R_Network08_US RN3
U 1 1 5D1C1190
P 4900 6350
AR Path="/5DAA3954/5D1C1190" Ref="RN3"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5D1C1190" Ref="RN?"  Part="1" 
AR Path="/5DA1E9BD/5D1C1190" Ref="RN3"  Part="1" 
F 0 "RN3" V 4250 6250 50  0000 L CNN
F 1 "270" V 4350 6250 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 5375 6350 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 4900 6350 50  0001 C CNN
	1    4900 6350
	0    1    1    0   
$EndComp
$Comp
L 74xx:74LS32 U?
U 4 1 5E880E7A
P 3400 4700
AR Path="/5CDEEC9F/5E880E7A" Ref="U?"  Part="4" 
AR Path="/5DAA5CD8/5E880E7A" Ref="U?"  Part="4" 
AR Path="/5DAA3954/5E880E7A" Ref="U5"  Part="4" 
AR Path="/5DAA5CD8/5D9A6C5F/5E880E7A" Ref="U?"  Part="4" 
AR Path="/5DA1E9BD/5E880E7A" Ref="U4"  Part="4" 
F 0 "U4" H 3400 4700 50  0000 C CNN
F 1 "74F32" H 3400 4934 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 3400 4700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 3400 4700 50  0001 C CNN
	4    3400 4700
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U?
U 3 1 5E880E74
P 3400 4200
AR Path="/5CDEEC9F/5E880E74" Ref="U?"  Part="3" 
AR Path="/5DAA5CD8/5E880E74" Ref="U?"  Part="3" 
AR Path="/5DAA3954/5E880E74" Ref="U5"  Part="3" 
AR Path="/5DAA5CD8/5D9A6C5F/5E880E74" Ref="U?"  Part="3" 
AR Path="/5DA1E9BD/5E880E74" Ref="U4"  Part="3" 
F 0 "U4" H 3400 4200 50  0000 C CNN
F 1 "74F32" H 3400 4000 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 3400 4200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 3400 4200 50  0001 C CNN
	3    3400 4200
	1    0    0    -1  
$EndComp
NoConn ~ 2500 6450
Wire Wire Line
	3100 4100 2900 4100
$Comp
L 74xx:74LS574 U31
U 1 1 5D660036
P 5800 4900
AR Path="/5DAA3954/5D660036" Ref="U31"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5D660036" Ref="U?"  Part="1" 
AR Path="/5DA1E9BD/5D660036" Ref="U31"  Part="1" 
F 0 "U31" H 5800 4700 50  0000 C CNN
F 1 "74F574" H 5800 4600 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 5800 4900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 5800 4900 50  0001 C CNN
	1    5800 4900
	-1   0    0    -1  
$EndComp
Text Label 2900 4100 0    50   ~ 0
H4
Entry Wire Line
	2900 4100 2800 4200
Text Label 2900 3800 0    50   ~ 0
H0
Text GLabel 3900 3500 0    50   Input ~ 0
qclk
Text GLabel 4700 3400 0    50   Input ~ 0
sclk
Text GLabel 3100 3600 0    50   Input ~ 0
mode1
Entry Wire Line
	6500 5100 6600 5200
Entry Wire Line
	6500 4800 6600 4900
Entry Wire Line
	6500 4900 6600 5000
Entry Wire Line
	6500 5000 6600 5100
Entry Wire Line
	6500 4700 6600 4800
Entry Wire Line
	6500 4400 6600 4500
Entry Wire Line
	6500 4500 6600 4600
Entry Wire Line
	6500 4600 6600 4700
Text GLabel 3100 6950 0    50   Input ~ 0
qclk
Text GLabel 3100 6850 0    50   Input ~ 0
hblank
Text GLabel 1500 6950 0    50   Input ~ 0
1
Text GLabel 1500 6750 0    50   Input ~ 0
qclk
Text GLabel 1500 6550 0    50   Input ~ 0
1
Text GLabel 1500 6250 0    50   Input ~ 0
0
Text GLabel 1500 6150 0    50   Input ~ 0
0
Text GLabel 1500 6050 0    50   Input ~ 0
0
Text GLabel 1500 5950 0    50   Input ~ 0
1
$Comp
L power:GNDD #PWR0114
U 1 1 5E722349
P 3600 7250
AR Path="/5DAA3954/5E722349" Ref="#PWR0114"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5E722349" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/5E722349" Ref="#PWR0147"  Part="1" 
F 0 "#PWR0147" H 3600 7000 50  0001 C CNN
F 1 "GNDD" H 3604 7095 50  0000 C CNN
F 2 "" H 3600 7250 50  0001 C CNN
F 3 "" H 3600 7250 50  0001 C CNN
	1    3600 7250
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR0113
U 1 1 5E721518
P 2000 7250
AR Path="/5DAA3954/5E721518" Ref="#PWR0113"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5E721518" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/5E721518" Ref="#PWR0146"  Part="1" 
F 0 "#PWR0146" H 2000 7000 50  0001 C CNN
F 1 "GNDD" H 2004 7095 50  0000 C CNN
F 2 "" H 2000 7250 50  0001 C CNN
F 3 "" H 2000 7250 50  0001 C CNN
	1    2000 7250
	1    0    0    -1  
$EndComp
Text Label 6500 4400 2    50   ~ 0
PD0
Text Label 6500 4500 2    50   ~ 0
PD1
Text Label 6500 4600 2    50   ~ 0
PD2
Text Label 6500 4700 2    50   ~ 0
PD3
Entry Wire Line
	5100 4600 5000 4700
Entry Wire Line
	5100 4500 5000 4600
Entry Wire Line
	5100 4400 5000 4500
Entry Wire Line
	5100 5100 5000 5200
Wire Wire Line
	5300 4400 5100 4400
Wire Wire Line
	5300 4500 5100 4500
Wire Wire Line
	5300 4600 5100 4600
Wire Wire Line
	5300 4700 5100 4700
Text Label 5300 4700 2    50   ~ 0
DA11
Text Label 5300 4600 2    50   ~ 0
DA10
Text Label 5250 4500 2    50   ~ 0
DA9
Text Label 5250 4400 2    50   ~ 0
DA8
Entry Wire Line
	5100 5000 5000 5100
Entry Wire Line
	5100 4900 5000 5000
Entry Wire Line
	5100 4800 5000 4900
Entry Wire Line
	5100 4700 5000 4800
Wire Wire Line
	5300 4800 5100 4800
Wire Wire Line
	5300 4900 5100 4900
Wire Wire Line
	5300 5000 5100 5000
Wire Wire Line
	5300 5100 5100 5100
Text Label 5300 5100 2    50   ~ 0
DA15
Text Label 5300 5000 2    50   ~ 0
DA14
Text Label 5300 4900 2    50   ~ 0
DA13
Text Label 5300 4800 2    50   ~ 0
DA12
$Comp
L power:VCC #PWR0107
U 1 1 5E4E6308
P 3600 5650
AR Path="/5DAA3954/5E4E6308" Ref="#PWR0107"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5E4E6308" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/5E4E6308" Ref="#PWR0144"  Part="1" 
F 0 "#PWR0144" H 3600 5500 50  0001 C CNN
F 1 "VCC" H 3617 5823 50  0000 C CNN
F 2 "" H 3600 5650 50  0001 C CNN
F 3 "" H 3600 5650 50  0001 C CNN
	1    3600 5650
	1    0    0    -1  
$EndComp
Text GLabel 4400 6850 3    50   Output ~ 0
DA[0..15]
Entry Wire Line
	4300 6350 4400 6450
Entry Wire Line
	4300 6450 4400 6550
Entry Wire Line
	4300 6550 4400 6650
Entry Wire Line
	4300 6650 4400 6750
Wire Wire Line
	4100 6650 4300 6650
Wire Wire Line
	4100 6550 4300 6550
Wire Wire Line
	4100 6450 4300 6450
Wire Wire Line
	4100 6350 4300 6350
Text Label 4150 6350 0    50   ~ 0
DA4
Text Label 4150 6450 0    50   ~ 0
DA5
Text Label 4150 6550 0    50   ~ 0
DA6
Text Label 4150 6650 0    50   ~ 0
DA7
Entry Wire Line
	4300 5950 4400 6050
Entry Wire Line
	4300 6050 4400 6150
Entry Wire Line
	4300 6150 4400 6250
Entry Wire Line
	4300 6250 4400 6350
Wire Wire Line
	4100 6250 4300 6250
Wire Wire Line
	4100 6150 4300 6150
Wire Wire Line
	4100 6050 4300 6050
Wire Wire Line
	4100 5950 4300 5950
Text Label 4150 5950 0    50   ~ 0
DA0
Text Label 4150 6050 0    50   ~ 0
DA1
Text Label 4150 6150 0    50   ~ 0
DA2
Text Label 4150 6250 0    50   ~ 0
DA3
Entry Wire Line
	2800 5850 2700 5950
Entry Wire Line
	2800 5950 2700 6050
Entry Wire Line
	2800 6050 2700 6150
Entry Wire Line
	2800 6150 2700 6250
Wire Wire Line
	2500 6250 2700 6250
Wire Wire Line
	2500 6150 2700 6150
Wire Wire Line
	2500 6050 2700 6050
Wire Wire Line
	2500 5950 2700 5950
Text Label 2600 5950 0    50   ~ 0
H4
Text Label 2600 6050 0    50   ~ 0
H5
Text Label 2600 6150 0    50   ~ 0
H6
Text Label 2600 6250 0    50   ~ 0
H7
$Comp
L power:VCC #PWR0106
U 1 1 5E4DC06C
P 2000 5650
AR Path="/5DAA3954/5E4DC06C" Ref="#PWR0106"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5E4DC06C" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/5E4DC06C" Ref="#PWR0143"  Part="1" 
F 0 "#PWR0143" H 2000 5500 50  0001 C CNN
F 1 "VCC" H 2017 5823 50  0000 C CNN
F 2 "" H 2000 5650 50  0001 C CNN
F 3 "" H 2000 5650 50  0001 C CNN
	1    2000 5650
	1    0    0    -1  
$EndComp
Text Label 2900 6650 0    50   ~ 0
H7
Text Label 2900 6550 0    50   ~ 0
H6
Text Label 2900 6450 0    50   ~ 0
H5
Text Label 2900 6350 0    50   ~ 0
H4
Wire Wire Line
	2900 6650 3100 6650
Wire Wire Line
	2900 6550 3100 6550
Wire Wire Line
	2900 6450 3100 6450
Wire Wire Line
	2900 6350 3100 6350
Entry Wire Line
	2900 6650 2800 6550
Entry Wire Line
	2900 6550 2800 6450
Entry Wire Line
	2900 6450 2800 6350
Entry Wire Line
	2900 6350 2800 6250
Text Label 2900 6250 0    50   ~ 0
H3
Text Label 2900 6150 0    50   ~ 0
H2
Text Label 2900 6050 0    50   ~ 0
H1
Text Label 2900 5950 0    50   ~ 0
H0
Wire Wire Line
	2900 6250 3100 6250
Wire Wire Line
	2900 6150 3100 6150
Wire Wire Line
	2900 6050 3100 6050
Wire Wire Line
	2900 5950 3100 5950
Entry Wire Line
	2900 6250 2800 6150
Entry Wire Line
	2900 6150 2800 6050
Entry Wire Line
	2900 6050 2800 5950
Entry Wire Line
	2900 5950 2800 5850
Entry Wire Line
	2800 3800 2700 3700
Entry Wire Line
	2800 3900 2700 3800
Entry Wire Line
	2800 4000 2700 3900
Entry Wire Line
	2800 4100 2700 4000
Text Label 6500 4800 2    50   ~ 0
PD4
Text Label 6500 4900 2    50   ~ 0
PD5
Text Label 6500 5000 2    50   ~ 0
PD6
Text Label 6500 5100 2    50   ~ 0
PD7
$Comp
L 74xx:74LS541 U30
U 1 1 5E4BA4C4
P 3600 6450
AR Path="/5DAA3954/5E4BA4C4" Ref="U30"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5E4BA4C4" Ref="U?"  Part="1" 
AR Path="/5DA1E9BD/5E4BA4C4" Ref="U30"  Part="1" 
F 0 "U30" H 3600 6250 50  0000 C CNN
F 1 "74F541" H 3600 6150 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 3600 6450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS541" H 3600 6450 50  0001 C CNN
	1    3600 6450
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS163 U29
U 1 1 5E4B79C3
P 2000 6450
AR Path="/5DAA3954/5E4B79C3" Ref="U29"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5E4B79C3" Ref="U?"  Part="1" 
AR Path="/5DA1E9BD/5E4B79C3" Ref="U29"  Part="1" 
F 0 "U29" H 2000 6450 50  0000 C CNN
F 1 "74F163" H 2050 6350 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 2000 6450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS163" H 2000 6450 50  0001 C CNN
	1    2000 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 2300 1200 4200
Wire Wire Line
	9750 4500 9750 3500
Wire Wire Line
	1350 5300 2600 5300
Wire Wire Line
	2600 4200 2600 5300
Wire Wire Line
	1200 4200 1200 6450
Entry Bus Bus
	4900 5550 5000 5450
Entry Bus Bus
	4400 5650 4500 5550
Wire Bus Line
	4500 5550 4900 5550
Wire Wire Line
	1350 5300 1350 6650
Wire Wire Line
	3700 3700 3900 3700
Wire Wire Line
	4500 3600 4700 3600
$Comp
L power:GNDD #PWR0122
U 1 1 5F15FC9A
P 7600 5700
AR Path="/5DAA3954/5F15FC9A" Ref="#PWR0122"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5F15FC9A" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/5F15FC9A" Ref="#PWR0163"  Part="1" 
F 0 "#PWR0163" H 7600 5450 50  0001 C CNN
F 1 "GNDD" H 7604 5545 50  0000 C CNN
F 2 "" H 7600 5700 50  0001 C CNN
F 3 "" H 7600 5700 50  0001 C CNN
	1    7600 5700
	1    0    0    -1  
$EndComp
Text GLabel 6600 5400 3    50   Input ~ 0
PD[0..7]
Wire Wire Line
	5300 3500 9750 3500
Wire Bus Line
	2850 2100 2850 2400
Wire Bus Line
	1200 1400 1200 2000
Wire Bus Line
	8300 4500 8300 5300
Wire Bus Line
	6800 4500 6800 5400
Wire Bus Line
	5000 4500 5000 5450
Wire Bus Line
	8300 1400 8300 2200
Wire Bus Line
	6800 1400 6800 2200
Wire Bus Line
	4650 1400 4650 2200
Wire Bus Line
	4400 5650 4400 6850
Wire Bus Line
	6600 4500 6600 5400
Wire Bus Line
	2800 3800 2800 6550
$EndSCHEMATC
