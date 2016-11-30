*version 6.3 314187198
u 77
XC4000 1464638818
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
pageloc 1 0 1609 1
@status
*page 1 0 1100 850 iX
@ports
port 78 IF_OUT 810 330 h
a 0 s 3 0 20 8 hln 80 LABEL=Q
port 79 IF_IN 290 300 h
a 0 s 3 0 10 8 hln 80 LABEL=PRE
port 80 IF_IN 290 330 h
a 0 s 3 0 10 8 hln 80 LABEL=D
port 81 IF_IN 290 350 h
a 0 s 3 0 10 8 hln 80 LABEL=CE
port 82 IF_IN 290 370 h
a 0 s 3 0 10 8 hln 80 LABEL=C
@parts
part 18 FDPE 510 300 h
a 0 sp 9 0 120 0 hrn 100 REFDES=U1
a 0 sp 11 0 60 10 hcn 200 PART=FDPE
a 0 u 13 13 20 140 hln 100 RLOC=R0C0
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 22 INV 390 370 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U2
a 0 sp 11 0 30 14 hlt 100 PART=INV
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 24
s 290 350 510 350 23
a 0 s 3 0 300 350 hln 100 LABEL=CE
w 32
s 290 330 510 330 31
a 0 s 3 0 300 330 hln 100 LABEL=D
w 40
s 460 370 510 370 39
a 0 s 3 0 480 370 hln 100 LABEL=CB
w 54
s 290 370 390 370 53
a 0 s 3 0 300 370 hln 100 LABEL=C
w 62
s 630 330 810 330 61
a 0 s 3 0 790 330 hln 100 LABEL=Q
w 70
s 290 300 510 300 69
a 0 s 3 0 300 300 hln 100 LABEL=PRE
@junction
j 510 350
+ p 18 CE
+ w 24
j 510 330
+ p 18 D
+ w 32
j 510 370
+ p 18 C
+ w 40
j 460 370
+ p 22 O
+ w 40
j 390 370
+ p 22 I
+ w 54
j 630 330
+ p 18 Q
+ w 62
j 510 300
+ p 18 PRE
+ w 70
j 810 330
+ s 78
+ w 62
j 290 300
+ s 79
+ w 70
j 290 330
+ s 80
+ w 32
j 290 350
+ s 81
+ w 24
j 290 370
+ s 82
+ w 54
@attributes
@text
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 750 780 hln 100 CLK ENABLE & ASYNCHRONOUS PRESET
s 5 750 770 hln 100 D FLIP-FLOP WITH AN INV CLK,
s 5 750 750 hln 100 XC4000 FAMILY FDPE_1 MACRO
s 5 950 820 hln 100 A
s 5 950 800 hln 100 1
s 5 710 800 hln 100 1ST MARCH 1993
