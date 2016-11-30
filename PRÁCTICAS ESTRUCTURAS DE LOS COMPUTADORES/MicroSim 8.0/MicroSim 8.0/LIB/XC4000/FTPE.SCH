*version 6.3 391953720
u 96
XC4000 3317390669
U? 3
@libraries
XC4000 [.slb]
@analysis
@targets
@attributes
a FAMILY=XC4000
a IMPL=XILINX
@translators
@setup
unconnectedPins 0
connectViaLabel 1
connectViaLocalLabels 0
NoStim4ExtIFPortsWarnings 1
AutoGenStim4ExtIFPorts 1
@index
pageloc 1 0 1855 1
@status
*page 1 0 1100 850 iX
@ports
port 97 IF_OUT 960 370 h
a 0 s 3 0 20 8 hln 80 LABEL=Q
port 98 IF_IN 130 340 h
a 0 s 3 0 10 8 hln 80 LABEL=PRE
port 99 IF_IN 130 380 h
a 0 s 3 0 10 8 hln 80 LABEL=T
port 100 IF_IN 130 410 h
a 0 s 3 0 10 8 hln 80 LABEL=CE
port 101 IF_IN 130 430 h
a 0 s 3 0 10 8 hln 80 LABEL=C
@parts
part 18 FDPE 640 340 h
a 0 sp 9 0 120 0 hrn 100 REFDES=U1
a 0 sp 11 0 60 10 hcn 200 PART=FDPE
a 0 u 13 13 20 140 hln 100 RLOC=R0C0
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 23 XOR2 310 360 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U2
a 0 sp 11 0 10 40 hlt 100 PART=XOR2
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 25
s 130 340 640 340 24
a 0 s 3 0 140 340 hln 100 LABEL=PRE
w 35
s 130 430 560 430 32
a 0 s 3 0 140 430 hln 100 LABEL=C
s 560 430 560 410 33
s 560 410 640 410 34
w 45
s 130 410 540 410 42
a 0 s 3 0 140 410 hln 100 LABEL=CE
s 540 410 540 390 43
s 540 390 640 390 44
w 53
s 390 370 640 370 52
a 0 s 3 0 410 370 hln 100 LABEL=TQ
w 67
s 130 380 310 380 66
a 0 s 3 0 140 380 hln 100 LABEL=T
w 80
s 790 370 960 370 74
a 0 s 3 0 940 370 hln 100 LABEL=Q
s 760 370 790 370 75
s 790 370 790 290 76
s 290 290 790 290 77
s 290 360 290 290 78
s 290 360 310 360 79
@junction
j 640 340
+ p 18 PRE
+ w 25
j 640 410
+ p 18 C
+ w 35
j 640 390
+ p 18 CE
+ w 45
j 640 370
+ p 18 D
+ w 53
j 390 370
+ p 23 O
+ w 53
j 310 380
+ p 23 I0
+ w 67
j 790 370
+ w 80
+ w 80
j 760 370
+ p 18 Q
+ w 80
j 310 360
+ p 23 I1
+ w 80
j 960 370
+ s 97
+ w 80
j 130 340
+ s 98
+ w 25
j 130 380
+ s 99
+ w 67
j 130 410
+ s 100
+ w 45
j 130 430
+ s 101
+ w 35
@attributes
@text
s 5 710 800 hln 100 16TH MARCH 1993
s 5 750 780 hln 100 ENABLE,CLK ENABLE & ASYNC PRESET
s 5 750 770 hln 100 TOGGLE FLIP-FLOP WITH TOGGLE
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
s 5 750 750 hln 100 XC4000 FAMILY FTPE MACRO
