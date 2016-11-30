*version 6.3 986228028
u 114
XC4000E 376349845
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
pageloc 1 0 2218 1
@status
*page 1 0 1100 850 iX
@ports
port 115 IF_IN 330 440 h
a 0 s 3 0 10 8 hln 80 LABEL=I0
port 116 IF_IN 330 410 h
a 0 s 3 0 10 8 hln 80 LABEL=I1
port 117 IF_IN 330 340 h
a 0 s 3 0 10 8 hln 80 LABEL=I4
port 118 IF_IN 330 320 h
a 0 s 3 0 10 8 hln 80 LABEL=I5
port 119 IF_OUT 770 380 h
a 0 s 3 0 20 8 hln 80 LABEL=O
port 120 IF_IN 330 360 h
a 0 s 3 0 10 8 hln 80 LABEL=I3
port 121 IF_IN 330 390 h
a 0 s 3 0 10 8 hln 80 LABEL=I2
@parts
part 16 OR2 420 390 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 40 hlt 100 PART=OR2
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 22 OR3 420 320 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U2
a 0 sp 11 0 10 60 hlt 100 PART=OR3
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 23 OR3 600 360 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U3
a 0 sp 11 0 10 60 hlt 100 PART=OR3
a 0 a 0 0 0 0 hln 100 PKGREF=U3
@conn
w 25
s 330 360 420 360 24
a 0 s 3 0 340 360 hln 100 LABEL=I3
w 33
s 330 340 420 340 32
a 0 s 3 0 340 340 hln 100 LABEL=I4
w 41
s 330 320 420 320 40
a 0 s 3 0 340 320 hln 100 LABEL=I5
w 49
s 330 410 420 410 48
a 0 s 3 0 340 410 hln 100 LABEL=I1
w 57
s 330 390 420 390 56
a 0 s 3 0 340 390 hln 100 LABEL=I2
w 65
s 680 380 770 380 64
a 0 s 3 0 750 380 hln 100 LABEL=O
w 75
s 330 440 580 440 72
a 0 s 3 0 340 440 hln 100 LABEL=I0
s 580 440 580 400 73
s 580 400 600 400 74
w 85
s 500 340 560 340 82
a 0 s 3 0 530 340 hln 100 LABEL=I35
s 560 360 560 340 83
s 560 360 600 360 84
w 101
s 500 400 560 400 98
a 0 s 3 0 530 400 hln 100 LABEL=I12
s 560 400 560 380 99
s 560 380 600 380 100
@junction
j 420 360
+ p 22 I0
+ w 25
j 420 340
+ p 22 I1
+ w 33
j 420 320
+ p 22 I2
+ w 41
j 420 410
+ p 16 I0
+ w 49
j 420 390
+ p 16 I1
+ w 57
j 680 380
+ p 23 O
+ w 65
j 600 400
+ p 23 I0
+ w 75
j 500 340
+ p 22 O
+ w 85
j 600 360
+ p 23 I2
+ w 85
j 500 400
+ p 16 O
+ w 101
j 600 380
+ p 23 I1
+ w 101
j 330 440
+ s 115
+ w 75
j 330 410
+ s 116
+ w 49
j 330 340
+ s 117
+ w 33
j 330 320
+ s 118
+ w 41
j 770 380
+ s 119
+ w 65
j 330 360
+ s 120
+ w 25
j 330 390
+ s 121
+ w 57
@attributes
@text
s 5 950 820 hln 100 A
s 5 950 800 hln 100 1
s 5 710 800 hln 100 15TH MARCH 1995
s 5 30 820 hln 100 COPYRIGHT (C) 1995, XILINX INC.
s 5 30 810 hln 100 DRAWN BY KS
s 5 750 750 hln 100 XC4000E FAMILY OR6 MACRO
s 5 750 770 hln 100 6-INPUT OR
