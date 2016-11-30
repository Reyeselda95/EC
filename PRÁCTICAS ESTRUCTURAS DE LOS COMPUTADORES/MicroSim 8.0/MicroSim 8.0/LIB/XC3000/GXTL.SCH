*version 6.3 1000147507
u 37
XC3000 536016618
U? 3
@libraries
XC3000 [.slb]
@analysis
@targets
@attributes
a FAMILY=XC3000
a IMPL=XILINX
@translators
@index
pageloc 1 0 923 1
@status
*page 1 0 1100 850 iX
@ports
port 38 IF_OUT 770 350 v
a 0 s 3 0 20 8 hln 80 LABEL=O
@parts
part 14 OSC 440 350 h
a 0 sp 9 0 100 0 hrn 100 REFDES=U1
a 0 sp 11 0 20 20 hln 100 PART=OSC
a 0 u 13 13 90 130 hlt 100 @PULSEHI=@PULSEH
a 0 u 13 13 90 110 hlt 100 @PULSELO=@PULSEL
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 18 ACLK 570 360 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U2
a 0 sp 11 0 30 14 hlt 100 PART=ACLK
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 20
s 640 360 770 350 19
a 0 s 3 0 750 350 hln 100 LABEL=O
w 28
s 440 350 570 360 27
a 0 s 3 0 450 350 hln 100 LABEL=OSC_OUT
@junction
j 640 360
+ p 18 O
+ w 20
j 440 350
+ p 14 O
+ w 28
j 770 350
+ s 38
+ w 20
@attributes
@text
s 5 710 800 hln 100 12TH MAY 1993
s 5 750 770 hln 100 CRYSTAL OSCILLATOR W/ ACLK BUFFER
s 5 750 750 hln 100 XC3000 FAMILY GXTL MACRO
s 5 950 800 hln 100 1
s 5 30 810 hln 100 DRAWN BY KS
s 5 950 820 hln 100 A
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
