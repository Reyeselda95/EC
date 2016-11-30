*version 6.3 852789779
u 69
XC4000 956507454
U? 3
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
pageloc 1 0 1406 1
@status
*page 1 0 1100 850 iX
@ports
port 70 IF_IN 270 370 h
a 0 s 3 0 10 8 hln 80 LABEL=C
port 71 IF_IN 270 330 h
a 0 s 3 0 10 8 hln 80 LABEL=D
port 72 IF_IN 270 300 h
a 0 s 3 0 10 8 hln 80 LABEL=PRE
port 73 IF_OUT 750 330 h
a 0 s 3 0 20 8 hln 80 LABEL=Q
@parts
part 18 FDPE 450 300 h
a 0 sp 9 0 120 0 hrn 100 REFDES=U1
a 0 sp 11 0 60 10 hcn 200 PART=FDPE
a 0 u 13 13 20 140 hln 100 RLOC=R0C0
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 21 VCC 410 290 h
a 0 sp 0 0 40 0 hrn 100 REFDES=U2
a 0 sp 11 0 20 10 hcn 100 PART=VCC
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 23
s 270 300 450 300 22
a 0 s 3 0 280 300 hln 100 LABEL=PRE
w 32
s 410 350 410 290 30
s 410 350 450 350 31
w 46
s 270 330 450 330 45
a 0 s 3 0 280 330 hln 100 LABEL=D
w 54
s 570 330 750 330 53
a 0 s 3 0 730 330 hln 100 LABEL=Q
w 62
s 270 370 450 370 61
a 0 s 3 0 280 370 hln 100 LABEL=C
@junction
j 450 300
+ p 18 PRE
+ w 23
j 450 350
+ p 18 CE
+ w 32
j 410 290
+ p 21 VCC
+ w 32
j 450 330
+ p 18 D
+ w 46
j 570 330
+ p 18 Q
+ w 54
j 450 370
+ p 18 C
+ w 62
j 270 370
+ s 70
+ w 62
j 270 330
+ s 71
+ w 46
j 270 300
+ s 72
+ w 23
j 750 330
+ s 73
+ w 54
@attributes
@text
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 760 750 hln 100 XC4000 FAMILY FDP MACRO
s 5 710 800 hln 100 26TH JANUARY 1993
s 5 950 820 hln 100 A
s 5 950 800 hln 100 1
s 5 760 770 hln 100 D FLIP-FLOP WITH
s 5 760 780 hln 100 ASYNCHRONOUS PRESET
