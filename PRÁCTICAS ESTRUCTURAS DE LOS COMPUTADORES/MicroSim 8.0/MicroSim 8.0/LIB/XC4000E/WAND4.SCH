*version 6.3 3854005457
u 95
XC4000E 92337641
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
pageloc 1 0 1966 1
@status
*page 1 0 850 1100 iX
@ports
port 96 INTERFACE 650 430 u
a 0 s 3 0 10 8 hln 80 LABEL=O
port 97 IF_IN 220 430 h
a 0 s 3 0 10 8 hln 80 LABEL=I0
port 98 IF_IN 220 550 h
a 0 s 3 0 10 8 hln 80 LABEL=I3
port 99 IF_IN 220 510 h
a 0 s 3 0 10 8 hln 80 LABEL=I2
port 100 IF_IN 220 470 h
a 0 s 3 0 10 8 hln 80 LABEL=I1
@parts
part 15 WAND1 340 550 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U1
a 0 sp 11 0 40 14 hlt 100 PART=WAND1
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 16 WAND1 340 510 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U2
a 0 sp 11 0 40 14 hlt 100 PART=WAND1
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 17 WAND1 340 470 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U3
a 0 sp 11 0 40 14 hlt 100 PART=WAND1
a 0 a 0 0 0 0 hln 100 PKGREF=U3
part 18 WAND1 340 430 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U4
a 0 sp 11 0 40 14 hlt 100 PART=WAND1
a 0 a 0 0 0 0 hln 100 PKGREF=U4
@conn
w 20
s 220 510 340 510 19
a 0 s 3 0 230 510 hln 100 LABEL=I2
w 28
s 220 470 340 470 27
a 0 s 3 0 230 470 hln 100 LABEL=I1
w 43
s 530 430 650 430 35
a 0 s 3 0 630 430 hln 100 LABEL=O
s 410 430 530 430 38
s 530 470 530 430 39
s 410 470 530 470 37
s 530 510 530 470 40
s 410 510 530 510 36
s 530 550 530 510 41
s 410 550 530 550 42
w 80
s 220 430 340 430 79
a 0 s 3 0 230 430 hln 100 LABEL=I0
w 88
s 220 550 340 550 87
a 0 s 3 0 230 550 hln 100 LABEL=I3
@junction
j 340 510
+ p 16 I
+ w 20
j 340 470
+ p 17 I
+ w 28
j 530 430
+ w 43
+ w 43
j 530 470
+ w 43
+ w 43
j 530 510
+ w 43
+ w 43
j 410 550
+ p 15 O
+ w 43
j 410 510
+ p 16 O
+ w 43
j 410 470
+ p 17 O
+ w 43
j 410 430
+ p 18 O
+ w 43
j 340 430
+ p 18 I
+ w 80
j 340 550
+ p 15 I
+ w 88
j 650 430
+ s 96
+ w 43
j 220 430
+ s 97
+ w 80
j 220 550
+ s 98
+ w 88
j 220 510
+ s 99
+ w 20
j 220 470
+ s 100
+ w 28
@attributes
@text
s 5 470 1050 hln 100 27TH JANUARY 1995
s 5 710 1070 hln 100 A
s 5 710 1050 hln 100 1
s 5 510 1000 hln 100 XC4000E FAMILY  WAND4 MACRO
s 5 510 1020 hln 100 4-INPUT WIRED-AND
s 5 30 1070 hln 100 COPYRIGHT (C) 1995, XILINX INC.
s 5 30 1060 hln 100 DRAWN BY KS
