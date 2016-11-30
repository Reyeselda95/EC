*version 6.3 390639950
u 133
XC4000 3009101901
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
pageloc 1 0 2573 1
@status
*page 1 0 1100 850 iX
@ports
port 134 IF_IN 330 300 h
a 0 s 3 0 10 8 hln 80 LABEL=I7
port 135 IF_IN 330 320 h
a 0 s 3 0 10 8 hln 80 LABEL=I6
port 136 IF_IN 330 460 h
a 0 s 3 0 10 8 hln 80 LABEL=I0
port 137 IF_OUT 770 380 h
a 0 s 3 0 20 8 hln 80 LABEL=O
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
@parts
part 17 XOR3 420 390 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 60 hlt 100 PART=XOR3
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 18 XOR3 600 360 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U2
a 0 sp 11 0 10 60 hlt 100 PART=XOR3
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 25 XOR4 420 300 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U3
a 0 sp 11 0 10 80 hlt 100 PART=XOR4
a 0 a 0 0 0 0 hln 100 PKGREF=U3
@conn
w 27
s 330 300 420 300 26
a 0 s 3 0 340 300 hln 100 LABEL=I7
w 37
s 330 460 580 460 34
a 0 s 3 0 340 460 hln 100 LABEL=I0
s 580 460 580 400 35
s 580 400 600 400 36
w 45
s 330 320 420 320 44
a 0 s 3 0 340 320 hln 100 LABEL=I6
w 53
s 330 390 420 390 52
a 0 s 3 0 340 390 hln 100 LABEL=I3
w 61
s 330 430 420 430 60
a 0 s 3 0 340 430 hln 100 LABEL=I1
w 69
s 330 410 420 410 68
a 0 s 3 0 340 410 hln 100 LABEL=I2
w 77
s 680 380 770 380 76
a 0 s 3 0 750 380 hln 100 LABEL=O
w 87
s 500 330 560 330 84
a 0 s 3 0 530 330 hln 100 LABEL=I47
s 560 360 560 330 85
s 560 360 600 360 86
w 103
s 500 410 560 410 100
a 0 s 3 0 530 410 hln 100 LABEL=I13
s 560 410 560 380 102
s 560 380 600 380 101
w 118
s 330 360 420 360 117
a 0 s 3 0 340 360 hln 100 LABEL=I4
w 126
s 330 340 420 340 125
a 0 s 3 0 340 340 hln 100 LABEL=I5
@junction
j 420 300
+ p 25 I3
+ w 27
j 600 400
+ p 18 I0
+ w 37
j 420 320
+ p 25 I2
+ w 45
j 420 390
+ p 17 I2
+ w 53
j 420 430
+ p 17 I0
+ w 61
j 420 410
+ p 17 I1
+ w 69
j 680 380
+ p 18 O
+ w 77
j 600 360
+ p 18 I2
+ w 87
j 500 330
+ p 25 O
+ w 87
j 500 410
+ p 17 O
+ w 103
j 600 380
+ p 18 I1
+ w 103
j 420 360
+ p 25 I0
+ w 118
j 420 340
+ p 25 I1
+ w 126
j 330 300
+ s 134
+ w 27
j 330 320
+ s 135
+ w 45
j 330 460
+ s 136
+ w 37
j 770 380
+ s 137
+ w 77
j 330 340
+ s 138
+ w 126
j 330 360
+ s 139
+ w 118
j 330 390
+ s 140
+ w 53
j 330 410
+ s 141
+ w 69
j 330 430
+ s 142
+ w 61
@attributes
@text
s 5 950 820 hln 100 A
s 5 950 800 hln 100 1
s 5 710 800 hln 100 15TH MARCH 1993
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 30 810 hln 100 DRAWN BY KS
s 5 750 750 hln 100 XC4000 FAMILY XOR8 MACRO
s 5 750 770 hln 100 8-INPUT XOR
