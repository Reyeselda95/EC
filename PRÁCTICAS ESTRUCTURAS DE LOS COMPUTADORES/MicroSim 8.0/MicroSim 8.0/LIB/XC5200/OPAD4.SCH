*version 6.3 1852661372
u 50
XC5200 907288579
U? 5
@libraries
XC5200 [.slb]
@analysis
@targets
@attributes
a FAMILY=XC5200
a IMPL=XILINX
@translators
@setup
unconnectedPins 0
connectViaLabel 1
connectViaLocalLabels 0
NoStim4ExtIFPortsWarnings 1
AutoGenStim4ExtIFPorts 1
@index
pageloc 1 0 1483 1
@status
*page 1 0 1100 850 iX
@ports
port 51 IF_IN 380 310 h
a 0 s 3 0 10 8 hln 80 LABEL=O0
port 52 IF_IN 380 340 h
a 0 s 3 0 10 8 hln 80 LABEL=O1
port 53 IF_IN 380 370 h
a 0 s 3 0 10 8 hln 80 LABEL=O2
port 54 IF_IN 380 400 h
a 0 s 3 0 10 8 hln 80 LABEL=O3
@parts
part 14 OPAD 580 400 h
a 0 sp 9 0 90 0 hrn 100 REFDES=U1
a 0 sp 11 0 0 0 hln 100 PART=OPAD
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 15 OPAD 580 370 h
a 0 sp 9 0 90 0 hrn 100 REFDES=U2
a 0 sp 11 0 0 0 hln 100 PART=OPAD
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 16 OPAD 580 340 h
a 0 sp 9 0 90 0 hrn 100 REFDES=U3
a 0 sp 11 0 0 0 hln 100 PART=OPAD
a 0 a 0 0 0 0 hln 100 PKGREF=U3
part 17 OPAD 580 310 h
a 0 sp 9 0 90 0 hrn 100 REFDES=U4
a 0 sp 11 0 0 0 hln 100 PART=OPAD
a 0 a 0 0 0 0 hln 100 PKGREF=U4
@conn
w 19
s 380 310 580 310 18
a 0 s 3 0 390 310 hln 100 LABEL=O0
w 27
s 380 340 580 340 26
a 0 s 3 0 390 340 hln 100 LABEL=O1
w 35
s 380 370 580 370 34
a 0 s 3 0 390 370 hln 100 LABEL=O2
w 43
s 380 400 580 400 42
a 0 s 3 0 390 400 hln 100 LABEL=O3
@junction
j 580 310
+ p 17 OPAD
+ w 19
j 580 340
+ p 16 OPAD
+ w 27
j 580 370
+ p 15 OPAD
+ w 35
j 580 400
+ p 14 OPAD
+ w 43
j 380 310
+ s 51
+ w 19
j 380 340
+ s 52
+ w 27
j 380 370
+ s 53
+ w 35
j 380 400
+ s 54
+ w 43
@attributes
@text
s 5 910 770 hrn 100 4-BIT OUTPUT PAD
s 5 850 800 hrn 100 1ST MARCH 1993
s 5 1000 750 hrn 100 XC5200 FAMILY OPAD4 MACRO
s 5 960 800 hrn 100 1
s 5 950 820 hln 100 A
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 30 810 hln 100 DRAWN BY KS
