*version 6.3 853148615
u 145
XC5200 1447104
U? 6
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
pageloc 1 0 2934 1
@status
*page 1 0 1100 850 iX
@ports
port 146 IF_OUT 770 440 h
a 0 s 3 0 20 8 hln 80 LABEL=O3
port 147 IF_OUT 770 400 h
a 0 s 3 0 20 8 hln 80 LABEL=O2
port 148 IF_OUT 770 360 h
a 0 s 3 0 20 8 hln 80 LABEL=O1
port 149 IF_OUT 770 320 h
a 0 s 3 0 20 8 hln 80 LABEL=O0
port 150 IF_IN 300 440 h
a 0 s 3 0 10 8 hln 80 LABEL=I3
port 151 IF_IN 300 400 h
a 0 s 3 0 10 8 hln 80 LABEL=I2
port 152 IF_IN 300 360 h
a 0 s 3 0 10 8 hln 80 LABEL=I1
port 153 IF_IN 300 320 h
a 0 s 3 0 10 8 hln 80 LABEL=I0
port 154 IF_IN 300 300 h
a 0 s 3 0 10 8 hln 80 LABEL=E
@parts
part 15 INV 380 300 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U1
a 0 sp 11 0 30 14 hlt 100 PART=INV
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 20 BUFT 500 300 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U2
a 0 sp 11 0 30 34 hlt 100 PART=BUFT
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 21 BUFT 500 340 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U3
a 0 sp 11 0 30 34 hlt 100 PART=BUFT
a 0 a 0 0 0 0 hln 100 PKGREF=U3
part 22 BUFT 500 380 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U4
a 0 sp 11 0 30 34 hlt 100 PART=BUFT
a 0 a 0 0 0 0 hln 100 PKGREF=U4
part 23 BUFT 500 420 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U5
a 0 sp 11 0 30 34 hlt 100 PART=BUFT
a 0 a 0 0 0 0 hln 100 PKGREF=U5
@conn
w 32
s 450 300 470 300 24
a 0 s 3 0 450 300 hln 100 LABEL=T
s 470 340 470 300 25
s 470 300 500 300 26
s 470 420 470 380 28
s 470 420 500 420 27
s 470 380 500 380 29
s 470 380 470 340 30
s 470 340 500 340 31
w 74
s 570 320 770 320 73
a 0 s 3 0 730 320 hln 100 LABEL=O0
w 82
s 300 320 500 320 81
a 0 s 3 0 310 320 hln 100 LABEL=I0
w 90
s 570 360 770 360 89
a 0 s 3 0 730 360 hln 100 LABEL=O1
w 98
s 300 360 500 360 97
a 0 s 3 0 310 360 hln 100 LABEL=I1
w 106
s 300 400 500 400 105
a 0 s 3 0 310 400 hln 100 LABEL=I2
w 114
s 570 400 770 400 113
a 0 s 3 0 730 400 hln 100 LABEL=O2
w 122
s 300 440 500 440 121
a 0 s 3 0 310 440 hln 100 LABEL=I3
w 130
s 570 440 770 440 129
a 0 s 3 0 730 440 hln 100 LABEL=O3
w 138
s 300 300 380 300 137
a 0 s 3 0 310 300 hln 100 LABEL=E
@junction
j 470 300
+ w 32
+ w 32
j 470 340
+ w 32
+ w 32
j 470 380
+ w 32
+ w 32
j 450 300
+ p 15 O
+ w 32
j 500 300
+ p 20 T
+ w 32
j 500 340
+ p 21 T
+ w 32
j 500 380
+ p 22 T
+ w 32
j 500 420
+ p 23 T
+ w 32
j 570 320
+ p 20 O
+ w 74
j 500 320
+ p 20 I
+ w 82
j 570 360
+ p 21 O
+ w 90
j 500 360
+ p 21 I
+ w 98
j 500 400
+ p 22 I
+ w 106
j 570 400
+ p 22 O
+ w 114
j 500 440
+ p 23 I
+ w 122
j 570 440
+ p 23 O
+ w 130
j 380 300
+ p 15 I
+ w 138
j 770 440
+ s 146
+ w 130
j 770 400
+ s 147
+ w 114
j 770 360
+ s 148
+ w 90
j 770 320
+ s 149
+ w 74
j 300 440
+ s 150
+ w 122
j 300 400
+ s 151
+ w 106
j 300 360
+ s 152
+ w 98
j 300 320
+ s 153
+ w 82
j 300 300
+ s 154
+ w 138
@attributes
@text
s 5 950 820 hln 100 A
s 5 960 800 hrn 100 1
s 5 890 800 hrn 100 23RD FEBRUARY 1993
s 5 1000 750 hrn 100 XC5200 FAMILY BUFE4 MACRO
s 5 950 770 hrn 100 4-BIT 3-STATE BUFFER
s 5 750 780 hln 100 W/ AN ACTIVE HIGH ENABLE
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 30 810 hln 100 DRAWN BY KS
