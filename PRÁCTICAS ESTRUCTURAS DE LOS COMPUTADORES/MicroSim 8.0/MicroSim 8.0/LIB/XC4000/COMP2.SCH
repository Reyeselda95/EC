*version 6.3 2491343157
u 97
XC4000 224701113
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
pageloc 1 0 1860 1
@status
*page 1 0 1100 850 iX
@ports
port 98 IF_OUT 810 370 h
a 0 s 3 0 20 8 hln 80 LABEL=EQ
port 99 IF_IN 260 410 h
a 0 s 3 0 10 8 hln 80 LABEL=B1
port 100 IF_IN 260 350 h
a 0 s 3 0 10 8 hln 80 LABEL=B0
port 101 IF_IN 260 390 h
a 0 s 3 0 10 8 hln 80 LABEL=A1
port 102 IF_IN 260 330 h
a 0 s 3 0 10 8 hln 80 LABEL=A0
@parts
part 16 AND2 600 360 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 40 hlt 100 PART=AND2
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 21 XNOR2 380 390 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U2
a 0 sp 11 0 10 40 hlt 100 PART=XNOR2
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 22 XNOR2 380 330 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U3
a 0 sp 11 0 10 40 hlt 100 PART=XNOR2
a 0 a 0 0 0 0 hln 100 PKGREF=U3
@conn
w 24
s 680 370 810 370 23
a 0 s 3 0 780 370 hln 100 LABEL=EQ
w 32
s 260 330 380 330 31
a 0 s 3 0 270 330 hln 100 LABEL=A0
w 40
s 260 350 380 350 39
a 0 s 3 0 270 350 hln 100 LABEL=B0
w 48
s 260 390 380 390 47
a 0 s 3 0 270 390 hln 100 LABEL=A1
w 56
s 260 410 380 410 55
a 0 s 3 0 270 410 hln 100 LABEL=B1
w 66
s 460 340 570 340 63
a 0 s 3 0 510 340 hln 100 LABEL=AB0
s 570 360 570 340 65
s 570 360 600 360 64
w 83
s 460 400 570 400 80
a 0 s 3 0 510 400 hln 100 LABEL=AB1
s 570 400 570 380 82
s 570 380 600 380 81
@junction
j 680 370
+ p 16 O
+ w 24
j 380 330
+ p 22 I1
+ w 32
j 380 350
+ p 22 I0
+ w 40
j 380 390
+ p 21 I1
+ w 48
j 380 410
+ p 21 I0
+ w 56
j 600 360
+ p 16 I1
+ w 66
j 460 340
+ p 22 O
+ w 66
j 600 380
+ p 16 I0
+ w 83
j 460 400
+ p 21 O
+ w 83
j 810 370
+ s 98
+ w 24
j 260 410
+ s 99
+ w 56
j 260 350
+ s 100
+ w 40
j 260 390
+ s 101
+ w 48
j 260 330
+ s 102
+ w 32
@attributes
@text
s 5 750 750 hln 100 XC4000 FAMILY COMP2 MACRO
s 5 750 770 hln 100 2-BIT IDENTITY COMPARATOR
s 5 710 800 hln 100 12TH JANUARY 1993
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 30 810 hln 100 DRAWN BY KS
