*version 6.3 2804028665
u 83
XC5200 2797518703
U? 5
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
pageloc 1 0 2153 1
@status
*page 1 0 1100 850 iX
@ports
port 84 IF_OUT 770 380 h
a 0 s 3 0 20 8 hln 80 LABEL=O2
port 85 IF_OUT 770 320 h
a 0 s 3 0 20 8 hln 80 LABEL=O0
port 86 IF_IN 300 350 h
a 0 s 3 0 10 8 hln 80 LABEL=I1
port 87 IF_IN 300 380 h
a 0 s 3 0 10 8 hln 80 LABEL=I2
port 88 IF_OUT 770 410 h
a 0 s 3 0 20 8 hln 80 LABEL=O3
port 89 IF_IN 300 410 h
a 0 s 3 0 10 8 hln 80 LABEL=I3
port 90 IF_OUT 770 350 h
a 0 s 3 0 20 8 hln 80 LABEL=O1
port 91 IF_IN 300 320 h
a 0 s 3 0 10 8 hln 80 LABEL=I0
@parts
part 15 IBUF 500 410 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U1
a 0 sp 11 0 30 14 hlt 100 PART=IBUF
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 16 IBUF 500 380 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U2
a 0 sp 11 0 30 14 hlt 100 PART=IBUF
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 17 IBUF 500 350 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U3
a 0 sp 11 0 30 14 hlt 100 PART=IBUF
a 0 a 0 0 0 0 hln 100 PKGREF=U3
part 18 IBUF 500 320 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U4
a 0 sp 11 0 30 14 hlt 100 PART=IBUF
a 0 a 0 0 0 0 hln 100 PKGREF=U4
@conn
w 20
s 570 380 770 380 19
a 0 s 3 0 730 380 hln 100 LABEL=O2
w 28
s 570 410 770 410 27
a 0 s 3 0 730 410 hln 100 LABEL=O3
w 36
s 570 350 770 350 35
a 0 s 3 0 730 350 hln 100 LABEL=O1
w 44
s 300 320 500 320 43
a 0 s 3 0 310 320 hln 100 LABEL=I0
w 52
s 300 350 500 350 51
a 0 s 3 0 310 350 hln 100 LABEL=I1
w 60
s 300 380 500 380 59
a 0 s 3 0 310 380 hln 100 LABEL=I2
w 68
s 300 410 500 410 67
a 0 s 3 0 310 410 hln 100 LABEL=I3
w 76
s 570 320 770 320 75
a 0 s 3 0 730 320 hln 100 LABEL=O0
@junction
j 570 380
+ p 16 O
+ w 20
j 570 410
+ p 15 O
+ w 28
j 570 350
+ p 17 O
+ w 36
j 500 320
+ p 18 I
+ w 44
j 500 350
+ p 17 I
+ w 52
j 500 380
+ p 16 I
+ w 60
j 500 410
+ p 15 I
+ w 68
j 570 320
+ p 18 O
+ w 76
j 770 380
+ s 84
+ w 20
j 770 320
+ s 85
+ w 76
j 300 350
+ s 86
+ w 52
j 300 380
+ s 87
+ w 60
j 770 410
+ s 88
+ w 28
j 300 410
+ s 89
+ w 68
j 770 350
+ s 90
+ w 36
j 300 320
+ s 91
+ w 44
@attributes
@text
s 5 880 800 hrn 100 25TH JANUARY 1993
s 5 1010 750 hrn 100 XC5200 FAMILY IBUF4  MACRO
s 5 950 820 hln 100 A
s 5 960 800 hrn 100 1
s 5 930 770 hrn 100 4-BIT INPUT BUFFER
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 30 810 hln 100 DRAWN BY KS
