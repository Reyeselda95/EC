*version 6.3 1766803332
u 77
XC5200 1703610
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
pageloc 1 0 1613 1
@status
*page 1 0 1100 850 iX
@ports
port 78 IF_IN 220 320 h
a 0 s 3 0 10 8 hln 80 LABEL=S
port 79 IF_IN 220 360 h
a 0 s 3 0 10 8 hln 80 LABEL=R
port 80 IF_OUT 890 350 h
a 0 s 3 0 20 8 hln 80 LABEL=Q
port 81 IF_IN 220 340 h
a 0 s 3 0 10 8 hln 80 LABEL=D
port 82 IF_IN 220 390 h
a 0 s 3 0 10 8 hln 80 LABEL=C
@parts
part 16 AND2B1 440 340 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 40 hlt 100 PART=AND2B1
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 22 FDS 590 320 h
a 0 sp 9 0 120 0 hrn 100 REFDES=U2
a 0 sp 11 0 60 10 hcn 200 PART=FDS
a 0 u 13 13 20 140 hln 100 RLOC=R0C0
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 24
s 220 390 590 390 23
a 0 s 3 0 230 390 hln 100 LABEL=C
w 32
s 710 350 890 350 31
a 0 s 3 0 870 350 hln 100 LABEL=Q
w 40
s 220 360 440 360 39
a 0 s 3 0 230 360 hln 100 LABEL=R
w 48
s 220 340 440 340 47
a 0 s 3 0 230 340 hln 100 LABEL=D
w 56
s 220 320 590 320 55
a 0 s 3 0 230 320 hln 100 LABEL=S
w 64
s 520 350 590 350 63
a 0 s 3 0 540 350 hln 100 LABEL=D_R
@junction
j 590 390
+ p 22 C
+ w 24
j 710 350
+ p 22 Q
+ w 32
j 440 360
+ p 16 I0
+ w 40
j 440 340
+ p 16 I1
+ w 48
j 590 320
+ p 22 S
+ w 56
j 520 350
+ p 16 O
+ w 64
j 590 350
+ p 22 D
+ w 64
j 220 320
+ s 78
+ w 56
j 220 360
+ s 79
+ w 40
j 890 350
+ s 80
+ w 32
j 220 340
+ s 81
+ w 48
j 220 390
+ s 82
+ w 24
@attributes
@text
s 5 760 770 hln 100 D FLIP-FLOP W/ SYNC SET & RESET
s 5 760 750 hln 100 XC5200 FAMILY FDSR MACRO
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
s 5 710 800 hln 100 24TH FEBRUARY 1993
s 5 740 780 hln 100 (SET TAKES PRECEDENCE OVER RESET)
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 30 810 hln 100 DRAWN BY KS
