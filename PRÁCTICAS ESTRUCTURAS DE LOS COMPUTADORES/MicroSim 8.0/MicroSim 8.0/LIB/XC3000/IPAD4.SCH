*version 6.3 511024613
u 50
XC3000 3401235515
U? 5
@libraries
XC3000 [.slb]
@analysis
@targets
@attributes
a FAMILY=XC3000
a IMPL=XILINX
@translators
@index
pageloc 1 0 1412 1
@status
*page 1 0 1100 850 iX
@ports
port 51 IF_OUT 680 310 h
a 0 s 3 0 20 8 hln 80 LABEL=I0
port 52 IF_OUT 680 340 h
a 0 s 3 0 20 8 hln 80 LABEL=I1
port 53 IF_OUT 680 370 h
a 0 s 3 0 20 8 hln 80 LABEL=I2
port 54 IF_OUT 680 400 h
a 0 s 3 0 20 8 hln 80 LABEL=I3
@parts
part 14 IPAD 480 310 h
a 0 sp 9 0 100 0 hrn 100 REFDES=U1
a 0 sp 11 0 0 0 hln 100 PART=IPAD
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 15 IPAD 480 340 h
a 0 sp 9 0 100 0 hrn 100 REFDES=U2
a 0 sp 11 0 0 0 hln 100 PART=IPAD
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 16 IPAD 480 370 h
a 0 sp 9 0 100 0 hrn 100 REFDES=U3
a 0 sp 11 0 0 0 hln 100 PART=IPAD
a 0 a 0 0 0 0 hln 100 PKGREF=U3
part 17 IPAD 480 400 h
a 0 sp 9 0 100 0 hrn 100 REFDES=U4
a 0 sp 11 0 0 0 hln 100 PART=IPAD
a 0 a 0 0 0 0 hln 100 PKGREF=U4
@conn
w 19
s 480 310 680 310 18
a 0 s 3 0 640 310 hln 100 LABEL=I0
w 27
s 480 340 680 340 26
a 0 s 3 0 640 340 hln 100 LABEL=I1
w 35
s 480 400 680 400 34
a 0 s 3 0 640 400 hln 100 LABEL=I3
w 43
s 480 370 680 370 42
a 0 s 3 0 640 370 hln 100 LABEL=I2
@junction
j 480 310
+ p 14 IPAD
+ w 19
j 480 340
+ p 15 IPAD
+ w 27
j 480 400
+ p 17 IPAD
+ w 35
j 480 370
+ p 16 IPAD
+ w 43
j 680 310
+ s 51
+ w 19
j 680 340
+ s 52
+ w 27
j 680 370
+ s 53
+ w 43
j 680 400
+ s 54
+ w 35
@attributes
@text
s 5 890 800 hrn 100 22ND FEBRUARY 1993
s 5 960 800 hrn 100 1
s 5 950 820 hln 100 A
s 5 1000 750 hrn 100 XC3000 FAMILY IPAD4 MACRO
s 5 900 770 hrn 100 4-BIT INPUT PAD
