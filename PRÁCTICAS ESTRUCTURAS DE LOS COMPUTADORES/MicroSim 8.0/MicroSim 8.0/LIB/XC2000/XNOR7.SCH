*version 6.3 2436029807
u 106
XC2000 2002738106
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
pageloc 1 0 2070 1
@status
*page 1 0 1100 850 iX
@ports
port 107 IF_OUT 770 410 h
a 0 s 3 0 20 8 hln 80 LABEL=O
port 108 IF_IN 330 380 h
a 0 s 3 0 10 8 hln 80 LABEL=I3
port 109 IF_IN 330 440 h
a 0 s 3 0 10 8 hln 80 LABEL=I0
port 110 IF_IN 330 420 h
a 0 s 3 0 10 8 hln 80 LABEL=I1
port 111 IF_IN 330 400 h
a 0 s 3 0 10 8 hln 80 LABEL=I2
port 112 IF_IN 330 360 h
a 0 s 3 0 10 8 hln 80 LABEL=I4
port 113 IF_IN 330 320 h
a 0 s 3 0 10 8 hln 80 LABEL=I6
port 114 IF_IN 330 340 h
a 0 s 3 0 10 8 hln 80 LABEL=I5
@parts
part 18 XNOR4 600 380 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 80 hlt 100 PART=XNOR4
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 25 XOR4 420 320 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U2
a 0 sp 11 0 10 80 hlt 100 PART=XOR4
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 27
s 680 410 770 410 26
a 0 s 3 0 750 410 hln 100 LABEL=O
w 35
s 330 380 420 380 34
a 0 s 3 0 340 380 hln 100 LABEL=I3
w 43
s 330 320 420 320 42
a 0 s 3 0 340 320 hln 100 LABEL=I6
w 51
s 330 360 420 360 50
a 0 s 3 0 340 360 hln 100 LABEL=I4
w 59
s 330 340 420 340 58
a 0 s 3 0 340 340 hln 100 LABEL=I5
w 67
s 330 400 600 400 66
a 0 s 3 0 340 400 hln 100 LABEL=I2
w 75
s 330 420 600 420 74
a 0 s 3 0 340 420 hln 100 LABEL=I1
w 83
s 330 440 600 440 82
a 0 s 3 0 340 440 hln 100 LABEL=I0
w 93
s 500 350 560 350 90
a 0 s 3 0 530 350 hln 100 LABEL=I36
s 560 380 560 350 91
s 560 380 600 380 92
@junction
j 680 410
+ p 18 O
+ w 27
j 420 380
+ p 25 I0
+ w 35
j 420 320
+ p 25 I3
+ w 43
j 420 360
+ p 25 I1
+ w 51
j 420 340
+ p 25 I2
+ w 59
j 600 400
+ p 18 I2
+ w 67
j 600 420
+ p 18 I1
+ w 75
j 600 440
+ p 18 I0
+ w 83
j 600 380
+ p 18 I3
+ w 93
j 500 350
+ p 25 O
+ w 93
j 770 410
+ s 107
+ w 27
j 330 380
+ s 108
+ w 35
j 330 440
+ s 109
+ w 83
j 330 420
+ s 110
+ w 75
j 330 400
+ s 111
+ w 67
j 330 360
+ s 112
+ w 51
j 330 320
+ s 113
+ w 43
j 330 340
+ s 114
+ w 59
@attributes
@text
s 5 710 800 hln 100 20TH APRIL 1993
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
s 5 750 750 hln 100 XC2000 FAMILY XNOR7 MACRO
s 5 750 770 hln 100 7-INPUT XNOR
