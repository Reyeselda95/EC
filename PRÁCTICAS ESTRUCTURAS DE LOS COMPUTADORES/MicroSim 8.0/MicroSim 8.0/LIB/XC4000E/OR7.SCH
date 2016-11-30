*version 6.3 119508525
u 121
XC4000E 872314500
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
pageloc 1 0 2391 1
@status
*page 1 0 1100 850 iX
@ports
port 122 IF_IN 330 380 h
a 0 s 3 0 10 8 hln 80 LABEL=I3
port 123 IF_IN 330 450 h
a 0 s 3 0 10 8 hln 80 LABEL=I0
port 124 IF_IN 330 420 h
a 0 s 3 0 10 8 hln 80 LABEL=I1
port 125 IF_IN 330 400 h
a 0 s 3 0 10 8 hln 80 LABEL=I2
port 126 IF_IN 330 350 h
a 0 s 3 0 10 8 hln 80 LABEL=I4
port 127 IF_IN 330 310 h
a 0 s 3 0 10 8 hln 80 LABEL=I6
port 128 IF_IN 330 330 h
a 0 s 3 0 10 8 hln 80 LABEL=I5
port 129 IF_OUT 770 380 h
a 0 s 3 0 20 8 hln 80 LABEL=O
@parts
part 17 OR3 600 360 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 60 hlt 100 PART=OR3
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 18 OR3 420 380 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U2
a 0 sp 11 0 10 60 hlt 100 PART=OR3
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 19 OR3 420 310 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U3
a 0 sp 11 0 10 60 hlt 100 PART=OR3
a 0 a 0 0 0 0 hln 100 PKGREF=U3
@conn
w 23
s 330 450 580 450 20
a 0 s 3 0 340 450 hln 100 LABEL=I0
s 580 450 580 400 22
s 580 400 600 400 21
w 32
s 330 310 420 310 31
a 0 s 3 0 340 310 hln 100 LABEL=I6
w 40
s 330 350 420 350 39
a 0 s 3 0 340 350 hln 100 LABEL=I4
w 50
s 500 400 560 400 47
a 0 s 3 0 530 400 hln 100 LABEL=I13
s 560 400 560 380 49
s 560 380 600 380 48
w 67
s 500 330 560 330 64
a 0 s 3 0 530 330 hln 100 LABEL=I46
s 560 360 560 330 66
s 560 360 600 360 65
w 82
s 680 380 770 380 81
a 0 s 3 0 750 380 hln 100 LABEL=O
w 90
s 330 400 420 400 89
a 0 s 3 0 340 400 hln 100 LABEL=I2
w 98
s 330 420 420 420 97
a 0 s 3 0 340 420 hln 100 LABEL=I1
w 106
s 330 330 420 330 105
a 0 s 3 0 340 330 hln 100 LABEL=I5
w 114
s 330 380 420 380 113
a 0 s 3 0 340 380 hln 100 LABEL=I3
@junction
j 600 400
+ p 17 I0
+ w 23
j 420 310
+ p 19 I2
+ w 32
j 420 350
+ p 19 I0
+ w 40
j 600 380
+ p 17 I1
+ w 50
j 500 400
+ p 18 O
+ w 50
j 600 360
+ p 17 I2
+ w 67
j 500 330
+ p 19 O
+ w 67
j 680 380
+ p 17 O
+ w 82
j 420 400
+ p 18 I1
+ w 90
j 420 420
+ p 18 I0
+ w 98
j 420 330
+ p 19 I1
+ w 106
j 420 380
+ p 18 I2
+ w 114
j 330 380
+ s 122
+ w 114
j 330 450
+ s 123
+ w 23
j 330 420
+ s 124
+ w 98
j 330 400
+ s 125
+ w 90
j 330 350
+ s 126
+ w 40
j 330 310
+ s 127
+ w 32
j 330 330
+ s 128
+ w 106
j 770 380
+ s 129
+ w 82
@attributes
@text
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1995, XILINX INC.
s 5 710 800 hln 100 15TH MARCH 1995
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
s 5 750 750 hln 100 XC4000E FAMILY OR7 MACRO
s 5 750 770 hln 100 7-INPUT OR
