*version 6.3 732487517
u 119
XC4000 3995340183
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
pageloc 1 0 2235 1
@status
*page 1 0 1100 850 iX
@ports
port 120 IF_IN 330 320 h
a 0 s 3 0 10 8 hln 80 LABEL=I5
port 121 IF_IN 330 340 h
a 0 s 3 0 10 8 hln 80 LABEL=I4
port 122 IF_IN 330 360 h
a 0 s 3 0 10 8 hln 80 LABEL=I3
port 123 IF_IN 330 390 h
a 0 s 3 0 10 8 hln 80 LABEL=I2
port 124 IF_IN 330 410 h
a 0 s 3 0 10 8 hln 80 LABEL=I1
port 125 IF_IN 330 440 h
a 0 s 3 0 10 8 hln 80 LABEL=I0
port 126 IF_OUT 770 380 h
a 0 s 3 0 20 8 hln 80 LABEL=O
@parts
part 17 NAND3 600 360 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 60 hlt 100 PART=NAND3
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 22 AND2 420 390 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U2
a 0 sp 11 0 10 40 hlt 100 PART=AND2
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 28 AND3 420 320 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U3
a 0 sp 11 0 10 60 hlt 100 PART=AND3
a 0 a 0 0 0 0 hln 100 PKGREF=U3
@conn
w 30
s 330 360 420 360 29
a 0 s 3 0 340 360 hln 100 LABEL=I3
w 38
s 330 340 420 340 37
a 0 s 3 0 340 340 hln 100 LABEL=I4
w 46
s 330 320 420 320 45
a 0 s 3 0 340 320 hln 100 LABEL=I5
w 56
s 500 340 560 340 53
a 0 s 3 0 530 340 hln 100 LABEL=I35
s 560 360 560 340 54
s 560 360 600 360 55
w 70
s 330 410 420 410 69
a 0 s 3 0 340 410 hln 100 LABEL=I1
w 78
s 330 390 420 390 77
a 0 s 3 0 340 390 hln 100 LABEL=I2
w 88
s 500 400 560 400 85
a 0 s 3 0 530 400 hln 100 LABEL=I12
s 560 400 560 380 86
s 560 380 600 380 87
w 102
s 680 380 770 380 101
a 0 s 3 0 750 380 hln 100 LABEL=O
w 112
s 330 440 580 440 109
a 0 s 3 0 340 440 hln 100 LABEL=I0
s 580 440 580 400 110
s 580 400 600 400 111
@junction
j 420 360
+ p 28 I0
+ w 30
j 420 340
+ p 28 I1
+ w 38
j 420 320
+ p 28 I2
+ w 46
j 600 360
+ p 17 I2
+ w 56
j 500 340
+ p 28 O
+ w 56
j 420 410
+ p 22 I0
+ w 70
j 420 390
+ p 22 I1
+ w 78
j 600 380
+ p 17 I1
+ w 88
j 500 400
+ p 22 O
+ w 88
j 680 380
+ p 17 O
+ w 102
j 600 400
+ p 17 I0
+ w 112
j 330 320
+ s 120
+ w 46
j 330 340
+ s 121
+ w 38
j 330 360
+ s 122
+ w 30
j 330 390
+ s 123
+ w 78
j 330 410
+ s 124
+ w 70
j 330 440
+ s 125
+ w 112
j 770 380
+ s 126
+ w 102
@attributes
@text
s 5 750 770 hln 100 6-INPUT NAND
s 5 750 750 hln 100 XC4000 FAMILY NAND6 MACRO
s 5 710 800 hln 100 15TH MARCH 1993
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 30 810 hln 100 DRAWN BY KS
