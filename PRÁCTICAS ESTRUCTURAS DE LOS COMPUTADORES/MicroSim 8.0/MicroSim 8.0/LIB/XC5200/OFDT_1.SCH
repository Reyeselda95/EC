*version 6.3 2126992658
u 68
XC5200 678875490
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
pageloc 1 0 1393 1
@status
*page 1 0 1100 850 iX
@ports
port 69 IF_IN 270 320 h
a 0 s 3 0 10 8 hln 80 LABEL=T
port 70 IF_OUT 880 350 h
a 0 s 3 0 20 8 hln 80 LABEL=O
port 71 IF_IN 270 350 h
a 0 s 3 0 10 8 hln 80 LABEL=D
port 72 IF_IN 270 390 h
a 0 s 3 0 10 8 hln 80 LABEL=C
@parts
part 15 INV 380 390 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U1
a 0 sp 11 0 30 14 hlt 100 PART=INV
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 21 OFDT 500 320 h
a 0 sp 9 0 160 0 hrn 100 REFDES=U2
a 0 sp 11 0 80 20 hcn 200 PART=OFDT
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 23
s 660 350 880 350 22
a 0 s 3 0 860 350 hln 100 LABEL=O
w 31
s 270 350 500 350 30
a 0 s 3 0 280 350 hln 100 LABEL=D
w 39
s 450 390 500 390 38
a 0 s 3 0 470 390 hln 100 LABEL=CB
w 53
s 270 390 380 390 52
a 0 s 3 0 280 390 hln 100 LABEL=C
w 61
s 270 320 500 320 60
a 0 s 3 0 280 320 hln 100 LABEL=T
@junction
j 660 350
+ p 21 O
+ w 23
j 500 350
+ p 21 D
+ w 31
j 450 390
+ p 15 O
+ w 39
j 500 390
+ p 21 C
+ w 39
j 380 390
+ p 15 I
+ w 53
j 500 320
+ p 21 T
+ w 61
j 270 320
+ s 69
+ w 61
j 880 350
+ s 70
+ w 23
j 270 350
+ s 71
+ w 31
j 270 390
+ s 72
+ w 53
@attributes
@text
s 5 950 820 hln 100 A
s 5 950 800 hln 100 1
s 5 710 800 hln 100 1ST MARCH 1993
s 5 750 750 hln 100 XC5200 FAMILY OFDT_1 MACRO
s 5 750 770 hln 100 OUTPUT D FLIP-FLOP W/ AN INV CLK
s 5 750 780 hln 100 & AN ACTIVE LOW ENABLE
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 30 810 hln 100 DRAWN BY KS
