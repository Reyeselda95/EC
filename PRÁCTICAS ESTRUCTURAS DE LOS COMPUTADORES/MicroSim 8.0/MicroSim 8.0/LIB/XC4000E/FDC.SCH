*version 6.3 686458665
u 69
XC4000E 408382132
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
pageloc 1 0 1407 1
@status
*page 1 0 1100 850 iX
@ports
port 70 IF_OUT 750 330 h
a 0 s 3 0 20 8 hln 80 LABEL=Q
port 71 IF_IN 270 330 h
a 0 s 3 0 10 8 hln 80 LABEL=D
port 72 IF_IN 270 400 h
a 0 s 3 0 10 8 hln 80 LABEL=CLR
port 73 IF_IN 270 370 h
a 0 s 3 0 10 8 hln 80 LABEL=C
@parts
part 14 VCC 410 290 h
a 0 sp 0 0 40 0 hrn 100 REFDES=U1
a 0 sp 11 0 20 10 hcn 100 PART=VCC
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 21 FDCE 450 330 h
a 0 sp 9 0 120 0 hrn 100 REFDES=U2
a 0 sp 11 0 60 20 hcn 200 PART=FDCE
a 0 u 13 13 20 140 hln 100 RLOC=R0C0
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 23
s 270 400 450 400 22
a 0 s 3 0 280 400 hln 100 LABEL=CLR
w 31
s 270 370 450 370 30
a 0 s 3 0 280 370 hln 100 LABEL=C
w 39
s 570 330 750 330 38
a 0 s 3 0 730 330 hln 100 LABEL=Q
w 47
s 270 330 450 330 46
a 0 s 3 0 280 330 hln 100 LABEL=D
w 56
s 410 350 450 350 54
s 410 350 410 290 55
@junction
j 450 400
+ p 21 CLR
+ w 23
j 450 370
+ p 21 C
+ w 31
j 570 330
+ p 21 Q
+ w 39
j 450 330
+ p 21 D
+ w 47
j 410 290
+ p 14 VCC
+ w 56
j 450 350
+ p 21 CE
+ w 56
j 750 330
+ s 70
+ w 39
j 270 330
+ s 71
+ w 47
j 270 400
+ s 72
+ w 23
j 270 370
+ s 73
+ w 31
@attributes
@text
s 5 710 800 hln 100 23RD FEBRUARY 1995
s 5 760 750 hln 100 XC4000E FAMILY FDC MACRO
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
s 5 760 770 hln 100 D FLIP-FLOP WITH
s 5 760 780 hln 100 ASYNCHRONOUS CLEAR
s 5 30 820 hln 100 COPYRIGHT (C) 1995, XILINX INC.
s 5 30 810 hln 100 DRAWN BY KS
