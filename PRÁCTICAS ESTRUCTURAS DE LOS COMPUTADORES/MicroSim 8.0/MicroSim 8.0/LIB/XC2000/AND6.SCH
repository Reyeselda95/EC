*version 6.3 477282499
u 98
XC2000 978490759
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
pageloc 1 0 1895 1
@status
*page 1 0 1100 850 iX
@ports
port 99 IF_IN 330 420 h
a 0 s 3 0 10 8 hln 80 LABEL=I0
port 100 IF_IN 330 400 h
a 0 s 3 0 10 8 hln 80 LABEL=I1
port 101 IF_IN 330 380 h
a 0 s 3 0 10 8 hln 80 LABEL=I2
port 102 IF_IN 330 360 h
a 0 s 3 0 10 8 hln 80 LABEL=I3
port 103 IF_IN 330 340 h
a 0 s 3 0 10 8 hln 80 LABEL=I4
port 104 IF_IN 330 320 h
a 0 s 3 0 10 8 hln 80 LABEL=I5
port 105 IF_OUT 770 390 h
a 0 s 3 0 20 8 hln 80 LABEL=O
@parts
part 18 AND4 600 360 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 80 hlt 100 PART=AND4
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 24 AND3 420 320 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U2
a 0 sp 11 0 10 60 hlt 100 PART=AND3
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 26
s 330 400 600 400 25
a 0 s 3 0 340 400 hln 100 LABEL=I1
w 34
s 330 380 600 380 33
a 0 s 3 0 340 380 hln 100 LABEL=I2
w 42
s 330 420 600 420 41
a 0 s 3 0 340 420 hln 100 LABEL=I0
w 50
s 680 390 770 390 49
a 0 s 3 0 750 390 hln 100 LABEL=O
w 60
s 500 340 560 340 57
a 0 s 3 0 530 340 hln 100 LABEL=I35
s 560 360 560 340 59
s 560 360 600 360 58
w 75
s 330 320 420 320 74
a 0 s 3 0 340 320 hln 100 LABEL=I5
w 83
s 330 340 420 340 82
a 0 s 3 0 340 340 hln 100 LABEL=I4
w 91
s 330 360 420 360 90
a 0 s 3 0 340 360 hln 100 LABEL=I3
@junction
j 600 400
+ p 18 I1
+ w 26
j 600 380
+ p 18 I2
+ w 34
j 600 420
+ p 18 I0
+ w 42
j 680 390
+ p 18 O
+ w 50
j 600 360
+ p 18 I3
+ w 60
j 500 340
+ p 24 O
+ w 60
j 420 320
+ p 24 I2
+ w 75
j 420 340
+ p 24 I1
+ w 83
j 420 360
+ p 24 I0
+ w 91
j 330 420
+ s 99
+ w 42
j 330 400
+ s 100
+ w 26
j 330 380
+ s 101
+ w 34
j 330 360
+ s 102
+ w 91
j 330 340
+ s 103
+ w 83
j 330 320
+ s 104
+ w 75
j 770 390
+ s 105
+ w 50
@attributes
@text
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
s 5 710 800 hln 100 20TH APRIL 1993
s 5 750 750 hln 100 XC2000 FAMILY AND6 MACRO
s 5 750 770 hln 100 6-INPUT AND
