*version 6.3 68066895
u 68
XC4000E 25208616
U? 3
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
pageloc 1 0 1404 1
@status
*page 1 0 1100 850 iX
@ports
port 69 IF_IN 270 370 h
a 0 s 3 0 10 8 hln 80 LABEL=CE
port 70 IF_IN 270 350 h
a 0 s 3 0 10 8 hln 80 LABEL=D
port 71 IF_OUT 840 350 h
a 0 s 3 0 20 8 hln 80 LABEL=Q
port 72 IF_IN 270 390 h
a 0 s 3 0 10 8 hln 80 LABEL=C
@parts
part 15 INV 380 390 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U1
a 0 sp 11 0 30 14 hlt 100 PART=INV
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 21 OFDX 500 350 h
a 0 sp 9 0 120 0 hrn 100 REFDES=U2
a 0 sp 11 0 60 20 hcn 200 PART=OFDX
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 23
s 270 370 500 370 22
a 0 s 3 0 280 370 hln 100 LABEL=CE
w 31
s 270 350 500 350 30
a 0 s 3 0 280 350 hln 100 LABEL=D
w 39
s 620 350 840 350 38
a 0 s 3 0 820 350 hln 100 LABEL=Q
w 47
s 270 390 380 390 46
a 0 s 3 0 280 390 hln 100 LABEL=C
w 55
s 450 390 500 390 54
a 0 s 3 0 470 390 hln 100 LABEL=CB
@junction
j 500 370
+ p 21 CE
+ w 23
j 500 350
+ p 21 D
+ w 31
j 620 350
+ p 21 Q
+ w 39
j 380 390
+ p 15 I
+ w 47
j 450 390
+ p 15 O
+ w 55
j 500 390
+ p 21 C
+ w 55
j 270 370
+ s 69
+ w 23
j 270 350
+ s 70
+ w 31
j 840 350
+ s 71
+ w 39
j 270 390
+ s 72
+ w 47
@attributes
@text
s 5 750 780 hln 100 & AN ACTIVE HIGH CLOCK ENABLE
s 5 750 750 hln 100 XC4000E FAMILY OFDX_1 MACRO
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1995, XILINX INC.
s 5 750 770 hln 100 OUTPUT D FLIP-FLOP W/ AN INV CLK
s 5 710 800 hln 100 1ST MARCH 1995
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
