*version 6.3 366713125
u 134
XC4000 963499654
U? 4
@libraries
XC4000 [.slb]
@analysis
@targets
@attributes
a FAMILY=XC4000
a IMPL=XILINX
@translators
@setup
unconnectedPins 0
connectViaLabel 1
connectViaLocalLabels 0
NoStim4ExtIFPortsWarnings 1
AutoGenStim4ExtIFPorts 1
@index
pageloc 1 0 2576 1
@status
*page 1 0 1100 850 iX
@ports
port 135 IF_OUT 770 380 h
a 0 s 3 0 20 8 hln 80 LABEL=O
port 136 IF_IN 330 300 h
a 0 s 3 0 10 8 hln 80 LABEL=I7
port 137 IF_IN 330 320 h
a 0 s 3 0 10 8 hln 80 LABEL=I6
port 138 IF_IN 330 340 h
a 0 s 3 0 10 8 hln 80 LABEL=I5
port 139 IF_IN 330 360 h
a 0 s 3 0 10 8 hln 80 LABEL=I4
port 140 IF_IN 330 390 h
a 0 s 3 0 10 8 hln 80 LABEL=I3
port 141 IF_IN 330 410 h
a 0 s 3 0 10 8 hln 80 LABEL=I2
port 142 IF_IN 330 430 h
a 0 s 3 0 10 8 hln 80 LABEL=I1
port 143 IF_IN 330 460 h
a 0 s 3 0 10 8 hln 80 LABEL=I0
@parts
part 17 AND3 600 360 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 60 hlt 100 PART=AND3
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 24 AND4 420 300 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U2
a 0 sp 11 0 10 80 hlt 100 PART=AND4
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 25 AND3 420 390 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U3
a 0 sp 11 0 10 60 hlt 100 PART=AND3
a 0 a 0 0 0 0 hln 100 PKGREF=U3
@conn
w 27
s 330 340 420 340 26
a 0 s 3 0 340 340 hln 100 LABEL=I5
w 35
s 330 360 420 360 34
a 0 s 3 0 340 360 hln 100 LABEL=I4
w 45
s 500 410 560 410 42
a 0 s 3 0 530 410 hln 100 LABEL=I13
s 560 410 560 380 43
s 560 380 600 380 44
w 61
s 500 330 560 330 58
a 0 s 3 0 530 330 hln 100 LABEL=I47
s 560 360 560 330 60
s 560 360 600 360 59
w 76
s 680 380 770 380 75
a 0 s 3 0 750 380 hln 100 LABEL=O
w 84
s 330 410 420 410 83
a 0 s 3 0 340 410 hln 100 LABEL=I2
w 92
s 330 430 420 430 91
a 0 s 3 0 340 430 hln 100 LABEL=I1
w 100
s 330 390 420 390 99
a 0 s 3 0 340 390 hln 100 LABEL=I3
w 108
s 330 320 420 320 107
a 0 s 3 0 340 320 hln 100 LABEL=I6
w 118
s 330 460 580 460 115
a 0 s 3 0 340 460 hln 100 LABEL=I0
s 580 460 580 400 117
s 580 400 600 400 116
w 127
s 330 300 420 300 126
a 0 s 3 0 340 300 hln 100 LABEL=I7
@junction
j 420 340
+ p 24 I1
+ w 27
j 420 360
+ p 24 I0
+ w 35
j 600 380
+ p 17 I1
+ w 45
j 500 410
+ p 25 O
+ w 45
j 600 360
+ p 17 I2
+ w 61
j 500 330
+ p 24 O
+ w 61
j 680 380
+ p 17 O
+ w 76
j 420 410
+ p 25 I1
+ w 84
j 420 430
+ p 25 I0
+ w 92
j 420 390
+ p 25 I2
+ w 100
j 420 320
+ p 24 I2
+ w 108
j 600 400
+ p 17 I0
+ w 118
j 420 300
+ p 24 I3
+ w 127
j 770 380
+ s 135
+ w 76
j 330 300
+ s 136
+ w 127
j 330 320
+ s 137
+ w 108
j 330 340
+ s 138
+ w 27
j 330 360
+ s 139
+ w 35
j 330 390
+ s 140
+ w 100
j 330 410
+ s 141
+ w 84
j 330 430
+ s 142
+ w 92
j 330 460
+ s 143
+ w 118
@attributes
@text
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 710 800 hln 100 15TH MARCH 1993
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
s 5 750 750 hln 100 XC4000 FAMILY AND8 MACRO
s 5 750 770 hln 100 8-INPUT AND
