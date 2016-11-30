*version 6.3 1302026048
u 77
XC4000E 470287130
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
pageloc 1 0 1524 1
@status
*page 1 0 1100 850 iX
@ports
port 78 IF_IN 270 370 h
a 0 s 3 0 10 8 hln 80 LABEL=CE
port 79 IF_IN 270 320 h
a 0 s 3 0 10 8 hln 80 LABEL=E
port 80 IF_OUT 880 350 h
a 0 s 3 0 20 8 hln 80 LABEL=O
port 81 IF_IN 270 390 h
a 0 s 3 0 10 8 hln 80 LABEL=C
port 82 IF_IN 270 350 h
a 0 s 3 0 10 8 hln 80 LABEL=D
@parts
part 15 INV 380 320 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U1
a 0 sp 11 0 30 14 hlt 100 PART=INV
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 22 OFDTX 500 320 h
a 0 sp 9 0 160 0 hrn 100 REFDES=U2
a 0 sp 11 0 80 20 hcn 200 PART=OFDTX
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 24
s 660 350 880 350 23
a 0 s 3 0 860 350 hln 100 LABEL=O
w 32
s 450 320 500 320 31
a 0 s 3 0 470 320 hln 100 LABEL=T
w 46
s 270 390 500 390 45
a 0 s 3 0 280 390 hln 100 LABEL=C
w 54
s 270 320 380 320 53
a 0 s 3 0 280 320 hln 100 LABEL=E
w 62
s 270 350 500 350 61
a 0 s 3 0 280 350 hln 100 LABEL=D
w 70
s 270 370 500 370 69
a 0 s 3 0 280 370 hln 100 LABEL=CE
@junction
j 660 350
+ p 22 O
+ w 24
j 450 320
+ p 15 O
+ w 32
j 500 320
+ p 22 T
+ w 32
j 500 390
+ p 22 C
+ w 46
j 380 320
+ p 15 I
+ w 54
j 500 350
+ p 22 D
+ w 62
j 500 370
+ p 22 CE
+ w 70
j 270 370
+ s 78
+ w 70
j 270 320
+ s 79
+ w 54
j 880 350
+ s 80
+ w 24
j 270 390
+ s 81
+ w 46
j 270 350
+ s 82
+ w 62
@attributes
@text
s 5 750 750 hln 100 XC4000E FAMILY OFDEX MACRO
s 5 30 820 hln 100 COPYRIGHT (C) 1995, XILINX INC.
s 5 750 770 hln 100 OUTPUT D FLIP-FLOP WITH AN
s 5 750 780 hln 100 ACTIVE HIGH ENABLE
s 5 950 820 hln 100 A
s 5 950 800 hln 100 1
s 5 710 800 hln 100 24TH FEBRUARY 1995
