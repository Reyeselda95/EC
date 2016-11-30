*version 6.3 1252166898
u 97
XC3000 2371040271
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
pageloc 1 0 1897 1
@status
*page 1 0 1100 850 iX
@ports
port 98 IF_IN 330 380 h
a 0 s 3 0 10 8 hln 80 LABEL=I2
port 99 IF_IN 330 360 h
a 0 s 3 0 10 8 hln 80 LABEL=I3
port 100 IF_IN 330 320 h
a 0 s 3 0 10 8 hln 80 LABEL=I5
port 101 IF_IN 330 340 h
a 0 s 3 0 10 8 hln 80 LABEL=I4
port 102 IF_IN 330 400 h
a 0 s 3 0 10 8 hln 80 LABEL=I1
port 103 IF_IN 330 420 h
a 0 s 3 0 10 8 hln 80 LABEL=I0
port 104 IF_OUT 770 390 h
a 0 s 3 0 20 8 hln 80 LABEL=O
@parts
part 17 XOR3 420 320 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 60 hlt 100 PART=XOR3
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 24 XNOR4 600 360 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U2
a 0 sp 11 0 10 80 hlt 100 PART=XNOR4
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 26
s 330 360 420 360 25
a 0 s 3 0 340 360 hln 100 LABEL=I3
w 34
s 330 340 420 340 33
a 0 s 3 0 340 340 hln 100 LABEL=I4
w 42
s 330 320 420 320 41
a 0 s 3 0 340 320 hln 100 LABEL=I5
w 52
s 500 340 560 340 49
a 0 s 3 0 530 340 hln 100 LABEL=I35
s 560 360 560 340 50
s 560 360 600 360 51
w 66
s 680 390 770 390 65
a 0 s 3 0 750 390 hln 100 LABEL=O
w 74
s 330 420 600 420 73
a 0 s 3 0 340 420 hln 100 LABEL=I0
w 82
s 330 380 600 380 81
a 0 s 3 0 340 380 hln 100 LABEL=I2
w 90
s 330 400 600 400 89
a 0 s 3 0 340 400 hln 100 LABEL=I1
@junction
j 420 360
+ p 17 I0
+ w 26
j 420 340
+ p 17 I1
+ w 34
j 420 320
+ p 17 I2
+ w 42
j 500 340
+ p 17 O
+ w 52
j 600 360
+ p 24 I3
+ w 52
j 680 390
+ p 24 O
+ w 66
j 600 420
+ p 24 I0
+ w 74
j 600 380
+ p 24 I2
+ w 82
j 600 400
+ p 24 I1
+ w 90
j 330 380
+ s 98
+ w 82
j 330 360
+ s 99
+ w 26
j 330 320
+ s 100
+ w 42
j 330 340
+ s 101
+ w 34
j 330 400
+ s 102
+ w 90
j 330 420
+ s 103
+ w 74
j 770 390
+ s 104
+ w 66
@attributes
@text
s 5 710 800 hln 100 20TH APRIL 1993
s 5 950 820 hln 100 A
s 5 950 800 hln 100 1
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 30 810 hln 100 DRAWN BY KS
s 5 750 750 hln 100 XC3000 FAMILY XNOR6 MACRO
s 5 750 770 hln 100 6-INPUT XNOR
