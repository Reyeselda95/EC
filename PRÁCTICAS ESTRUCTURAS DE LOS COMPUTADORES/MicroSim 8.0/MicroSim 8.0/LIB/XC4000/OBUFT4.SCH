*version 6.3 1068847372
u 128
XC4000 492005543
U? 5
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
pageloc 1 0 2692 1
@status
*page 1 0 1100 850 iX
@ports
port 129 IF_IN 300 300 h
a 0 s 3 0 10 8 hln 80 LABEL=T
port 130 IF_IN 300 320 h
a 0 s 3 0 10 8 hln 80 LABEL=I0
port 131 IF_OUT 770 320 h
a 0 s 3 0 20 8 hln 80 LABEL=O0
port 132 IF_IN 300 360 h
a 0 s 3 0 10 8 hln 80 LABEL=I1
port 133 IF_OUT 770 360 h
a 0 s 3 0 20 8 hln 80 LABEL=O1
port 134 IF_IN 300 440 h
a 0 s 3 0 10 8 hln 80 LABEL=I3
port 135 IF_OUT 770 440 h
a 0 s 3 0 20 8 hln 80 LABEL=O3
port 136 IF_OUT 770 400 h
a 0 s 3 0 20 8 hln 80 LABEL=O2
port 137 IF_IN 300 400 h
a 0 s 3 0 10 8 hln 80 LABEL=I2
@parts
part 16 OBUFT 500 380 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U1
a 0 sp 11 0 30 34 hlt 100 PART=OBUFT
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 17 OBUFT 500 340 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U2
a 0 sp 11 0 30 34 hlt 100 PART=OBUFT
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 18 OBUFT 500 300 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U3
a 0 sp 11 0 30 34 hlt 100 PART=OBUFT
a 0 a 0 0 0 0 hln 100 PKGREF=U3
part 19 OBUFT 500 420 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U4
a 0 sp 11 0 30 34 hlt 100 PART=OBUFT
a 0 a 0 0 0 0 hln 100 PKGREF=U4
@conn
w 21
s 570 440 770 440 20
a 0 s 3 0 730 440 hln 100 LABEL=O3
w 29
s 300 440 500 440 28
a 0 s 3 0 310 440 hln 100 LABEL=I3
w 37
s 570 400 770 400 36
a 0 s 3 0 730 400 hln 100 LABEL=O2
w 45
s 300 400 500 400 44
a 0 s 3 0 310 400 hln 100 LABEL=I2
w 53
s 300 360 500 360 52
a 0 s 3 0 310 360 hln 100 LABEL=I1
w 61
s 570 360 770 360 60
a 0 s 3 0 730 360 hln 100 LABEL=O1
w 69
s 300 320 500 320 68
a 0 s 3 0 310 320 hln 100 LABEL=I0
w 77
s 570 320 770 320 76
a 0 s 3 0 730 320 hln 100 LABEL=O0
w 92
s 300 300 470 300 84
a 0 s 3 0 310 300 hln 100 LABEL=T
s 470 340 470 300 89
s 470 380 500 380 85
s 470 380 470 340 87
s 470 340 500 340 86
s 470 420 470 380 88
s 470 300 500 300 90
s 470 420 500 420 91
@junction
j 570 440
+ p 19 O
+ w 21
j 500 440
+ p 19 I
+ w 29
j 570 400
+ p 16 O
+ w 37
j 500 400
+ p 16 I
+ w 45
j 500 360
+ p 17 I
+ w 53
j 570 360
+ p 17 O
+ w 61
j 500 320
+ p 18 I
+ w 69
j 570 320
+ p 18 O
+ w 77
j 470 300
+ w 92
+ w 92
j 470 340
+ w 92
+ w 92
j 470 380
+ w 92
+ w 92
j 500 380
+ p 16 T
+ w 92
j 500 340
+ p 17 T
+ w 92
j 500 300
+ p 18 T
+ w 92
j 500 420
+ p 19 T
+ w 92
j 300 300
+ s 129
+ w 92
j 300 320
+ s 130
+ w 69
j 770 320
+ s 131
+ w 77
j 300 360
+ s 132
+ w 53
j 770 360
+ s 133
+ w 61
j 300 440
+ s 134
+ w 29
j 770 440
+ s 135
+ w 21
j 770 400
+ s 136
+ w 37
j 300 400
+ s 137
+ w 45
@attributes
@text
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 1030 770 hrn 100 4-BIT 3-STATE OUTPUT BUFFER
s 5 890 800 hrn 100 22ND FEBRUARY 1993
s 5 960 800 hrn 100 1
s 5 950 820 hln 100 A
s 5 1020 750 hrn 100 XC4000 FAMILY OBUFT4 MACRO
s 5 760 780 hln 100 W/ ACTIVE LOW ENABLE
