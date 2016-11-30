*version 6.3 751009379
u 83
XC4000 2227727841
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
pageloc 1 0 1608 1
@status
*page 1 0 1100 850 iX
@ports
port 84 IF_IN 270 320 h
a 0 s 3 0 10 8 hln 80 LABEL=E
port 85 IF_IN 270 390 h
a 0 s 3 0 10 8 hln 80 LABEL=C
port 86 IF_OUT 880 350 h
a 0 s 3 0 20 8 hln 80 LABEL=O
port 87 IF_IN 270 350 h
a 0 s 3 0 10 8 hln 80 LABEL=D
@parts
part 15 INV 380 320 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U1
a 0 sp 11 0 30 14 hlt 100 PART=INV
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 16 INV 380 390 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U2
a 0 sp 11 0 30 14 hlt 100 PART=INV
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 22 OFDTI 500 320 h
a 0 sp 9 0 160 0 hrn 100 REFDES=U3
a 0 sp 11 0 80 20 hcn 200 PART=OFDTI
a 0 a 0 0 0 0 hln 100 PKGREF=U3
@conn
w 24
s 270 390 380 390 23
a 0 s 3 0 280 390 hln 100 LABEL=C
w 32
s 450 390 500 390 31
a 0 s 3 0 470 390 hln 100 LABEL=CB
w 46
s 270 320 380 320 45
a 0 s 3 0 280 320 hln 100 LABEL=E
w 54
s 450 320 500 320 53
a 0 s 3 0 470 320 hln 100 LABEL=T
w 68
s 270 350 500 350 67
a 0 s 3 0 280 350 hln 100 LABEL=D
w 76
s 660 350 880 350 75
a 0 s 3 0 860 350 hln 100 LABEL=O
@junction
j 380 390
+ p 16 I
+ w 24
j 450 390
+ p 16 O
+ w 32
j 500 390
+ p 22 C
+ w 32
j 380 320
+ p 15 I
+ w 46
j 450 320
+ p 15 O
+ w 54
j 500 320
+ p 22 T
+ w 54
j 500 350
+ p 22 D
+ w 68
j 660 350
+ p 22 O
+ w 76
j 270 320
+ s 84
+ w 46
j 270 390
+ s 85
+ w 24
j 880 350
+ s 86
+ w 76
j 270 350
+ s 87
+ w 68
@attributes
@text
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
s 5 750 750 hln 100 XC4000 FAMILY OFDEI_1 MACRO
s 5 750 780 hln 100 ACTIVE HIGH ENABLE, SET BY GSR)
s 5 750 770 hln 100 OUTPUT D FLIP-FLOP (INVERTED CLK
s 5 710 800 hln 100 7TH JUNE 1993
