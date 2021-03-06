*version 6.3 1096218898
u 224
XC4000 1262146838
U? 6
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
pageloc 1 0 4120 1
@status
*page 1 0 1100 850 iX
@ports
port 225 IF_IN 340 190 h
a 0 s 3 0 10 8 hln 80 LABEL=A1
port 226 IF_IN 340 290 h
a 0 s 3 0 10 8 hln 80 LABEL=A2
port 227 IF_IN 340 390 h
a 0 s 3 0 10 8 hln 80 LABEL=A3
port 228 IF_IN 340 210 h
a 0 s 3 0 10 8 hln 80 LABEL=B1
port 229 IF_IN 340 310 h
a 0 s 3 0 10 8 hln 80 LABEL=B2
port 230 IF_IN 340 410 h
a 0 s 3 0 10 8 hln 80 LABEL=B3
port 231 IF_IN 340 530 h
a 0 s 3 0 10 8 hln 80 LABEL=S
port 232 IF_IN 340 510 h
a 0 s 3 0 10 8 hln 80 LABEL=B4
port 233 IF_IN 340 490 h
a 0 s 3 0 10 8 hln 80 LABEL=A4
port 234 IF_OUT 800 200 h
a 0 s 3 0 20 8 hln 80 LABEL=Y1
port 235 IF_OUT 800 300 h
a 0 s 3 0 20 8 hln 80 LABEL=Y2
port 236 IF_OUT 800 400 h
a 0 s 3 0 20 8 hln 80 LABEL=Y3
port 237 IF_OUT 800 500 h
a 0 s 3 0 20 8 hln 80 LABEL=Y4
port 238 IF_IN 340 550 h
a 0 s 3 0 10 8 hln 80 LABEL=G
@parts
part 18 M2_1E 550 490 h
a 0 sp 9 0 70 70 hrn 100 REFDES=U1
a 0 sp 11 0 50 20 hcn 200 PART=M2_1E
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 19 M2_1E 550 390 h
a 0 sp 9 0 70 70 hrn 100 REFDES=U2
a 0 sp 11 0 50 20 hcn 200 PART=M2_1E
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 20 M2_1E 550 290 h
a 0 sp 9 0 70 70 hrn 100 REFDES=U3
a 0 sp 11 0 50 20 hcn 200 PART=M2_1E
a 0 a 0 0 0 0 hln 100 PKGREF=U3
part 21 M2_1E 550 190 h
a 0 sp 9 0 70 70 hrn 100 REFDES=U4
a 0 sp 11 0 50 20 hcn 200 PART=M2_1E
a 0 a 0 0 0 0 hln 100 PKGREF=U4
part 25 INV 410 550 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U5
a 0 sp 11 0 30 14 hlt 100 PART=INV
a 0 a 0 0 0 0 hln 100 PKGREF=U5
@conn
w 27
s 340 210 550 210 26
a 0 s 3 0 350 210 hln 100 LABEL=B1
w 35
s 340 290 550 290 34
a 0 s 3 0 350 290 hln 100 LABEL=A2
w 43
s 340 310 550 310 42
a 0 s 3 0 350 310 hln 100 LABEL=B2
w 51
s 340 390 550 390 50
a 0 s 3 0 350 390 hln 100 LABEL=A3
w 59
s 340 410 550 410 58
a 0 s 3 0 350 410 hln 100 LABEL=B3
w 67
s 340 490 550 490 66
a 0 s 3 0 350 490 hln 100 LABEL=A4
w 75
s 340 510 550 510 74
a 0 s 3 0 350 510 hln 100 LABEL=B4
w 90
s 340 530 500 530 82
a 0 s 3 0 350 530 hln 100 LABEL=S
s 500 530 500 430 88
s 500 330 550 330 83
s 500 330 500 230 85
s 500 230 550 230 84
s 500 430 500 330 86
s 500 430 550 430 87
s 500 530 550 530 89
w 127
s 340 550 410 550 126
a 0 s 3 0 350 550 hln 100 LABEL=G
w 142
s 480 550 520 550 134
a 0 s 3 0 490 550 hln 100 LABEL=E
s 520 550 520 450 140
s 520 350 550 350 135
s 520 350 520 250 137
s 520 250 550 250 136
s 520 450 520 350 138
s 520 450 550 450 139
s 520 550 550 550 141
w 185
s 650 400 800 400 184
a 0 s 3 0 770 400 hln 100 LABEL=Y3
w 193
s 650 500 800 500 192
a 0 s 3 0 770 500 hln 100 LABEL=Y4
w 201
s 650 300 800 300 200
a 0 s 3 0 770 300 hln 100 LABEL=Y2
w 209
s 650 200 800 200 208
a 0 s 3 0 770 200 hln 100 LABEL=Y1
w 217
s 340 190 550 190 216
a 0 s 3 0 350 190 hln 100 LABEL=A1
@junction
j 550 210
+ p 21 D1
+ w 27
j 550 290
+ p 20 D0
+ w 35
j 550 310
+ p 20 D1
+ w 43
j 550 390
+ p 19 D0
+ w 51
j 550 410
+ p 19 D1
+ w 59
j 550 490
+ p 18 D0
+ w 67
j 550 510
+ p 18 D1
+ w 75
j 500 530
+ w 90
+ w 90
j 500 430
+ w 90
+ w 90
j 500 330
+ w 90
+ w 90
j 550 530
+ p 18 S0
+ w 90
j 550 430
+ p 19 S0
+ w 90
j 550 330
+ p 20 S0
+ w 90
j 550 230
+ p 21 S0
+ w 90
j 410 550
+ p 25 I
+ w 127
j 520 550
+ w 142
+ w 142
j 520 450
+ w 142
+ w 142
j 520 350
+ w 142
+ w 142
j 550 550
+ p 18 E
+ w 142
j 550 450
+ p 19 E
+ w 142
j 550 350
+ p 20 E
+ w 142
j 550 250
+ p 21 E
+ w 142
j 480 550
+ p 25 O
+ w 142
j 650 400
+ p 19 O
+ w 185
j 650 500
+ p 18 O
+ w 193
j 650 300
+ p 20 O
+ w 201
j 650 200
+ p 21 O
+ w 209
j 550 190
+ p 21 D0
+ w 217
j 340 190
+ s 225
+ w 217
j 340 290
+ s 226
+ w 35
j 340 390
+ s 227
+ w 51
j 340 210
+ s 228
+ w 27
j 340 310
+ s 229
+ w 43
j 340 410
+ s 230
+ w 59
j 340 530
+ s 231
+ w 90
j 340 510
+ s 232
+ w 75
j 340 490
+ s 233
+ w 67
j 800 200
+ s 234
+ w 209
j 800 300
+ s 235
+ w 201
j 800 400
+ s 236
+ w 185
j 800 500
+ s 237
+ w 193
j 340 550
+ s 238
+ w 127
@attributes
@text
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 710 800 hln 100 8TH MARCH 1993
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
s 5 1020 750 hrn 100 XC4000 FAMILY X74_157 MACRO
s 5 750 770 hln 100 QUAD 4-TO-1 MULTIPLEXERS WITH
s 5 750 780 hln 100 AN ACTIVE LOW ENABLE
