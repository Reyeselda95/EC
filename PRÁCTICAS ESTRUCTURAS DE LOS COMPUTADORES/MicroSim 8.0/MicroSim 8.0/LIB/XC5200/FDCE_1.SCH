*version 6.3 1258066178
u 77
XC5200 2015380498
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
pageloc 1 0 1614 1
@status
*page 1 0 1100 850 iX
@ports
port 78 IF_IN 290 370 h
a 0 s 3 0 10 8 hln 80 LABEL=CE
port 79 IF_IN 290 420 h
a 0 s 3 0 10 8 hln 80 LABEL=CLR
port 80 IF_OUT 810 350 h
a 0 s 3 0 20 8 hln 80 LABEL=Q
port 81 IF_IN 290 390 h
a 0 s 3 0 10 8 hln 80 LABEL=C
port 82 IF_IN 290 350 h
a 0 s 3 0 10 8 hln 80 LABEL=D
@parts
part 15 INV 390 390 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U1
a 0 sp 11 0 30 14 hlt 100 PART=INV
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 22 FDCE 510 350 h
a 0 sp 9 0 120 0 hrn 100 REFDES=U2
a 0 sp 11 0 60 20 hcn 200 PART=FDCE
a 0 u 13 13 20 140 hln 100 RLOC=R0C0
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 24
s 460 390 510 390 23
a 0 s 3 0 480 390 hln 100 LABEL=CB
w 38
s 290 420 510 420 37
a 0 s 3 0 300 420 hln 100 LABEL=CLR
w 46
s 630 350 810 350 45
a 0 s 3 0 790 350 hln 100 LABEL=Q
w 54
s 290 390 390 390 53
a 0 s 3 0 300 390 hln 100 LABEL=C
w 62
s 290 350 510 350 61
a 0 s 3 0 300 350 hln 100 LABEL=D
w 70
s 290 370 510 370 69
a 0 s 3 0 300 370 hln 100 LABEL=CE
@junction
j 460 390
+ p 15 O
+ w 24
j 510 390
+ p 22 C
+ w 24
j 510 420
+ p 22 CLR
+ w 38
j 630 350
+ p 22 Q
+ w 46
j 390 390
+ p 15 I
+ w 54
j 510 350
+ p 22 D
+ w 62
j 510 370
+ p 22 CE
+ w 70
j 290 370
+ s 78
+ w 70
j 290 420
+ s 79
+ w 38
j 810 350
+ s 80
+ w 46
j 290 390
+ s 81
+ w 54
j 290 350
+ s 82
+ w 62
@attributes
@text
s 5 710 800 hln 100 1ST MARCH 1993
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
s 5 750 750 hln 100 XC5200 FAMILY FDCE_1 MACRO
s 5 750 770 hln 100 D FLIP-FLOP WITH AN INVERTED CLK,
s 5 750 780 hln 100 CLK ENABLE & AN ASYNCHRONOUS CLR
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 30 810 hln 100 DRAWN BY KS
