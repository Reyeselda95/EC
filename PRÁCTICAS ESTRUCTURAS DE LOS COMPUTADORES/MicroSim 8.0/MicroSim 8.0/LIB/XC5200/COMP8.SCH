*version 6.3 880548977
u 427
XC5200 42140609
U? 12
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
pageloc 1 0 6631 1
@status
*page 1 0 1100 850 iX
@ports
port 428 IF_IN 140 660 h
a 0 s 3 0 10 8 hln 50 LABEL=B[7:0]
port 429 IF_IN 140 620 h
a 0 s 3 0 10 8 hln 50 LABEL=A[7:0]
port 430 IF_OUT 980 360 h
a 0 s 3 0 20 8 hln 80 LABEL=EQ
@parts
part 16 AND2 770 350 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 40 hlt 100 PART=AND2
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 23 AND4 570 470 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U2
a 0 sp 11 0 10 80 hlt 100 PART=AND4
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 24 AND4 570 220 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U3
a 0 sp 11 0 10 80 hlt 100 PART=AND4
a 0 a 0 0 0 0 hln 100 PKGREF=U3
part 29 XNOR2 310 150 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U4
a 0 sp 11 0 10 40 hlt 100 PART=XNOR2
a 0 a 0 0 0 0 hln 100 PKGREF=U4
part 30 XNOR2 310 210 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U5
a 0 sp 11 0 10 40 hlt 100 PART=XNOR2
a 0 a 0 0 0 0 hln 100 PKGREF=U5
part 31 XNOR2 310 270 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U6
a 0 sp 11 0 10 40 hlt 100 PART=XNOR2
a 0 a 0 0 0 0 hln 100 PKGREF=U6
part 32 XNOR2 310 330 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U7
a 0 sp 11 0 10 40 hlt 100 PART=XNOR2
a 0 a 0 0 0 0 hln 100 PKGREF=U7
part 33 XNOR2 310 400 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U8
a 0 sp 11 0 10 40 hlt 100 PART=XNOR2
a 0 a 0 0 0 0 hln 100 PKGREF=U8
part 34 XNOR2 310 460 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U9
a 0 sp 11 0 10 40 hlt 100 PART=XNOR2
a 0 a 0 0 0 0 hln 100 PKGREF=U9
part 35 XNOR2 310 520 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U10
a 0 sp 11 0 10 40 hlt 100 PART=XNOR2
a 0 a 0 0 0 0 hln 100 PKGREF=U10
part 36 XNOR2 310 580 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U11
a 0 sp 11 0 10 40 hlt 100 PART=XNOR2
a 0 a 0 0 0 0 hln 100 PKGREF=U11
@conn
b 46
s 140 620 220 620 37
a 0 s 3 0 140 610 hln 100 LABEL=A[7:0]
s 220 620 220 580 45
s 220 210 220 150 38
s 220 270 220 210 39
s 220 330 220 270 40
s 220 400 220 330 41
s 220 460 220 400 42
s 220 520 220 460 43
s 220 580 220 520 44
w 49
s 220 150 310 150 48
a 0 s 3 0 260 150 hln 100 LABEL=A[0]
s 220 150 220 150 50
w 58
s 220 210 310 210 57
a 0 s 3 0 260 210 hln 100 LABEL=A[1]
s 220 210 220 210 59
w 67
s 220 270 310 270 66
a 0 s 3 0 260 270 hln 100 LABEL=A[2]
s 220 270 220 270 68
w 76
s 220 330 310 330 75
a 0 s 3 0 260 330 hln 100 LABEL=A[3]
s 220 330 220 330 77
w 85
s 220 400 310 400 84
a 0 s 3 0 260 400 hln 100 LABEL=A[4]
s 220 400 220 400 86
w 94
s 220 460 310 460 93
a 0 s 3 0 260 460 hln 100 LABEL=A[5]
s 220 460 220 460 95
w 103
s 220 520 310 520 102
a 0 s 3 0 260 520 hln 100 LABEL=A[6]
s 220 520 220 520 104
w 112
s 220 580 310 580 111
a 0 s 3 0 260 580 hln 100 LABEL=A[7]
s 220 580 220 580 113
b 129
s 140 660 250 660 120
a 0 s 3 0 140 650 hln 100 LABEL=B[7:0]
s 250 230 250 170 125
s 250 480 250 420 121
s 250 420 250 350 122
s 250 350 250 290 123
s 250 290 250 230 124
s 250 540 250 480 126
s 250 600 250 540 127
s 250 660 250 600 128
w 132
s 250 420 310 420 131
a 0 s 3 0 260 420 hln 100 LABEL=B[4]
s 250 420 250 420 133
w 141
s 250 350 310 350 140
a 0 s 3 0 260 350 hln 100 LABEL=B[3]
s 250 350 250 350 142
w 150
s 250 290 310 290 149
a 0 s 3 0 260 290 hln 100 LABEL=B[2]
s 250 290 250 290 151
w 159
s 250 170 310 170 158
a 0 s 3 0 260 170 hln 100 LABEL=B[0]
s 250 170 250 170 160
w 168
s 250 230 310 230 167
a 0 s 3 0 260 230 hln 100 LABEL=B[1]
s 250 230 250 230 169
w 177
s 250 480 310 480 176
a 0 s 3 0 260 480 hln 100 LABEL=B[5]
s 250 480 250 480 178
w 186
s 250 540 310 540 185
a 0 s 3 0 260 540 hln 100 LABEL=B[6]
s 250 540 250 540 187
w 195
s 250 600 310 600 194
a 0 s 3 0 260 600 hln 100 LABEL=B[7]
s 250 600 250 600 196
w 204
s 850 360 980 360 203
a 0 s 3 0 950 360 hln 100 LABEL=EQ
w 214
s 390 530 520 530 211
a 0 s 3 0 460 530 hln 100 LABEL=AB6
s 520 530 520 510 213
s 520 510 570 510 212
w 231
s 390 470 520 470 228
a 0 s 3 0 460 470 hln 100 LABEL=AB5
s 520 490 520 470 230
s 520 490 570 490 229
w 248
s 650 500 740 500 245
a 0 s 3 0 670 500 hln 100 LABEL=AB47
s 740 500 740 370 247
s 740 370 770 370 246
w 265
s 650 250 740 250 262
a 0 s 3 0 670 250 hln 100 LABEL=AB03
s 740 350 740 250 264
s 740 350 770 350 263
w 282
s 390 160 540 160 279
a 0 s 3 0 460 160 hln 100 LABEL=AB0
s 540 220 540 160 280
s 540 220 570 220 281
w 298
s 390 220 520 220 295
a 0 s 3 0 460 220 hln 100 LABEL=AB1
s 520 240 520 220 297
s 520 240 570 240 296
w 315
s 390 280 520 280 312
a 0 s 3 0 460 280 hln 100 LABEL=AB2
s 520 280 520 260 314
s 520 260 570 260 313
w 332
s 390 340 540 340 329
a 0 s 3 0 460 340 hln 100 LABEL=AB3
s 540 340 540 280 331
s 540 280 570 280 330
w 349
s 390 590 540 590 346
a 0 s 3 0 460 590 hln 100 LABEL=AB7
s 540 590 540 530 348
s 540 530 570 530 347
w 366
s 390 410 540 410 363
a 0 s 3 0 460 410 hln 100 LABEL=AB4
s 540 470 540 410 364
s 540 470 570 470 365
@junction
j 310 150
+ p 29 I1
+ w 49
j 310 210
+ p 30 I1
+ w 58
j 310 270
+ p 31 I1
+ w 67
j 310 330
+ p 32 I1
+ w 76
j 310 400
+ p 33 I1
+ w 85
j 310 460
+ p 34 I1
+ w 94
j 310 520
+ p 35 I1
+ w 103
j 310 580
+ p 36 I1
+ w 112
j 310 420
+ p 33 I0
+ w 132
j 310 350
+ p 32 I0
+ w 141
j 310 290
+ p 31 I0
+ w 150
j 310 170
+ p 29 I0
+ w 159
j 310 230
+ p 30 I0
+ w 168
j 310 480
+ p 34 I0
+ w 177
j 310 540
+ p 35 I0
+ w 186
j 310 600
+ p 36 I0
+ w 195
j 850 360
+ p 16 O
+ w 204
j 570 510
+ p 23 I1
+ w 214
j 390 530
+ p 35 O
+ w 214
j 570 490
+ p 23 I2
+ w 231
j 390 470
+ p 34 O
+ w 231
j 770 370
+ p 16 I0
+ w 248
j 650 500
+ p 23 O
+ w 248
j 770 350
+ p 16 I1
+ w 265
j 650 250
+ p 24 O
+ w 265
j 570 220
+ p 24 I3
+ w 282
j 390 160
+ p 29 O
+ w 282
j 570 240
+ p 24 I2
+ w 298
j 390 220
+ p 30 O
+ w 298
j 570 260
+ p 24 I1
+ w 315
j 390 280
+ p 31 O
+ w 315
j 570 280
+ p 24 I0
+ w 332
j 390 340
+ p 32 O
+ w 332
j 570 530
+ p 23 I0
+ w 349
j 390 590
+ p 36 O
+ w 349
j 570 470
+ p 23 I3
+ w 366
j 390 410
+ p 33 O
+ w 366
j 220 150
+ b 46
A[0]
+ w 49
j 220 210
+ b 46
A[1]
+ w 58
j 220 270
+ b 46
A[2]
+ w 67
j 220 330
+ b 46
A[3]
+ w 76
j 220 400
+ b 46
A[4]
+ w 85
j 220 460
+ b 46
A[5]
+ w 94
j 220 520
+ b 46
A[6]
+ w 103
j 220 580
+ b 46
A[7]
+ w 112
j 250 420
+ b 129
B[4]
+ w 132
j 250 350
+ b 129
B[3]
+ w 141
j 250 290
+ b 129
B[2]
+ w 150
j 250 170
+ b 129
B[0]
+ w 159
j 250 230
+ b 129
B[1]
+ w 168
j 250 480
+ b 129
B[5]
+ w 177
j 250 540
+ b 129
B[6]
+ w 186
j 250 600
+ b 129
B[7]
+ w 195
j 140 660
+ S 428
B[7]
B[6]
B[5]
B[4]
B[3]
B[2]
B[1]
B[0]
+ b 129
B[7]
B[6]
B[5]
B[4]
B[3]
B[2]
B[1]
B[0]
j 140 620
+ S 429
A[7]
A[6]
A[5]
A[4]
A[3]
A[2]
A[1]
A[0]
+ b 46
A[7]
A[6]
A[5]
A[4]
A[3]
A[2]
A[1]
A[0]
j 980 360
+ s 430
+ w 204
@attributes
@text
s 5 30 810 hln 100 DRAWN BY KS
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 750 770 hln 100 8-BIT IDENTITY COMPARATOR
s 5 750 750 hln 100 XC5200 FAMILY COMP8 MACRO
s 5 950 820 hln 100 A
s 5 950 800 hln 100 1
s 5 710 800 hln 100 12TH JANUARY 1993
