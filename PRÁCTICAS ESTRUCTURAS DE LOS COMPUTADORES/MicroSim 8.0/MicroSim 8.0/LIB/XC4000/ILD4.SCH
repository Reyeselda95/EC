*version 6.3 830087491
u 131
XC4000 1965633868
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
pageloc 1 0 2710 1
@status
*page 1 0 850 1100 iX
@ports
port 132 IF_IN 180 690 h
a 0 s 3 0 10 8 hln 80 LABEL=G
port 133 IF_IN 180 280 h
a 0 s 3 0 10 8 hln 80 LABEL=D0
port 134 IF_OUT 640 280 h
a 0 s 3 0 20 8 hln 80 LABEL=Q0
port 135 IF_OUT 640 390 h
a 0 s 3 0 20 8 hln 80 LABEL=Q1
port 136 IF_OUT 640 500 h
a 0 s 3 0 20 8 hln 80 LABEL=Q2
port 137 IF_OUT 640 610 h
a 0 s 3 0 20 8 hln 80 LABEL=Q3
port 138 IF_IN 180 610 h
a 0 s 3 0 10 8 hln 80 LABEL=D3
port 139 IF_IN 180 500 h
a 0 s 3 0 10 8 hln 80 LABEL=D2
port 140 IF_IN 180 390 h
a 0 s 3 0 10 8 hln 80 LABEL=D1
@parts
part 16 ILD 350 610 h
a 0 sp 9 0 80 100 hrn 100 REFDES=U1
a 0 sp 11 0 60 20 hcn 200 PART=ILD
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 17 ILD 350 500 h
a 0 sp 9 0 80 100 hrn 100 REFDES=U2
a 0 sp 11 0 60 20 hcn 200 PART=ILD
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 18 ILD 350 390 h
a 0 sp 9 0 80 100 hrn 100 REFDES=U3
a 0 sp 11 0 60 20 hcn 200 PART=ILD
a 0 a 0 0 0 0 hln 100 PKGREF=U3
part 19 ILD 350 280 h
a 0 sp 9 0 80 100 hrn 100 REFDES=U4
a 0 sp 11 0 60 20 hcn 200 PART=ILD
a 0 a 0 0 0 0 hln 100 PKGREF=U4
@conn
w 21
s 180 500 350 500 20
a 0 s 3 0 190 500 hln 100 LABEL=D2
w 29
s 180 390 350 390 28
a 0 s 3 0 190 390 hln 100 LABEL=D1
w 37
s 180 610 350 610 36
a 0 s 3 0 190 610 hln 100 LABEL=D3
w 53
s 180 690 310 690 44
a 0 s 3 0 190 690 hln 100 LABEL=G
s 310 690 310 650 52
s 310 650 350 650 45
s 310 650 310 540 51
s 310 540 350 540 46
s 310 540 310 430 50
s 310 430 350 430 47
s 310 430 310 320 49
s 310 320 350 320 48
w 92
s 470 390 640 390 91
a 0 s 3 0 590 390 hln 100 LABEL=Q1
w 100
s 470 280 640 280 99
a 0 s 3 0 590 280 hln 100 LABEL=Q0
w 108
s 470 500 640 500 107
a 0 s 3 0 590 500 hln 100 LABEL=Q2
w 116
s 470 610 640 610 115
a 0 s 3 0 590 610 hln 100 LABEL=Q3
w 124
s 180 280 350 280 123
a 0 s 3 0 190 280 hln 100 LABEL=D0
@junction
j 350 500
+ p 17 D
+ w 21
j 350 390
+ p 18 D
+ w 29
j 350 610
+ p 16 D
+ w 37
j 310 650
+ w 53
+ w 53
j 310 540
+ w 53
+ w 53
j 310 430
+ w 53
+ w 53
j 350 650
+ p 16 G
+ w 53
j 350 540
+ p 17 G
+ w 53
j 350 430
+ p 18 G
+ w 53
j 350 320
+ p 19 G
+ w 53
j 470 390
+ p 18 Q
+ w 92
j 470 280
+ p 19 Q
+ w 100
j 470 500
+ p 17 Q
+ w 108
j 470 610
+ p 16 Q
+ w 116
j 350 280
+ p 19 D
+ w 124
j 180 690
+ s 132
+ w 53
j 180 280
+ s 133
+ w 124
j 640 280
+ s 134
+ w 100
j 640 390
+ s 135
+ w 92
j 640 500
+ s 136
+ w 108
j 640 610
+ s 137
+ w 116
j 180 610
+ s 138
+ w 37
j 180 500
+ s 139
+ w 21
j 180 390
+ s 140
+ w 29
@attributes
@text
s 5 750 1020 hrn 100 4-BIT INPUT TRANSPARENT
s 5 770 1000 hrn 100 XC4000 FAMILY ILD4  MACRO
s 5 630 1050 hrn 100 25TH JANUARY 1993
s 5 710 1050 hrn 100 1
s 5 700 1070 hln 100 A
s 5 520 1030 hln 100 DATA LATCH
s 5 30 1070 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 30 1060 hln 100 DRAWN BY KS
