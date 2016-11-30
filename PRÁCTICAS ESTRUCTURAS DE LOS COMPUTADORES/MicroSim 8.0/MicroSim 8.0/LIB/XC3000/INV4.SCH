*version 6.3 246219482
u 83
XC3000 225206040
U? 5
@libraries
XC3000 [.slb]
@analysis
@targets
@attributes
a FAMILY=XC3000
a IMPL=XILINX
@translators
@index
pageloc 1 0 2139 1
@status
*page 1 0 1100 850 iX
@ports
port 84 IF_IN 290 420 h
a 0 s 3 0 10 8 hln 80 LABEL=I3
port 85 IF_IN 290 390 h
a 0 s 3 0 10 8 hln 80 LABEL=I2
port 86 IF_IN 290 360 h
a 0 s 3 0 10 8 hln 80 LABEL=I1
port 87 IF_IN 290 330 h
a 0 s 3 0 10 8 hln 80 LABEL=I0
port 88 IF_OUT 760 420 h
a 0 s 3 0 20 8 hln 80 LABEL=O3
port 89 IF_OUT 760 390 h
a 0 s 3 0 20 8 hln 80 LABEL=O2
port 90 IF_OUT 760 360 h
a 0 s 3 0 20 8 hln 80 LABEL=O1
port 91 IF_OUT 760 330 h
a 0 s 3 0 20 8 hln 80 LABEL=O0
@parts
part 15 INV 490 330 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U1
a 0 sp 11 0 30 14 hlt 100 PART=INV
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 16 INV 490 360 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U2
a 0 sp 11 0 30 14 hlt 100 PART=INV
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 17 INV 490 390 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U3
a 0 sp 11 0 30 14 hlt 100 PART=INV
a 0 a 0 0 0 0 hln 100 PKGREF=U3
part 18 INV 490 420 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U4
a 0 sp 11 0 30 14 hlt 100 PART=INV
a 0 a 0 0 0 0 hln 100 PKGREF=U4
@conn
w 20
s 290 420 490 420 19
a 0 s 3 0 300 420 hln 100 LABEL=I3
w 28
s 560 420 760 420 27
a 0 s 3 0 720 420 hln 100 LABEL=O3
w 36
s 560 390 760 390 35
a 0 s 3 0 720 390 hln 100 LABEL=O2
w 44
s 290 390 490 390 43
a 0 s 3 0 300 390 hln 100 LABEL=I2
w 52
s 290 360 490 360 51
a 0 s 3 0 300 360 hln 100 LABEL=I1
w 60
s 560 360 760 360 59
a 0 s 3 0 720 360 hln 100 LABEL=O1
w 68
s 560 330 760 330 67
a 0 s 3 0 720 330 hln 100 LABEL=O0
w 76
s 290 330 490 330 75
a 0 s 3 0 300 330 hln 100 LABEL=I0
@junction
j 490 420
+ p 18 I
+ w 20
j 560 420
+ p 18 O
+ w 28
j 560 390
+ p 17 O
+ w 36
j 490 390
+ p 17 I
+ w 44
j 490 360
+ p 16 I
+ w 52
j 560 360
+ p 16 O
+ w 60
j 560 330
+ p 15 O
+ w 68
j 490 330
+ p 15 I
+ w 76
j 290 420
+ s 84
+ w 20
j 290 390
+ s 85
+ w 44
j 290 360
+ s 86
+ w 52
j 290 330
+ s 87
+ w 76
j 760 420
+ s 88
+ w 28
j 760 390
+ s 89
+ w 36
j 760 360
+ s 90
+ w 60
j 760 330
+ s 91
+ w 68
@attributes
@text
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 990 750 hrn 100 XC3000 FAMILY INV4 MACRO
s 5 880 800 hrn 100 22ND FEBRUARY 1993
s 5 960 800 hrn 100 1
s 5 950 820 hln 100 A
s 5 890 770 hrn 100 4-BIT INVERTER
