*version 6.3 1516324060
u 117
XC5200 507796173
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
pageloc 1 0 2221 1
@status
*page 1 0 1100 850 iX
@ports
port 118 IF_IN 330 440 h
a 0 s 3 0 10 8 hln 80 LABEL=I0
port 119 IF_IN 330 410 h
a 0 s 3 0 10 8 hln 80 LABEL=I1
port 120 IF_IN 330 340 h
a 0 s 3 0 10 8 hln 80 LABEL=I4
port 121 IF_IN 330 320 h
a 0 s 3 0 10 8 hln 80 LABEL=I5
port 122 IF_OUT 770 380 h
a 0 s 3 0 20 8 hln 80 LABEL=O
port 123 IF_IN 330 360 h
a 0 s 3 0 10 8 hln 80 LABEL=I3
port 124 IF_IN 330 390 h
a 0 s 3 0 10 8 hln 80 LABEL=I2
@parts
part 17 OR3 600 360 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 60 hlt 100 PART=OR3
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 18 OR3 420 320 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U2
a 0 sp 11 0 10 60 hlt 100 PART=OR3
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 23 OR2 420 390 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U3
a 0 sp 11 0 10 40 hlt 100 PART=OR2
a 0 a 0 0 0 0 hln 100 PKGREF=U3
@conn
w 27
s 500 400 560 400 24
a 0 s 3 0 530 400 hln 100 LABEL=I12
s 560 400 560 380 26
s 560 380 600 380 25
w 44
s 500 340 560 340 41
a 0 s 3 0 530 340 hln 100 LABEL=I35
s 560 360 560 340 43
s 560 360 600 360 42
w 61
s 330 440 580 440 58
a 0 s 3 0 340 440 hln 100 LABEL=I0
s 580 440 580 400 60
s 580 400 600 400 59
w 70
s 680 380 770 380 69
a 0 s 3 0 750 380 hln 100 LABEL=O
w 78
s 330 390 420 390 77
a 0 s 3 0 340 390 hln 100 LABEL=I2
w 86
s 330 410 420 410 85
a 0 s 3 0 340 410 hln 100 LABEL=I1
w 94
s 330 320 420 320 93
a 0 s 3 0 340 320 hln 100 LABEL=I5
w 102
s 330 340 420 340 101
a 0 s 3 0 340 340 hln 100 LABEL=I4
w 110
s 330 360 420 360 109
a 0 s 3 0 340 360 hln 100 LABEL=I3
@junction
j 600 380
+ p 17 I1
+ w 27
j 500 400
+ p 23 O
+ w 27
j 600 360
+ p 17 I2
+ w 44
j 500 340
+ p 18 O
+ w 44
j 600 400
+ p 17 I0
+ w 61
j 680 380
+ p 17 O
+ w 70
j 420 390
+ p 23 I1
+ w 78
j 420 410
+ p 23 I0
+ w 86
j 420 320
+ p 18 I2
+ w 94
j 420 340
+ p 18 I1
+ w 102
j 420 360
+ p 18 I0
+ w 110
j 330 440
+ s 118
+ w 61
j 330 410
+ s 119
+ w 86
j 330 340
+ s 120
+ w 102
j 330 320
+ s 121
+ w 94
j 770 380
+ s 122
+ w 70
j 330 360
+ s 123
+ w 110
j 330 390
+ s 124
+ w 78
@attributes
@text
s 5 750 770 hln 100 6-INPUT OR
s 5 750 750 hln 100 XC5200 FAMILY OR6 MACRO
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 710 800 hln 100 15TH MARCH 1993
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
