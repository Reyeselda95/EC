*version 6.3 3998799343
u 129
XC5200 56396365
U? 9
@libraries
XC5200 [.slb]
@analysis
@targets
@attributes
a FAMILY=XC5200
a IMPL=XILINX
@translators
@setup
unconnectedPins 0
connectViaLabel 1
connectViaLocalLabels 0
NoStim4ExtIFPortsWarnings 1
AutoGenStim4ExtIFPorts 1
@index
pageloc 1 0 2755 1
@status
*page 1 0 1100 850 iX
@ports
port 130 IF_OUT 740 260 h
a 0 s 3 0 20 8 hln 50 LABEL=I[7:0]
@parts
part 14 IPAD 420 420 h
a 0 sp 9 0 90 0 hrn 100 REFDES=U1
a 0 sp 11 0 0 0 hln 100 PART=IPAD
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 15 IPAD 420 450 h
a 0 sp 9 0 90 0 hrn 100 REFDES=U2
a 0 sp 11 0 0 0 hln 100 PART=IPAD
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 16 IPAD 420 480 h
a 0 sp 9 0 90 0 hrn 100 REFDES=U3
a 0 sp 11 0 0 0 hln 100 PART=IPAD
a 0 a 0 0 0 0 hln 100 PKGREF=U3
part 17 IPAD 420 510 h
a 0 sp 9 0 90 0 hrn 100 REFDES=U4
a 0 sp 11 0 0 0 hln 100 PART=IPAD
a 0 a 0 0 0 0 hln 100 PKGREF=U4
part 18 IPAD 420 390 h
a 0 sp 9 0 90 0 hrn 100 REFDES=U5
a 0 sp 11 0 0 0 hln 100 PART=IPAD
a 0 a 0 0 0 0 hln 100 PKGREF=U5
part 19 IPAD 420 360 h
a 0 sp 9 0 90 0 hrn 100 REFDES=U6
a 0 sp 11 0 0 0 hln 100 PART=IPAD
a 0 a 0 0 0 0 hln 100 PKGREF=U6
part 20 IPAD 420 300 h
a 0 sp 9 0 90 0 hrn 100 REFDES=U7
a 0 sp 11 0 0 0 hln 100 PART=IPAD
a 0 a 0 0 0 0 hln 100 PKGREF=U7
part 21 IPAD 420 330 h
a 0 sp 9 0 90 0 hrn 100 REFDES=U8
a 0 sp 11 0 0 0 hln 100 PART=IPAD
a 0 a 0 0 0 0 hln 100 PKGREF=U8
@conn
b 31
s 630 260 740 260 22
a 0 s 3 0 680 250 hln 100 LABEL=I[7:0]
s 630 300 630 260 30
s 630 510 630 480 23
s 630 480 630 450 24
s 630 450 630 420 25
s 630 420 630 390 26
s 630 390 630 360 27
s 630 360 630 330 28
s 630 330 630 300 29
w 34
s 420 510 630 510 33
a 0 s 3 0 590 510 hln 100 LABEL=I[7]
s 630 510 630 510 35
w 43
s 420 480 630 480 42
a 0 s 3 0 590 480 hln 100 LABEL=I[6]
s 630 480 630 480 44
w 52
s 420 450 630 450 51
a 0 s 3 0 590 450 hln 100 LABEL=I[5]
s 630 450 630 450 53
w 61
s 420 420 630 420 60
a 0 s 3 0 590 420 hln 100 LABEL=I[4]
s 630 420 630 420 62
w 70
s 420 390 630 390 69
a 0 s 3 0 590 390 hln 100 LABEL=I[3]
s 630 390 630 390 71
w 79
s 420 360 630 360 78
a 0 s 3 0 590 360 hln 100 LABEL=I[2]
s 630 360 630 360 80
w 88
s 420 330 630 330 87
a 0 s 3 0 590 330 hln 100 LABEL=I[1]
s 630 330 630 330 89
w 97
s 420 300 630 300 96
a 0 s 3 0 590 300 hln 100 LABEL=I[0]
s 630 300 630 300 98
@junction
j 420 510
+ p 17 IPAD
+ w 34
j 420 480
+ p 16 IPAD
+ w 43
j 420 450
+ p 15 IPAD
+ w 52
j 420 420
+ p 14 IPAD
+ w 61
j 420 390
+ p 18 IPAD
+ w 70
j 420 360
+ p 19 IPAD
+ w 79
j 420 330
+ p 21 IPAD
+ w 88
j 420 300
+ p 20 IPAD
+ w 97
j 630 510
+ b 31
I[7]
+ w 34
j 630 480
+ b 31
I[6]
+ w 43
j 630 450
+ b 31
I[5]
+ w 52
j 630 420
+ b 31
I[4]
+ w 61
j 630 390
+ b 31
I[3]
+ w 70
j 630 360
+ b 31
I[2]
+ w 79
j 630 330
+ b 31
I[1]
+ w 88
j 630 300
+ b 31
I[0]
+ w 97
j 740 260
+ S 130
I[7]
I[6]
I[5]
I[4]
I[3]
I[2]
I[1]
I[0]
+ b 31
I[7]
I[6]
I[5]
I[4]
I[3]
I[2]
I[1]
I[0]
@attributes
@text
s 5 900 770 hrn 100 8-BIT INPUT PAD
s 5 1000 750 hrn 100 XC5200 FAMILY IPAD8 MACRO
s 5 960 800 hrn 100 1
s 5 950 820 hln 100 A
s 5 890 800 hrn 100 23RD FEBRUARY 1993
