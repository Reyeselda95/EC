*version 6.3 1635449658
u 77
XC5200 627851904
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
pageloc 1 0 1463 1
@status
*page 1 0 1100 850 iX
@ports
port 78 IF_OUT 840 350 h
a 0 s 3 0 20 8 hln 80 LABEL=Q
port 79 IF_IN 270 390 h
a 0 s 3 0 10 8 hln 80 LABEL=G
port 80 IF_IN 270 350 h
a 0 s 3 0 10 8 hln 80 LABEL=D
@parts
part 15 IBUF 380 350 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U1
a 0 sp 11 0 30 14 hlt 100 PART=IBUF
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 20 LD 500 350 h
a 0 sp 9 0 120 0 hrn 100 REFDES=U2
a 0 sp 11 0 60 20 hcn 200 PART=LD
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 24 INV 380 390 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U3
a 0 sp 11 0 30 14 hlt 100 PART=INV
a 0 a 0 0 0 0 hln 100 PKGREF=U3
@conn
w 26
s 620 350 840 350 25
a 0 s 3 0 820 350 hln 100 LABEL=Q
w 34
s 450 390 500 390 33
a 0 s 3 0 470 390 hln 100 LABEL=GB
w 48
s 270 390 380 390 47
a 0 s 3 0 280 390 hln 100 LABEL=G
w 56
s 450 350 500 350 55
a 0 s 3 0 460 350 hln 100 LABEL=D_IN
w 70
s 270 350 380 350 69
a 0 s 3 0 280 350 hln 100 LABEL=D
@junction
j 620 350
+ p 20 Q
+ w 26
j 500 390
+ p 20 G
+ w 34
j 450 390
+ p 24 O
+ w 34
j 380 390
+ p 24 I
+ w 48
j 450 350
+ p 15 O
+ w 56
j 500 350
+ p 20 D
+ w 56
j 380 350
+ p 15 I
+ w 70
j 840 350
+ s 78
+ w 26
j 270 390
+ s 79
+ w 48
j 270 350
+ s 80
+ w 70
@attributes
@text
s 5 710 800 hln 100 17TH DECEMBER 1993
s 5 750 780 hln 100 WITH AN INVERTED GATE
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 950 820 hln 100 A
s 5 950 800 hln 100 1
s 5 750 750 hln 100 XC5200 FAMILY ILD_1 MACRO
s 5 750 770 hln 100 INPUT DATA TRANSPARENT LATCH
