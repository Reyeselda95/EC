*version 6.3 732981709
u 89
XC2000 900114517
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
pageloc 1 0 1741 1
@status
*page 1 0 1100 850 iX
@ports
port 90 IF_OUT 770 380 h
a 0 s 3 0 20 8 hln 80 LABEL=O
port 91 IF_IN 330 320 h
a 0 s 3 0 10 8 hln 80 LABEL=I4
port 92 IF_IN 330 340 h
a 0 s 3 0 10 8 hln 80 LABEL=I3
port 93 IF_IN 330 360 h
a 0 s 3 0 10 8 hln 80 LABEL=I2
port 94 IF_IN 330 380 h
a 0 s 3 0 10 8 hln 80 LABEL=I1
port 95 IF_IN 330 400 h
a 0 s 3 0 10 8 hln 80 LABEL=I0
@parts
part 17 AND3B1 600 360 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 60 hlt 100 PART=AND3B1
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 23 AND3 420 320 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U2
a 0 sp 11 0 10 60 hlt 100 PART=AND3
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 25
s 330 380 600 380 24
a 0 s 3 0 340 380 hln 100 LABEL=I1
w 35
s 500 340 560 340 32
a 0 s 3 0 530 340 hln 100 LABEL=I35
s 560 360 560 340 34
s 560 360 600 360 33
w 50
s 330 360 420 360 49
a 0 s 3 0 340 360 hln 100 LABEL=I2
w 58
s 680 380 770 380 57
a 0 s 3 0 750 380 hln 100 LABEL=O
w 66
s 330 400 600 400 65
a 0 s 3 0 340 400 hln 100 LABEL=I0
w 74
s 330 340 420 340 73
a 0 s 3 0 340 340 hln 100 LABEL=I3
w 82
s 330 320 420 320 81
a 0 s 3 0 340 320 hln 100 LABEL=I4
@junction
j 600 380
+ p 17 I1
+ w 25
j 600 360
+ p 17 I2
+ w 35
j 500 340
+ p 23 O
+ w 35
j 420 360
+ p 23 I0
+ w 50
j 680 380
+ p 17 O
+ w 58
j 600 400
+ p 17 I0
+ w 66
j 420 340
+ p 23 I1
+ w 74
j 420 320
+ p 23 I2
+ w 82
j 770 380
+ s 90
+ w 58
j 330 320
+ s 91
+ w 82
j 330 340
+ s 92
+ w 74
j 330 360
+ s 93
+ w 50
j 330 380
+ s 94
+ w 25
j 330 400
+ s 95
+ w 66
@attributes
@text
s 5 750 750 hln 100 XC2000 FAMILY AND5B1 MACRO
s 5 750 770 hln 100 5-INPUT AND (W/ ONE INV INPUT)
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
s 5 710 800 hln 100 20TH APRIL 1993
