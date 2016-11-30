*version 6.3 1005733211
u 106
XC5200 77055605
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
pageloc 1 0 1858 1
@status
*page 1 0 1100 850 iX
@ports
port 107 IF_IN 290 440 h
a 0 s 3 0 10 8 hln 80 LABEL=D1
port 108 IF_IN 290 320 h
a 0 s 3 0 10 8 hln 80 LABEL=D0
port 109 IF_IN 290 380 h
a 0 s 3 0 10 8 hln 80 LABEL=S0
port 110 IF_OUT 850 380 h
a 0 s 3 0 20 8 hln 80 LABEL=O
@parts
part 16 OR2 640 370 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 40 hlt 100 PART=OR2
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 21 AND2B1 480 420 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U2
a 0 sp 11 0 10 40 hlt 100 PART=AND2B1
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 26 AND2B2 480 320 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U3
a 0 sp 11 0 10 40 hlt 100 PART=AND2B2
a 0 a 0 0 0 0 hln 100 PKGREF=U3
@conn
w 28
s 720 380 850 380 27
a 0 s 3 0 830 380 hln 100 LABEL=O
w 38
s 560 330 600 330 35
a 0 s 3 0 580 330 hln 100 LABEL=M0
s 600 370 600 330 37
s 600 370 640 370 36
w 55
s 560 430 600 430 52
a 0 s 3 0 580 430 hln 100 LABEL=M1
s 600 430 600 390 53
s 600 390 640 390 54
w 69
s 290 320 480 320 68
a 0 s 3 0 300 320 hln 100 LABEL=D0
w 77
s 290 440 480 440 76
a 0 s 3 0 300 440 hln 100 LABEL=D1
w 89
s 290 380 450 380 84
a 0 s 3 0 300 380 hln 100 LABEL=S0
s 450 420 450 380 86
s 450 420 480 420 85
s 450 380 450 340 87
s 450 340 480 340 88
@junction
j 720 380
+ p 16 O
+ w 28
j 640 370
+ p 16 I1
+ w 38
j 560 330
+ p 26 O
+ w 38
j 640 390
+ p 16 I0
+ w 55
j 560 430
+ p 21 O
+ w 55
j 480 320
+ p 26 I1
+ w 69
j 480 440
+ p 21 I0
+ w 77
j 450 380
+ w 89
+ w 89
j 480 420
+ p 21 I1
+ w 89
j 480 340
+ p 26 I0
+ w 89
j 290 440
+ s 107
+ w 77
j 290 320
+ s 108
+ w 69
j 290 380
+ s 109
+ w 89
j 850 380
+ s 110
+ w 28
@attributes
@text
s 5 750 770 hln 100 2-TO-1 MUTIPLEXER W/
s 5 750 780 hln 100 D0 & D1 INVERTED
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 750 750 hln 100 XC5200 FAMILY M2_1B2 MACRO
s 5 710 800 hln 100 1ST MARCH 1993
s 5 950 820 hln 100 A
s 5 950 800 hln 100 1
