*version 6.3 70712286
u 330
XC3000 3245232255
U? 10
@libraries
XC3000 [.slb]
@analysis
@targets
@attributes
a FAMILY=XC3000
a IMPL=XILINX
@translators
@index
pageloc 1 0 5643 1
@status
*page 1 0 1100 850 iX
@ports
port 331 IF_IN 130 490 h
a 0 s 3 0 10 8 hln 80 LABEL=D7
port 332 IF_IN 130 470 h
a 0 s 3 0 10 8 hln 80 LABEL=D6
port 333 IF_IN 130 410 h
a 0 s 3 0 10 8 hln 80 LABEL=D5
port 334 IF_IN 130 390 h
a 0 s 3 0 10 8 hln 80 LABEL=D4
port 335 IF_IN 130 310 h
a 0 s 3 0 10 8 hln 80 LABEL=D3
port 336 IF_IN 130 290 h
a 0 s 3 0 10 8 hln 80 LABEL=D2
port 337 IF_IN 130 230 h
a 0 s 3 0 10 8 hln 80 LABEL=D1
port 338 IF_IN 130 510 h
a 0 s 3 0 10 8 hln 80 LABEL=A
port 339 IF_IN 130 530 h
a 0 s 3 0 10 8 hln 80 LABEL=B
port 340 IF_IN 130 550 h
a 0 s 3 0 10 8 hln 80 LABEL=C
port 341 IF_IN 130 210 h
a 0 s 3 0 10 8 hln 80 LABEL=D0
port 342 IF_OUT 980 350 h
a 0 s 3 0 20 8 hln 80 LABEL=Y
port 343 IF_OUT 980 370 h
a 0 s 3 0 20 8 hln 80 LABEL=W
port 344 IF_IN 130 570 h
a 0 s 3 0 10 8 hln 80 LABEL=G
@parts
part 15 INV 870 370 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U1
a 0 sp 11 0 30 14 hlt 100 PART=INV
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 16 INV 330 570 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U2
a 0 sp 11 0 30 14 hlt 100 PART=INV
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 22 M2_1 330 210 h
a 0 sp 9 0 60 70 hrn 100 REFDES=U3
a 0 sp 11 0 50 20 hcn 200 PART=M2_1
a 0 a 0 0 0 0 hln 100 PKGREF=U3
part 23 M2_1 330 290 h
a 0 sp 9 0 60 70 hrn 100 REFDES=U4
a 0 sp 11 0 50 20 hcn 200 PART=M2_1
a 0 a 0 0 0 0 hln 100 PKGREF=U4
part 24 M2_1 330 390 h
a 0 sp 9 0 60 70 hrn 100 REFDES=U5
a 0 sp 11 0 50 20 hcn 200 PART=M2_1
a 0 a 0 0 0 0 hln 100 PKGREF=U5
part 25 M2_1 330 470 h
a 0 sp 9 0 60 70 hrn 100 REFDES=U6
a 0 sp 11 0 50 20 hcn 200 PART=M2_1
a 0 a 0 0 0 0 hln 100 PKGREF=U6
part 26 M2_1 530 250 h
a 0 sp 9 0 60 70 hrn 100 REFDES=U7
a 0 sp 11 0 50 20 hcn 200 PART=M2_1
a 0 a 0 0 0 0 hln 100 PKGREF=U7
part 27 M2_1 530 430 h
a 0 sp 9 0 60 70 hrn 100 REFDES=U8
a 0 sp 11 0 50 20 hcn 200 PART=M2_1
a 0 a 0 0 0 0 hln 100 PKGREF=U8
part 34 M2_1E 730 340 h
a 0 sp 9 0 70 70 hrn 100 REFDES=U9
a 0 sp 11 0 50 20 hcn 200 PART=M2_1E
a 0 a 0 0 0 0 hln 100 PKGREF=U9
@conn
w 36
s 130 210 330 210 35
a 0 s 3 0 140 210 hln 100 LABEL=D0
w 44
s 130 230 330 230 43
a 0 s 3 0 140 230 hln 100 LABEL=D1
w 54
s 460 250 530 250 51
a 0 s 3 0 460 250 hln 100 LABEL=M01
s 460 250 460 220 53
s 430 220 460 220 52
w 71
s 400 570 700 570 68
a 0 s 3 0 530 570 hln 100 LABEL=E
s 700 570 700 400 69
s 700 400 730 400 70
w 88
s 850 350 980 350 84
a 0 s 3 0 960 350 hln 100 LABEL=Y
s 850 370 850 350 86
s 850 370 870 370 85
s 830 350 850 350 87
w 106
s 940 370 980 370 105
a 0 s 3 0 960 370 hln 100 LABEL=W
w 114
s 130 570 330 570 113
a 0 s 3 0 140 570 hln 100 LABEL=G
w 124
s 130 550 680 550 121
a 0 s 3 0 140 550 hln 100 LABEL=C
s 680 550 680 380 123
s 680 380 730 380 122
w 137
s 130 530 500 530 132
a 0 s 3 0 140 530 hln 100 LABEL=B
s 500 530 500 470 136
s 500 470 530 470 133
s 500 470 500 290 134
s 500 290 530 290 135
w 157
s 660 340 730 340 154
a 0 s 3 0 660 340 hln 100 LABEL=M03
s 660 340 660 260 156
s 630 260 660 260 155
w 174
s 660 360 730 360 171
a 0 s 3 0 660 360 hln 100 LABEL=M47
s 660 440 660 360 173
s 630 440 660 440 172
w 191
s 460 450 530 450 188
a 0 s 3 0 460 450 hln 100 LABEL=M67
s 460 480 460 450 190
s 430 480 460 480 189
w 208
s 460 430 530 430 205
a 0 s 3 0 460 430 hln 100 LABEL=M45
s 460 430 460 400 207
s 430 400 460 400 206
w 223
s 130 490 330 490 222
a 0 s 3 0 140 490 hln 100 LABEL=D7
w 231
s 130 470 330 470 230
a 0 s 3 0 140 470 hln 100 LABEL=D6
w 239
s 130 310 330 310 238
a 0 s 3 0 140 310 hln 100 LABEL=D3
w 247
s 130 410 330 410 246
a 0 s 3 0 140 410 hln 100 LABEL=D5
w 255
s 130 390 330 390 254
a 0 s 3 0 140 390 hln 100 LABEL=D4
w 263
s 130 290 330 290 262
a 0 s 3 0 140 290 hln 100 LABEL=D2
w 273
s 460 270 530 270 270
a 0 s 3 0 460 270 hln 100 LABEL=M23
s 460 300 460 270 271
s 430 300 460 300 272
w 294
s 130 510 300 510 286
a 0 s 3 0 140 510 hln 100 LABEL=A
s 300 510 300 430 292
s 300 250 330 250 287
s 300 330 300 250 288
s 300 430 300 330 290
s 300 430 330 430 289
s 300 330 330 330 291
s 300 510 330 510 293
@junction
j 330 210
+ p 22 D0
+ w 36
j 330 230
+ p 22 D1
+ w 44
j 430 220
+ p 22 O
+ w 54
j 530 250
+ p 26 D0
+ w 54
j 400 570
+ p 16 O
+ w 71
j 730 400
+ p 34 E
+ w 71
j 850 350
+ w 88
+ w 88
j 870 370
+ p 15 I
+ w 88
j 830 350
+ p 34 O
+ w 88
j 940 370
+ p 15 O
+ w 106
j 330 570
+ p 16 I
+ w 114
j 730 380
+ p 34 S0
+ w 124
j 500 470
+ w 137
+ w 137
j 530 290
+ p 26 S0
+ w 137
j 530 470
+ p 27 S0
+ w 137
j 630 260
+ p 26 O
+ w 157
j 730 340
+ p 34 D0
+ w 157
j 630 440
+ p 27 O
+ w 174
j 730 360
+ p 34 D1
+ w 174
j 430 480
+ p 25 O
+ w 191
j 530 450
+ p 27 D1
+ w 191
j 430 400
+ p 24 O
+ w 208
j 530 430
+ p 27 D0
+ w 208
j 330 490
+ p 25 D1
+ w 223
j 330 470
+ p 25 D0
+ w 231
j 330 310
+ p 23 D1
+ w 239
j 330 410
+ p 24 D1
+ w 247
j 330 390
+ p 24 D0
+ w 255
j 330 290
+ p 23 D0
+ w 263
j 430 300
+ p 23 O
+ w 273
j 530 270
+ p 26 D1
+ w 273
j 300 510
+ w 294
+ w 294
j 300 430
+ w 294
+ w 294
j 300 330
+ w 294
+ w 294
j 330 250
+ p 22 S0
+ w 294
j 330 330
+ p 23 S0
+ w 294
j 330 430
+ p 24 S0
+ w 294
j 330 510
+ p 25 S0
+ w 294
j 130 490
+ s 331
+ w 223
j 130 470
+ s 332
+ w 231
j 130 410
+ s 333
+ w 247
j 130 390
+ s 334
+ w 255
j 130 310
+ s 335
+ w 239
j 130 290
+ s 336
+ w 263
j 130 230
+ s 337
+ w 44
j 130 510
+ s 338
+ w 294
j 130 530
+ s 339
+ w 137
j 130 550
+ s 340
+ w 124
j 130 210
+ s 341
+ w 36
j 980 350
+ s 342
+ w 88
j 980 370
+ s 343
+ w 106
j 130 570
+ s 344
+ w 114
@attributes
@text
s 5 710 800 hln 100 8TH MARCH 1993
s 5 750 770 hln 100 8-TO-1 MUX W/ ACTIVE LOW ENABLE
s 5 750 750 hln 100 XC3000 FAMILY X74_151 MACRO
s 5 950 820 hln 100 A
s 5 950 800 hln 100 1
s 5 750 780 hln 100 & COMPLEMENTARY OUTPUTS
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 30 810 hln 100 DRAWN BY KS
