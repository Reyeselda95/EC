*version 6.3 289140524
u 87
XC2000 426173628
U? 4
@libraries
XC2000 [.slb]
@analysis
@targets
@attributes
a FAMILY=XC2000
a IMPL=XILINX
@translators
@index
pageloc 1 0 1626 1
@status
*page 1 0 1100 850 iX
@ports
port 88 IF_IN 290 390 h
a 0 s 3 0 10 8 hln 80 LABEL=G
port 89 IF_OUT 810 350 h
a 0 s 3 0 20 8 hln 80 LABEL=Q
port 90 IF_IN 290 350 h
a 0 s 3 0 10 8 hln 80 LABEL=D
port 91 IF_IN 290 420 h
a 0 s 3 0 10 8 hln 80 LABEL=CLR
@parts
part 18 LDCP 510 320 h
a 0 sp 9 0 120 0 hrn 100 REFDES=U1
a 0 sp 11 0 60 10 hcn 200 PART=LDCP
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 22 INV 390 390 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U2
a 0 sp 11 0 30 14 hlt 100 PART=INV
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 25 GND 480 450 h
a 0 sp 0 0 40 0 hrn 100 REFDES=U3
a 0 sp 11 0 5 40 hln 100 PART=GND
a 0 a 0 0 0 0 hln 100 PKGREF=U3
@conn
w 27
s 460 390 510 390 26
a 0 s 3 0 480 390 hln 100 LABEL=GB
w 41
s 290 390 390 390 40
a 0 s 3 0 300 390 hln 100 LABEL=G
w 49
s 630 350 810 350 48
a 0 s 3 0 790 350 hln 100 LABEL=Q
w 57
s 290 420 510 420 56
a 0 s 3 0 300 420 hln 100 LABEL=CLR
w 65
s 290 350 510 350 64
a 0 s 3 0 300 350 hln 100 LABEL=D
w 74
s 480 320 510 320 72
s 480 450 480 320 73
@junction
j 510 390
+ p 18 G
+ w 27
j 460 390
+ p 22 O
+ w 27
j 390 390
+ p 22 I
+ w 41
j 630 350
+ p 18 Q
+ w 49
j 510 420
+ p 18 CLR
+ w 57
j 510 350
+ p 18 D
+ w 65
j 510 320
+ p 18 PRE
+ w 74
j 480 450
+ p 25 GROUND
+ w 74
j 290 390
+ s 88
+ w 41
j 810 350
+ s 89
+ w 49
j 290 350
+ s 90
+ w 65
j 290 420
+ s 91
+ w 57
@attributes
@text
s 5 950 820 hln 100 A
s 5 950 800 hln 100 1
s 5 750 780 hln 100 CLOCK & AN ASYNCHRONOUS CLEAR
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 30 810 hln 100 DRAWN BY KS
s 5 750 750 hln 100 XC2000 FAMILY LDC_1 MACRO
s 5 750 770 hln 100 DATA LATCH WITH AN INVERTED
s 5 710 800 hln 100 5TH MAY 1993
