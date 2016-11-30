*version 6.3 3604012605
u 122
XC4000E 408581030
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
pageloc 1 0 2226 1
@status
*page 1 0 1100 850 iX
@ports
port 123 IF_IN 330 390 h
a 0 s 3 0 10 8 hln 80 LABEL=I2
port 124 IF_IN 330 410 h
a 0 s 3 0 10 8 hln 80 LABEL=I1
port 125 IF_IN 330 440 h
a 0 s 3 0 10 8 hln 80 LABEL=I0
port 126 IF_OUT 770 380 h
a 0 s 3 0 20 8 hln 80 LABEL=O
port 127 IF_IN 330 320 h
a 0 s 3 0 10 8 hln 80 LABEL=I5
port 128 IF_IN 330 340 h
a 0 s 3 0 10 8 hln 80 LABEL=I4
port 129 IF_IN 330 360 h
a 0 s 3 0 10 8 hln 80 LABEL=I3
@parts
part 17 OR3 420 320 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 60 hlt 100 PART=OR3
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 23 NOR3 600 360 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U2
a 0 sp 11 0 10 60 hlt 100 PART=NOR3
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 28 OR2 420 390 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U3
a 0 sp 11 0 10 40 hlt 100 PART=OR2
a 0 a 0 0 0 0 hln 100 PKGREF=U3
@conn
w 32
s 330 440 580 440 29
a 0 s 3 0 340 440 hln 100 LABEL=I0
s 580 440 580 400 31
s 580 400 600 400 30
w 41
s 680 380 770 380 40
a 0 s 3 0 750 380 hln 100 LABEL=O
w 51
s 500 400 560 400 48
a 0 s 3 0 530 400 hln 100 LABEL=I12
s 560 400 560 380 50
s 560 380 600 380 49
w 66
s 330 390 420 390 65
a 0 s 3 0 340 390 hln 100 LABEL=I2
w 74
s 330 410 420 410 73
a 0 s 3 0 340 410 hln 100 LABEL=I1
w 84
s 500 340 560 340 81
a 0 s 3 0 530 340 hln 100 LABEL=I35
s 560 360 560 340 83
s 560 360 600 360 82
w 99
s 330 320 420 320 98
a 0 s 3 0 340 320 hln 100 LABEL=I5
w 107
s 330 340 420 340 106
a 0 s 3 0 340 340 hln 100 LABEL=I4
w 115
s 330 360 420 360 114
a 0 s 3 0 340 360 hln 100 LABEL=I3
@junction
j 600 400
+ p 23 I0
+ w 32
j 680 380
+ p 23 O
+ w 41
j 600 380
+ p 23 I1
+ w 51
j 500 400
+ p 28 O
+ w 51
j 420 390
+ p 28 I1
+ w 66
j 420 410
+ p 28 I0
+ w 74
j 500 340
+ p 17 O
+ w 84
j 600 360
+ p 23 I2
+ w 84
j 420 320
+ p 17 I2
+ w 99
j 420 340
+ p 17 I1
+ w 107
j 420 360
+ p 17 I0
+ w 115
j 330 390
+ s 123
+ w 66
j 330 410
+ s 124
+ w 74
j 330 440
+ s 125
+ w 32
j 770 380
+ s 126
+ w 41
j 330 320
+ s 127
+ w 99
j 330 340
+ s 128
+ w 107
j 330 360
+ s 129
+ w 115
@attributes
@text
s 5 750 750 hln 100 XC4000E FAMILY NOR6 MACRO
s 5 750 770 hln 100 6-INPUT NOR
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1995, XILINX INC.
s 5 950 820 hln 100 A
s 5 950 800 hln 100 1
s 5 710 800 hln 100 15TH MARCH 1995
