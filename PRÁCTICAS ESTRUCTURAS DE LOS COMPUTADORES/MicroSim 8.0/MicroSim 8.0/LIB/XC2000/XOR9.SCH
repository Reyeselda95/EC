*version 6.3 371153447
u 141
XC2000 3134495259
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
pageloc 1 0 2744 1
@status
*page 1 0 1100 850 iX
@ports
port 142 IF_IN 330 320 h
a 0 s 3 0 10 8 hln 80 LABEL=I6
port 143 IF_IN 330 420 h
a 0 s 3 0 10 8 hln 80 LABEL=I1
port 144 IF_IN 330 400 h
a 0 s 3 0 10 8 hln 80 LABEL=I2
port 145 IF_IN 330 380 h
a 0 s 3 0 10 8 hln 80 LABEL=I3
port 146 IF_IN 330 300 h
a 0 s 3 0 10 8 hln 80 LABEL=I7
port 147 IF_IN 330 280 h
a 0 s 3 0 10 8 hln 80 LABEL=I8
port 148 IF_IN 330 440 h
a 0 s 3 0 10 8 hln 80 LABEL=I0
port 149 IF_IN 330 340 h
a 0 s 3 0 10 8 hln 80 LABEL=I5
port 150 IF_IN 330 360 h
a 0 s 3 0 10 8 hln 80 LABEL=I4
port 151 IF_OUT 770 390 h
a 0 s 3 0 20 8 hln 80 LABEL=O
@parts
part 17 XOR3 420 360 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 60 hlt 100 PART=XOR3
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 24 XOR4 420 280 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U2
a 0 sp 11 0 10 80 hlt 100 PART=XOR4
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 25 XOR4 600 360 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U3
a 0 sp 11 0 10 80 hlt 100 PART=XOR4
a 0 a 0 0 0 0 hln 100 PKGREF=U3
@conn
w 29
s 330 420 560 420 26
a 0 s 3 0 340 420 hln 100 LABEL=I1
s 560 420 560 400 27
s 560 400 600 400 28
w 37
s 330 400 420 400 36
a 0 s 3 0 340 400 hln 100 LABEL=I2
w 45
s 330 340 420 340 44
a 0 s 3 0 340 340 hln 100 LABEL=I5
w 53
s 330 300 420 300 52
a 0 s 3 0 340 300 hln 100 LABEL=I7
w 61
s 330 280 420 280 60
a 0 s 3 0 340 280 hln 100 LABEL=I8
w 71
s 500 310 560 310 68
a 0 s 3 0 530 310 hln 100 LABEL=I48
s 560 360 560 310 69
s 560 360 600 360 70
w 85
s 330 380 420 380 84
a 0 s 3 0 340 380 hln 100 LABEL=I3
w 95
s 330 440 580 440 92
a 0 s 3 0 340 440 hln 100 LABEL=I0
s 580 440 580 420 94
s 580 420 600 420 93
w 104
s 330 360 420 360 103
a 0 s 3 0 340 360 hln 100 LABEL=I4
w 112
s 500 380 600 380 111
a 0 s 3 0 530 380 hln 100 LABEL=I24
w 126
s 680 390 770 390 125
a 0 s 3 0 750 390 hln 100 LABEL=O
w 134
s 330 320 420 320 133
a 0 s 3 0 340 320 hln 100 LABEL=I6
@junction
j 600 400
+ p 25 I1
+ w 29
j 420 400
+ p 17 I0
+ w 37
j 420 340
+ p 24 I0
+ w 45
j 420 300
+ p 24 I2
+ w 53
j 420 280
+ p 24 I3
+ w 61
j 500 310
+ p 24 O
+ w 71
j 600 360
+ p 25 I3
+ w 71
j 420 380
+ p 17 I1
+ w 85
j 600 420
+ p 25 I0
+ w 95
j 420 360
+ p 17 I2
+ w 104
j 500 380
+ p 17 O
+ w 112
j 600 380
+ p 25 I2
+ w 112
j 680 390
+ p 25 O
+ w 126
j 420 320
+ p 24 I1
+ w 134
j 330 320
+ s 142
+ w 134
j 330 420
+ s 143
+ w 29
j 330 400
+ s 144
+ w 37
j 330 380
+ s 145
+ w 85
j 330 300
+ s 146
+ w 53
j 330 280
+ s 147
+ w 61
j 330 440
+ s 148
+ w 95
j 330 340
+ s 149
+ w 45
j 330 360
+ s 150
+ w 104
j 770 390
+ s 151
+ w 126
@attributes
@text
s 5 710 800 hln 100 20TH APRIL 1993
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
s 5 750 750 hln 100 XC2000 FAMILY XOR9 MACRO
s 5 750 770 hln 100 9-INPUT XOR
