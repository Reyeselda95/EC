*version 6.3 97916835
u 83
XC2000 544801992
U? 5
@libraries
XC2000 [.slb]
@analysis
@targets
@attributes
a FAMILY=XC2000
a IMPL=XILINX
@translators
@index
pageloc 1 0 2154 1
@status
*page 1 0 1100 850 iX
@ports
port 84 IF_OUT 770 330 h
a 0 s 3 0 20 8 hln 80 LABEL=O0
port 85 IF_OUT 770 360 h
a 0 s 3 0 20 8 hln 80 LABEL=O1
port 86 IF_IN 300 390 h
a 0 s 3 0 10 8 hln 80 LABEL=I2
port 87 IF_OUT 770 390 h
a 0 s 3 0 20 8 hln 80 LABEL=O2
port 88 IF_IN 300 360 h
a 0 s 3 0 10 8 hln 80 LABEL=I1
port 89 IF_IN 300 330 h
a 0 s 3 0 10 8 hln 80 LABEL=I0
port 90 IF_IN 300 420 h
a 0 s 3 0 10 8 hln 80 LABEL=I3
port 91 IF_OUT 770 420 h
a 0 s 3 0 20 8 hln 80 LABEL=O3
@parts
part 15 OBUF 500 330 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U1
a 0 sp 11 0 30 14 hlt 100 PART=OBUF
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 16 OBUF 500 360 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U2
a 0 sp 11 0 30 14 hlt 100 PART=OBUF
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 17 OBUF 500 390 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U3
a 0 sp 11 0 30 14 hlt 100 PART=OBUF
a 0 a 0 0 0 0 hln 100 PKGREF=U3
part 18 OBUF 500 420 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U4
a 0 sp 11 0 30 14 hlt 100 PART=OBUF
a 0 a 0 0 0 0 hln 100 PKGREF=U4
@conn
w 20
s 570 330 770 330 19
a 0 s 3 0 730 330 hln 100 LABEL=O0
w 28
s 300 420 500 420 27
a 0 s 3 0 310 420 hln 100 LABEL=I3
w 36
s 300 390 500 390 35
a 0 s 3 0 310 390 hln 100 LABEL=I2
w 44
s 300 360 500 360 43
a 0 s 3 0 310 360 hln 100 LABEL=I1
w 52
s 300 330 500 330 51
a 0 s 3 0 310 330 hln 100 LABEL=I0
w 60
s 570 360 770 360 59
a 0 s 3 0 730 360 hln 100 LABEL=O1
w 68
s 570 420 770 420 67
a 0 s 3 0 730 420 hln 100 LABEL=O3
w 76
s 570 390 770 390 75
a 0 s 3 0 730 390 hln 100 LABEL=O2
@junction
j 570 330
+ p 15 O
+ w 20
j 500 420
+ p 18 I
+ w 28
j 500 390
+ p 17 I
+ w 36
j 500 360
+ p 16 I
+ w 44
j 500 330
+ p 15 I
+ w 52
j 570 360
+ p 16 O
+ w 60
j 570 420
+ p 18 O
+ w 68
j 570 390
+ p 17 O
+ w 76
j 770 330
+ s 84
+ w 20
j 770 360
+ s 85
+ w 60
j 300 390
+ s 86
+ w 36
j 770 390
+ s 87
+ w 76
j 300 360
+ s 88
+ w 44
j 300 330
+ s 89
+ w 52
j 300 420
+ s 90
+ w 28
j 770 420
+ s 91
+ w 68
@attributes
@text
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 880 800 hrn 100 25TH JANUARY 1993
s 5 950 820 hln 100 A
s 5 960 800 hrn 100 1
s 5 950 770 hrn 100 4-BIT OUTPUT BUFFER
s 5 1020 750 hrn 100 XC2000 FAMILY OBUF4  MACRO
