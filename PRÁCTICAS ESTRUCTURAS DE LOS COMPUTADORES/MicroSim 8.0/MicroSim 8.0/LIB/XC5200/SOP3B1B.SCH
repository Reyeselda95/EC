*version 6.3 2321876433
u 71
XC5200 4243248781
U? 3
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
pageloc 1 0 1398 1
@status
*page 1 0 1100 850 iX
@ports
port 72 IF_OUT 740 400 h
a 0 s 3 0 20 8 hln 80 LABEL=O
port 73 IF_IN 320 360 h
a 0 s 3 0 10 8 hln 80 LABEL=I1
port 74 IF_IN 320 380 h
a 0 s 3 0 10 8 hln 80 LABEL=I0
port 75 IF_IN 320 410 h
a 0 s 3 0 10 8 hln 80 LABEL=I2
@parts
part 16 AND2 400 360 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 40 hlt 100 PART=AND2
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 21 OR2B1 580 390 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U2
a 0 sp 11 0 10 40 hlt 100 PART=OR2B1
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 23
s 660 400 740 400 22
a 0 s 3 0 720 400 hln 100 LABEL=O
w 31
s 320 380 400 380 30
a 0 s 3 0 330 380 hln 100 LABEL=I0
w 39
s 320 360 400 360 38
a 0 s 3 0 330 360 hln 100 LABEL=I1
w 49
s 480 370 530 370 46
a 0 s 3 0 500 370 hln 100 LABEL=I01
s 530 390 530 370 48
s 530 390 580 390 47
w 64
s 320 410 580 410 63
a 0 s 3 0 330 410 hln 100 LABEL=I2
@junction
j 660 400
+ p 21 O
+ w 23
j 400 380
+ p 16 I0
+ w 31
j 400 360
+ p 16 I1
+ w 39
j 480 370
+ p 16 O
+ w 49
j 580 390
+ p 21 I1
+ w 49
j 580 410
+ p 21 I0
+ w 64
j 740 400
+ s 72
+ w 23
j 320 360
+ s 73
+ w 39
j 320 380
+ s 74
+ w 31
j 320 410
+ s 75
+ w 64
@attributes
@text
s 5 750 750 hln 100 XC5200 FAMILY SOP3B1B MACRO
s 5 710 800 hln 100 1ST MARCH 1993
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
s 5 750 770 hln 100 3-INPUT SUM-OF-PRODUCTS
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 30 810 hln 100 DRAWN BY KS
