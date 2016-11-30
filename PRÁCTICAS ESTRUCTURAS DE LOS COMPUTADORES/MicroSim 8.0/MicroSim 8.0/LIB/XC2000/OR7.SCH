*version 6.3 306727150
u 101
XC2000 21959810
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
pageloc 1 0 2060 1
@status
*page 1 0 1100 850 iX
@ports
port 102 IF_IN 330 380 h
a 0 s 3 0 10 8 hln 80 LABEL=I3
port 103 IF_IN 330 440 h
a 0 s 3 0 10 8 hln 80 LABEL=I0
port 104 IF_IN 330 420 h
a 0 s 3 0 10 8 hln 80 LABEL=I1
port 105 IF_IN 330 400 h
a 0 s 3 0 10 8 hln 80 LABEL=I2
port 106 IF_IN 330 360 h
a 0 s 3 0 10 8 hln 80 LABEL=I4
port 107 IF_IN 330 320 h
a 0 s 3 0 10 8 hln 80 LABEL=I6
port 108 IF_IN 330 340 h
a 0 s 3 0 10 8 hln 80 LABEL=I5
port 109 IF_OUT 770 410 h
a 0 s 3 0 20 8 hln 80 LABEL=O
@parts
part 18 OR4 420 320 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 80 hlt 100 PART=OR4
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 19 OR4 600 380 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U2
a 0 sp 11 0 10 80 hlt 100 PART=OR4
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 21
s 680 410 770 410 20
a 0 s 3 0 750 410 hln 100 LABEL=O
w 31
s 500 350 560 350 28
a 0 s 3 0 530 350 hln 100 LABEL=I36
s 560 380 560 350 30
s 560 380 600 380 29
w 46
s 330 380 420 380 45
a 0 s 3 0 340 380 hln 100 LABEL=I3
w 54
s 330 320 420 320 53
a 0 s 3 0 340 320 hln 100 LABEL=I6
w 62
s 330 360 420 360 61
a 0 s 3 0 340 360 hln 100 LABEL=I4
w 70
s 330 340 420 340 69
a 0 s 3 0 340 340 hln 100 LABEL=I5
w 78
s 330 400 600 400 77
a 0 s 3 0 340 400 hln 100 LABEL=I2
w 86
s 330 420 600 420 85
a 0 s 3 0 340 420 hln 100 LABEL=I1
w 94
s 330 440 600 440 93
a 0 s 3 0 340 440 hln 100 LABEL=I0
@junction
j 680 410
+ p 19 O
+ w 21
j 500 350
+ p 18 O
+ w 31
j 600 380
+ p 19 I3
+ w 31
j 420 380
+ p 18 I0
+ w 46
j 420 320
+ p 18 I3
+ w 54
j 420 360
+ p 18 I1
+ w 62
j 420 340
+ p 18 I2
+ w 70
j 600 400
+ p 19 I2
+ w 78
j 600 420
+ p 19 I1
+ w 86
j 600 440
+ p 19 I0
+ w 94
j 330 380
+ s 102
+ w 46
j 330 440
+ s 103
+ w 94
j 330 420
+ s 104
+ w 86
j 330 400
+ s 105
+ w 78
j 330 360
+ s 106
+ w 62
j 330 320
+ s 107
+ w 54
j 330 340
+ s 108
+ w 70
j 770 410
+ s 109
+ w 21
@attributes
@text
s 5 710 800 hln 100 20TH APRIL 1993
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
s 5 750 750 hln 100 XC2000 FAMILY OR7 MACRO
s 5 750 770 hln 100 7-INPUT OR
