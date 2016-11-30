*version 6.3 63445465
u 68
XC4000E 2564021145
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
pageloc 1 0 1371 1
@status
*page 1 0 1100 850 iX
@ports
port 69 IF_IN 270 370 h
a 0 s 3 0 10 8 hln 80 LABEL=GE
port 70 IF_IN 270 390 h
a 0 s 3 0 10 8 hln 80 LABEL=G
port 71 IF_OUT 840 350 h
a 0 s 3 0 20 8 hln 80 LABEL=Q
port 72 IF_IN 270 350 h
a 0 s 3 0 10 8 hln 80 LABEL=D
@parts
part 15 INV 380 390 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U1
a 0 sp 11 0 30 14 hlt 100 PART=INV
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 21 ILDXI_1 500 350 h
a 0 sp 9 0 120 0 hrn 100 REFDES=U2
a 0 sp 11 0 60 20 hcn 200 PART=ILDXI_1
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 23
s 270 370 500 370 22
a 0 s 3 0 280 370 hln 100 LABEL=GE
w 31
s 270 350 500 350 30
a 0 s 3 0 280 350 hln 100 LABEL=D
w 39
s 450 390 500 390 38
a 0 s 3 0 470 390 hln 100 LABEL=GB
w 53
s 620 350 840 350 52
a 0 s 3 0 820 350 hln 100 LABEL=Q
w 61
s 270 390 380 390 60
a 0 s 3 0 280 390 hln 100 LABEL=G
@junction
j 500 370
+ p 21 GE
+ w 23
j 500 350
+ p 21 D
+ w 31
j 450 390
+ p 15 O
+ w 39
j 500 390
+ p 21 G
+ w 39
j 620 350
+ p 21 Q
+ w 53
j 380 390
+ p 15 I
+ w 61
j 270 370
+ s 69
+ w 23
j 270 390
+ s 70
+ w 61
j 840 350
+ s 71
+ w 53
j 270 350
+ s 72
+ w 31
@attributes
@text
s 5 750 750 hln 100 XC4000E FAMILY ILDXI MACRO
s 5 750 770 hln 100 INPUT TRANSPARENT DATA LATCH
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
s 5 710 800 hln 100 7TH JUNE 1995
s 5 750 780 hln 100 (INVERTED GATE, SET BY GSR)
s 5 30 820 hln 100 COPYRIGHT (C) 1995, XILINX INC.
