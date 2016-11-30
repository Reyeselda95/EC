*version 6.3 608181087
u 95
XC5200 3047817173
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
pageloc 1 0 1856 1
@status
*page 1 0 1100 850 iX
@ports
port 96 IF_IN 260 330 h
a 0 s 3 0 10 8 hln 80 LABEL=A0
port 97 IF_IN 260 390 h
a 0 s 3 0 10 8 hln 80 LABEL=A1
port 98 IF_IN 260 350 h
a 0 s 3 0 10 8 hln 80 LABEL=B0
port 99 IF_IN 260 410 h
a 0 s 3 0 10 8 hln 80 LABEL=B1
port 100 IF_OUT 810 370 h
a 0 s 3 0 20 8 hln 80 LABEL=EQ
@parts
part 16 XNOR2 380 330 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 40 hlt 100 PART=XNOR2
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 17 XNOR2 380 390 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U2
a 0 sp 11 0 10 40 hlt 100 PART=XNOR2
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 22 AND2 600 360 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U3
a 0 sp 11 0 10 40 hlt 100 PART=AND2
a 0 a 0 0 0 0 hln 100 PKGREF=U3
@conn
w 26
s 460 400 570 400 23
a 0 s 3 0 510 400 hln 100 LABEL=AB1
s 570 400 570 380 24
s 570 380 600 380 25
w 42
s 460 340 570 340 39
a 0 s 3 0 510 340 hln 100 LABEL=AB0
s 570 360 570 340 40
s 570 360 600 360 41
w 56
s 260 410 380 410 55
a 0 s 3 0 270 410 hln 100 LABEL=B1
w 64
s 260 390 380 390 63
a 0 s 3 0 270 390 hln 100 LABEL=A1
w 72
s 260 350 380 350 71
a 0 s 3 0 270 350 hln 100 LABEL=B0
w 80
s 260 330 380 330 79
a 0 s 3 0 270 330 hln 100 LABEL=A0
w 88
s 680 370 810 370 87
a 0 s 3 0 780 370 hln 100 LABEL=EQ
@junction
j 460 400
+ p 17 O
+ w 26
j 600 380
+ p 22 I0
+ w 26
j 460 340
+ p 16 O
+ w 42
j 600 360
+ p 22 I1
+ w 42
j 380 410
+ p 17 I0
+ w 56
j 380 390
+ p 17 I1
+ w 64
j 380 350
+ p 16 I0
+ w 72
j 380 330
+ p 16 I1
+ w 80
j 680 370
+ p 22 O
+ w 88
j 260 330
+ s 96
+ w 80
j 260 390
+ s 97
+ w 64
j 260 350
+ s 98
+ w 72
j 260 410
+ s 99
+ w 56
j 810 370
+ s 100
+ w 88
@attributes
@text
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 950 820 hln 100 A
s 5 950 800 hln 100 1
s 5 710 800 hln 100 12TH JANUARY 1993
s 5 750 770 hln 100 2-BIT IDENTITY COMPARATOR
s 5 750 750 hln 100 XC5200 FAMILY COMP2 MACRO
