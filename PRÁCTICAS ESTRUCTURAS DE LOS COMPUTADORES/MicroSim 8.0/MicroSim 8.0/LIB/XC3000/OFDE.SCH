*version 6.3 2135582054
u 68
XC3000 1886046186
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
pageloc 1 0 1384 1
@status
*page 1 0 1100 850 iX
@ports
port 69 IF_IN 270 350 h
a 0 s 3 0 10 8 hln 80 LABEL=D
port 70 IF_IN 270 390 h
a 0 s 3 0 10 8 hln 80 LABEL=C
port 71 IF_OUT 880 350 h
a 0 s 3 0 20 8 hln 80 LABEL=O
port 72 IF_IN 270 320 h
a 0 s 3 0 10 8 hln 80 LABEL=E
@parts
part 15 INV 380 320 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U1
a 0 sp 11 0 30 14 hlt 100 PART=INV
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 21 OFDT 500 320 h
a 0 sp 9 0 160 0 hrn 100 REFDES=U2
a 0 sp 11 0 80 20 hcn 200 PART=OFDT
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 23
s 270 320 380 320 22
a 0 s 3 0 280 320 hln 100 LABEL=E
w 31
s 270 350 500 350 30
a 0 s 3 0 280 350 hln 100 LABEL=D
w 39
s 270 390 500 390 38
a 0 s 3 0 280 390 hln 100 LABEL=C
w 47
s 450 320 500 320 46
a 0 s 3 0 470 320 hln 100 LABEL=T
w 61
s 660 350 880 350 60
a 0 s 3 0 860 350 hln 100 LABEL=O
@junction
j 380 320
+ p 15 I
+ w 23
j 500 350
+ p 21 D
+ w 31
j 500 390
+ p 21 C
+ w 39
j 450 320
+ p 15 O
+ w 47
j 500 320
+ p 21 T
+ w 47
j 660 350
+ p 21 O
+ w 61
j 270 350
+ s 69
+ w 31
j 270 390
+ s 70
+ w 39
j 880 350
+ s 71
+ w 61
j 270 320
+ s 72
+ w 23
@attributes
@text
s 5 710 800 hln 100 24TH FEBRUARY 1993
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
s 5 750 780 hln 100 ACTIVE HIGH ENABLE
s 5 750 770 hln 100 OUTPUT D FLIP-FLOP WITH AN
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 30 810 hln 100 DRAWN BY KS
s 5 750 750 hln 100 XC3000 FAMILY OFDE MACRO
