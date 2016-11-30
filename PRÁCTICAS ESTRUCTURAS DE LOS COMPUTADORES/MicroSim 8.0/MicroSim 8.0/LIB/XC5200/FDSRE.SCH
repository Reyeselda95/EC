*version 6.3 671376650
u 123
XC5200 3059273141
U? 4
@libraries
XC5200 [.slb]
@analysis
@targets
@attributes
a FAMILY=XC5200
a IMPL=XILINX
@translators
@setup
unconnectedPins 0
connectViaLabel 1
connectViaLocalLabels 0
NoStim4ExtIFPortsWarnings 1
AutoGenStim4ExtIFPorts 1
@index
pageloc 1 0 2222 1
@status
*page 1 0 1100 850 iX
@ports
port 124 IF_IN 210 320 h
a 0 s 3 0 10 8 hln 80 LABEL=S
port 125 IF_IN 210 360 h
a 0 s 3 0 10 8 hln 80 LABEL=R
port 126 IF_OUT 890 350 h
a 0 s 3 0 20 8 hln 80 LABEL=Q
port 127 IF_IN 210 340 h
a 0 s 3 0 10 8 hln 80 LABEL=D
port 128 IF_IN 210 420 h
a 0 s 3 0 10 8 hln 80 LABEL=CE
port 129 IF_IN 210 450 h
a 0 s 3 0 10 8 hln 80 LABEL=C
@parts
part 16 AND2B1 410 340 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 40 hlt 100 PART=AND2B1
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 21 OR2 410 400 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U2
a 0 sp 11 0 10 40 hlt 100 PART=OR2
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 28 FDSE 590 320 h
a 0 sp 9 0 120 0 hrn 100 REFDES=U3
a 0 sp 11 0 60 10 hcn 200 PART=FDSE
a 0 u 13 13 20 140 hln 100 RLOC=R0C0
a 0 a 0 0 0 0 hln 100 PKGREF=U3
@conn
w 30
s 710 350 890 350 29
a 0 s 3 0 870 350 hln 100 LABEL=Q
w 38
s 490 350 590 350 37
a 0 s 3 0 500 350 hln 100 LABEL=D_R
w 54
s 490 410 540 410 51
a 0 s 3 0 500 410 hln 100 LABEL=CE_R
s 540 410 540 370 52
s 540 370 590 370 53
w 68
s 210 340 410 340 67
a 0 s 3 0 220 340 hln 100 LABEL=D
w 79
s 210 360 360 360 75
a 0 s 3 0 220 360 hln 100 LABEL=R
s 360 400 360 360 77
s 360 400 410 400 76
s 360 360 410 360 78
w 99
s 210 450 560 450 96
a 0 s 3 0 220 450 hln 100 LABEL=C
s 560 450 560 390 98
s 560 390 590 390 97
w 108
s 210 320 590 320 107
a 0 s 3 0 220 320 hln 100 LABEL=S
w 116
s 210 420 410 420 115
a 0 s 3 0 220 420 hln 100 LABEL=CE
@junction
j 710 350
+ p 28 Q
+ w 30
j 490 350
+ p 16 O
+ w 38
j 590 350
+ p 28 D
+ w 38
j 490 410
+ p 21 O
+ w 54
j 590 370
+ p 28 CE
+ w 54
j 410 340
+ p 16 I1
+ w 68
j 360 360
+ w 79
+ w 79
j 410 360
+ p 16 I0
+ w 79
j 410 400
+ p 21 I1
+ w 79
j 590 390
+ p 28 C
+ w 99
j 590 320
+ p 28 S
+ w 108
j 410 420
+ p 21 I0
+ w 116
j 210 320
+ s 124
+ w 108
j 210 360
+ s 125
+ w 79
j 890 350
+ s 126
+ w 30
j 210 340
+ s 127
+ w 68
j 210 420
+ s 128
+ w 116
j 210 450
+ s 129
+ w 99
@attributes
@text
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
s 5 710 800 hln 100 24TH FEBRUARY 1993
s 5 760 780 hln 100 & CLOCK ENABLE
s 5 760 750 hln 100 XC5200 FAMILY FDSRE MACRO
s 5 760 770 hln 100 D FLIP-FLOP W/ SYNC SET & RESET,
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 30 810 hln 100 DRAWN BY KS
