*version 6.3 922047503
u 84
XC5200 857130356
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
pageloc 1 0 1710 1
@status
*page 1 0 1100 850 iX
@ports
port 85 IF_IN 330 400 h
a 0 s 3 0 10 8 hln 80 LABEL=I0
port 86 IF_IN 330 380 h
a 0 s 3 0 10 8 hln 80 LABEL=I1
port 87 IF_IN 330 360 h
a 0 s 3 0 10 8 hln 80 LABEL=I2
port 88 IF_IN 330 340 h
a 0 s 3 0 10 8 hln 80 LABEL=I3
port 89 IF_IN 330 320 h
a 0 s 3 0 10 8 hln 80 LABEL=I4
port 90 IF_OUT 770 380 h
a 0 s 3 0 20 8 hln 80 LABEL=O
@parts
part 17 OR3 600 360 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 60 hlt 100 PART=OR3
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 18 OR3 420 320 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U2
a 0 sp 11 0 10 60 hlt 100 PART=OR3
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 20
s 330 400 600 400 19
a 0 s 3 0 340 400 hln 100 LABEL=I0
w 30
s 500 340 560 340 27
a 0 s 3 0 530 340 hln 100 LABEL=I35
s 560 360 560 340 29
s 560 360 600 360 28
w 45
s 330 360 420 360 44
a 0 s 3 0 340 360 hln 100 LABEL=I2
w 53
s 680 380 770 380 52
a 0 s 3 0 750 380 hln 100 LABEL=O
w 61
s 330 380 600 380 60
a 0 s 3 0 340 380 hln 100 LABEL=I1
w 69
s 330 340 420 340 68
a 0 s 3 0 340 340 hln 100 LABEL=I3
w 77
s 330 320 420 320 76
a 0 s 3 0 340 320 hln 100 LABEL=I4
@junction
j 600 400
+ p 17 I0
+ w 20
j 600 360
+ p 17 I2
+ w 30
j 500 340
+ p 18 O
+ w 30
j 420 360
+ p 18 I0
+ w 45
j 680 380
+ p 17 O
+ w 53
j 600 380
+ p 17 I1
+ w 61
j 420 340
+ p 18 I1
+ w 69
j 420 320
+ p 18 I2
+ w 77
j 330 400
+ s 85
+ w 20
j 330 380
+ s 86
+ w 61
j 330 360
+ s 87
+ w 45
j 330 340
+ s 88
+ w 69
j 330 320
+ s 89
+ w 77
j 770 380
+ s 90
+ w 53
@attributes
@text
s 5 750 770 hln 100 5-INPUT OR
s 5 750 750 hln 100 XC5200 FAMILY OR5 MACRO
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
s 5 710 800 hln 100 20TH APRIL 1993
