*version 6.3 2051934318
u 99
XC4000E 4091239217
U? 3
@libraries
XC4000E [.slb]
@analysis
@targets
@attributes
a FAMILY=XC4000E
a IMPL=XILINX
@translators
@setup
unconnectedPins 0
connectViaLabel 1
connectViaLocalLabels 0
NoStim4ExtIFPortsWarnings 1
AutoGenStim4ExtIFPorts 1
@index
pageloc 1 0 1862 1
@status
*page 1 0 1100 850 iX
@ports
port 100 IF_IN 130 430 h
a 0 s 3 0 10 8 hln 80 LABEL=C
port 101 IF_IN 130 410 h
a 0 s 3 0 10 8 hln 80 LABEL=CE
port 102 IF_IN 130 380 h
a 0 s 3 0 10 8 hln 80 LABEL=T
port 103 IF_IN 130 340 h
a 0 s 3 0 10 8 hln 80 LABEL=PRE
port 104 IF_OUT 960 370 h
a 0 s 3 0 20 8 hln 80 LABEL=Q
@parts
part 16 XOR2 310 360 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 40 hlt 100 PART=XOR2
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 23 FDPE 640 340 h
a 0 sp 9 0 120 0 hrn 100 REFDES=U2
a 0 sp 11 0 60 20 hcn 200 PART=FDPE
a 0 u 13 13 20 150 hln 100 RLOC=R0C0
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 30
s 790 370 960 370 24
a 0 s 3 0 940 370 hln 100 LABEL=Q
s 790 370 790 290 28
s 290 360 310 360 25
s 290 360 290 290 26
s 290 290 790 290 27
s 760 370 790 370 29
w 48
s 130 380 310 380 47
a 0 s 3 0 140 380 hln 100 LABEL=T
w 56
s 390 370 640 370 55
a 0 s 3 0 410 370 hln 100 LABEL=TQ
w 72
s 130 410 540 410 69
a 0 s 3 0 140 410 hln 100 LABEL=CE
s 540 410 540 390 71
s 540 390 640 390 70
w 83
s 130 430 560 430 80
a 0 s 3 0 140 430 hln 100 LABEL=C
s 560 430 560 410 82
s 560 410 640 410 81
w 92
s 130 340 640 340 91
a 0 s 3 0 140 340 hln 100 LABEL=PRE
@junction
j 790 370
+ w 30
+ w 30
j 310 360
+ p 16 I1
+ w 30
j 760 370
+ p 23 Q
+ w 30
j 310 380
+ p 16 I0
+ w 48
j 390 370
+ p 16 O
+ w 56
j 640 370
+ p 23 D
+ w 56
j 640 390
+ p 23 CE
+ w 72
j 640 410
+ p 23 C
+ w 83
j 640 340
+ p 23 PRE
+ w 92
j 130 430
+ s 100
+ w 83
j 130 410
+ s 101
+ w 72
j 130 380
+ s 102
+ w 48
j 130 340
+ s 103
+ w 92
j 960 370
+ s 104
+ w 30
@attributes
@text
s 5 750 750 hln 100 XC4000E FAMILY FTPE MACRO
s 5 950 820 hln 100 A
s 5 950 800 hln 100 1
s 5 30 820 hln 100 COPYRIGHT (C) 1995, XILINX INC.
s 5 30 810 hln 100 DRAWN BY KS
s 5 750 770 hln 100 TOGGLE FLIP-FLOP WITH TOGGLE
s 5 750 780 hln 100 ENABLE,CLK ENABLE & ASYNC PRESET
s 5 710 800 hln 100 16TH MARCH 1995
