*version 6.3 741119036
u 87
XC4000E 1404310498
U? 4
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
pageloc 1 0 1655 1
@status
*page 1 0 1100 850 iX
@ports
port 88 IF_IN 290 370 h
a 0 s 3 0 10 8 hln 80 LABEL=C
port 89 IF_OUT 810 330 h
a 0 s 3 0 20 8 hln 80 LABEL=Q
port 90 IF_IN 290 330 h
a 0 s 3 0 10 8 hln 80 LABEL=D
port 91 IF_IN 290 300 h
a 0 s 3 0 10 8 hln 80 LABEL=PRE
@parts
part 15 INV 390 370 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U1
a 0 sp 11 0 30 14 hlt 100 PART=INV
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 18 VCC 470 290 h
a 0 sp 0 0 40 0 hrn 100 REFDES=U2
a 0 sp 11 0 20 10 hcn 100 PART=VCC
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 25 FDPE 510 300 h
a 0 sp 9 0 120 0 hrn 100 REFDES=U3
a 0 sp 11 0 60 20 hcn 200 PART=FDPE
a 0 u 13 13 20 150 hln 100 RLOC=R0C0
a 0 a 0 0 0 0 hln 100 PKGREF=U3
@conn
w 27
s 460 370 510 370 26
a 0 s 3 0 480 370 hln 100 LABEL=CB
w 41
s 290 370 390 370 40
a 0 s 3 0 300 370 hln 100 LABEL=C
w 50
s 470 350 470 290 48
s 470 350 510 350 49
w 64
s 630 330 810 330 63
a 0 s 3 0 790 330 hln 100 LABEL=Q
w 72
s 290 330 510 330 71
a 0 s 3 0 300 330 hln 100 LABEL=D
w 80
s 290 300 510 300 79
a 0 s 3 0 300 300 hln 100 LABEL=PRE
@junction
j 460 370
+ p 15 O
+ w 27
j 510 370
+ p 25 C
+ w 27
j 390 370
+ p 15 I
+ w 41
j 470 290
+ p 18 VCC
+ w 50
j 510 350
+ p 25 CE
+ w 50
j 630 330
+ p 25 Q
+ w 64
j 510 330
+ p 25 D
+ w 72
j 510 300
+ p 25 PRE
+ w 80
j 290 370
+ s 88
+ w 41
j 810 330
+ s 89
+ w 64
j 290 330
+ s 90
+ w 72
j 290 300
+ s 91
+ w 80
@attributes
@text
s 5 950 820 hln 100 A
s 5 950 800 hln 100 1
s 5 750 750 hln 100 XC4000E FAMILY FDP_1 MACRO
s 5 750 770 hln 100 D FLIP-FLOP WITH AN INV CLK &
s 5 750 780 hln 100 ASYNCHRONOUS PRESET
s 5 710 800 hln 100 1ST MARCH 1995
s 5 30 820 hln 100 COPYRIGHT (C) 1995, XILINX INC.
s 5 30 810 hln 100 DRAWN BY KS
