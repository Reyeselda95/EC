*version 6.3 3349747965
u 127
XC4000 733703202
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
pageloc 1 0 2676 1
@status
*page 1 0 850 1100 iX
@ports
port 128 IF_OUT 640 390 h
a 0 s 3 0 20 8 hln 80 LABEL=Q1
port 129 IF_OUT 640 500 h
a 0 s 3 0 20 8 hln 80 LABEL=Q2
port 130 IF_OUT 640 610 h
a 0 s 3 0 20 8 hln 80 LABEL=Q3
port 131 IF_IN 180 610 h
a 0 s 3 0 10 8 hln 80 LABEL=D3
port 132 IF_IN 180 500 h
a 0 s 3 0 10 8 hln 80 LABEL=D2
port 133 IF_IN 180 390 h
a 0 s 3 0 10 8 hln 80 LABEL=D1
port 134 IF_IN 180 280 h
a 0 s 3 0 10 8 hln 80 LABEL=D0
port 135 IF_OUT 640 280 h
a 0 s 3 0 20 8 hln 80 LABEL=Q0
port 136 IF_IN 180 690 h
a 0 s 3 0 10 8 hln 80 LABEL=C
@parts
part 16 OFD 350 610 h
a 0 sp 9 0 80 100 hrn 100 REFDES=U1
a 0 sp 11 0 60 20 hcn 200 PART=OFD
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 17 OFD 350 500 h
a 0 sp 9 0 80 100 hrn 100 REFDES=U2
a 0 sp 11 0 60 20 hcn 200 PART=OFD
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 18 OFD 350 390 h
a 0 sp 9 0 80 100 hrn 100 REFDES=U3
a 0 sp 11 0 60 20 hcn 200 PART=OFD
a 0 a 0 0 0 0 hln 100 PKGREF=U3
part 19 OFD 350 280 h
a 0 sp 9 0 80 100 hrn 100 REFDES=U4
a 0 sp 11 0 60 20 hcn 200 PART=OFD
a 0 a 0 0 0 0 hln 100 PKGREF=U4
@conn
w 21
s 180 500 350 500 20
a 0 s 3 0 190 500 hln 100 LABEL=D2
w 29
s 180 390 350 390 28
a 0 s 3 0 190 390 hln 100 LABEL=D1
w 37
s 180 280 350 280 36
a 0 s 3 0 190 280 hln 100 LABEL=D0
w 45
s 180 610 350 610 44
a 0 s 3 0 190 610 hln 100 LABEL=D3
w 61
s 180 690 310 690 52
a 0 s 3 0 190 690 hln 100 LABEL=C
s 310 690 310 650 53
s 310 650 350 650 54
s 310 650 310 540 55
s 310 540 350 540 56
s 310 540 310 430 57
s 310 430 350 430 58
s 310 430 310 320 59
s 310 320 350 320 60
w 96
s 470 390 640 390 95
a 0 s 3 0 590 390 hln 100 LABEL=Q1
w 104
s 470 280 640 280 103
a 0 s 3 0 590 280 hln 100 LABEL=Q0
w 112
s 470 500 640 500 111
a 0 s 3 0 590 500 hln 100 LABEL=Q2
w 120
s 470 610 640 610 119
a 0 s 3 0 590 610 hln 100 LABEL=Q3
@junction
j 350 500
+ p 17 D
+ w 21
j 350 390
+ p 18 D
+ w 29
j 350 280
+ p 19 D
+ w 37
j 350 610
+ p 16 D
+ w 45
j 310 650
+ w 61
+ w 61
j 310 540
+ w 61
+ w 61
j 310 430
+ w 61
+ w 61
j 350 650
+ p 16 C
+ w 61
j 350 540
+ p 17 C
+ w 61
j 350 430
+ p 18 C
+ w 61
j 350 320
+ p 19 C
+ w 61
j 470 390
+ p 18 Q
+ w 96
j 470 280
+ p 19 Q
+ w 104
j 470 500
+ p 17 Q
+ w 112
j 470 610
+ p 16 Q
+ w 120
j 640 390
+ s 128
+ w 96
j 640 500
+ s 129
+ w 112
j 640 610
+ s 130
+ w 120
j 180 610
+ s 131
+ w 45
j 180 500
+ s 132
+ w 21
j 180 390
+ s 133
+ w 29
j 180 280
+ s 134
+ w 37
j 640 280
+ s 135
+ w 104
j 180 690
+ s 136
+ w 61
@attributes
@text
s 5 30 1060 hln 100 DRAWN BY KS
s 5 30 1070 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 760 1000 hrn 100 XC4000 FAMILY OFD4  MACRO
s 5 630 1050 hrn 100 26TH JANUARY 1993
s 5 750 1020 hrn 100 4-BIT OUTPUT D FLIP-FLOP
s 5 710 1050 hrn 100 1
s 5 700 1070 hln 100 A
