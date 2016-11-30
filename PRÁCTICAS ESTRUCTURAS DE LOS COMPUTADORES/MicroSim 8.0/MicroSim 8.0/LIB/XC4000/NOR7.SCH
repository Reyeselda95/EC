*version 6.3 327909807
u 126
XC4000 757555280
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
pageloc 1 0 2398 1
@status
*page 1 0 1100 850 iX
@ports
port 127 IF_IN 330 380 h
a 0 s 3 0 10 8 hln 80 LABEL=I3
port 128 IF_OUT 770 380 h
a 0 s 3 0 20 8 hln 80 LABEL=O
port 129 IF_IN 330 450 h
a 0 s 3 0 10 8 hln 80 LABEL=I0
port 130 IF_IN 330 420 h
a 0 s 3 0 10 8 hln 80 LABEL=I1
port 131 IF_IN 330 400 h
a 0 s 3 0 10 8 hln 80 LABEL=I2
port 132 IF_IN 330 350 h
a 0 s 3 0 10 8 hln 80 LABEL=I4
port 133 IF_IN 330 310 h
a 0 s 3 0 10 8 hln 80 LABEL=I6
port 134 IF_IN 330 330 h
a 0 s 3 0 10 8 hln 80 LABEL=I5
@parts
part 17 NOR3 600 360 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 60 hlt 100 PART=NOR3
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 23 OR3 420 310 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U2
a 0 sp 11 0 10 60 hlt 100 PART=OR3
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 24 OR3 420 380 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U3
a 0 sp 11 0 10 60 hlt 100 PART=OR3
a 0 a 0 0 0 0 hln 100 PKGREF=U3
@conn
w 28
s 330 450 580 450 25
a 0 s 3 0 340 450 hln 100 LABEL=I0
s 580 450 580 400 27
s 580 400 600 400 26
w 37
s 330 310 420 310 36
a 0 s 3 0 340 310 hln 100 LABEL=I6
w 45
s 330 350 420 350 44
a 0 s 3 0 340 350 hln 100 LABEL=I4
w 55
s 500 400 560 400 52
a 0 s 3 0 530 400 hln 100 LABEL=I13
s 560 400 560 380 54
s 560 380 600 380 53
w 72
s 500 330 560 330 69
a 0 s 3 0 530 330 hln 100 LABEL=I46
s 560 360 560 330 71
s 560 360 600 360 70
w 87
s 680 380 770 380 86
a 0 s 3 0 750 380 hln 100 LABEL=O
w 95
s 330 400 420 400 94
a 0 s 3 0 340 400 hln 100 LABEL=I2
w 103
s 330 420 420 420 102
a 0 s 3 0 340 420 hln 100 LABEL=I1
w 111
s 330 330 420 330 110
a 0 s 3 0 340 330 hln 100 LABEL=I5
w 119
s 330 380 420 380 118
a 0 s 3 0 340 380 hln 100 LABEL=I3
@junction
j 600 400
+ p 17 I0
+ w 28
j 420 310
+ p 23 I2
+ w 37
j 420 350
+ p 23 I0
+ w 45
j 600 380
+ p 17 I1
+ w 55
j 500 400
+ p 24 O
+ w 55
j 600 360
+ p 17 I2
+ w 72
j 500 330
+ p 23 O
+ w 72
j 680 380
+ p 17 O
+ w 87
j 420 400
+ p 24 I1
+ w 95
j 420 420
+ p 24 I0
+ w 103
j 420 330
+ p 23 I1
+ w 111
j 420 380
+ p 24 I2
+ w 119
j 330 380
+ s 127
+ w 119
j 770 380
+ s 128
+ w 87
j 330 450
+ s 129
+ w 28
j 330 420
+ s 130
+ w 103
j 330 400
+ s 131
+ w 95
j 330 350
+ s 132
+ w 45
j 330 310
+ s 133
+ w 37
j 330 330
+ s 134
+ w 111
@attributes
@text
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 710 800 hln 100 15TH MARCH 1993
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
s 5 750 750 hln 100 XC4000 FAMILY NOR7 MACRO
s 5 750 770 hln 100 7-INPUT NOR
