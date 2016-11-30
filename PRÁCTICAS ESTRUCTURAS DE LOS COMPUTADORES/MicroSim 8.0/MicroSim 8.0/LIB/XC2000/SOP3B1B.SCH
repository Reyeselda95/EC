*version 6.3 705257973
u 70
XC2000 3739208839
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
pageloc 1 0 1398 1
@status
*page 1 0 1100 850 iX
@ports
port 71 IF_IN 320 410 h
a 0 s 3 0 10 8 hln 80 LABEL=I2
port 72 IF_IN 320 380 h
a 0 s 3 0 10 8 hln 80 LABEL=I0
port 73 IF_IN 320 360 h
a 0 s 3 0 10 8 hln 80 LABEL=I1
port 74 IF_OUT 740 400 h
a 0 s 3 0 20 8 hln 80 LABEL=O
@parts
part 16 OR2B1 580 390 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 40 hlt 100 PART=OR2B1
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 21 AND2 400 360 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U2
a 0 sp 11 0 10 40 hlt 100 PART=AND2
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 23
s 320 410 580 410 22
a 0 s 3 0 330 410 hln 100 LABEL=I2
w 33
s 480 370 530 370 30
a 0 s 3 0 500 370 hln 100 LABEL=I01
s 530 390 530 370 31
s 530 390 580 390 32
w 47
s 320 360 400 360 46
a 0 s 3 0 330 360 hln 100 LABEL=I1
w 55
s 320 380 400 380 54
a 0 s 3 0 330 380 hln 100 LABEL=I0
w 63
s 660 400 740 400 62
a 0 s 3 0 720 400 hln 100 LABEL=O
@junction
j 580 410
+ p 16 I0
+ w 23
j 580 390
+ p 16 I1
+ w 33
j 480 370
+ p 21 O
+ w 33
j 400 360
+ p 21 I1
+ w 47
j 400 380
+ p 21 I0
+ w 55
j 660 400
+ p 16 O
+ w 63
j 320 410
+ s 71
+ w 23
j 320 380
+ s 72
+ w 55
j 320 360
+ s 73
+ w 47
j 740 400
+ s 74
+ w 63
@attributes
@text
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 750 770 hln 100 3-INPUT SUM-OF-PRODUCTS
s 5 950 820 hln 100 A
s 5 950 800 hln 100 1
s 5 710 800 hln 100 1ST MARCH 1993
s 5 750 750 hln 100 XC2000 FAMILY SOP3B1B MACRO
