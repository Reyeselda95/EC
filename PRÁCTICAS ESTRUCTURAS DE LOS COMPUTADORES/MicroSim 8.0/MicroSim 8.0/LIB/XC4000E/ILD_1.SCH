*version 6.3 853775227
u 60
XC4000E 1092659476
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
pageloc 1 0 1160 1
@status
*page 1 0 1100 850 iX
@ports
port 61 IF_IN 250 340 h
a 0 s 3 0 10 8 hln 80 LABEL=D
port 62 IF_IN 250 380 h
a 0 s 3 0 10 8 hln 80 LABEL=G
port 63 IF_OUT 810 340 h
a 0 s 3 0 20 8 hln 80 LABEL=Q
@parts
part 14 VCC 440 320 h
a 0 sp 0 0 40 0 hrn 100 REFDES=U1
a 0 sp 11 0 20 10 hcn 100 PART=VCC
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 20 ILDX_1 470 340 h
a 0 sp 9 0 120 0 hrn 100 REFDES=U2
a 0 sp 11 0 60 20 hcn 200 PART=ILDX_1
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 22
s 250 340 470 340 21
a 0 s 3 0 260 340 hln 100 LABEL=D
w 30
s 250 380 470 380 29
a 0 s 3 0 260 380 hln 100 LABEL=G
w 38
s 590 340 810 340 37
a 0 s 3 0 790 340 hln 100 LABEL=Q
w 47
s 440 360 470 360 45
s 440 360 440 320 46
@junction
j 470 340
+ p 20 D
+ w 22
j 470 380
+ p 20 G
+ w 30
j 590 340
+ p 20 Q
+ w 38
j 440 320
+ p 14 VCC
+ w 47
j 470 360
+ p 20 GE
+ w 47
j 250 340
+ s 61
+ w 22
j 250 380
+ s 62
+ w 30
j 810 340
+ s 63
+ w 38
@attributes
@text
s 5 750 750 hln 100 XC4000E FAMILY OFD MACRO
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1995, XILINX INC.
s 5 950 820 hln 100 A
s 5 950 800 hln 100 1
s 5 710 800 hln 100 23RD DECEMBER 1992
s 5 750 770 hln 100 D FLIP-FLOP
