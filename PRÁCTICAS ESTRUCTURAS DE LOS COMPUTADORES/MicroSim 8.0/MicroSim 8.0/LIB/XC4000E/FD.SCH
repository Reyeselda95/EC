*version 6.3 81493017
u 79
XC4000E 798459381
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
pageloc 1 0 1420 1
@status
*page 1 0 1100 850 iX
@ports
port 80 IF_IN 250 380 h
a 0 s 3 0 10 8 hln 80 LABEL=C
port 81 IF_IN 250 340 h
a 0 s 3 0 10 8 hln 80 LABEL=D
port 82 IF_OUT 810 340 h
a 0 s 3 0 20 8 hln 80 LABEL=Q
@parts
part 14 VCC 440 320 h
a 0 sp 0 0 40 0 hrn 100 REFDES=U1
a 0 sp 11 0 20 10 hcn 100 PART=VCC
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 17 GND 440 440 h
a 0 sp 0 0 40 0 hrn 100 REFDES=U2
a 0 sp 11 0 5 40 hln 100 PART=GND
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 24 FDCE 470 340 h
a 0 sp 9 0 120 0 hrn 100 REFDES=U3
a 0 sp 11 0 60 20 hcn 200 PART=FDCE
a 0 u 13 13 20 140 hln 100 RLOC=R0C0
a 0 a 0 0 0 0 hln 100 PKGREF=U3
@conn
w 26
s 250 340 470 340 25
a 0 s 3 0 260 340 hln 100 LABEL=D
w 34
s 250 380 470 380 33
a 0 s 3 0 260 380 hln 100 LABEL=C
w 42
s 590 340 810 340 41
a 0 s 3 0 790 340 hln 100 LABEL=Q
w 51
s 440 360 470 360 49
s 440 360 440 320 50
w 66
s 440 440 440 410 64
s 440 410 470 410 65
@junction
j 470 340
+ p 24 D
+ w 26
j 470 380
+ p 24 C
+ w 34
j 590 340
+ p 24 Q
+ w 42
j 440 320
+ p 14 VCC
+ w 51
j 470 360
+ p 24 CE
+ w 51
j 440 440
+ p 17 GROUND
+ w 66
j 470 410
+ p 24 CLR
+ w 66
j 250 380
+ s 80
+ w 34
j 250 340
+ s 81
+ w 26
j 810 340
+ s 82
+ w 42
@attributes
@text
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1995, XILINX INC.
s 5 950 820 hln 100 A
s 5 950 800 hln 100 1
s 5 710 800 hln 100 23RD DECEMBER 1992
s 5 750 750 hln 100 XC4000E FAMILY FD MACRO
s 5 750 770 hln 100 D FLIP-FLOP
