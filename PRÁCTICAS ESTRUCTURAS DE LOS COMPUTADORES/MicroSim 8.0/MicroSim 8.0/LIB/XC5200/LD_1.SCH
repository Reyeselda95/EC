*version 6.3 415146972
u 97
XC5200 954081064
U? 5
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
pageloc 1 0 1679 1
@status
*page 1 0 1100 850 iX
@ports
port 98 IF_OUT 810 340 h
a 0 s 3 0 20 8 hln 80 LABEL=Q
port 99 IF_IN 250 340 h
a 0 s 3 0 10 8 hln 80 LABEL=D
port 100 IF_IN 250 380 h
a 0 s 3 0 10 8 hln 80 LABEL=G
@parts
part 18 LDCE 470 340 h
a 0 sp 9 0 120 0 hrn 100 REFDES=U1
a 0 sp 11 0 60 20 hcn 200 PART=LDCE
a 0 u 13 13 20 140 hln 100 RLOC=R0C0
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 21 GND 440 440 h
a 0 sp 0 0 40 0 hrn 100 REFDES=U2
a 0 sp 11 0 5 40 hln 100 PART=GND
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 24 VCC 440 320 h
a 0 sp 0 0 40 0 hrn 100 REFDES=U3
a 0 sp 11 0 20 10 hcn 100 PART=VCC
a 0 a 0 0 0 0 hln 100 PKGREF=U3
part 28 INV 350 380 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U4
a 0 sp 11 0 30 14 hlt 100 PART=INV
a 0 a 0 0 0 0 hln 100 PKGREF=U4
@conn
w 30
s 420 380 470 380 29
a 0 s 3 0 440 380 hln 100 LABEL=GB
w 44
s 250 380 350 380 43
a 0 s 3 0 260 380 hln 100 LABEL=G
w 53
s 440 410 470 410 51
s 440 440 440 410 52
w 68
s 440 360 440 320 66
s 440 360 470 360 67
w 82
s 590 340 810 340 81
a 0 s 3 0 790 340 hln 100 LABEL=Q
w 90
s 250 340 470 340 89
a 0 s 3 0 260 340 hln 100 LABEL=D
@junction
j 470 380
+ p 18 G
+ w 30
j 420 380
+ p 28 O
+ w 30
j 350 380
+ p 28 I
+ w 44
j 470 410
+ p 18 CLR
+ w 53
j 440 440
+ p 21 GROUND
+ w 53
j 470 360
+ p 18 GE
+ w 68
j 440 320
+ p 24 VCC
+ w 68
j 590 340
+ p 18 Q
+ w 82
j 470 340
+ p 18 D
+ w 90
j 810 340
+ s 98
+ w 82
j 250 340
+ s 99
+ w 90
j 250 380
+ s 100
+ w 44
@attributes
@text
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 30 810 hln 100 DRAWN BY KS
s 5 750 750 hln 100 XC5200 FAMILY LD_1 MACRO
s 5 710 800 hln 100 19TH DECEMBER 1993
s 5 750 770 hln 100 DATA LATCH W/ AN INVERTED CLOCK
