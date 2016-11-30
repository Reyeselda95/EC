*version 6.3 80546654
u 120
XC4000E 855777442
U? 4
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
pageloc 1 0 2215 1
@status
*page 1 0 1100 850 iX
@ports
port 121 IF_IN 210 310 h
a 0 s 3 0 10 8 hln 80 LABEL=S
port 122 IF_IN 210 420 h
a 0 s 3 0 10 8 hln 80 LABEL=R
port 123 IF_OUT 890 350 h
a 0 s 3 0 20 8 hln 80 LABEL=Q
port 124 IF_IN 210 290 h
a 0 s 3 0 10 8 hln 80 LABEL=D
port 125 IF_IN 210 370 h
a 0 s 3 0 10 8 hln 80 LABEL=CE
port 126 IF_IN 210 390 h
a 0 s 3 0 10 8 hln 80 LABEL=C
@parts
part 16 OR2 410 350 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 40 hlt 100 PART=OR2
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 17 OR2 410 290 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U2
a 0 sp 11 0 10 40 hlt 100 PART=OR2
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 24 FDRE 590 350 h
a 0 sp 9 0 120 0 hrn 100 REFDES=U3
a 0 sp 11 0 60 20 hcn 200 PART=FDRE
a 0 u 13 13 20 140 hln 100 RLOC=R0C0
a 0 a 0 0 0 0 hln 100 PKGREF=U3
@conn
w 29
s 210 310 360 310 25
a 0 s 3 0 220 310 hln 100 LABEL=S
s 360 350 360 310 27
s 360 350 410 350 26
s 360 310 410 310 28
w 47
s 210 290 410 290 46
a 0 s 3 0 220 290 hln 100 LABEL=D
w 55
s 210 370 410 370 54
a 0 s 3 0 220 370 hln 100 LABEL=CE
w 63
s 710 350 890 350 62
a 0 s 3 0 870 350 hln 100 LABEL=Q
w 71
s 210 390 590 390 70
a 0 s 3 0 220 390 hln 100 LABEL=C
w 79
s 210 420 590 420 78
a 0 s 3 0 220 420 hln 100 LABEL=R
w 89
s 490 360 540 360 86
a 0 s 3 0 500 360 hln 100 LABEL=CE_S
s 540 370 540 360 88
s 540 370 590 370 87
w 106
s 490 300 560 300 103
a 0 s 3 0 500 300 hln 100 LABEL=D_S
s 560 350 560 300 105
s 560 350 590 350 104
@junction
j 360 310
+ w 29
+ w 29
j 410 350
+ p 16 I1
+ w 29
j 410 310
+ p 17 I0
+ w 29
j 410 290
+ p 17 I1
+ w 47
j 410 370
+ p 16 I0
+ w 55
j 710 350
+ p 24 Q
+ w 63
j 590 390
+ p 24 C
+ w 71
j 590 420
+ p 24 R
+ w 79
j 490 360
+ p 16 O
+ w 89
j 590 370
+ p 24 CE
+ w 89
j 490 300
+ p 17 O
+ w 106
j 590 350
+ p 24 D
+ w 106
j 210 310
+ s 121
+ w 29
j 210 420
+ s 122
+ w 79
j 890 350
+ s 123
+ w 63
j 210 290
+ s 124
+ w 47
j 210 370
+ s 125
+ w 55
j 210 390
+ s 126
+ w 71
@attributes
@text
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
s 5 760 780 hln 100 & CLOCK ENABLE
s 5 760 770 hln 100 D FLIP-FLOP W/ SYNC RESET & SET,
s 5 760 750 hln 100 XC4000E FAMILY FDRSE MACRO
s 5 710 800 hln 100 24TH FEBRUARY 1995
s 5 30 820 hln 100 COPYRIGHT (C) 1995, XILINX INC.
s 5 30 810 hln 100 DRAWN BY KS
