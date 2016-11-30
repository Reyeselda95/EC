*version 6.3 224466856
u 50
XC4000 259855214
U? 5
@libraries
XC4000 [.slb]
@analysis
@targets
@attributes
a FAMILY=XC4000
a IMPL=XILINX
@translators
@setup
unconnectedPins 0
connectViaLabel 1
connectViaLocalLabels 0
NoStim4ExtIFPortsWarnings 1
AutoGenStim4ExtIFPorts 1
@index
pageloc 1 0 1534 1
@status
*page 1 0 1100 850 iX
@ports
port 51 INTERFACE 680 310 u
a 0 s 3 0 10 8 hln 80 LABEL=IO0
port 52 INTERFACE 680 340 u
a 0 s 3 0 10 8 hln 80 LABEL=IO1
port 53 INTERFACE 680 370 u
a 0 s 3 0 10 8 hln 80 LABEL=IO2
port 54 INTERFACE 680 400 u
a 0 s 3 0 10 8 hln 80 LABEL=IO3
@parts
part 14 IOPAD 480 310 h
a 0 sp 9 0 100 0 hrn 100 REFDES=U1
a 0 sp 11 0 0 0 hln 100 PART=IOPAD
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 15 IOPAD 480 340 h
a 0 sp 9 0 100 0 hrn 100 REFDES=U2
a 0 sp 11 0 0 0 hln 100 PART=IOPAD
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 16 IOPAD 480 370 h
a 0 sp 9 0 100 0 hrn 100 REFDES=U3
a 0 sp 11 0 0 0 hln 100 PART=IOPAD
a 0 a 0 0 0 0 hln 100 PKGREF=U3
part 17 IOPAD 480 400 h
a 0 sp 9 0 100 0 hrn 100 REFDES=U4
a 0 sp 11 0 0 0 hln 100 PART=IOPAD
a 0 a 0 0 0 0 hln 100 PKGREF=U4
@conn
w 19
s 480 370 680 370 18
a 0 s 3 0 640 370 hln 100 LABEL=IO2
w 27
s 480 400 680 400 26
a 0 s 3 0 640 400 hln 100 LABEL=IO3
w 35
s 480 340 680 340 34
a 0 s 3 0 640 340 hln 100 LABEL=IO1
w 43
s 480 310 680 310 42
a 0 s 3 0 640 310 hln 100 LABEL=IO0
@junction
j 480 370
+ p 16 IOPAD
+ w 19
j 480 400
+ p 17 IOPAD
+ w 27
j 480 340
+ p 15 IOPAD
+ w 35
j 480 310
+ p 14 IOPAD
+ w 43
j 680 310
+ s 51
+ w 43
j 680 340
+ s 52
+ w 35
j 680 370
+ s 53
+ w 19
j 680 400
+ s 54
+ w 27
@attributes
@text
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 950 820 hln 100 A
s 5 960 800 hrn 100 1
s 5 890 800 hrn 100 22ND FEBRUARY 1993
s 5 970 770 hrn 100 4-BIT INPUT-OUTPUT PAD
s 5 1010 750 hrn 100 XC4000 FAMILY IOPAD4 MACRO
