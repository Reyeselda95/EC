*version 6.3 335952813
u 139
XC5200 281060938
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
pageloc 1 0 2581 1
@status
*page 1 0 1100 850 iX
@ports
port 140 IF_OUT 770 380 h
a 0 s 3 0 20 8 hln 80 LABEL=O
port 141 IF_IN 330 460 h
a 0 s 3 0 10 8 hln 80 LABEL=I0
port 142 IF_IN 330 430 h
a 0 s 3 0 10 8 hln 80 LABEL=I1
port 143 IF_IN 330 410 h
a 0 s 3 0 10 8 hln 80 LABEL=I2
port 144 IF_IN 330 390 h
a 0 s 3 0 10 8 hln 80 LABEL=I3
port 145 IF_IN 330 360 h
a 0 s 3 0 10 8 hln 80 LABEL=I4
port 146 IF_IN 330 340 h
a 0 s 3 0 10 8 hln 80 LABEL=I5
port 147 IF_IN 330 320 h
a 0 s 3 0 10 8 hln 80 LABEL=I6
port 148 IF_IN 330 300 h
a 0 s 3 0 10 8 hln 80 LABEL=I7
@parts
part 18 XOR4 420 300 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 80 hlt 100 PART=XOR4
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 24 XOR3 420 390 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U2
a 0 sp 11 0 10 60 hlt 100 PART=XOR3
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 30 XNOR3 600 360 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U3
a 0 sp 11 0 10 60 hlt 100 PART=XNOR3
a 0 a 0 0 0 0 hln 100 PKGREF=U3
@conn
w 32
s 330 340 420 340 31
a 0 s 3 0 340 340 hln 100 LABEL=I5
w 40
s 330 360 420 360 39
a 0 s 3 0 340 360 hln 100 LABEL=I4
w 50
s 500 410 560 410 47
a 0 s 3 0 530 410 hln 100 LABEL=I13
s 560 410 560 380 48
s 560 380 600 380 49
w 66
s 500 330 560 330 63
a 0 s 3 0 530 330 hln 100 LABEL=I47
s 560 360 560 330 65
s 560 360 600 360 64
w 81
s 680 380 770 380 80
a 0 s 3 0 750 380 hln 100 LABEL=O
w 89
s 330 410 420 410 88
a 0 s 3 0 340 410 hln 100 LABEL=I2
w 97
s 330 430 420 430 96
a 0 s 3 0 340 430 hln 100 LABEL=I1
w 105
s 330 390 420 390 104
a 0 s 3 0 340 390 hln 100 LABEL=I3
w 113
s 330 320 420 320 112
a 0 s 3 0 340 320 hln 100 LABEL=I6
w 123
s 330 460 580 460 120
a 0 s 3 0 340 460 hln 100 LABEL=I0
s 580 460 580 400 122
s 580 400 600 400 121
w 132
s 330 300 420 300 131
a 0 s 3 0 340 300 hln 100 LABEL=I7
@junction
j 420 340
+ p 18 I1
+ w 32
j 420 360
+ p 18 I0
+ w 40
j 500 410
+ p 24 O
+ w 50
j 600 380
+ p 30 I1
+ w 50
j 500 330
+ p 18 O
+ w 66
j 600 360
+ p 30 I2
+ w 66
j 680 380
+ p 30 O
+ w 81
j 420 410
+ p 24 I1
+ w 89
j 420 430
+ p 24 I0
+ w 97
j 420 390
+ p 24 I2
+ w 105
j 420 320
+ p 18 I2
+ w 113
j 600 400
+ p 30 I0
+ w 123
j 420 300
+ p 18 I3
+ w 132
j 770 380
+ s 140
+ w 81
j 330 460
+ s 141
+ w 123
j 330 430
+ s 142
+ w 97
j 330 410
+ s 143
+ w 89
j 330 390
+ s 144
+ w 105
j 330 360
+ s 145
+ w 40
j 330 340
+ s 146
+ w 32
j 330 320
+ s 147
+ w 113
j 330 300
+ s 148
+ w 132
@attributes
@text
s 5 750 770 hln 100 8-INPUT XNOR
s 5 750 750 hln 100 XC5200 FAMILY XNOR8 MACRO
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 710 800 hln 100 15TH MARCH 1993
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
