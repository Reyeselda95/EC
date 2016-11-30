*version 6.3 357379861
u 100
XC2000 188351195
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
pageloc 1 0 2066 1
@status
*page 1 0 1100 850 iX
@ports
port 101 IF_OUT 770 410 h
a 0 s 3 0 20 8 hln 80 LABEL=O
port 102 IF_IN 330 340 h
a 0 s 3 0 10 8 hln 80 LABEL=I5
port 103 IF_IN 330 320 h
a 0 s 3 0 10 8 hln 80 LABEL=I6
port 104 IF_IN 330 360 h
a 0 s 3 0 10 8 hln 80 LABEL=I4
port 105 IF_IN 330 400 h
a 0 s 3 0 10 8 hln 80 LABEL=I2
port 106 IF_IN 330 420 h
a 0 s 3 0 10 8 hln 80 LABEL=I1
port 107 IF_IN 330 440 h
a 0 s 3 0 10 8 hln 80 LABEL=I0
port 108 IF_IN 330 380 h
a 0 s 3 0 10 8 hln 80 LABEL=I3
@parts
part 18 XOR4 420 320 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 80 hlt 100 PART=XOR4
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 19 XOR4 600 380 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U2
a 0 sp 11 0 10 80 hlt 100 PART=XOR4
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 21
s 330 440 600 440 20
a 0 s 3 0 340 440 hln 100 LABEL=I0
w 29
s 330 420 600 420 28
a 0 s 3 0 340 420 hln 100 LABEL=I1
w 37
s 330 400 600 400 36
a 0 s 3 0 340 400 hln 100 LABEL=I2
w 45
s 330 340 420 340 44
a 0 s 3 0 340 340 hln 100 LABEL=I5
w 53
s 330 360 420 360 52
a 0 s 3 0 340 360 hln 100 LABEL=I4
w 61
s 330 320 420 320 60
a 0 s 3 0 340 320 hln 100 LABEL=I6
w 69
s 330 380 420 380 68
a 0 s 3 0 340 380 hln 100 LABEL=I3
w 79
s 500 350 560 350 76
a 0 s 3 0 530 350 hln 100 LABEL=I36
s 560 380 560 350 77
s 560 380 600 380 78
w 93
s 680 410 770 410 92
a 0 s 3 0 750 410 hln 100 LABEL=O
@junction
j 600 440
+ p 19 I0
+ w 21
j 600 420
+ p 19 I1
+ w 29
j 600 400
+ p 19 I2
+ w 37
j 420 340
+ p 18 I2
+ w 45
j 420 360
+ p 18 I1
+ w 53
j 420 320
+ p 18 I3
+ w 61
j 420 380
+ p 18 I0
+ w 69
j 500 350
+ p 18 O
+ w 79
j 600 380
+ p 19 I3
+ w 79
j 680 410
+ p 19 O
+ w 93
j 770 410
+ s 101
+ w 93
j 330 340
+ s 102
+ w 45
j 330 320
+ s 103
+ w 61
j 330 360
+ s 104
+ w 53
j 330 400
+ s 105
+ w 37
j 330 420
+ s 106
+ w 29
j 330 440
+ s 107
+ w 21
j 330 380
+ s 108
+ w 69
@attributes
@text
s 5 950 820 hln 100 A
s 5 950 800 hln 100 1
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 30 810 hln 100 DRAWN BY KS
s 5 710 800 hln 100 20TH APRIL 1993
s 5 750 750 hln 100 XC2000 FAMILY XOR7 MACRO
s 5 750 770 hln 100 7-INPUT XOR
