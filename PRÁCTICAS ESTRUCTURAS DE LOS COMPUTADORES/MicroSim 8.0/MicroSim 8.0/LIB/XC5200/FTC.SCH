*version 6.3 996358895
u 83
XC5200 8355060
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
pageloc 1 0 1597 1
@status
*page 1 0 1100 850 iX
@ports
port 84 IF_IN 130 410 h
a 0 s 3 0 10 8 hln 80 LABEL=C
port 85 IF_IN 130 440 h
a 0 s 3 0 10 8 hln 80 LABEL=CLR
port 86 IF_IN 130 380 h
a 0 s 3 0 10 8 hln 80 LABEL=T
port 87 IF_OUT 960 370 h
a 0 s 3 0 20 8 hln 80 LABEL=Q
@parts
part 16 XOR2 310 360 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 40 hlt 100 PART=XOR2
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 22 FDC 640 370 h
a 0 sp 9 0 120 0 hrn 100 REFDES=U2
a 0 sp 11 0 60 20 hcn 200 PART=FDC
a 0 u 13 13 20 140 hln 100 RLOC=R0C0
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 29
s 790 370 960 370 23
a 0 s 3 0 940 370 hln 100 LABEL=Q
s 760 370 790 370 24
s 790 370 790 290 25
s 290 290 790 290 26
s 290 360 290 290 27
s 290 360 310 360 28
w 46
s 390 370 640 370 45
a 0 s 3 0 410 370 hln 100 LABEL=TQ
w 60
s 130 440 640 440 59
a 0 s 3 0 140 440 hln 100 LABEL=CLR
w 68
s 130 410 640 410 67
a 0 s 3 0 140 410 hln 100 LABEL=C
w 76
s 130 380 310 380 75
a 0 s 3 0 140 380 hln 100 LABEL=T
@junction
j 790 370
+ w 29
+ w 29
j 310 360
+ p 16 I1
+ w 29
j 760 370
+ p 22 Q
+ w 29
j 390 370
+ p 16 O
+ w 46
j 640 370
+ p 22 D
+ w 46
j 640 440
+ p 22 CLR
+ w 60
j 640 410
+ p 22 C
+ w 68
j 310 380
+ p 16 I0
+ w 76
j 130 410
+ s 84
+ w 68
j 130 440
+ s 85
+ w 60
j 130 380
+ s 86
+ w 76
j 960 370
+ s 87
+ w 29
@attributes
@text
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 750 780 hln 100 ENABLE AND ASYNCHRONOUS CLEAR
s 5 750 750 hln 100 XC5200 FAMILY FTC MACRO
s 5 710 800 hln 100 23RD FEBRUARY 1993
s 5 950 820 hln 100 A
s 5 950 800 hln 100 1
s 5 750 770 hln 100 TOGGLE FLIP-FLOP WITH TOGGLE
