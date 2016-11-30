*version 6.3 2259605007
u 77
XC2000 2432642975
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
pageloc 1 0 1570 1
@status
*page 1 0 1100 850 iX
@ports
port 78 IF_IN 220 390 h
a 0 s 3 0 10 8 hln 80 LABEL=C
port 79 IF_IN 220 340 h
a 0 s 3 0 10 8 hln 80 LABEL=D
port 80 IF_OUT 890 350 h
a 0 s 3 0 20 8 hln 80 LABEL=Q
port 81 IF_IN 220 420 h
a 0 s 3 0 10 8 hln 80 LABEL=R
port 82 IF_IN 220 360 h
a 0 s 3 0 10 8 hln 80 LABEL=S
@parts
part 17 FDR 590 350 h
a 0 sp 9 0 120 0 hrn 100 REFDES=U1
a 0 sp 11 0 60 20 hcn 200 PART=FDR
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 22 OR2 440 340 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U2
a 0 sp 11 0 10 40 hlt 100 PART=OR2
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 24
s 520 350 590 350 23
a 0 s 3 0 540 350 hln 100 LABEL=D_S
w 38
s 220 390 590 390 37
a 0 s 3 0 230 390 hln 100 LABEL=C
w 46
s 710 350 890 350 45
a 0 s 3 0 870 350 hln 100 LABEL=Q
w 54
s 220 340 440 340 53
a 0 s 3 0 230 340 hln 100 LABEL=D
w 62
s 220 360 440 360 61
a 0 s 3 0 230 360 hln 100 LABEL=S
w 70
s 220 420 590 420 69
a 0 s 3 0 230 420 hln 100 LABEL=R
@junction
j 590 350
+ p 17 D
+ w 24
j 520 350
+ p 22 O
+ w 24
j 590 390
+ p 17 C
+ w 38
j 710 350
+ p 17 Q
+ w 46
j 440 340
+ p 22 I1
+ w 54
j 440 360
+ p 22 I0
+ w 62
j 590 420
+ p 17 R
+ w 70
j 220 390
+ s 78
+ w 38
j 220 340
+ s 79
+ w 54
j 890 350
+ s 80
+ w 46
j 220 420
+ s 81
+ w 70
j 220 360
+ s 82
+ w 62
@attributes
@text
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 740 780 hln 100 (RESET TAKES PRECEDENCE OVER SET)
s 5 760 770 hln 100 D FLIP-FLOP W/ SYNC RESET & SET
s 5 760 750 hln 100 XC2000 FAMILY FDRS MACRO
s 5 710 800 hln 100 24TH FEBRUARY 1993
s 5 950 820 hln 100 A
s 5 950 800 hln 100 1
