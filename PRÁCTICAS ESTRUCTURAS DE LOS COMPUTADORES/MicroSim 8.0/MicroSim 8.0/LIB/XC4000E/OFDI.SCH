*version 6.3 459140066
u 60
XC4000E 1437590
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
pageloc 1 0 1172 1
@status
*page 1 0 1100 850 iX
@ports
port 61 IF_OUT 810 340 h
a 0 s 3 0 20 8 hln 80 LABEL=Q
port 62 IF_IN 250 340 h
a 0 s 3 0 10 8 hln 80 LABEL=D
port 63 IF_IN 250 380 h
a 0 s 3 0 10 8 hln 80 LABEL=C
@parts
part 14 VCC 440 320 h
a 0 sp 0 0 40 0 hrn 100 REFDES=U1
a 0 sp 11 0 20 10 hcn 100 PART=VCC
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 20 OFDXI 470 340 h
a 0 sp 9 0 120 0 hrn 100 REFDES=U2
a 0 sp 11 0 60 20 hcn 200 PART=OFDXI
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 23
s 440 360 440 320 21
s 440 360 470 360 22
w 37
s 590 340 810 340 36
a 0 s 3 0 790 340 hln 100 LABEL=Q
w 45
s 250 380 470 380 44
a 0 s 3 0 260 380 hln 100 LABEL=C
w 53
s 250 340 470 340 52
a 0 s 3 0 260 340 hln 100 LABEL=D
@junction
j 440 320
+ p 14 VCC
+ w 23
j 470 360
+ p 20 CE
+ w 23
j 590 340
+ p 20 Q
+ w 37
j 470 380
+ p 20 C
+ w 45
j 470 340
+ p 20 D
+ w 53
j 810 340
+ s 61
+ w 37
j 250 340
+ s 62
+ w 53
j 250 380
+ s 63
+ w 45
@attributes
@text
s 5 710 800 hln 100 23RD DECEMBER 1992
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
s 5 30 820 hln 100 COPYRIGHT (C) 1995, XILINX INC.
s 5 30 810 hln 100 DRAWN BY KS
s 5 750 750 hln 100 XC4000E FAMILY OFDI MACRO
s 5 750 770 hln 100 OUT BUF WITH D FLIP-FLOP
