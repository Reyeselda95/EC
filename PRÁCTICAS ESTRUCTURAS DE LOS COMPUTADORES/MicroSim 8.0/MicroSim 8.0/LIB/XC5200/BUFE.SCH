*version 6.3 224353330
u 59
XC5200 1308764260
U? 3
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
pageloc 1 0 1217 1
@status
*page 1 0 1100 850 iX
@ports
port 60 IF_OUT 810 340 h
a 0 s 3 0 20 8 hln 80 LABEL=O
port 61 IF_IN 290 340 h
a 0 s 3 0 10 8 hln 80 LABEL=I
port 62 IF_IN 290 320 h
a 0 s 3 0 10 8 hln 80 LABEL=E
@parts
part 16 BUFT 520 320 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U1
a 0 sp 11 0 30 34 hlt 100 PART=BUFT
a 0 u 13 13 0 60 hln 100 RLOC=R0C0
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 20 INV 400 320 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U2
a 0 sp 11 0 30 14 hlt 100 PART=INV
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 22
s 590 340 810 340 21
a 0 s 3 0 790 340 hln 100 LABEL=O
w 30
s 290 320 400 320 29
a 0 s 3 0 300 320 hln 100 LABEL=E
w 38
s 290 340 520 340 37
a 0 s 3 0 300 340 hln 100 LABEL=I
w 46
s 470 320 520 320 45
a 0 s 3 0 490 320 hln 100 LABEL=T
@junction
j 590 340
+ p 16 O
+ w 22
j 400 320
+ p 20 I
+ w 30
j 520 340
+ p 16 I
+ w 38
j 520 320
+ p 16 T
+ w 46
j 470 320
+ p 20 O
+ w 46
j 810 340
+ s 60
+ w 22
j 290 340
+ s 61
+ w 38
j 290 320
+ s 62
+ w 30
@attributes
@text
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 710 800 hln 100 3RD MARCH 1993
s 5 750 770 hln 100 3-STATE BUFFER W/ ACTIVE HIGH EN
s 5 750 750 hln 100 XC5200 FAMILY BUFE MACRO
s 5 950 820 hln 100 A
s 5 950 800 hln 100 1
