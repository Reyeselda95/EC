*version 6.3 853249601
u 116
XC3000 979050637
U? 3
@libraries
XC3000 [.slb]
@analysis
@targets
@attributes
a FAMILY=XC3000
a IMPL=XILINX
@translators
@index
pageloc 1 0 2238 1
@status
*page 1 0 1100 850 iX
@ports
port 117 IF_IN 330 380 h
a 0 s 3 0 10 8 hln 80 LABEL=I3
port 118 IF_IN 330 360 h
a 0 s 3 0 10 8 hln 80 LABEL=I4
port 119 IF_OUT 770 400 h
a 0 s 3 0 20 8 hln 80 LABEL=O
port 120 IF_IN 330 300 h
a 0 s 3 0 10 8 hln 80 LABEL=I7
port 121 IF_IN 330 320 h
a 0 s 3 0 10 8 hln 80 LABEL=I6
port 122 IF_IN 330 340 h
a 0 s 3 0 10 8 hln 80 LABEL=I5
port 123 IF_IN 330 400 h
a 0 s 3 0 10 8 hln 80 LABEL=I2
port 124 IF_IN 330 420 h
a 0 s 3 0 10 8 hln 80 LABEL=I1
port 125 IF_IN 330 440 h
a 0 s 3 0 10 8 hln 80 LABEL=I0
@parts
part 19 OR5 600 360 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 100 hlt 100 PART=OR5
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 26 OR4 420 300 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U2
a 0 sp 11 0 10 80 hlt 100 PART=OR4
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 28
s 680 400 770 400 27
a 0 s 3 0 750 400 hln 100 LABEL=O
w 36
s 330 440 600 440 35
a 0 s 3 0 340 440 hln 100 LABEL=I0
w 44
s 330 420 600 420 43
a 0 s 3 0 340 420 hln 100 LABEL=I1
w 52
s 330 400 600 400 51
a 0 s 3 0 340 400 hln 100 LABEL=I2
w 60
s 330 380 600 380 59
a 0 s 3 0 340 380 hln 100 LABEL=I3
w 68
s 330 340 420 340 67
a 0 s 3 0 340 340 hln 100 LABEL=I5
w 76
s 330 360 420 360 75
a 0 s 3 0 340 360 hln 100 LABEL=I4
w 86
s 500 330 560 330 83
a 0 s 3 0 530 330 hln 100 LABEL=I47
s 560 360 560 330 85
s 560 360 600 360 84
w 101
s 330 320 420 320 100
a 0 s 3 0 340 320 hln 100 LABEL=I6
w 109
s 330 300 420 300 108
a 0 s 3 0 340 300 hln 100 LABEL=I7
@junction
j 680 400
+ p 19 O
+ w 28
j 600 440
+ p 19 I0
+ w 36
j 600 420
+ p 19 I1
+ w 44
j 600 400
+ p 19 I2
+ w 52
j 600 380
+ p 19 I3
+ w 60
j 420 340
+ p 26 I1
+ w 68
j 420 360
+ p 26 I0
+ w 76
j 600 360
+ p 19 I4
+ w 86
j 500 330
+ p 26 O
+ w 86
j 420 320
+ p 26 I2
+ w 101
j 420 300
+ p 26 I3
+ w 109
j 330 380
+ s 117
+ w 60
j 330 360
+ s 118
+ w 76
j 770 400
+ s 119
+ w 28
j 330 300
+ s 120
+ w 109
j 330 320
+ s 121
+ w 101
j 330 340
+ s 122
+ w 68
j 330 400
+ s 123
+ w 52
j 330 420
+ s 124
+ w 44
j 330 440
+ s 125
+ w 36
@attributes
@text
s 5 710 800 hln 100 20TH APRIL 1993
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
s 5 750 750 hln 100 XC3000 FAMILY OR8 MACRO
s 5 750 770 hln 100 8-INPUT OR
