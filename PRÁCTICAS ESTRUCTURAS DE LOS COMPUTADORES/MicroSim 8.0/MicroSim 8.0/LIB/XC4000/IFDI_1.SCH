*version 6.3 3884293531
u 59
XC4000 203604832
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
pageloc 1 0 1188 1
@status
*page 1 0 1100 850 iX
@ports
port 60 IF_IN 270 350 h
a 0 s 3 0 10 8 hln 80 LABEL=D
port 61 IF_OUT 840 350 h
a 0 s 3 0 20 8 hln 80 LABEL=Q
port 62 IF_IN 270 390 h
a 0 s 3 0 10 8 hln 80 LABEL=C
@parts
part 16 IFDI 500 350 h
a 0 sp 9 0 120 0 hrn 100 REFDES=U1
a 0 sp 11 0 60 20 hcn 200 PART=IFDI
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 20 INV 380 390 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U2
a 0 sp 11 0 30 14 hlt 100 PART=INV
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 22
s 270 350 500 350 21
a 0 s 3 0 280 350 hln 100 LABEL=D
w 30
s 270 390 380 390 29
a 0 s 3 0 280 390 hln 100 LABEL=C
w 38
s 620 350 840 350 37
a 0 s 3 0 820 350 hln 100 LABEL=Q
w 46
s 450 390 500 390 45
a 0 s 3 0 470 390 hln 100 LABEL=CB
@junction
j 500 350
+ p 16 D
+ w 22
j 380 390
+ p 20 I
+ w 30
j 620 350
+ p 16 Q
+ w 38
j 500 390
+ p 16 C
+ w 46
j 450 390
+ p 20 O
+ w 46
j 270 350
+ s 60
+ w 22
j 840 350
+ s 61
+ w 38
j 270 390
+ s 62
+ w 30
@attributes
@text
s 5 750 750 hln 100 XC4000 FAMILY IFDI_1 MACRO
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 950 820 hln 100 A
s 5 950 800 hln 100 1
s 5 710 800 hln 100 7TH JUNE 1993
s 5 750 770 hln 100 INPUT D FLIP-FLOP
s 5 750 780 hln 100 (INVERTED CLOCK, SET BY GSR)
