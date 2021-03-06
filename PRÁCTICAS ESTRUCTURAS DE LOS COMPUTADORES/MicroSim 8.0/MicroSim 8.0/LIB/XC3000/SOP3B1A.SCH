*version 6.3 1451280888
u 70
XC3000 345746947
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
pageloc 1 0 1399 1
@status
*page 1 0 1100 850 iX
@ports
port 71 IF_IN 320 340 h
a 0 s 3 0 10 8 hln 80 LABEL=I2
port 72 IF_IN 320 360 h
a 0 s 3 0 10 8 hln 80 LABEL=I1
port 73 IF_OUT 740 350 h
a 0 s 3 0 20 8 hln 80 LABEL=O
port 74 IF_IN 320 380 h
a 0 s 3 0 10 8 hln 80 LABEL=I0
@parts
part 16 OR2 580 340 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 40 hlt 100 PART=OR2
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 21 AND2B1 400 360 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U2
a 0 sp 11 0 10 40 hlt 100 PART=AND2B1
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 23
s 320 340 580 340 22
a 0 s 3 0 330 340 hln 100 LABEL=I2
w 31
s 320 360 400 360 30
a 0 s 3 0 330 360 hln 100 LABEL=I1
w 39
s 320 380 400 380 38
a 0 s 3 0 330 380 hln 100 LABEL=I0
w 49
s 480 370 530 370 46
a 0 s 3 0 490 370 hln 100 LABEL=I0B1
s 530 370 530 360 47
s 530 360 580 360 48
w 63
s 660 350 740 350 62
a 0 s 3 0 720 350 hln 100 LABEL=O
@junction
j 580 340
+ p 16 I1
+ w 23
j 400 360
+ p 21 I1
+ w 31
j 400 380
+ p 21 I0
+ w 39
j 580 360
+ p 16 I0
+ w 49
j 480 370
+ p 21 O
+ w 49
j 660 350
+ p 16 O
+ w 63
j 320 340
+ s 71
+ w 23
j 320 360
+ s 72
+ w 31
j 740 350
+ s 73
+ w 63
j 320 380
+ s 74
+ w 39
@attributes
@text
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 750 750 hln 100 XC3000 FAMILY SOP3B1A MACRO
s 5 750 770 hln 100 3-INPUT SUM-OF-PRODUCTS
s 5 950 820 hln 100 A
s 5 950 800 hln 100 1
s 5 710 800 hln 100 1ST MARCH 1993
