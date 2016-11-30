*version 6.3 507589078
u 92
XC5200 3943045393
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
pageloc 1 0 1842 1
@status
*page 1 0 1100 850 iX
@ports
port 93 IF_OUT 850 330 h
a 0 s 3 0 20 8 hln 80 LABEL=Q
port 94 IF_IN 170 400 h
a 0 s 3 0 10 8 hln 80 LABEL=PRE
port 95 IF_IN 170 330 h
a 0 s 3 0 10 8 hln 80 LABEL=D
port 96 IF_IN 170 350 h
a 0 s 3 0 10 8 hln 80 LABEL=CE
port 97 IF_IN 170 370 h
a 0 s 3 0 10 8 hln 80 LABEL=C
@parts
part 15 INV 660 330 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U1
a 0 sp 11 0 30 14 hlt 100 PART=INV
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 22 FDCE 450 330 h
a 0 sp 9 0 120 0 hrn 100 REFDES=U2
a 0 sp 11 0 60 20 hcn 200 PART=FDCE
a 0 u 13 13 20 140 hln 100 RLOC=R0C0
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 23 INV 290 330 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U3
a 0 sp 11 0 30 14 hlt 100 PART=INV
a 0 a 0 0 0 0 hln 100 PKGREF=U3
@conn
w 25
s 570 330 660 330 24
a 0 s 3 0 580 330 hln 100 LABEL=QB
w 39
s 170 400 450 400 38
a 0 s 3 0 180 400 hln 100 LABEL=PRE
w 47
s 170 330 290 330 46
a 0 s 3 0 180 330 hln 100 LABEL=D
w 55
s 360 330 450 330 54
a 0 s 3 0 370 330 hln 100 LABEL=DB
w 69
s 170 370 450 370 68
a 0 s 3 0 180 370 hln 100 LABEL=C
w 77
s 170 350 450 350 76
a 0 s 3 0 180 350 hln 100 LABEL=CE
w 85
s 730 330 850 330 84
a 0 s 3 0 830 330 hln 100 LABEL=Q
@junction
j 660 330
+ p 15 I
+ w 25
j 570 330
+ p 22 Q
+ w 25
j 450 400
+ p 22 CLR
+ w 39
j 290 330
+ p 23 I
+ w 47
j 450 330
+ p 22 D
+ w 55
j 360 330
+ p 23 O
+ w 55
j 450 370
+ p 22 C
+ w 69
j 450 350
+ p 22 CE
+ w 77
j 730 330
+ p 15 O
+ w 85
j 850 330
+ s 93
+ w 85
j 170 400
+ s 94
+ w 39
j 170 330
+ s 95
+ w 47
j 170 350
+ s 96
+ w 77
j 170 370
+ s 97
+ w 69
@attributes
@text
s 5 30 810 hln 100 DRAWN BY KS
s 5 950 820 hln 100 A
s 5 950 800 hln 100 1
s 5 760 750 hln 100 XC5200 FAMILY FDPE MACRO
s 5 760 770 hln 100 DATA FLIP-FLOP WITH CLOCK ENABLE
s 5 760 780 hln 100 AND ASYNCHRONOUS PRESET
s 5 710 800 hln 100 23RD DECEMBER 1994
s 5 30 820 hln 100 COPYRIGHT (C) 1994, XILINX INC.
