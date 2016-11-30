*version 6.3 3412342253
u 83
XC5200 91011992
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
pageloc 1 0 1629 1
@status
*page 1 0 1100 850 iX
@ports
port 84 IF_OUT 880 350 h
a 0 s 3 0 20 8 hln 80 LABEL=O
port 85 IF_IN 270 320 h
a 0 s 3 0 10 8 hln 80 LABEL=E
port 86 IF_IN 270 350 h
a 0 s 3 0 10 8 hln 80 LABEL=D
port 87 IF_IN 270 390 h
a 0 s 3 0 10 8 hln 80 LABEL=C
@parts
part 15 INV 380 390 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U1
a 0 sp 11 0 30 14 hlt 100 PART=INV
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 21 OFDT 500 320 h
a 0 sp 9 0 160 0 hrn 100 REFDES=U2
a 0 sp 11 0 80 20 hcn 200 PART=OFDT
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 22 INV 380 320 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U3
a 0 sp 11 0 30 14 hlt 100 PART=INV
a 0 a 0 0 0 0 hln 100 PKGREF=U3
@conn
w 24
s 660 350 880 350 23
a 0 s 3 0 860 350 hln 100 LABEL=O
w 32
s 270 350 500 350 31
a 0 s 3 0 280 350 hln 100 LABEL=D
w 40
s 450 320 500 320 39
a 0 s 3 0 470 320 hln 100 LABEL=T
w 54
s 270 320 380 320 53
a 0 s 3 0 280 320 hln 100 LABEL=E
w 62
s 450 390 500 390 61
a 0 s 3 0 470 390 hln 100 LABEL=CB
w 76
s 270 390 380 390 75
a 0 s 3 0 280 390 hln 100 LABEL=C
@junction
j 660 350
+ p 21 O
+ w 24
j 500 350
+ p 21 D
+ w 32
j 500 320
+ p 21 T
+ w 40
j 450 320
+ p 22 O
+ w 40
j 380 320
+ p 22 I
+ w 54
j 450 390
+ p 15 O
+ w 62
j 500 390
+ p 21 C
+ w 62
j 380 390
+ p 15 I
+ w 76
j 880 350
+ s 84
+ w 24
j 270 320
+ s 85
+ w 54
j 270 350
+ s 86
+ w 32
j 270 390
+ s 87
+ w 76
@attributes
@text
s 5 950 820 hln 100 A
s 5 950 800 hln 100 1
s 5 750 750 hln 100 XC5200 FAMILY OFDE_1 MACRO
s 5 750 770 hln 100 OUTPUT D FLIP-FLOP W/ AN INV CLK
s 5 750 780 hln 100 & AN ACTIVE HIGH ENABLE
s 5 710 800 hln 100 1ST MARCH 1993
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 30 810 hln 100 DRAWN BY KS
