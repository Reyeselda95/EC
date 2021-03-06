*version 6.3 3947458087
u 128
XC4000 2898591699
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
pageloc 1 0 2103 1
@status
*page 1 0 1100 850 iX
@ports
port 129 IF_IN 290 340 h
a 0 s 3 0 10 8 hln 80 LABEL=S0
port 130 IF_IN 290 320 h
a 0 s 3 0 10 8 hln 80 LABEL=E
port 131 IF_OUT 850 370 h
a 0 s 3 0 20 8 hln 80 LABEL=O
port 132 IF_IN 290 300 h
a 0 s 3 0 10 8 hln 80 LABEL=D0
port 133 IF_IN 290 440 h
a 0 s 3 0 10 8 hln 80 LABEL=D1
@parts
part 16 OR2 640 360 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 40 hlt 100 PART=OR2
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 22 AND3B1 480 300 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U2
a 0 sp 11 0 10 60 hlt 100 PART=AND3B1
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 28 AND3 480 400 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U3
a 0 sp 11 0 10 60 hlt 100 PART=AND3
a 0 a 0 0 0 0 hln 100 PKGREF=U3
@conn
w 33
s 290 320 430 320 29
a 0 s 3 0 300 320 hln 100 LABEL=E
s 430 420 430 320 30
s 430 420 480 420 31
s 430 320 480 320 32
w 50
s 720 370 850 370 49
a 0 s 3 0 830 370 hln 100 LABEL=O
w 60
s 560 420 600 420 57
a 0 s 3 0 580 420 hln 100 LABEL=M1
s 600 420 600 380 59
s 600 380 640 380 58
w 77
s 560 320 600 320 74
a 0 s 3 0 580 320 hln 100 LABEL=M0
s 600 360 600 320 76
s 600 360 640 360 75
w 92
s 290 300 480 300 91
a 0 s 3 0 300 300 hln 100 LABEL=D0
w 103
s 290 340 450 340 99
a 0 s 3 0 300 340 hln 100 LABEL=S0
s 450 400 450 340 101
s 450 400 480 400 100
s 450 340 480 340 102
w 121
s 290 440 480 440 120
a 0 s 3 0 300 440 hln 100 LABEL=D1
@junction
j 430 320
+ w 33
+ w 33
j 480 320
+ p 22 I1
+ w 33
j 480 420
+ p 28 I1
+ w 33
j 720 370
+ p 16 O
+ w 50
j 640 380
+ p 16 I0
+ w 60
j 560 420
+ p 28 O
+ w 60
j 640 360
+ p 16 I1
+ w 77
j 560 320
+ p 22 O
+ w 77
j 480 300
+ p 22 I2
+ w 92
j 450 340
+ w 103
+ w 103
j 480 340
+ p 22 I0
+ w 103
j 480 400
+ p 28 I2
+ w 103
j 480 440
+ p 28 I0
+ w 121
j 290 340
+ s 129
+ w 103
j 290 320
+ s 130
+ w 33
j 850 370
+ s 131
+ w 50
j 290 300
+ s 132
+ w 92
j 290 440
+ s 133
+ w 121
@attributes
@text
s 5 750 770 hln 100 2-TO-1 MULTIPLEXER WITH ENABLE
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 750 750 hln 100 XC4000 FAMILY M2_1E MACRO
s 5 950 820 hln 100 A
s 5 710 800 hln 100 16TH DECEMBER 1992
s 5 950 800 hln 100 1
