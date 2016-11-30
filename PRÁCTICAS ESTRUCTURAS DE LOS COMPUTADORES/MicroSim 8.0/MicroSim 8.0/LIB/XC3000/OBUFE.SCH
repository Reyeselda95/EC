*version 6.3 2267036843
u 59
XC3000 266595567
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
pageloc 1 0 1222 1
@status
*page 1 0 1100 850 iX
@ports
port 60 IF_IN 290 340 h
a 0 s 3 0 10 8 hln 80 LABEL=I
port 61 IF_OUT 810 340 h
a 0 s 3 0 20 8 hln 80 LABEL=O
port 62 IF_IN 290 320 h
a 0 s 3 0 10 8 hln 80 LABEL=E
@parts
part 16 OBUFT 520 320 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U1
a 0 sp 11 0 30 34 hlt 100 PART=OBUFT
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 20 INV 400 320 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U2
a 0 sp 11 0 30 14 hlt 100 PART=INV
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 22
s 470 320 520 320 21
a 0 s 3 0 490 320 hln 100 LABEL=T
w 36
s 290 340 520 340 35
a 0 s 3 0 300 340 hln 100 LABEL=I
w 44
s 290 320 400 320 43
a 0 s 3 0 300 320 hln 100 LABEL=E
w 52
s 590 340 810 340 51
a 0 s 3 0 790 340 hln 100 LABEL=O
@junction
j 520 320
+ p 16 T
+ w 22
j 470 320
+ p 20 O
+ w 22
j 520 340
+ p 16 I
+ w 36
j 400 320
+ p 20 I
+ w 44
j 590 340
+ p 16 O
+ w 52
j 290 340
+ s 60
+ w 36
j 810 340
+ s 61
+ w 52
j 290 320
+ s 62
+ w 44
@attributes
@text
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 750 750 hln 100 XC3000 FAMILY OBUFE MACRO
s 5 710 800 hln 100 22ND FEBRUARY 1993
s 5 750 770 hln 100 3-STATE OUTPUT BUFFER WITH
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
s 5 750 780 hln 100 ACTIVE HIGH ENABLE
