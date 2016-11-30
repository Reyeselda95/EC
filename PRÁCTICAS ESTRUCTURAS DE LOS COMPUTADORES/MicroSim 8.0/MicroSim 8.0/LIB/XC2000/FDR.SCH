*version 6.3 552488061
u 68
XC2000 2092893904
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
pageloc 1 0 1349 1
@status
*page 1 0 1100 850 iX
@ports
port 69 IF_IN 210 410 h
a 0 s 3 0 10 8 hln 80 LABEL=C
port 70 IF_IN 210 360 h
a 0 s 3 0 10 8 hln 80 LABEL=D
port 71 IF_OUT 880 370 h
a 0 s 3 0 20 8 hln 80 LABEL=Q
port 72 IF_IN 210 380 h
a 0 s 3 0 10 8 hln 80 LABEL=R
@parts
part 16 AND2B1 430 360 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 40 hlt 100 PART=AND2B1
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 21 FD 580 370 h
a 0 sp 9 0 120 0 hrn 100 REFDES=U2
a 0 sp 11 0 60 20 hcn 200 PART=FD
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 23
s 210 380 430 380 22
a 0 s 3 0 220 380 hln 100 LABEL=R
w 31
s 700 370 880 370 30
a 0 s 3 0 860 370 hln 100 LABEL=Q
w 39
s 210 360 430 360 38
a 0 s 3 0 220 360 hln 100 LABEL=D
w 47
s 210 410 580 410 46
a 0 s 3 0 220 410 hln 100 LABEL=C
w 55
s 510 370 580 370 54
a 0 s 3 0 530 370 hln 100 LABEL=D_R
@junction
j 430 380
+ p 16 I0
+ w 23
j 700 370
+ p 21 Q
+ w 31
j 430 360
+ p 16 I1
+ w 39
j 580 410
+ p 21 C
+ w 47
j 510 370
+ p 16 O
+ w 55
j 580 370
+ p 21 D
+ w 55
j 210 410
+ s 69
+ w 47
j 210 360
+ s 70
+ w 39
j 880 370
+ s 71
+ w 31
j 210 380
+ s 72
+ w 23
@attributes
@text
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 760 770 hln 100 D FLIP-FLOP W/ SYNC RESET
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
s 5 710 800 hln 100 24TH FEBRUARY 1993
s 5 760 750 hln 100 XC2000 FAMILY FDR MACRO
