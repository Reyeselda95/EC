*version 6.3 311218846
u 77
XC4000E 2976226261
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
pageloc 1 0 1525 1
@status
*page 1 0 1100 850 iX
@ports
port 78 IF_IN 270 350 h
a 0 s 3 0 10 8 hln 80 LABEL=D
port 79 IF_OUT 880 350 h
a 0 s 3 0 20 8 hln 80 LABEL=O
port 80 IF_IN 270 320 h
a 0 s 3 0 10 8 hln 80 LABEL=E
port 81 IF_IN 270 390 h
a 0 s 3 0 10 8 hln 80 LABEL=C
port 82 IF_IN 270 370 h
a 0 s 3 0 10 8 hln 80 LABEL=CE
@parts
part 18 OFDTXI 500 320 h
a 0 sp 9 0 160 0 hrn 100 REFDES=U1
a 0 sp 11 0 80 20 hcn 200 PART=OFDTXI
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 22 INV 380 320 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U2
a 0 sp 11 0 30 14 hlt 100 PART=INV
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 24
s 450 320 500 320 23
w 38
s 270 320 380 320 37
a 0 s 3 0 280 320 hln 100 LABEL=E
w 46
s 270 350 500 350 45
a 0 s 3 0 280 350 hln 100 LABEL=D
w 54
s 270 390 500 390 53
a 0 s 3 0 280 390 hln 100 LABEL=C
w 62
s 660 350 880 350 61
a 0 s 3 0 860 350 hln 100 LABEL=O
w 70
s 270 370 500 370 69
a 0 s 3 0 290 370 hln 100 LABEL=CE
@junction
j 500 320
+ p 18 T
+ w 24
j 450 320
+ p 22 O
+ w 24
j 380 320
+ p 22 I
+ w 38
j 500 350
+ p 18 D
+ w 46
j 500 390
+ p 18 C
+ w 54
j 660 350
+ p 18 O
+ w 62
j 500 370
+ p 18 CE
+ w 70
j 270 350
+ s 78
+ w 46
j 880 350
+ s 79
+ w 62
j 270 320
+ s 80
+ w 38
j 270 390
+ s 81
+ w 54
j 270 370
+ s 82
+ w 70
@attributes
@text
s 5 750 750 hln 100 XC4000E FAMILY OFDEXI MACRO
s 5 30 810 hln 100 DRAWN BY KS
s 5 750 780 hln 100 ENABLE, SET BY GSR)
s 5 750 770 hln 100 OUTPUT D FLIP-FLOP (ACTIVE HIGH
s 5 710 800 hln 100 7TH JUNE 1995
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
s 5 30 820 hln 100 COPYRIGHT (C) 1995, XILINX INC.
