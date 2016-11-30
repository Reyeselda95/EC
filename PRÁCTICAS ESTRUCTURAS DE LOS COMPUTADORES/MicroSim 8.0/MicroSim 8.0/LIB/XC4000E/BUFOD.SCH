*version 6.3 142746410
u 32
XC4000E 1263403176
U? 2
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
pageloc 1 0 775 1
@status
*page 1 0 1100 850 iX
@ports
port 33 IF_IN 410 360 h
a 0 s 3 0 10 8 hln 80 LABEL=I
port 34 INTERFACE 720 360 u
a 0 s 3 0 10 8 hln 80 LABEL=O
@parts
part 15 WAND1 530 360 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U1
a 0 sp 11 0 40 14 hlt 100 PART=WAND1
a 0 a 0 0 0 0 hln 100 PKGREF=U1
@conn
w 17
s 600 360 720 360 16
a 0 s 3 0 700 360 hln 100 LABEL=O
w 25
s 410 360 530 360 24
a 0 s 3 0 420 360 hln 100 LABEL=I
@junction
j 600 360
+ p 15 O
+ w 17
j 530 360
+ p 15 I
+ w 25
j 410 360
+ s 33
+ w 25
j 720 360
+ s 34
+ w 17
@attributes
@text
s 5 710 800 hln 100 6TH APRIL 1995
s 5 950 820 hln 100 A
s 5 950 800 hln 100 1
s 5 750 770 hln 100 OPEN-DRAIN BUFFER
s 5 750 750 hln 100 XC4000E FAMILY BUFOD MACRO
s 5 30 820 hln 100 COPYRIGHT (C) 1995, XILINX INC.
s 5 30 810 hln 100 DRAWN BY KS
