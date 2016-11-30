*version 6.3 650642201
u 78
XC4000E 811374618
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
pageloc 1 0 1417 1
@status
*page 1 0 1100 850 iX
@ports
port 79 IF_IN 270 390 h
a 0 s 3 0 10 8 hln 80 LABEL=G
port 80 IF_IN 270 350 h
a 0 s 3 0 10 8 hln 80 LABEL=D
port 81 IF_OUT 840 350 h
a 0 s 3 0 20 8 hln 80 LABEL=Q
@parts
part 15 INV 380 390 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U1
a 0 sp 11 0 30 14 hlt 100 PART=INV
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 21 ILDXI 500 350 h
a 0 sp 9 0 120 0 hrn 100 REFDES=U2
a 0 sp 11 0 60 20 hcn 200 PART=ILDXI
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 24 VCC 450 280 h
a 0 sp 0 0 40 0 hrn 100 REFDES=U3
a 0 sp 11 0 20 10 hcn 100 PART=VCC
a 0 a 0 0 0 0 hln 100 PKGREF=U3
@conn
w 26
s 620 350 840 350 25
a 0 s 3 0 820 350 hln 100 LABEL=Q
w 34
s 270 390 380 390 33
a 0 s 3 0 280 390 hln 100 LABEL=G
w 42
s 450 390 500 390 41
a 0 s 3 0 470 390 hln 100 LABEL=CB
w 56
s 270 350 500 350 55
a 0 s 3 0 280 350 hln 100 LABEL=D
w 65
s 450 370 500 370 63
s 450 370 450 280 64
@junction
j 620 350
+ p 21 Q
+ w 26
j 380 390
+ p 15 I
+ w 34
j 450 390
+ p 15 O
+ w 42
j 500 390
+ p 21 G
+ w 42
j 500 350
+ p 21 D
+ w 56
j 500 370
+ p 21 GE
+ w 65
j 450 280
+ p 24 VCC
+ w 65
j 270 390
+ s 79
+ w 34
j 270 350
+ s 80
+ w 56
j 840 350
+ s 81
+ w 26
@attributes
@text
s 5 750 750 hln 100 XC4000E FAMILY OFDI_1 MACRO
s 5 710 800 hln 100 7TH JUNE 1995
s 5 750 780 hln 100 (INVERTED CLOCK, SET BY GSR)
s 5 750 770 hln 100 OUTPUT D FLIP-FLOP
s 5 30 820 hln 100 COPYRIGHT (C) 1995, XILINX INC.
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
