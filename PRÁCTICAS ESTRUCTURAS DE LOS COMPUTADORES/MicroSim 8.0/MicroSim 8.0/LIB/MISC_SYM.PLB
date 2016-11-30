*version 8.0 1944393984
@index
symloc C_elect 0 150
symloc FUSE 150 91
symloc JUMPER1X2 241 69
symloc JUMPER2X2 310 89
symloc JUMPER1X3 399 80
symloc JUMPER1X4 479 89
symloc LED 568 119
symloc 3-UP-LED 687 87
symloc 4-UP-LED 774 93
symloc DIPSW4 867 116
symloc DIPSW8 983 192
symloc BRIDGE 1175 79
symloc CRYSTAL 1254 169
symloc OSCILLATOR 1423 84
symloc XTAL-OSC/TTL 1507 85
symloc XTAL-OSC/HCMOS 1592 99
symloc AT&T2659E 1691 98
symloc XFMR/CT-PRI/SEC 1789 129
symloc XFMR/CT-SEC 1918 127
symloc VPPXX/2.5VA/MAG 2045 152
symloc TY-XXXP/100W/MAG 2197 127
symloc TRIMPOT 2324 111
*package C_elect
@types 1
g 1
@pinout
t PLP3970SMD/AA,PLP3970SMD/BB,PLP3481/AA,PLP3481/BB,PLP3481/CD,PLP3476/LL,PLP3476/KG,PLP3476/CB
g 1
p + 1
p - 2
*package FUSE
@types 1
g 1
@pinout
t NANO-R451,PICOII-R473,PICO-R460
g 1
p PIN1 1
p PIN2 2
*package JUMPER1X2
@types 1
g 1
@pinout
t HDR2
g 1
p PIN1 1
p PIN2 2
*package JUMPER2X2
@types 1
g 1
@pinout
t HDR2X2
g 1
p PIN1 1
p PIN2 2
p PIN3 3
p PIN4 4
*package JUMPER1X3
@types 1
g 1
@pinout
t HDR1X3
g 1
p PIN1 1
p PIN2 2
p PIN3 3
*package JUMPER1X4
@types 1
g 1
@pinout
t HDR1X4
g 1
p PIN1 1
p PIN2 2
p PIN3 3
p PIN4 4
*package LED
@types 1
g 1
@pinout
t T-1/PCB_LEVEL,T-1/MINI/PCB_LEVEL,T-1/WIRE_ENDED,T-1_3/4/WIRE_ENDED
g 1
p A 1
p K 2
*package 3-UP-LED
@types 3
g 1 A,B,C
@pinout
t 3/T-1/PCB_LEVEL
g 1
p A 5,3,1
p K 6,4,2
*package 4-UP-LED
@types 4
g 1 A,B,C,D
@pinout
t 4/T-1/PCB_LEVEL
g 1
p A 7,5,3,1
p K 8,6,4,2
*package DIPSW4
@types 1
g 1
@pinout
t DIP8
g 1
p OFF1 1
p OFF2 2
p OFF3 3
p OFF4 4
p ON1 8
p ON2 7
p ON3 6
p ON4 5
*package DIPSW8
@types 1
g 1
@pinout
t DIP16
g 1
p OFF1 1
p OFF2 2
p OFF3 3
p OFF4 4
p OFF5 5
p OFF6 6
p OFF7 7
p OFF8 8
p ON1 16
p ON2 15
p ON3 14
p ON4 13
p ON5 12
p ON6 11
p ON7 10
p ON8 9
*package BRIDGE
@types 1
g 1 
@pinout
t BRIDGE
g 1
p - 1
p + 2
p AC2 3
p AC1 4
*package CRYSTAL
@types 1
g 1
@pinout
t EDC140,EDC150
g 1
p PIN1 1
p PIN2 3
t EDC100
g 1
p PIN1 1
p PIN2 4
t HC-18U,HC-33U,HC-49,HC-51,EDC130,UM-1
g 1
p PIN1 1
p PIN2 2
*package OSCILLATOR
@types 1
g 1
@pinout
t DIP14
g 1
p IN 1
p GND 7
p OUT 8
p V+ 14
*package XTAL-OSC/TTL
@types 1
g 1
@pinout
t XTAL/DIP14
g 1
p GND 7
p OUT 8
p VCC 14
*package XTAL-OSC/HCMOS
@types 1
g 1
@pinout
t XTAL/DIP14
g 1
p GND 7
p OUT 8
p VDD 14
p NC/CTRL 1
*package AT&T2659E
@types 1
g 1
@pinout
t AT&T2659E/AUDIO
g 1
p pin7 7
p pin3 3
p pin6 6
p pin2 2
*package XFMR/CT-PRI/SEC
@types 1
g 1
@pinout
t MINI-CIRC/KK81
g 1
p PRI_DOT 4
p PRI 6
p PRI_CT 5
p SEC 1
p SEC_DOT 3
p SEC_CT 2
*package XFMR/CT-SEC
@types 1
g 1
@pinout
t MINI-CIRC/W38,MINI-CIRC/X65
g 1
p PRI_DOT 4
p PRI 6
p SEC 1
p SEC_DOT 3
p SEC_CT 2
*package VPPXX/2.5VA/MAG
@types 1
g 1
@pinout
t VPP/2.5VA
g 1
p PRI0 3
p SEC0 9
p PRI-DOT0 1
p SEC-DOT0 7
p PRI-DOT1 4
p SEC-DOT1 10
p PRI1 6
p SEC1 12
*package TY-XXXP/100W/MAG
@types 1
g 1
@pinout
t TYXXXP-100W
g 1
p PRI_DOT 1
p PRI 3
p SEC 6
p SEC_DOT 4
p SEC_CT 5
p PRI_CT 2
*package TRIMPOT
@types 1
g 1
@pinout
t ST-4A,ST-4B,ST-5P,ST-5R,ST-5W,ST-5X,ST-6P
g 1
p WIPER 2
p CCW 1
p CW 3
