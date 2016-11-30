*version 6.3 366628820
u 69
XC2000 453508619
U? 3
@libraries
XC2000 [.slb]
@analysis
@targets
@attributes
a FAMILY=XC2000
a IMPL=XILINX
@translators
@index
pageloc 1 0 1365 1
@status
*page 1 0 1100 850 iX
@ports
port 70 IF_IN 270 370 h
a 0 s 3 0 10 8 hln 80 LABEL=G
port 71 IF_IN 270 400 h
a 0 s 3 0 10 8 hln 80 LABEL=CLR
port 72 IF_IN 270 330 h
a 0 s 3 0 10 8 hln 80 LABEL=D
port 73 IF_OUT 750 330 h
a 0 s 3 0 20 8 hln 80 LABEL=Q
@parts
part 18 LDCP 450 300 h
a 0 sp 9 0 120 0 hrn 100 REFDES=U1
a 0 sp 11 0 60 10 hcn 200 PART=LDCP
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 21 GND 420 430 h
a 0 sp 0 0 40 0 hrn 100 REFDES=U2
a 0 sp 11 0 5 40 hln 100 PART=GND
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 23
s 270 370 450 370 22
a 0 s 3 0 280 370 hln 100 LABEL=G
w 32
s 420 430 420 300 30
s 420 300 450 300 31
w 46
s 270 400 450 400 45
a 0 s 3 0 280 400 hln 100 LABEL=CLR
w 54
s 570 330 750 330 53
a 0 s 3 0 730 330 hln 100 LABEL=Q
w 62
s 270 330 450 330 61
a 0 s 3 0 280 330 hln 100 LABEL=D
@junction
j 450 370
+ p 18 G
+ w 23
j 450 300
+ p 18 PRE
+ w 32
j 420 430
+ p 21 GROUND
+ w 32
j 450 400
+ p 18 CLR
+ w 46
j 570 330
+ p 18 Q
+ w 54
j 450 330
+ p 18 D
+ w 62
j 270 370
+ s 70
+ w 23
j 270 400
+ s 71
+ w 46
j 270 330
+ s 72
+ w 62
j 750 330
+ s 73
+ w 54
@attributes
@text
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 30 810 hln 100 DRAWN BY KS
s 5 710 800 hln 100 5TH MAY 1993
s 5 750 750 hln 100 XC2000 FAMILY LDC MACRO
s 5 750 770 hln 100 DATA LATCH WITH
s 5 750 780 hln 100 ASYNCHRONOUS CLEAR
