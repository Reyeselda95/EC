*version 6.3 76087032
u 87
XC5200 1370522216
U? 4
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
pageloc 1 0 1666 1
@status
*page 1 0 1100 850 iX
@ports
port 88 IF_OUT 810 350 h
a 0 s 3 0 20 8 hln 80 LABEL=Q
port 89 IF_IN 290 350 h
a 0 s 3 0 10 8 hln 80 LABEL=D
port 90 IF_IN 290 420 h
a 0 s 3 0 10 8 hln 80 LABEL=CLR
port 91 IF_IN 290 390 h
a 0 s 3 0 10 8 hln 80 LABEL=G
@parts
part 18 LDCE 510 350 h
a 0 sp 9 0 120 0 hrn 100 REFDES=U1
a 0 sp 11 0 60 20 hcn 200 PART=LDCE
a 0 u 13 13 20 140 hln 100 RLOC=R0C0
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 21 VCC 470 310 h
a 0 sp 0 0 40 0 hrn 100 REFDES=U2
a 0 sp 11 0 20 10 hcn 100 PART=VCC
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 25 INV 390 390 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U3
a 0 sp 11 0 30 14 hlt 100 PART=INV
a 0 a 0 0 0 0 hln 100 PKGREF=U3
@conn
w 27
s 290 350 510 350 26
a 0 s 3 0 300 350 hln 100 LABEL=D
w 35
s 290 420 510 420 34
a 0 s 3 0 300 420 hln 100 LABEL=CLR
w 43
s 630 350 810 350 42
a 0 s 3 0 790 350 hln 100 LABEL=Q
w 52
s 470 370 510 370 50
s 470 370 470 310 51
w 66
s 290 390 390 390 65
a 0 s 3 0 300 390 hln 100 LABEL=G
w 74
s 460 390 510 390 73
a 0 s 3 0 480 390 hln 100 LABEL=GB
@junction
j 510 350
+ p 18 D
+ w 27
j 510 420
+ p 18 CLR
+ w 35
j 630 350
+ p 18 Q
+ w 43
j 510 370
+ p 18 GE
+ w 52
j 470 310
+ p 21 VCC
+ w 52
j 390 390
+ p 25 I
+ w 66
j 510 390
+ p 18 G
+ w 74
j 460 390
+ p 25 O
+ w 74
j 810 350
+ s 88
+ w 43
j 290 350
+ s 89
+ w 27
j 290 420
+ s 90
+ w 35
j 290 390
+ s 91
+ w 66
@attributes
@text
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
s 5 750 750 hln 100 XC5200 FAMILY LDC_1 MACRO
s 5 750 770 hln 100 DATA LATCH WITH AN INVERTED
s 5 750 780 hln 100 CLOCK & AN ASYNCHRONOUS CLEAR
s 5 710 800 hln 100 13TH DECEMBER 1993
