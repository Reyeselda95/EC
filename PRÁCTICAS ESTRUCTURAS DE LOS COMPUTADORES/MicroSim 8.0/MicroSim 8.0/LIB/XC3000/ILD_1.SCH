*version 6.3 33615584
u 59
XC3000 156230634
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
pageloc 1 0 1138 1
@status
*page 1 0 1100 850 iX
@ports
port 60 IF_OUT 840 350 h
a 0 s 3 0 20 8 hln 80 LABEL=Q
port 61 IF_IN 270 350 h
a 0 s 3 0 10 8 hln 80 LABEL=D
port 62 IF_IN 270 390 h
a 0 s 3 0 10 8 hln 80 LABEL=G
@parts
part 15 INV 380 390 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U1
a 0 sp 11 0 30 14 hlt 100 PART=INV
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 20 ILD 500 350 h
a 0 sp 9 0 120 0 hrn 100 REFDES=U2
a 0 sp 11 0 60 20 hcn 200 PART=ILD
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 22
s 450 390 500 390 21
a 0 s 3 0 470 390 hln 100 LABEL=GB
w 36
s 620 350 840 350 35
a 0 s 3 0 820 350 hln 100 LABEL=Q
w 44
s 270 390 380 390 43
a 0 s 3 0 280 390 hln 100 LABEL=G
w 52
s 270 350 500 350 51
a 0 s 3 0 280 350 hln 100 LABEL=D
@junction
j 450 390
+ p 15 O
+ w 22
j 500 390
+ p 20 G
+ w 22
j 620 350
+ p 20 Q
+ w 36
j 380 390
+ p 15 I
+ w 44
j 500 350
+ p 20 D
+ w 52
j 840 350
+ s 60
+ w 36
j 270 350
+ s 61
+ w 52
j 270 390
+ s 62
+ w 44
@attributes
@text
s 5 750 780 hln 100 AN INVERTED CLOCK
s 5 750 770 hln 100 INPUT TRANSPARENT DATA LATCH W/
s 5 750 750 hln 100 XC3000 FAMILY ILD_1 MACRO
s 5 710 800 hln 100 1ST MARCH 1993
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
