*version 6.3 1281108688
u 126
XC5200 586888395
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
pageloc 1 0 2100 1
@status
*page 1 0 1100 850 iX
@ports
port 127 IF_IN 290 440 h
a 0 s 3 0 10 8 hln 80 LABEL=D1
port 128 IF_IN 290 300 h
a 0 s 3 0 10 8 hln 80 LABEL=D0
port 129 IF_OUT 850 370 h
a 0 s 3 0 20 8 hln 80 LABEL=O
port 130 IF_IN 290 320 h
a 0 s 3 0 10 8 hln 80 LABEL=E
port 131 IF_IN 290 340 h
a 0 s 3 0 10 8 hln 80 LABEL=S0
@parts
part 17 AND3 480 400 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 60 hlt 100 PART=AND3
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 23 AND3B1 480 300 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U2
a 0 sp 11 0 10 60 hlt 100 PART=AND3B1
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 28 OR2 640 360 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U3
a 0 sp 11 0 10 40 hlt 100 PART=OR2
a 0 a 0 0 0 0 hln 100 PKGREF=U3
@conn
w 30
s 290 440 480 440 29
a 0 s 3 0 300 440 hln 100 LABEL=D1
w 41
s 290 340 450 340 37
a 0 s 3 0 300 340 hln 100 LABEL=S0
s 450 340 480 340 38
s 450 400 450 340 39
s 450 400 480 400 40
w 58
s 290 300 480 300 57
a 0 s 3 0 300 300 hln 100 LABEL=D0
w 68
s 560 320 600 320 65
a 0 s 3 0 580 320 hln 100 LABEL=M0
s 600 360 600 320 66
s 600 360 640 360 67
w 84
s 560 420 600 420 81
a 0 s 3 0 580 420 hln 100 LABEL=M1
s 600 420 600 380 82
s 600 380 640 380 83
w 98
s 720 370 850 370 97
a 0 s 3 0 830 370 hln 100 LABEL=O
w 109
s 290 320 430 320 105
a 0 s 3 0 300 320 hln 100 LABEL=E
s 430 320 480 320 106
s 430 420 430 320 108
s 430 420 480 420 107
@junction
j 480 440
+ p 17 I0
+ w 30
j 450 340
+ w 41
+ w 41
j 480 400
+ p 17 I2
+ w 41
j 480 340
+ p 23 I0
+ w 41
j 480 300
+ p 23 I2
+ w 58
j 560 320
+ p 23 O
+ w 68
j 640 360
+ p 28 I1
+ w 68
j 560 420
+ p 17 O
+ w 84
j 640 380
+ p 28 I0
+ w 84
j 720 370
+ p 28 O
+ w 98
j 430 320
+ w 109
+ w 109
j 480 420
+ p 17 I1
+ w 109
j 480 320
+ p 23 I1
+ w 109
j 290 440
+ s 127
+ w 30
j 290 300
+ s 128
+ w 58
j 850 370
+ s 129
+ w 98
j 290 320
+ s 130
+ w 109
j 290 340
+ s 131
+ w 41
@attributes
@text
s 5 950 800 hln 100 1
s 5 710 800 hln 100 16TH DECEMBER 1992
s 5 950 820 hln 100 A
s 5 750 750 hln 100 XC5200 FAMILY M2_1E MACRO
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 30 810 hln 100 DRAWN BY KS
s 5 750 770 hln 100 2-TO-1 MULTIPLEXER WITH ENABLE
