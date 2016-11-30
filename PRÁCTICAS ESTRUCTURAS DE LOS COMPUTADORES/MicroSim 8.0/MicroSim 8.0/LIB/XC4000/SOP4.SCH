*version 6.3 1047117225
u 97
XC4000 908023790
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
pageloc 1 0 1846 1
@status
*page 1 0 1100 850 iX
@ports
port 98 IF_OUT 860 380 h
a 0 s 3 0 20 8 hln 80 LABEL=O
port 99 IF_IN 280 400 h
a 0 s 3 0 10 8 hln 80 LABEL=I1
port 100 IF_IN 280 420 h
a 0 s 3 0 10 8 hln 80 LABEL=I0
port 101 IF_IN 280 340 h
a 0 s 3 0 10 8 hln 80 LABEL=I3
port 102 IF_IN 280 360 h
a 0 s 3 0 10 8 hln 80 LABEL=I2
@parts
part 16 AND2 450 400 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 40 hlt 100 PART=AND2
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 17 AND2 450 340 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U2
a 0 sp 11 0 10 40 hlt 100 PART=AND2
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 22 OR2 640 370 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U3
a 0 sp 11 0 10 40 hlt 100 PART=OR2
a 0 a 0 0 0 0 hln 100 PKGREF=U3
@conn
w 24
s 280 360 450 360 23
a 0 s 3 0 290 360 hln 100 LABEL=I2
w 32
s 280 420 450 420 31
a 0 s 3 0 290 420 hln 100 LABEL=I0
w 40
s 280 400 450 400 39
a 0 s 3 0 290 400 hln 100 LABEL=I1
w 48
s 720 380 860 380 47
a 0 s 3 0 840 380 hln 100 LABEL=O
w 56
s 280 340 450 340 55
a 0 s 3 0 290 340 hln 100 LABEL=I3
w 66
s 530 410 600 410 63
a 0 s 3 0 540 410 hln 100 LABEL=I01
s 600 410 600 390 65
s 600 390 640 390 64
w 83
s 530 350 600 350 80
a 0 s 3 0 540 350 hln 100 LABEL=I23
s 600 370 600 350 82
s 600 370 640 370 81
@junction
j 450 360
+ p 17 I0
+ w 24
j 450 420
+ p 16 I0
+ w 32
j 450 400
+ p 16 I1
+ w 40
j 720 380
+ p 22 O
+ w 48
j 450 340
+ p 17 I1
+ w 56
j 530 410
+ p 16 O
+ w 66
j 640 390
+ p 22 I0
+ w 66
j 530 350
+ p 17 O
+ w 83
j 640 370
+ p 22 I1
+ w 83
j 860 380
+ s 98
+ w 48
j 280 400
+ s 99
+ w 40
j 280 420
+ s 100
+ w 32
j 280 340
+ s 101
+ w 56
j 280 360
+ s 102
+ w 24
@attributes
@text
s 5 750 770 hln 100 4-INPUT SUM-OF-PRODUCTS
s 5 950 820 hln 100 A
s 5 950 800 hln 100 1
s 5 710 800 hln 100 3RD MARCH 1993
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 30 810 hln 100 DRAWN BY KS
s 5 750 750 hln 100 XC4000 FAMILY SOP4 MACRO
