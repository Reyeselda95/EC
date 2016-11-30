*version 6.3 2342277855
u 118
XC5200 901168144
U? 4
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
pageloc 1 0 2392 1
@status
*page 1 0 1100 850 iX
@ports
port 119 IF_IN 330 380 h
a 0 s 3 0 10 8 hln 80 LABEL=I3
port 120 IF_IN 330 450 h
a 0 s 3 0 10 8 hln 80 LABEL=I0
port 121 IF_IN 330 420 h
a 0 s 3 0 10 8 hln 80 LABEL=I1
port 122 IF_IN 330 400 h
a 0 s 3 0 10 8 hln 80 LABEL=I2
port 123 IF_IN 330 350 h
a 0 s 3 0 10 8 hln 80 LABEL=I4
port 124 IF_IN 330 310 h
a 0 s 3 0 10 8 hln 80 LABEL=I6
port 125 IF_IN 330 330 h
a 0 s 3 0 10 8 hln 80 LABEL=I5
port 126 IF_OUT 770 380 h
a 0 s 3 0 20 8 hln 80 LABEL=O
@parts
part 17 OR3 420 310 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 60 hlt 100 PART=OR3
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 18 OR3 420 380 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U2
a 0 sp 11 0 10 60 hlt 100 PART=OR3
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 19 OR3 600 360 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U3
a 0 sp 11 0 10 60 hlt 100 PART=OR3
a 0 a 0 0 0 0 hln 100 PKGREF=U3
@conn
w 21
s 330 380 420 380 20
a 0 s 3 0 340 380 hln 100 LABEL=I3
w 29
s 330 330 420 330 28
a 0 s 3 0 340 330 hln 100 LABEL=I5
w 37
s 330 420 420 420 36
a 0 s 3 0 340 420 hln 100 LABEL=I1
w 45
s 330 400 420 400 44
a 0 s 3 0 340 400 hln 100 LABEL=I2
w 53
s 680 380 770 380 52
a 0 s 3 0 750 380 hln 100 LABEL=O
w 63
s 500 330 560 330 60
a 0 s 3 0 530 330 hln 100 LABEL=I46
s 560 360 560 330 61
s 560 360 600 360 62
w 79
s 500 400 560 400 76
a 0 s 3 0 530 400 hln 100 LABEL=I13
s 560 400 560 380 77
s 560 380 600 380 78
w 93
s 330 350 420 350 92
a 0 s 3 0 340 350 hln 100 LABEL=I4
w 101
s 330 310 420 310 100
a 0 s 3 0 340 310 hln 100 LABEL=I6
w 111
s 330 450 580 450 108
a 0 s 3 0 340 450 hln 100 LABEL=I0
s 580 450 580 400 109
s 580 400 600 400 110
@junction
j 420 380
+ p 18 I2
+ w 21
j 420 330
+ p 17 I1
+ w 29
j 420 420
+ p 18 I0
+ w 37
j 420 400
+ p 18 I1
+ w 45
j 680 380
+ p 19 O
+ w 53
j 500 330
+ p 17 O
+ w 63
j 600 360
+ p 19 I2
+ w 63
j 500 400
+ p 18 O
+ w 79
j 600 380
+ p 19 I1
+ w 79
j 420 350
+ p 17 I0
+ w 93
j 420 310
+ p 17 I2
+ w 101
j 600 400
+ p 19 I0
+ w 111
j 330 380
+ s 119
+ w 21
j 330 450
+ s 120
+ w 111
j 330 420
+ s 121
+ w 37
j 330 400
+ s 122
+ w 45
j 330 350
+ s 123
+ w 93
j 330 310
+ s 124
+ w 101
j 330 330
+ s 125
+ w 29
j 770 380
+ s 126
+ w 53
@attributes
@text
s 5 750 770 hln 100 7-INPUT OR
s 5 750 750 hln 100 XC5200 FAMILY OR7 MACRO
s 5 950 820 hln 100 A
s 5 950 800 hln 100 1
s 5 710 800 hln 100 15TH MARCH 1993
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 30 810 hln 100 DRAWN BY KS
