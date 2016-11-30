*version 6.3 2723719785
u 140
XC5200 1557160808
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
pageloc 1 0 2744 1
@status
*page 1 0 1100 850 iX
@ports
port 141 IF_IN 330 330 h
a 0 s 3 0 10 8 hln 80 LABEL=I6
port 142 IF_IN 330 440 h
a 0 s 3 0 10 8 hln 80 LABEL=I1
port 143 IF_IN 330 420 h
a 0 s 3 0 10 8 hln 80 LABEL=I2
port 144 IF_IN 330 400 h
a 0 s 3 0 10 8 hln 80 LABEL=I3
port 145 IF_IN 330 310 h
a 0 s 3 0 10 8 hln 80 LABEL=I7
port 146 IF_IN 330 290 h
a 0 s 3 0 10 8 hln 80 LABEL=I8
port 147 IF_IN 330 470 h
a 0 s 3 0 10 8 hln 80 LABEL=I0
port 148 IF_IN 330 350 h
a 0 s 3 0 10 8 hln 80 LABEL=I5
port 149 IF_IN 330 380 h
a 0 s 3 0 10 8 hln 80 LABEL=I4
port 150 IF_OUT 770 380 h
a 0 s 3 0 20 8 hln 80 LABEL=O
@parts
part 18 XOR4 420 380 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 80 hlt 100 PART=XOR4
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 19 XOR4 420 290 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U2
a 0 sp 11 0 10 80 hlt 100 PART=XOR4
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 25 XOR3 600 360 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U3
a 0 sp 11 0 10 60 hlt 100 PART=XOR3
a 0 a 0 0 0 0 hln 100 PKGREF=U3
@conn
w 27
s 330 290 420 290 26
a 0 s 3 0 340 290 hln 100 LABEL=I8
w 35
s 330 310 420 310 34
a 0 s 3 0 340 310 hln 100 LABEL=I7
w 43
s 330 380 420 380 42
a 0 s 3 0 340 380 hln 100 LABEL=I4
w 51
s 330 400 420 400 50
a 0 s 3 0 340 400 hln 100 LABEL=I3
w 59
s 330 420 420 420 58
a 0 s 3 0 340 420 hln 100 LABEL=I2
w 67
s 330 440 420 440 66
a 0 s 3 0 340 440 hln 100 LABEL=I1
w 75
s 330 330 420 330 74
a 0 s 3 0 340 330 hln 100 LABEL=I6
w 83
s 330 350 420 350 82
a 0 s 3 0 340 350 hln 100 LABEL=I5
w 93
s 330 470 580 470 90
a 0 s 3 0 340 470 hln 100 LABEL=I0
s 580 470 580 400 91
s 580 400 600 400 92
w 103
s 500 410 560 410 100
a 0 s 3 0 530 410 hln 100 LABEL=I14
s 560 410 560 380 101
s 560 380 600 380 102
w 119
s 500 320 560 320 116
a 0 s 3 0 530 320 hln 100 LABEL=I58
s 560 360 560 320 117
s 560 360 600 360 118
w 133
s 680 380 770 380 132
a 0 s 3 0 750 380 hln 100 LABEL=O
@junction
j 420 290
+ p 19 I3
+ w 27
j 420 310
+ p 19 I2
+ w 35
j 420 380
+ p 18 I3
+ w 43
j 420 400
+ p 18 I2
+ w 51
j 420 420
+ p 18 I1
+ w 59
j 420 440
+ p 18 I0
+ w 67
j 420 330
+ p 19 I1
+ w 75
j 420 350
+ p 19 I0
+ w 83
j 600 400
+ p 25 I0
+ w 93
j 500 410
+ p 18 O
+ w 103
j 600 380
+ p 25 I1
+ w 103
j 500 320
+ p 19 O
+ w 119
j 600 360
+ p 25 I2
+ w 119
j 680 380
+ p 25 O
+ w 133
j 330 330
+ s 141
+ w 75
j 330 440
+ s 142
+ w 67
j 330 420
+ s 143
+ w 59
j 330 400
+ s 144
+ w 51
j 330 310
+ s 145
+ w 35
j 330 290
+ s 146
+ w 27
j 330 470
+ s 147
+ w 93
j 330 350
+ s 148
+ w 83
j 330 380
+ s 149
+ w 43
j 770 380
+ s 150
+ w 133
@attributes
@text
s 5 750 770 hln 100 9-INPUT XOR
s 5 750 750 hln 100 XC5200 FAMILY XOR9 MACRO
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 710 800 hln 100 15TH MARCH 1993
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
