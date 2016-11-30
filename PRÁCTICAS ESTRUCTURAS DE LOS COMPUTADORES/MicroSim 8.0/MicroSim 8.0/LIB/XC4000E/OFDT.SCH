*version 6.3 453501988
u 69
XC4000E 335754193
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
pageloc 1 0 1323 1
@status
*page 1 0 1100 850 iX
@ports
port 70 IF_IN 250 310 h
a 0 s 3 0 10 8 hln 80 LABEL=T
port 71 IF_OUT 850 340 h
a 0 s 3 0 20 8 hln 80 LABEL=O
port 72 IF_IN 250 340 h
a 0 s 3 0 10 8 hln 80 LABEL=D
port 73 IF_IN 250 380 h
a 0 s 3 0 10 8 hln 80 LABEL=C
@parts
part 14 VCC 440 320 h
a 0 sp 0 0 40 0 hrn 100 REFDES=U1
a 0 sp 11 0 20 10 hcn 100 PART=VCC
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 21 OFDTX 470 310 h
a 0 sp 9 0 160 0 hrn 100 REFDES=U2
a 0 sp 11 0 80 20 hcn 200 PART=OFDTX
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 23
s 630 340 850 340 22
a 0 s 3 0 830 340 hln 100 LABEL=O
w 31
s 250 310 470 310 30
a 0 s 3 0 260 310 hln 100 LABEL=T
w 39
s 250 340 470 340 38
a 0 s 3 0 260 340 hln 100 LABEL=D
w 47
s 250 380 470 380 46
a 0 s 3 0 260 380 hln 100 LABEL=C
w 56
s 440 360 470 360 54
s 440 360 440 320 55
@junction
j 630 340
+ p 21 O
+ w 23
j 470 310
+ p 21 T
+ w 31
j 470 340
+ p 21 D
+ w 39
j 470 380
+ p 21 C
+ w 47
j 440 320
+ p 14 VCC
+ w 56
j 470 360
+ p 21 CE
+ w 56
j 250 310
+ s 70
+ w 31
j 850 340
+ s 71
+ w 23
j 250 340
+ s 72
+ w 39
j 250 380
+ s 73
+ w 47
@attributes
@text
s 5 750 750 hln 100 XC4000E FAMILY OFDE MACRO
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1995, XILINX INC.
s 5 950 820 hln 100 A
s 5 950 800 hln 100 1
s 5 710 800 hln 100 23RD DECEMBER 1992
s 5 750 770 hln 100 D FLIP-FLOP
