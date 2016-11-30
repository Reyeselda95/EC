*version 6.3 790164062
u 96
XC4000E 831086426
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
pageloc 1 0 1818 1
@status
*page 1 0 1100 850 iX
@ports
port 97 IF_IN 130 410 h
a 0 s 3 0 10 8 hln 80 LABEL=C
port 98 IF_IN 130 390 h
a 0 s 3 0 10 8 hln 80 LABEL=CE
port 99 IF_IN 130 440 h
a 0 s 3 0 10 8 hln 80 LABEL=CLR
port 100 IF_IN 130 360 h
a 0 s 3 0 10 8 hln 80 LABEL=T
port 101 IF_OUT 960 370 h
a 0 s 3 0 20 8 hln 80 LABEL=Q
@parts
part 16 XOR2 310 340 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 40 hlt 100 PART=XOR2
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 23 FDCE 640 370 h
a 0 sp 9 0 120 0 hrn 100 REFDES=U2
a 0 sp 11 0 60 20 hcn 200 PART=FDCE
a 0 u 13 13 20 140 hln 100 RLOC=R0C0
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 25
s 130 360 310 360 24
a 0 s 3 0 140 360 hln 100 LABEL=T
w 33
s 130 390 640 390 32
a 0 s 3 0 140 390 hln 100 LABEL=CE
w 46
s 790 370 960 370 40
a 0 s 3 0 940 370 hln 100 LABEL=Q
s 760 370 790 370 43
s 790 370 790 290 44
s 290 290 790 290 45
s 290 340 310 340 41
s 290 340 290 290 42
w 66
s 390 350 430 350 63
a 0 s 3 0 410 350 hln 100 LABEL=TQ
s 430 370 430 350 65
s 430 370 640 370 64
w 81
s 130 410 640 410 80
a 0 s 3 0 140 410 hln 100 LABEL=C
w 89
s 130 440 640 440 88
a 0 s 3 0 140 440 hln 100 LABEL=CLR
@junction
j 310 360
+ p 16 I0
+ w 25
j 640 390
+ p 23 CE
+ w 33
j 790 370
+ w 46
+ w 46
j 310 340
+ p 16 I1
+ w 46
j 760 370
+ p 23 Q
+ w 46
j 390 350
+ p 16 O
+ w 66
j 640 370
+ p 23 D
+ w 66
j 640 410
+ p 23 C
+ w 81
j 640 440
+ p 23 CLR
+ w 89
j 130 410
+ s 97
+ w 81
j 130 390
+ s 98
+ w 33
j 130 440
+ s 99
+ w 89
j 130 360
+ s 100
+ w 25
j 960 370
+ s 101
+ w 46
@attributes
@text
s 5 740 780 hln 100 ENABLE,CLOCK ENABLE AND ASYNC CLR
s 5 750 750 hln 100 XC4000E FAMILY FTCE MACRO
s 5 750 770 hln 100 TOGGLE FLIP-FLOP WITH TOGGLE
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
s 5 710 800 hln 100 23RD FEBRUARY 1995
s 5 30 820 hln 100 COPYRIGHT (C) 1995, XILINX INC.
s 5 30 810 hln 100 DRAWN BY KS
