*version 6.3 290285278
u 92
XC4000E 669764839
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
pageloc 1 0 1800 1
@status
*page 1 0 1100 850 iX
@ports
port 93 IF_IN 270 350 h
a 0 s 3 0 10 8 hln 80 LABEL=D
port 94 IF_OUT 880 350 h
a 0 s 3 0 20 8 hln 80 LABEL=O
port 95 IF_IN 270 390 h
a 0 s 3 0 10 8 hln 80 LABEL=C
port 96 IF_IN 270 320 h
a 0 s 3 0 10 8 hln 80 LABEL=E
port 97 IF_IN 270 370 h
a 0 s 3 0 10 8 hln 80 LABEL=CE
@parts
part 15 INV 380 320 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U1
a 0 sp 11 0 30 14 hlt 100 PART=INV
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 16 INV 380 390 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U2
a 0 sp 11 0 30 14 hlt 100 PART=INV
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 23 OFDTX 500 320 h
a 0 sp 9 0 160 0 hrn 100 REFDES=U3
a 0 sp 11 0 80 20 hcn 200 PART=OFDTX
a 0 a 0 0 0 0 hln 100 PKGREF=U3
@conn
w 25
s 270 390 380 390 24
a 0 s 3 0 280 390 hln 100 LABEL=C
w 33
s 450 390 500 390 32
a 0 s 3 0 470 390 hln 100 LABEL=CB
w 47
s 270 320 380 320 46
a 0 s 3 0 280 320 hln 100 LABEL=E
w 55
s 450 320 500 320 54
a 0 s 3 0 470 320 hln 100 LABEL=T
w 69
s 660 350 880 350 68
a 0 s 3 0 860 350 hln 100 LABEL=O
w 77
s 270 350 500 350 76
a 0 s 3 0 280 350 hln 100 LABEL=D
w 85
s 270 370 500 370 84
a 0 s 3 0 280 370 hln 100 LABEL=CE
@junction
j 380 390
+ p 16 I
+ w 25
j 450 390
+ p 16 O
+ w 33
j 500 390
+ p 23 C
+ w 33
j 380 320
+ p 15 I
+ w 47
j 450 320
+ p 15 O
+ w 55
j 500 320
+ p 23 T
+ w 55
j 660 350
+ p 23 O
+ w 69
j 500 350
+ p 23 D
+ w 77
j 500 370
+ p 23 CE
+ w 85
j 270 350
+ s 93
+ w 77
j 880 350
+ s 94
+ w 69
j 270 390
+ s 95
+ w 25
j 270 320
+ s 96
+ w 47
j 270 370
+ s 97
+ w 85
@attributes
@text
s 5 750 750 hln 100 XC4000E FAMILY OFDEX_1 MACRO
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1995, XILINX INC.
s 5 710 800 hln 100 1ST MARCH 1995
s 5 750 780 hln 100 & AN ACTIVE HIGH ENABLE
s 5 750 770 hln 100 OUTPUT D FLIP-FLOP W/ AN INV CLK
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
