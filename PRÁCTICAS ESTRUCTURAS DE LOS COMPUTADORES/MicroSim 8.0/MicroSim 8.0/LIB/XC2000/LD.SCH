*version 6.3 1005915666
u 72
XC2000 3686540319
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
pageloc 1 0 1244 1
@status
*page 1 0 1100 850 iX
@ports
port 73 IF_OUT 810 340 h
a 0 s 3 0 20 8 hln 80 LABEL=Q
port 74 IF_IN 250 340 h
a 0 s 3 0 10 8 hln 80 LABEL=D
port 75 IF_IN 250 380 h
a 0 s 3 0 10 8 hln 80 LABEL=G
@parts
part 14 GND 440 440 h
a 0 sp 0 0 40 0 hrn 100 REFDES=U1
a 0 sp 11 0 5 40 hln 100 PART=GND
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 21 LDCP 470 310 h
a 0 sp 9 0 120 0 hrn 100 REFDES=U2
a 0 sp 11 0 60 10 hcn 200 PART=LDCP
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 23
s 250 340 470 340 22
a 0 s 3 0 260 340 hln 100 LABEL=D
w 31
s 590 340 810 340 30
a 0 s 3 0 790 340 hln 100 LABEL=Q
w 39
s 250 380 470 380 38
a 0 s 3 0 260 380 hln 100 LABEL=G
w 50
s 440 410 470 410 46
s 440 440 440 410 47
s 440 410 440 310 48
s 440 310 470 310 49
@junction
j 470 340
+ p 21 D
+ w 23
j 590 340
+ p 21 Q
+ w 31
j 470 380
+ p 21 G
+ w 39
j 440 410
+ w 50
+ w 50
j 440 440
+ p 14 GROUND
+ w 50
j 470 410
+ p 21 CLR
+ w 50
j 470 310
+ p 21 PRE
+ w 50
j 810 340
+ s 73
+ w 31
j 250 340
+ s 74
+ w 23
j 250 380
+ s 75
+ w 39
@attributes
@text
s 5 710 800 hln 100 5TH MAY 1993
s 5 750 770 hln 100 DATA LATCH
s 5 750 750 hln 100 XC2000 FAMILY LD MACRO
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 30 810 hln 100 DRAWN BY KS
