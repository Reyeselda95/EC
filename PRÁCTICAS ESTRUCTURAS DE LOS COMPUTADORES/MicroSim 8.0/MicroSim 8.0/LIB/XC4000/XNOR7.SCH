*version 6.3 204452451
u 123
XC4000 15840820
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
pageloc 1 0 2404 1
@status
*page 1 0 1100 850 iX
@ports
port 124 IF_IN 330 330 h
a 0 s 3 0 10 8 hln 80 LABEL=I5
port 125 IF_IN 330 310 h
a 0 s 3 0 10 8 hln 80 LABEL=I6
port 126 IF_IN 330 350 h
a 0 s 3 0 10 8 hln 80 LABEL=I4
port 127 IF_IN 330 400 h
a 0 s 3 0 10 8 hln 80 LABEL=I2
port 128 IF_IN 330 420 h
a 0 s 3 0 10 8 hln 80 LABEL=I1
port 129 IF_IN 330 450 h
a 0 s 3 0 10 8 hln 80 LABEL=I0
port 130 IF_IN 330 380 h
a 0 s 3 0 10 8 hln 80 LABEL=I3
port 131 IF_OUT 770 380 h
a 0 s 3 0 20 8 hln 80 LABEL=O
@parts
part 17 XNOR3 600 360 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 60 hlt 100 PART=XNOR3
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 23 XOR3 420 310 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U2
a 0 sp 11 0 10 60 hlt 100 PART=XOR3
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 24 XOR3 420 380 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U3
a 0 sp 11 0 10 60 hlt 100 PART=XOR3
a 0 a 0 0 0 0 hln 100 PKGREF=U3
@conn
w 26
s 330 380 420 380 25
a 0 s 3 0 340 380 hln 100 LABEL=I3
w 34
s 330 330 420 330 33
a 0 s 3 0 340 330 hln 100 LABEL=I5
w 42
s 330 420 420 420 41
a 0 s 3 0 340 420 hln 100 LABEL=I1
w 50
s 330 400 420 400 49
a 0 s 3 0 340 400 hln 100 LABEL=I2
w 58
s 680 380 770 380 57
a 0 s 3 0 750 380 hln 100 LABEL=O
w 68
s 500 330 560 330 65
a 0 s 3 0 530 330 hln 100 LABEL=I46
s 560 360 560 330 66
s 560 360 600 360 67
w 84
s 500 400 560 400 81
a 0 s 3 0 530 400 hln 100 LABEL=I13
s 560 400 560 380 82
s 560 380 600 380 83
w 98
s 330 350 420 350 97
a 0 s 3 0 340 350 hln 100 LABEL=I4
w 106
s 330 310 420 310 105
a 0 s 3 0 340 310 hln 100 LABEL=I6
w 116
s 330 450 580 450 113
a 0 s 3 0 340 450 hln 100 LABEL=I0
s 580 450 580 400 114
s 580 400 600 400 115
@junction
j 420 380
+ p 24 I2
+ w 26
j 420 330
+ p 23 I1
+ w 34
j 420 420
+ p 24 I0
+ w 42
j 420 400
+ p 24 I1
+ w 50
j 680 380
+ p 17 O
+ w 58
j 600 360
+ p 17 I2
+ w 68
j 500 330
+ p 23 O
+ w 68
j 600 380
+ p 17 I1
+ w 84
j 500 400
+ p 24 O
+ w 84
j 420 350
+ p 23 I0
+ w 98
j 420 310
+ p 23 I2
+ w 106
j 600 400
+ p 17 I0
+ w 116
j 330 330
+ s 124
+ w 34
j 330 310
+ s 125
+ w 106
j 330 350
+ s 126
+ w 98
j 330 400
+ s 127
+ w 50
j 330 420
+ s 128
+ w 42
j 330 450
+ s 129
+ w 116
j 330 380
+ s 130
+ w 26
j 770 380
+ s 131
+ w 58
@attributes
@text
s 5 950 820 hln 100 A
s 5 950 800 hln 100 1
s 5 710 800 hln 100 15TH MARCH 1993
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 30 810 hln 100 DRAWN BY KS
s 5 750 750 hln 100 XC4000 FAMILY XNOR7 MACRO
s 5 750 770 hln 100 7-INPUT XNOR
