*version 6.3 397829995
u 69
XC5200 439628276
U? 3
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
part 14 VCC 410 290 h
a 0 sp 0 0 40 0 hrn 100 REFDES=U1
a 0 sp 11 0 20 10 hcn 100 PART=VCC
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 21 FDPE 450 300 h
a 0 sp 9 0 120 0 hrn 100 REFDES=U2
a 0 sp 11 0 60 20 hcn 200 PART=FDPE
a 0 u 13 13 20 150 hln 100 RLOC=R0C0
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 23
s 270 370 450 370 22
a 0 s 3 0 280 370 hln 100 LABEL=C
w 31
s 570 330 750 330 30
a 0 s 3 0 730 330 hln 100 LABEL=Q
w 39
s 270 330 450 330 38
a 0 s 3 0 280 330 hln 100 LABEL=D
w 48
s 410 350 450 350 46
s 410 350 410 290 47
w 62
s 270 300 450 300 61
a 0 s 3 0 280 300 hln 100 LABEL=PRE
@junction
j 450 370
+ p 21 C
+ w 23
j 570 330
+ p 21 Q
+ w 31
j 450 330
+ p 21 D
+ w 39
j 410 290
+ p 14 VCC
+ w 48
j 450 350
+ p 21 CE
+ w 48
j 450 300
+ p 21 PRE
+ w 62
j 270 370
+ s 70
+ w 23
j 270 330
+ s 71
+ w 39
j 270 300
+ s 72
+ w 62
j 750 330
+ s 73
+ w 31
@attributes
@text
s 5 760 780 hln 100 ASYNCHRONOUS PRESET
s 5 760 770 hln 100 D FLIP-FLOP WITH
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
s 5 710 800 hln 100 26TH JANUARY 1993
s 5 760 750 hln 100 XC5200 FAMILY FDP MACRO
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 30 810 hln 100 DRAWN BY KS
