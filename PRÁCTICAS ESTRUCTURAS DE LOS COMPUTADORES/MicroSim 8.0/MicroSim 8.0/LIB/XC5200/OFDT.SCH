*version 6.3 2272011127
u 70
XC5200 100206356
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
pageloc 1 0 1434 1
@status
*page 1 0 1100 850 iX
@ports
port 71 IF_IN 270 290 h
a 0 s 3 0 10 8 hln 80 LABEL=T
port 72 IF_OUT 850 350 h
a 0 s 3 0 20 8 hln 80 LABEL=O
port 73 IF_IN 270 350 h
a 0 s 3 0 10 8 hln 80 LABEL=D
port 74 IF_IN 270 390 h
a 0 s 3 0 10 8 hln 80 LABEL=C
@parts
part 16 OBUFT 690 330 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U1
a 0 sp 11 0 30 34 hlt 100 PART=OBUFT
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 21 FD 500 350 h
a 0 sp 9 0 120 0 hrn 100 REFDES=U2
a 0 sp 11 0 60 20 hcn 200 PART=FD
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 25
s 270 290 670 290 22
a 0 s 3 0 280 290 hln 100 LABEL=T
s 670 330 670 290 23
s 670 330 690 330 24
w 33
s 760 350 850 350 32
a 0 s 3 0 830 350 hln 100 LABEL=O
w 41
s 620 350 690 350 40
a 0 s 3 0 630 350 hln 100 LABEL=O_OUT
w 55
s 270 390 500 390 54
a 0 s 3 0 280 390 hln 100 LABEL=C
w 63
s 270 350 500 350 62
a 0 s 3 0 280 350 hln 100 LABEL=D
@junction
j 690 330
+ p 16 T
+ w 25
j 760 350
+ p 16 O
+ w 33
j 690 350
+ p 16 I
+ w 41
j 620 350
+ p 21 Q
+ w 41
j 500 390
+ p 21 C
+ w 55
j 500 350
+ p 21 D
+ w 63
j 270 290
+ s 71
+ w 25
j 850 350
+ s 72
+ w 33
j 270 350
+ s 73
+ w 63
j 270 390
+ s 74
+ w 55
@attributes
@text
s 5 750 780 hln 100 WITH ACTIVE LOW ENABLE
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
s 5 710 800 hln 100 17TH DECEMBER 1993
s 5 750 750 hln 100 XC5200 FAMILY OFDT MACRO
s 5 750 770 hln 100 3-STATE OUTPUT D FLIP-FLOP
