*version 6.3 3943442579
u 95
XC4000E 3024437979
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
pageloc 1 0 1843 1
@status
*page 1 0 1100 850 iX
@ports
port 96 IF_IN 280 360 h
a 0 s 3 0 10 8 hln 80 LABEL=I2
port 97 IF_IN 280 340 h
a 0 s 3 0 10 8 hln 80 LABEL=I3
port 98 IF_IN 280 420 h
a 0 s 3 0 10 8 hln 80 LABEL=I0
port 99 IF_IN 280 400 h
a 0 s 3 0 10 8 hln 80 LABEL=I1
port 100 IF_OUT 860 380 h
a 0 s 3 0 20 8 hln 80 LABEL=O
@parts
part 16 OR2 640 370 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 40 hlt 100 PART=OR2
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 21 AND2 450 340 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U2
a 0 sp 11 0 10 40 hlt 100 PART=AND2
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 22 AND2 450 400 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U3
a 0 sp 11 0 10 40 hlt 100 PART=AND2
a 0 a 0 0 0 0 hln 100 PKGREF=U3
@conn
w 26
s 530 350 600 350 23
a 0 s 3 0 540 350 hln 100 LABEL=I23
s 600 370 600 350 24
s 600 370 640 370 25
w 42
s 530 410 600 410 39
a 0 s 3 0 540 410 hln 100 LABEL=I01
s 600 410 600 390 40
s 600 390 640 390 41
w 56
s 280 340 450 340 55
a 0 s 3 0 290 340 hln 100 LABEL=I3
w 64
s 720 380 860 380 63
a 0 s 3 0 840 380 hln 100 LABEL=O
w 72
s 280 400 450 400 71
a 0 s 3 0 290 400 hln 100 LABEL=I1
w 80
s 280 420 450 420 79
a 0 s 3 0 290 420 hln 100 LABEL=I0
w 88
s 280 360 450 360 87
a 0 s 3 0 290 360 hln 100 LABEL=I2
@junction
j 640 370
+ p 16 I1
+ w 26
j 530 350
+ p 21 O
+ w 26
j 640 390
+ p 16 I0
+ w 42
j 530 410
+ p 22 O
+ w 42
j 450 340
+ p 21 I1
+ w 56
j 720 380
+ p 16 O
+ w 64
j 450 400
+ p 22 I1
+ w 72
j 450 420
+ p 22 I0
+ w 80
j 450 360
+ p 21 I0
+ w 88
j 280 360
+ s 96
+ w 88
j 280 340
+ s 97
+ w 56
j 280 420
+ s 98
+ w 80
j 280 400
+ s 99
+ w 72
j 860 380
+ s 100
+ w 64
@attributes
@text
s 5 750 750 hln 100 XC4000E FAMILY SOP4 MACRO
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1995, XILINX INC.
s 5 710 800 hln 100 3RD MARCH 1995
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
s 5 750 770 hln 100 4-INPUT SUM-OF-PRODUCTS
