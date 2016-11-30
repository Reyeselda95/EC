*version 6.3 469299901
u 68
XC4000 992378768
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
pageloc 1 0 1378 1
@status
*page 1 0 1100 850 iX
@ports
port 69 IF_IN 210 380 h
a 0 s 3 0 10 8 hln 80 LABEL=S
port 70 IF_OUT 880 370 h
a 0 s 3 0 20 8 hln 80 LABEL=Q
port 71 IF_IN 210 360 h
a 0 s 3 0 10 8 hln 80 LABEL=D
port 72 IF_IN 210 410 h
a 0 s 3 0 10 8 hln 80 LABEL=C
@parts
part 16 FD 580 370 h
a 0 sp 9 0 120 0 hrn 100 REFDES=U1
a 0 sp 11 0 60 20 hcn 200 PART=FD
a 0 u 13 13 20 140 hln 100 RLOC=R0C0
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 21 OR2 430 360 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U2
a 0 sp 11 0 10 40 hlt 100 PART=OR2
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 23
s 510 370 580 370 22
a 0 s 3 0 530 370 hln 100 LABEL=D_S
w 37
s 210 410 580 410 36
a 0 s 3 0 220 410 hln 100 LABEL=C
w 45
s 210 380 430 380 44
a 0 s 3 0 220 380 hln 100 LABEL=S
w 53
s 210 360 430 360 52
a 0 s 3 0 220 360 hln 100 LABEL=D
w 61
s 700 370 880 370 60
a 0 s 3 0 860 370 hln 100 LABEL=Q
@junction
j 580 370
+ p 16 D
+ w 23
j 510 370
+ p 21 O
+ w 23
j 580 410
+ p 16 C
+ w 37
j 430 380
+ p 21 I0
+ w 45
j 430 360
+ p 21 I1
+ w 53
j 700 370
+ p 16 Q
+ w 61
j 210 380
+ s 69
+ w 45
j 880 370
+ s 70
+ w 61
j 210 360
+ s 71
+ w 53
j 210 410
+ s 72
+ w 37
@attributes
@text
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 710 800 hln 100 24TH FEBRUARY 1993
s 5 760 770 hln 100 D FLIP-FLOP W/ SYNC SET
s 5 760 750 hln 100 XC4000 FAMILY FDS MACRO
s 5 950 820 hln 100 A
s 5 950 800 hln 100 1
