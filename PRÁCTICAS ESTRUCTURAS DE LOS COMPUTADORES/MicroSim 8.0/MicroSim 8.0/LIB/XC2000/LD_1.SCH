*version 6.3 860198692
u 91
XC2000 953683620
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
pageloc 1 0 1584 1
@status
*page 1 0 1100 850 iX
@ports
port 92 IF_IN 250 380 h
a 0 s 3 0 10 8 hln 80 LABEL=G
port 93 IF_IN 250 340 h
a 0 s 3 0 10 8 hln 80 LABEL=D
port 94 IF_OUT 810 340 h
a 0 s 3 0 20 8 hln 80 LABEL=Q
@parts
part 18 LDCP 470 310 h
a 0 sp 9 0 120 0 hrn 100 REFDES=U1
a 0 sp 11 0 60 10 hcn 200 PART=LDCP
a 0 u 13 13 0 130 hln 100 RLOC=R0C0.FFX
a 0 u 13 13 0 140 hln 100 USE_RLOC=FALSE
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 21 GND 440 440 h
a 0 sp 0 0 40 0 hrn 100 REFDES=U2
a 0 sp 11 0 5 40 hln 100 PART=GND
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 25 INV 350 380 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U3
a 0 sp 11 0 30 14 hlt 100 PART=INV
a 0 a 0 0 0 0 hln 100 PKGREF=U3
@conn
w 27
s 420 380 470 380 26
a 0 s 3 0 440 380 hln 100 LABEL=GB
w 41
s 250 380 350 380 40
a 0 s 3 0 260 380 hln 100 LABEL=G
w 49
s 590 340 810 340 48
a 0 s 3 0 790 340 hln 100 LABEL=Q
w 57
s 250 340 470 340 56
a 0 s 3 0 260 340 hln 100 LABEL=D
w 68
s 440 310 470 310 64
s 440 410 440 310 67
s 440 410 470 410 65
s 440 440 440 410 66
@junction
j 470 380
+ p 18 G
+ w 27
j 420 380
+ p 25 O
+ w 27
j 350 380
+ p 25 I
+ w 41
j 590 340
+ p 18 Q
+ w 49
j 470 340
+ p 18 D
+ w 57
j 440 410
+ w 68
+ w 68
j 470 310
+ p 18 PRE
+ w 68
j 470 410
+ p 18 CLR
+ w 68
j 440 440
+ p 21 GROUND
+ w 68
j 250 380
+ s 92
+ w 41
j 250 340
+ s 93
+ w 57
j 810 340
+ s 94
+ w 49
@attributes
@text
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 30 810 hln 100 DRAWN BY KS
s 5 750 750 hln 100 XC2000 FAMILY LD_1 MACRO
s 5 750 770 hln 100 DATA LATCH W/ AN INVERTED CLOCK
s 5 710 800 hln 100 5TH MAY 1993
