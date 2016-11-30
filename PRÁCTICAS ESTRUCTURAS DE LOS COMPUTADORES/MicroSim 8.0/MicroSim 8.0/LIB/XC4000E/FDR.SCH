*version 6.3 590021676
u 68
XC4000E 102118624
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
pageloc 1 0 1387 1
@status
*page 1 0 1100 850 iX
@ports
port 69 IF_IN 210 380 h
a 0 s 3 0 10 8 hln 80 LABEL=R
port 70 IF_OUT 880 370 h
a 0 s 3 0 20 8 hln 80 LABEL=Q
port 71 IF_IN 210 360 h
a 0 s 3 0 10 8 hln 80 LABEL=D
port 72 IF_IN 210 410 h
a 0 s 3 0 10 8 hln 80 LABEL=C
@parts
part 16 AND2B1 430 360 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 40 hlt 100 PART=AND2B1
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 21 FD 580 370 h
a 0 sp 9 0 120 0 hrn 100 REFDES=U2
a 0 sp 11 0 60 20 hcn 200 PART=FD
a 0 u 13 13 20 140 hln 100 RLOC=R0C0
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 23
s 510 370 580 370 22
a 0 s 3 0 530 370 hln 100 LABEL=D_R
w 37
s 210 410 580 410 36
a 0 s 3 0 220 410 hln 100 LABEL=C
w 45
s 210 360 430 360 44
a 0 s 3 0 220 360 hln 100 LABEL=D
w 53
s 700 370 880 370 52
a 0 s 3 0 860 370 hln 100 LABEL=Q
w 61
s 210 380 430 380 60
a 0 s 3 0 220 380 hln 100 LABEL=R
@junction
j 510 370
+ p 16 O
+ w 23
j 580 370
+ p 21 D
+ w 23
j 580 410
+ p 21 C
+ w 37
j 430 360
+ p 16 I1
+ w 45
j 700 370
+ p 21 Q
+ w 53
j 430 380
+ p 16 I0
+ w 61
j 210 380
+ s 69
+ w 61
j 880 370
+ s 70
+ w 53
j 210 360
+ s 71
+ w 45
j 210 410
+ s 72
+ w 37
@attributes
@text
s 5 760 750 hln 100 XC4000E FAMILY FDR MACRO
s 5 710 800 hln 100 24TH FEBRUARY 1995
s 5 950 820 hln 100 A
s 5 950 800 hln 100 1
s 5 760 770 hln 100 D FLIP-FLOP W/ SYNC RESET
s 5 30 820 hln 100 COPYRIGHT (C) 1995, XILINX INC.
s 5 30 810 hln 100 DRAWN BY KS
