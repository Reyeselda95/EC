*version 6.3 770230140
u 101
XC4000 570530310
U? 4
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
pageloc 1 0 1857 1
@status
*page 1 0 1100 850 iX
@ports
port 102 IF_IN 280 420 h
a 0 s 3 0 10 8 hln 80 LABEL=I0
port 103 IF_IN 280 400 h
a 0 s 3 0 10 8 hln 80 LABEL=I1
port 104 IF_IN 280 360 h
a 0 s 3 0 10 8 hln 80 LABEL=I2
port 105 IF_IN 280 340 h
a 0 s 3 0 10 8 hln 80 LABEL=I3
port 106 IF_OUT 860 380 h
a 0 s 3 0 20 8 hln 80 LABEL=O
@parts
part 16 AND2 450 340 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 40 hlt 100 PART=AND2
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 21 OR2 640 370 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U2
a 0 sp 11 0 10 40 hlt 100 PART=OR2
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 26 AND2B1 450 400 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U3
a 0 sp 11 0 10 40 hlt 100 PART=AND2B1
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
w 54
s 530 410 600 410 51
a 0 s 3 0 560 410 hln 100 LABEL=I0B1
s 600 410 600 390 53
s 600 390 640 390 52
w 71
s 530 350 600 350 68
a 0 s 3 0 560 350 hln 100 LABEL=I23
s 600 370 600 350 70
s 600 370 640 370 69
w 86
s 720 380 860 380 85
a 0 s 3 0 840 380 hln 100 LABEL=O
w 94
s 280 340 450 340 93
a 0 s 3 0 290 340 hln 100 LABEL=I3
@junction
j 450 360
+ p 16 I0
+ w 28
j 450 420
+ p 26 I0
+ w 36
j 450 400
+ p 26 I1
+ w 44
j 640 390
+ p 21 I0
+ w 54
j 530 410
+ p 26 O
+ w 54
j 530 350
+ p 16 O
+ w 71
j 640 370
+ p 21 I1
+ w 71
j 720 380
+ p 21 O
+ w 86
j 450 340
+ p 16 I1
+ w 94
j 280 420
+ s 102
+ w 36
j 280 400
+ s 103
+ w 44
j 280 360
+ s 104
+ w 28
j 280 340
+ s 105
+ w 94
j 860 380
+ s 106
+ w 86
@attributes
@text
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 750 750 hln 100 XC4000 FAMILY SOP4B1 MACRO
s 5 750 770 hln 100 4-INPUT SUM-OF-PRODUCTS
s 5 950 820 hln 100 A
s 5 950 800 hln 100 1
s 5 710 800 hln 100 1ST MARCH 1993
