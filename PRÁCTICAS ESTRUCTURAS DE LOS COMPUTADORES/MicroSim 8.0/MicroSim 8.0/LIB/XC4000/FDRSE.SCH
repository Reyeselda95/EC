*version 6.3 79970561
u 117
XC4000 94426850
U? 4
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
pageloc 1 0 2215 1
@status
*page 1 0 1100 850 iX
@ports
port 118 IF_IN 210 390 h
a 0 s 3 0 10 8 hln 80 LABEL=C
port 119 IF_IN 210 370 h
a 0 s 3 0 10 8 hln 80 LABEL=CE
port 120 IF_IN 210 290 h
a 0 s 3 0 10 8 hln 80 LABEL=D
port 121 IF_OUT 890 350 h
a 0 s 3 0 20 8 hln 80 LABEL=Q
port 122 IF_IN 210 420 h
a 0 s 3 0 10 8 hln 80 LABEL=R
port 123 IF_IN 210 310 h
a 0 s 3 0 10 8 hln 80 LABEL=S
@parts
part 18 FDRE 590 350 h
a 0 sp 9 0 120 0 hrn 100 REFDES=U1
a 0 sp 11 0 60 20 hcn 200 PART=FDRE
a 0 u 13 13 20 140 hln 100 RLOC=R0C0
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 23 OR2 410 290 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U2
a 0 sp 11 0 10 40 hlt 100 PART=OR2
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 24 OR2 410 350 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U3
a 0 sp 11 0 10 40 hlt 100 PART=OR2
a 0 a 0 0 0 0 hln 100 PKGREF=U3
@conn
w 28
s 490 300 560 300 25
a 0 s 3 0 500 300 hln 100 LABEL=D_S
s 560 350 560 300 26
s 560 350 590 350 27
w 44
s 490 360 540 360 41
a 0 s 3 0 500 360 hln 100 LABEL=CE_S
s 540 370 540 360 42
s 540 370 590 370 43
w 58
s 210 420 590 420 57
a 0 s 3 0 220 420 hln 100 LABEL=R
w 66
s 210 390 590 390 65
a 0 s 3 0 220 390 hln 100 LABEL=C
w 74
s 710 350 890 350 73
a 0 s 3 0 870 350 hln 100 LABEL=Q
w 82
s 210 370 410 370 81
a 0 s 3 0 220 370 hln 100 LABEL=CE
w 90
s 210 290 410 290 89
a 0 s 3 0 220 290 hln 100 LABEL=D
w 101
s 210 310 360 310 97
a 0 s 3 0 220 310 hln 100 LABEL=S
s 360 310 410 310 98
s 360 350 360 310 99
s 360 350 410 350 100
@junction
j 590 350
+ p 18 D
+ w 28
j 490 300
+ p 23 O
+ w 28
j 590 370
+ p 18 CE
+ w 44
j 490 360
+ p 24 O
+ w 44
j 590 420
+ p 18 R
+ w 58
j 590 390
+ p 18 C
+ w 66
j 710 350
+ p 18 Q
+ w 74
j 410 370
+ p 24 I0
+ w 82
j 410 290
+ p 23 I1
+ w 90
j 360 310
+ w 101
+ w 101
j 410 310
+ p 23 I0
+ w 101
j 410 350
+ p 24 I1
+ w 101
j 210 390
+ s 118
+ w 66
j 210 370
+ s 119
+ w 82
j 210 290
+ s 120
+ w 90
j 890 350
+ s 121
+ w 74
j 210 420
+ s 122
+ w 58
j 210 310
+ s 123
+ w 101
@attributes
@text
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 710 800 hln 100 24TH FEBRUARY 1993
s 5 760 750 hln 100 XC4000 FAMILY FDRSE MACRO
s 5 760 770 hln 100 D FLIP-FLOP W/ SYNC RESET & SET,
s 5 760 780 hln 100 & CLOCK ENABLE
s 5 950 820 hln 100 A
s 5 950 800 hln 100 1
