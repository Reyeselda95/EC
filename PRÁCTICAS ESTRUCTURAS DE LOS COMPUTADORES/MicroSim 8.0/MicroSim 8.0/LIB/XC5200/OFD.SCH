*version 6.3 13144257
u 59
XC5200 1008827786
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
pageloc 1 0 1174 1
@status
*page 1 0 1100 850 iX
@ports
port 60 IF_OUT 850 350 h
a 0 s 3 0 20 8 hln 80 LABEL=Q
port 61 IF_IN 270 350 h
a 0 s 3 0 10 8 hln 80 LABEL=D
port 62 IF_IN 270 390 h
a 0 s 3 0 10 8 hln 80 LABEL=C
@parts
part 15 OBUF 690 350 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U1
a 0 sp 11 0 30 14 hlt 100 PART=OBUF
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 20 FD 500 350 h
a 0 sp 9 0 120 0 hrn 100 REFDES=U2
a 0 sp 11 0 60 20 hcn 200 PART=FD
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 22
s 620 350 690 350 21
a 0 s 3 0 630 350 hln 100 LABEL=Q_OUT
w 36
s 270 390 500 390 35
a 0 s 3 0 280 390 hln 100 LABEL=C
w 44
s 270 350 500 350 43
a 0 s 3 0 280 350 hln 100 LABEL=D
w 52
s 760 350 850 350 51
a 0 s 3 0 830 350 hln 100 LABEL=Q
@junction
j 690 350
+ p 15 I
+ w 22
j 620 350
+ p 20 Q
+ w 22
j 500 390
+ p 20 C
+ w 36
j 500 350
+ p 20 D
+ w 44
j 760 350
+ p 15 O
+ w 52
j 850 350
+ s 60
+ w 52
j 270 350
+ s 61
+ w 44
j 270 390
+ s 62
+ w 36
@attributes
@text
s 5 710 800 hln 100 17TH DECEMBER 1993
s 5 950 820 hln 100 A
s 5 950 800 hln 100 1
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 30 810 hln 100 DRAWN BY KS
s 5 750 750 hln 100 XC5200 FAMILY OFD MACRO
s 5 750 770 hln 100 OUTPUT D FLIP-FLOP
