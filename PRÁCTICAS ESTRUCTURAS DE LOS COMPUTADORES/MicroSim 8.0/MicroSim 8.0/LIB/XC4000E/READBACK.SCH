*version 6.3 1907523560
u 52
XC4000E 219344340
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
pageloc 1 0 1276 1
@status
*page 1 0 1100 850 iX
@ports
port 53 IF_OUT 820 380 h
a 0 s 3 0 20 8 hln 50 LABEL=DATA
port 54 IF_IN 340 380 h
a 0 s 3 0 10 8 hln 50 LABEL=TRIG
port 55 IF_IN 340 280 h
a 0 s 3 0 10 8 hln 80 LABEL=CLK
port 56 IF_OUT 820 400 h
a 0 s 3 0 20 8 hln 80 LABEL=RIP
@parts
part 14 RDCLK 510 280 h
a 0 sp 9 0 140 0 hrn 100 REFDES=U1
a 0 sp 11 0 70 20 hcn 200 PART=RDCLK
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 19 RDBK 510 380 h
a 0 sp 9 0 140 0 hrn 100 REFDES=U2
a 0 sp 11 0 70 20 hcn 200 PART=RDBK
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 21
s 650 400 820 400 20
a 0 s 3 0 780 400 hln 100 LABEL=RIP
w 29
s 650 380 820 380 28
a 0 s 3 0 770 380 hln 100 LABEL=DATA
w 37
s 340 380 510 380 36
a 0 s 3 0 350 380 hln 100 LABEL=TRIG
w 45
s 340 280 510 280 44
a 0 s 3 0 350 280 hln 100 LABEL=CLK
@junction
j 650 400
+ p 19 RIP
+ w 21
j 650 380
+ p 19 DATA
+ w 29
j 510 380
+ p 19 TRIG
+ w 37
j 510 280
+ p 14 I
+ w 45
j 820 380
+ s 53
+ w 29
j 340 380
+ s 54
+ w 37
j 340 280
+ s 55
+ w 45
j 820 400
+ s 56
+ w 21
@attributes
@text
s 5 710 800 hln 100 29TH MARCH 1995
s 5 750 770 hln 100 LCA BITSTREAM READBACK CONTROLLER
s 5 750 750 hln 100 XC4000E FAMILY READBACK MACRO
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1995, XILINX INC.
s 5 950 820 hln 100 A
s 5 950 800 hln 100 1
