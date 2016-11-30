*version 6.3 2596214475
u 59
XC5200 3046674783
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
pageloc 1 0 1134 1
@status
*page 1 0 1100 850 iX
@ports
port 60 IF_OUT 840 360 h
a 0 s 3 0 20 8 hln 80 LABEL=Q
port 61 IF_IN 270 400 h
a 0 s 3 0 10 8 hln 80 LABEL=G
port 62 IF_IN 270 360 h
a 0 s 3 0 10 8 hln 80 LABEL=D
@parts
part 16 LD 500 360 h
a 0 sp 9 0 120 0 hrn 100 REFDES=U1
a 0 sp 11 0 60 20 hcn 200 PART=LD
a 0 u 13 13 20 117 hln 100 RLOC=R0C0
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 20 IBUF 380 360 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U2
a 0 sp 11 0 30 14 hlt 100 PART=IBUF
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 22
s 270 360 380 360 21
a 0 s 3 0 280 360 hln 100 LABEL=D
w 30
s 620 360 840 360 29
a 0 s 3 0 820 360 hln 100 LABEL=Q
w 38
s 450 360 500 360 37
a 0 s 3 0 460 360 hln 100 LABEL=D_IN
w 52
s 270 400 500 400 51
a 0 s 3 0 280 400 hln 100 LABEL=G
@junction
j 380 360
+ p 20 I
+ w 22
j 620 360
+ p 16 Q
+ w 30
j 500 360
+ p 16 D
+ w 38
j 450 360
+ p 20 O
+ w 38
j 500 400
+ p 16 G
+ w 52
j 840 360
+ s 60
+ w 30
j 270 400
+ s 61
+ w 52
j 270 360
+ s 62
+ w 22
@attributes
@text
s 5 750 770 hln 100 INPUT TRANSPARENT DATA LATCH
s 5 950 820 hln 100 A
s 5 950 800 hln 100 1
s 5 710 800 hln 100 1ST MARCH 1993
s 5 750 750 hln 100 XC5200 FAMILY ILD MACRO
