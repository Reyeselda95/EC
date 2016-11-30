*version 6.3 168268752
u 77
XC4000 817287725
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
pageloc 1 0 1614 1
@status
*page 1 0 1100 850 iX
@ports
port 78 IF_IN 290 350 h
a 0 s 3 0 10 8 hln 80 LABEL=D
port 79 IF_IN 290 390 h
a 0 s 3 0 10 8 hln 80 LABEL=C
port 80 IF_OUT 810 350 h
a 0 s 3 0 20 8 hln 80 LABEL=Q
port 81 IF_IN 290 420 h
a 0 s 3 0 10 8 hln 80 LABEL=CLR
port 82 IF_IN 290 370 h
a 0 s 3 0 10 8 hln 80 LABEL=CE
@parts
part 18 FDCE 510 350 h
a 0 sp 9 0 120 0 hrn 100 REFDES=U1
a 0 sp 11 0 60 20 hcn 200 PART=FDCE
a 0 u 13 13 20 140 hln 100 RLOC=R0C0
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 22 INV 390 390 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U2
a 0 sp 11 0 30 14 hlt 100 PART=INV
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 24
s 290 370 510 370 23
a 0 s 3 0 300 370 hln 100 LABEL=CE
w 32
s 290 350 510 350 31
a 0 s 3 0 300 350 hln 100 LABEL=D
w 40
s 290 390 390 390 39
a 0 s 3 0 300 390 hln 100 LABEL=C
w 48
s 630 350 810 350 47
a 0 s 3 0 790 350 hln 100 LABEL=Q
w 56
s 290 420 510 420 55
a 0 s 3 0 300 420 hln 100 LABEL=CLR
w 64
s 460 390 510 390 63
a 0 s 3 0 480 390 hln 100 LABEL=CB
@junction
j 510 370
+ p 18 CE
+ w 24
j 510 350
+ p 18 D
+ w 32
j 390 390
+ p 22 I
+ w 40
j 630 350
+ p 18 Q
+ w 48
j 510 420
+ p 18 CLR
+ w 56
j 510 390
+ p 18 C
+ w 64
j 460 390
+ p 22 O
+ w 64
j 290 350
+ s 78
+ w 32
j 290 390
+ s 79
+ w 40
j 810 350
+ s 80
+ w 48
j 290 420
+ s 81
+ w 56
j 290 370
+ s 82
+ w 24
@attributes
@text
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 750 780 hln 100 CLK ENABLE & AN ASYNCHRONOUS CLR
s 5 750 770 hln 100 D FLIP-FLOP WITH AN INVERTED CLK,
s 5 750 750 hln 100 XC4000 FAMILY FDCE_1 MACRO
s 5 950 820 hln 100 A
s 5 950 800 hln 100 1
s 5 710 800 hln 100 1ST MARCH 1993
