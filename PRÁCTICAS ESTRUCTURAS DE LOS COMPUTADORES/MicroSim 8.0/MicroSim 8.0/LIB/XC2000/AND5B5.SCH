*version 6.3 2105177668
u 88
XC2000 777981860
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
pageloc 1 0 1747 1
@status
*page 1 0 1100 850 iX
@ports
port 89 IF_OUT 770 380 h
a 0 s 3 0 20 8 hln 80 LABEL=O
port 90 IF_IN 330 320 h
a 0 s 3 0 10 8 hln 80 LABEL=I4
port 91 IF_IN 330 340 h
a 0 s 3 0 10 8 hln 80 LABEL=I3
port 92 IF_IN 330 360 h
a 0 s 3 0 10 8 hln 80 LABEL=I2
port 93 IF_IN 330 380 h
a 0 s 3 0 10 8 hln 80 LABEL=I1
port 94 IF_IN 330 400 h
a 0 s 3 0 10 8 hln 80 LABEL=I0
@parts
part 17 AND3B3 420 320 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 60 hlt 100 PART=AND3B3
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 23 AND3B2 600 360 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U2
a 0 sp 11 0 10 60 hlt 100 PART=AND3B2
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 25
s 330 340 420 340 24
a 0 s 3 0 340 340 hln 100 LABEL=I3
w 33
s 330 320 420 320 32
a 0 s 3 0 340 320 hln 100 LABEL=I4
w 43
s 500 340 560 340 40
a 0 s 3 0 530 340 hln 100 LABEL=I35
s 560 360 560 340 41
s 560 360 600 360 42
w 57
s 330 400 600 400 56
a 0 s 3 0 340 400 hln 100 LABEL=I0
w 65
s 330 360 420 360 64
a 0 s 3 0 340 360 hln 100 LABEL=I2
w 73
s 680 380 770 380 72
a 0 s 3 0 750 380 hln 100 LABEL=O
w 81
s 330 380 600 380 80
a 0 s 3 0 340 380 hln 100 LABEL=I1
@junction
j 420 340
+ p 17 I1
+ w 25
j 420 320
+ p 17 I2
+ w 33
j 500 340
+ p 17 O
+ w 43
j 600 360
+ p 23 I2
+ w 43
j 600 400
+ p 23 I0
+ w 57
j 420 360
+ p 17 I0
+ w 65
j 680 380
+ p 23 O
+ w 73
j 600 380
+ p 23 I1
+ w 81
j 770 380
+ s 89
+ w 73
j 330 320
+ s 90
+ w 33
j 330 340
+ s 91
+ w 25
j 330 360
+ s 92
+ w 65
j 330 380
+ s 93
+ w 81
j 330 400
+ s 94
+ w 57
@attributes
@text
s 5 710 800 hln 100 20TH APRIL 1993
s 5 950 820 hln 100 A
s 5 950 800 hln 100 1
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 30 810 hln 100 DRAWN BY KS
s 5 750 750 hln 100 XC2000 FAMILY AND5B5 MACRO
s 5 750 770 hln 100 5-INPUT AND (W/ FIVE INV INPUTS)
