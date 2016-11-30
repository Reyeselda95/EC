*version 6.3 351980601
u 101
XC4000E 314644822
U? 4
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
pageloc 1 0 1860 1
@status
*page 1 0 1100 850 iX
@ports
port 102 IF_IN 280 400 h
a 0 s 3 0 10 8 hln 80 LABEL=I1
port 103 IF_OUT 860 380 h
a 0 s 3 0 20 8 hln 80 LABEL=O
port 104 IF_IN 280 420 h
a 0 s 3 0 10 8 hln 80 LABEL=I0
port 105 IF_IN 280 340 h
a 0 s 3 0 10 8 hln 80 LABEL=I3
port 106 IF_IN 280 360 h
a 0 s 3 0 10 8 hln 80 LABEL=I2
@parts
part 16 AND2B2 450 400 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 40 hlt 100 PART=AND2B2
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 21 AND2 450 340 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U2
a 0 sp 11 0 10 40 hlt 100 PART=AND2
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 26 OR2 640 370 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U3
a 0 sp 11 0 10 40 hlt 100 PART=OR2
a 0 a 0 0 0 0 hln 100 PKGREF=U3
@conn
w 28
s 280 360 450 360 27
a 0 s 3 0 290 360 hln 100 LABEL=I2
w 36
s 280 420 450 420 35
a 0 s 3 0 290 420 hln 100 LABEL=I0
w 44
s 280 400 450 400 43
a 0 s 3 0 290 400 hln 100 LABEL=I1
w 52
s 720 380 860 380 51
a 0 s 3 0 840 380 hln 100 LABEL=O
w 60
s 280 340 450 340 59
a 0 s 3 0 290 340 hln 100 LABEL=I3
w 70
s 530 410 600 410 67
a 0 s 3 0 540 410 hln 100 LABEL=I0B1B
s 600 410 600 390 69
s 600 390 640 390 68
w 87
s 530 350 600 350 84
a 0 s 3 0 540 350 hln 100 LABEL=I23
s 600 370 600 350 86
s 600 370 640 370 85
@junction
j 450 360
+ p 21 I0
+ w 28
j 450 420
+ p 16 I0
+ w 36
j 450 400
+ p 16 I1
+ w 44
j 720 380
+ p 26 O
+ w 52
j 450 340
+ p 21 I1
+ w 60
j 530 410
+ p 16 O
+ w 70
j 640 390
+ p 26 I0
+ w 70
j 530 350
+ p 21 O
+ w 87
j 640 370
+ p 26 I1
+ w 87
j 280 400
+ s 102
+ w 44
j 860 380
+ s 103
+ w 52
j 280 420
+ s 104
+ w 36
j 280 340
+ s 105
+ w 60
j 280 360
+ s 106
+ w 28
@attributes
@text
s 5 750 770 hln 100 4-INPUT SUM-OF-PRODUCTS
s 5 950 820 hln 100 A
s 5 950 800 hln 100 1
s 5 710 800 hln 100 3RD MARCH 1995
s 5 750 750 hln 100 XC4000E FAMILY SOP4B2A MACRO
s 5 30 820 hln 100 COPYRIGHT (C) 1995, XILINX INC.
s 5 30 810 hln 100 DRAWN BY KS
