*version 6.3 313304328
u 106
XC3000 895291447
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
pageloc 1 0 2067 1
@status
*page 1 0 1100 850 iX
@ports
port 107 IF_IN 330 380 h
a 0 s 3 0 10 8 hln 80 LABEL=I3
port 108 IF_IN 330 440 h
a 0 s 3 0 10 8 hln 80 LABEL=I0
port 109 IF_IN 330 420 h
a 0 s 3 0 10 8 hln 80 LABEL=I1
port 110 IF_IN 330 400 h
a 0 s 3 0 10 8 hln 80 LABEL=I2
port 111 IF_IN 330 360 h
a 0 s 3 0 10 8 hln 80 LABEL=I4
port 112 IF_IN 330 320 h
a 0 s 3 0 10 8 hln 80 LABEL=I6
port 113 IF_IN 330 340 h
a 0 s 3 0 10 8 hln 80 LABEL=I5
port 114 IF_OUT 770 400 h
a 0 s 3 0 20 8 hln 80 LABEL=O
@parts
part 19 XOR5 600 360 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 100 hlt 100 PART=XOR5
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 25 XOR3 420 320 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U2
a 0 sp 11 0 10 60 hlt 100 PART=XOR3
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 27
s 330 320 420 320 26
a 0 s 3 0 340 320 hln 100 LABEL=I6
w 35
s 330 360 420 360 34
a 0 s 3 0 340 360 hln 100 LABEL=I4
w 45
s 500 340 560 340 42
a 0 s 3 0 530 340 hln 100 LABEL=I46
s 560 360 560 340 43
s 560 360 600 360 44
w 59
s 330 340 420 340 58
a 0 s 3 0 340 340 hln 100 LABEL=I5
w 67
s 330 380 600 380 66
a 0 s 3 0 340 380 hln 100 LABEL=I3
w 75
s 330 400 600 400 74
a 0 s 3 0 340 400 hln 100 LABEL=I2
w 83
s 330 420 600 420 82
a 0 s 3 0 340 420 hln 100 LABEL=I1
w 91
s 330 440 600 440 90
a 0 s 3 0 340 440 hln 100 LABEL=I0
w 99
s 680 400 770 400 98
a 0 s 3 0 750 400 hln 100 LABEL=O
@junction
j 420 320
+ p 25 I2
+ w 27
j 420 360
+ p 25 I0
+ w 35
j 600 360
+ p 19 I4
+ w 45
j 500 340
+ p 25 O
+ w 45
j 420 340
+ p 25 I1
+ w 59
j 600 380
+ p 19 I3
+ w 67
j 600 400
+ p 19 I2
+ w 75
j 600 420
+ p 19 I1
+ w 83
j 600 440
+ p 19 I0
+ w 91
j 680 400
+ p 19 O
+ w 99
j 330 380
+ s 107
+ w 67
j 330 440
+ s 108
+ w 91
j 330 420
+ s 109
+ w 83
j 330 400
+ s 110
+ w 75
j 330 360
+ s 111
+ w 35
j 330 320
+ s 112
+ w 27
j 330 340
+ s 113
+ w 59
j 770 400
+ s 114
+ w 99
@attributes
@text
s 5 710 800 hln 100 20TH APRIL 1993
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
s 5 750 750 hln 100 XC3000 FAMILY XOR7 MACRO
s 5 750 770 hln 100 7-INPUT XOR
