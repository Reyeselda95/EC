*version 6.3 40197900
u 50
XC4000E 111673518
U? 5
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
pageloc 1 0 1409 1
@status
*page 1 0 1100 850 iX
@ports
port 51 IF_OUT 670 400 h
a 0 s 3 0 20 8 hln 80 LABEL=I3
port 52 IF_OUT 670 370 h
a 0 s 3 0 20 8 hln 80 LABEL=I2
port 53 IF_OUT 670 340 h
a 0 s 3 0 20 8 hln 80 LABEL=I1
port 54 IF_OUT 670 310 h
a 0 s 3 0 20 8 hln 80 LABEL=I0
@parts
part 14 IPAD 470 310 h
a 0 sp 9 0 90 0 hrn 100 REFDES=U1
a 0 sp 11 0 0 0 hln 100 PART=IPAD
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 15 IPAD 470 340 h
a 0 sp 9 0 90 0 hrn 100 REFDES=U2
a 0 sp 11 0 0 0 hln 100 PART=IPAD
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 16 IPAD 470 370 h
a 0 sp 9 0 90 0 hrn 100 REFDES=U3
a 0 sp 11 0 0 0 hln 100 PART=IPAD
a 0 a 0 0 0 0 hln 100 PKGREF=U3
part 17 IPAD 470 400 h
a 0 sp 9 0 90 0 hrn 100 REFDES=U4
a 0 sp 11 0 0 0 hln 100 PART=IPAD
a 0 a 0 0 0 0 hln 100 PKGREF=U4
@conn
w 19
s 470 400 670 400 18
a 0 s 3 0 630 400 hln 100 LABEL=I3
w 27
s 470 370 670 370 26
a 0 s 3 0 630 370 hln 100 LABEL=I2
w 35
s 470 340 670 340 34
a 0 s 3 0 630 340 hln 100 LABEL=I1
w 43
s 470 310 670 310 42
a 0 s 3 0 630 310 hln 100 LABEL=I0
@junction
j 470 400
+ p 17 IPAD
+ w 19
j 470 370
+ p 16 IPAD
+ w 27
j 470 340
+ p 15 IPAD
+ w 35
j 470 310
+ p 14 IPAD
+ w 43
j 670 400
+ s 51
+ w 19
j 670 370
+ s 52
+ w 27
j 670 340
+ s 53
+ w 35
j 670 310
+ s 54
+ w 43
@attributes
@text
s 5 890 800 hrn 100 22ND FEBRUARY 1995
s 5 960 800 hrn 100 1
s 5 950 820 hln 100 A
s 5 1000 750 hrn 100 XC4000E FAMILY IPAD4 MACRO
s 5 900 770 hrn 100 4-BIT INPUT PAD
