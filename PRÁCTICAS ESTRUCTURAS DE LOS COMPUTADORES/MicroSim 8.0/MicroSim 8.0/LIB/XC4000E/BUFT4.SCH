*version 6.3 141784044
u 127
XC4000E 1037651059
U? 5
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
pageloc 1 0 2691 1
@status
*page 1 0 1100 850 iX
@ports
port 128 IF_OUT 770 360 h
a 0 s 3 0 20 8 hln 80 LABEL=O1
port 129 IF_IN 300 360 h
a 0 s 3 0 10 8 hln 80 LABEL=I1
port 130 IF_OUT 770 400 h
a 0 s 3 0 20 8 hln 80 LABEL=O2
port 131 IF_IN 300 400 h
a 0 s 3 0 10 8 hln 80 LABEL=I2
port 132 IF_OUT 770 440 h
a 0 s 3 0 20 8 hln 80 LABEL=O3
port 133 IF_IN 300 440 h
a 0 s 3 0 10 8 hln 80 LABEL=I3
port 134 IF_OUT 770 320 h
a 0 s 3 0 20 8 hln 80 LABEL=O0
port 135 IF_IN 300 320 h
a 0 s 3 0 10 8 hln 80 LABEL=I0
port 136 IF_IN 300 300 h
a 0 s 3 0 10 8 hln 80 LABEL=T
@parts
part 16 BUFT 500 420 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U1
a 0 sp 11 0 30 34 hlt 100 PART=BUFT
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 17 BUFT 500 380 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U2
a 0 sp 11 0 30 34 hlt 100 PART=BUFT
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 18 BUFT 500 340 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U3
a 0 sp 11 0 30 34 hlt 100 PART=BUFT
a 0 a 0 0 0 0 hln 100 PKGREF=U3
part 19 BUFT 500 300 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U4
a 0 sp 11 0 30 34 hlt 100 PART=BUFT
a 0 a 0 0 0 0 hln 100 PKGREF=U4
@conn
w 28
s 300 300 470 300 20
a 0 s 3 0 310 300 hln 100 LABEL=T
s 470 300 500 300 22
s 470 340 470 300 23
s 470 420 470 380 24
s 470 420 500 420 21
s 470 380 470 340 25
s 470 340 500 340 26
s 470 380 500 380 27
w 64
s 570 320 770 320 63
a 0 s 3 0 730 320 hln 100 LABEL=O0
w 72
s 300 320 500 320 71
a 0 s 3 0 310 320 hln 100 LABEL=I0
w 80
s 570 360 770 360 79
a 0 s 3 0 730 360 hln 100 LABEL=O1
w 88
s 300 360 500 360 87
a 0 s 3 0 310 360 hln 100 LABEL=I1
w 96
s 300 400 500 400 95
a 0 s 3 0 310 400 hln 100 LABEL=I2
w 104
s 570 400 770 400 103
a 0 s 3 0 730 400 hln 100 LABEL=O2
w 112
s 300 440 500 440 111
a 0 s 3 0 310 440 hln 100 LABEL=I3
w 120
s 570 440 770 440 119
a 0 s 3 0 730 440 hln 100 LABEL=O3
@junction
j 470 300
+ w 28
+ w 28
j 470 340
+ w 28
+ w 28
j 470 380
+ w 28
+ w 28
j 500 420
+ p 16 T
+ w 28
j 500 380
+ p 17 T
+ w 28
j 500 340
+ p 18 T
+ w 28
j 500 300
+ p 19 T
+ w 28
j 570 320
+ p 19 O
+ w 64
j 500 320
+ p 19 I
+ w 72
j 570 360
+ p 18 O
+ w 80
j 500 360
+ p 18 I
+ w 88
j 500 400
+ p 17 I
+ w 96
j 570 400
+ p 17 O
+ w 104
j 500 440
+ p 16 I
+ w 112
j 570 440
+ p 16 O
+ w 120
j 770 360
+ s 128
+ w 80
j 300 360
+ s 129
+ w 88
j 770 400
+ s 130
+ w 104
j 300 400
+ s 131
+ w 96
j 770 440
+ s 132
+ w 120
j 300 440
+ s 133
+ w 112
j 770 320
+ s 134
+ w 64
j 300 320
+ s 135
+ w 72
j 300 300
+ s 136
+ w 28
@attributes
@text
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1995, XILINX INC.
s 5 950 820 hln 100 A
s 5 960 800 hrn 100 1
s 5 950 770 hrn 100 4-BIT 3-STATE BUFFER
s 5 1000 750 hrn 100 XC4000E FAMILY BUFT4 MACRO
s 5 750 780 hln 100 W/ AN ACTIVE LOW ENABLE
s 5 890 800 hrn 100 23RD FEBRUARY 1995
