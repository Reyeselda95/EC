*version 6.3 811087423
u 138
XC4000E 1905131146
U? 4
@libraries
XC4000E [.slb]
@analysis
@targets
@attributes
a FAMILY=XC4000E
a IMPL=XILINX
@translators
@setup
unconnectedPins 0
connectViaLabel 1
connectViaLocalLabels 0
NoStim4ExtIFPortsWarnings 1
AutoGenStim4ExtIFPorts 1
@index
pageloc 1 0 2570 1
@status
*page 1 0 1100 850 iX
@ports
port 139 IF_IN 330 390 h
a 0 s 3 0 10 8 hln 80 LABEL=I3
port 140 IF_IN 330 360 h
a 0 s 3 0 10 8 hln 80 LABEL=I4
port 141 IF_IN 330 300 h
a 0 s 3 0 10 8 hln 80 LABEL=I7
port 142 IF_IN 330 320 h
a 0 s 3 0 10 8 hln 80 LABEL=I6
port 143 IF_IN 330 340 h
a 0 s 3 0 10 8 hln 80 LABEL=I5
port 144 IF_IN 330 410 h
a 0 s 3 0 10 8 hln 80 LABEL=I2
port 145 IF_IN 330 430 h
a 0 s 3 0 10 8 hln 80 LABEL=I1
port 146 IF_IN 330 460 h
a 0 s 3 0 10 8 hln 80 LABEL=I0
port 147 IF_OUT 770 380 h
a 0 s 3 0 20 8 hln 80 LABEL=O
@parts
part 17 NOR3 600 360 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 60 hlt 100 PART=NOR3
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 23 OR3 420 390 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U2
a 0 sp 11 0 10 60 hlt 100 PART=OR3
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 30 OR4 420 300 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U3
a 0 sp 11 0 10 80 hlt 100 PART=OR4
a 0 a 0 0 0 0 hln 100 PKGREF=U3
@conn
w 32
s 330 300 420 300 31
a 0 s 3 0 340 300 hln 100 LABEL=I7
w 42
s 330 460 580 460 39
a 0 s 3 0 340 460 hln 100 LABEL=I0
s 580 460 580 400 40
s 580 400 600 400 41
w 50
s 330 320 420 320 49
a 0 s 3 0 340 320 hln 100 LABEL=I6
w 58
s 330 390 420 390 57
a 0 s 3 0 340 390 hln 100 LABEL=I3
w 66
s 330 430 420 430 65
a 0 s 3 0 340 430 hln 100 LABEL=I1
w 74
s 330 410 420 410 73
a 0 s 3 0 340 410 hln 100 LABEL=I2
w 82
s 680 380 770 380 81
a 0 s 3 0 750 380 hln 100 LABEL=O
w 92
s 500 330 560 330 89
a 0 s 3 0 530 330 hln 100 LABEL=I47
s 560 360 560 330 90
s 560 360 600 360 91
w 108
s 500 410 560 410 105
a 0 s 3 0 530 410 hln 100 LABEL=I13
s 560 410 560 380 107
s 560 380 600 380 106
w 123
s 330 360 420 360 122
a 0 s 3 0 340 360 hln 100 LABEL=I4
w 131
s 330 340 420 340 130
a 0 s 3 0 340 340 hln 100 LABEL=I5
@junction
j 420 300
+ p 30 I3
+ w 32
j 600 400
+ p 17 I0
+ w 42
j 420 320
+ p 30 I2
+ w 50
j 420 390
+ p 23 I2
+ w 58
j 420 430
+ p 23 I0
+ w 66
j 420 410
+ p 23 I1
+ w 74
j 680 380
+ p 17 O
+ w 82
j 600 360
+ p 17 I2
+ w 92
j 500 330
+ p 30 O
+ w 92
j 600 380
+ p 17 I1
+ w 108
j 500 410
+ p 23 O
+ w 108
j 420 360
+ p 30 I0
+ w 123
j 420 340
+ p 30 I1
+ w 131
j 330 390
+ s 139
+ w 58
j 330 360
+ s 140
+ w 123
j 330 300
+ s 141
+ w 32
j 330 320
+ s 142
+ w 50
j 330 340
+ s 143
+ w 131
j 330 410
+ s 144
+ w 74
j 330 430
+ s 145
+ w 66
j 330 460
+ s 146
+ w 42
j 770 380
+ s 147
+ w 82
@attributes
@text
s 5 750 770 hln 100 8-INPUT NOR
s 5 750 750 hln 100 XC4000E FAMILY NOR8 MACRO
s 5 950 820 hln 100 A
s 5 950 800 hln 100 1
s 5 710 800 hln 100 15TH MARCH 1995
s 5 30 820 hln 100 COPYRIGHT (C) 1995, XILINX INC.
s 5 30 810 hln 100 DRAWN BY KS
