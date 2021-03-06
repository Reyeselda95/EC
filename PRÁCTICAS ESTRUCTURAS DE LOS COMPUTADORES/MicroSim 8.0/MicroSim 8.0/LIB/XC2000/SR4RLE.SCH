*version 6.3 921217404
u 407
XC2000 140806542
U? 10
@libraries
XC2000 [.slb]
@analysis
@targets
@attributes
a FAMILY=XC2000
a IMPL=XILINX
@translators
@index
pageloc 1 0 6243 1
@status
*page 1 0 850 1100 iX
@ports
port 408 IF_OUT 760 760 h
a 0 s 3 0 20 8 hln 80 LABEL=Q3
port 409 IF_OUT 760 590 h
a 0 s 3 0 20 8 hln 80 LABEL=Q2
port 410 IF_OUT 760 420 h
a 0 s 3 0 20 8 hln 80 LABEL=Q1
port 411 IF_OUT 760 250 h
a 0 s 3 0 20 8 hln 80 LABEL=Q0
port 412 IF_IN 100 770 h
a 0 s 3 0 10 8 hln 80 LABEL=D3
port 413 IF_IN 100 600 h
a 0 s 3 0 10 8 hln 80 LABEL=D2
port 414 IF_IN 100 430 h
a 0 s 3 0 10 8 hln 80 LABEL=D1
port 415 IF_IN 100 260 h
a 0 s 3 0 10 8 hln 80 LABEL=D0
port 416 IF_IN 100 240 h
a 0 s 3 0 10 8 hln 80 LABEL=SLI
port 417 IF_IN 100 830 h
a 0 s 3 0 10 8 hln 80 LABEL=R
port 418 IF_IN 100 850 h
a 0 s 3 0 10 8 hln 80 LABEL=C
port 419 IF_IN 100 140 h
a 0 s 3 0 10 8 hln 80 LABEL=CE
port 420 IF_IN 100 790 h
a 0 s 3 0 10 8 hln 80 LABEL=L
@parts
part 18 FDRE 550 760 h
a 0 sp 9 0 100 110 hrn 100 REFDES=U1
a 0 sp 11 0 60 20 hcn 200 PART=FDRE
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 19 FDRE 550 590 h
a 0 sp 9 0 100 110 hrn 100 REFDES=U2
a 0 sp 11 0 60 20 hcn 200 PART=FDRE
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 20 FDRE 550 420 h
a 0 sp 9 0 100 110 hrn 100 REFDES=U3
a 0 sp 11 0 60 20 hcn 200 PART=FDRE
a 0 a 0 0 0 0 hln 100 PKGREF=U3
part 21 FDRE 550 250 h
a 0 sp 9 0 100 110 hrn 100 REFDES=U4
a 0 sp 11 0 60 20 hcn 200 PART=FDRE
a 0 a 0 0 0 0 hln 100 PKGREF=U4
part 26 OR2 330 140 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U5
a 0 sp 11 0 10 40 hlt 100 PART=OR2
a 0 a 0 0 0 0 hln 100 PKGREF=U5
part 32 M2_1 330 750 h
a 0 sp 9 0 100 70 hrn 100 REFDES=U6
a 0 sp 11 0 50 20 hcn 200 PART=M2_1
a 0 a 0 0 0 0 hln 100 PKGREF=U6
part 33 M2_1 330 580 h
a 0 sp 9 0 100 70 hrn 100 REFDES=U7
a 0 sp 11 0 50 20 hcn 200 PART=M2_1
a 0 a 0 0 0 0 hln 100 PKGREF=U7
part 34 M2_1 330 410 h
a 0 sp 9 0 100 70 hrn 100 REFDES=U8
a 0 sp 11 0 50 20 hcn 200 PART=M2_1
a 0 a 0 0 0 0 hln 100 PKGREF=U8
part 35 M2_1 330 240 h
a 0 sp 9 0 100 70 hrn 100 REFDES=U9
a 0 sp 11 0 50 20 hcn 200 PART=M2_1
a 0 a 0 0 0 0 hln 100 PKGREF=U9
@conn
w 46
s 100 790 280 790 36
a 0 s 3 0 110 790 hln 100 LABEL=L
s 280 790 330 790 37
s 280 790 280 620 45
s 280 280 280 160 38
s 280 160 330 160 39
s 280 620 280 450 42
s 280 450 330 450 40
s 280 620 330 620 41
s 280 450 280 280 43
s 280 280 330 280 44
w 93
s 670 760 760 760 92
a 0 s 3 0 730 760 hln 100 LABEL=Q3
w 106
s 700 590 760 590 100
a 0 s 3 0 730 590 hln 100 LABEL=Q2
s 700 680 700 590 101
s 300 680 700 680 102
s 300 750 300 680 103
s 300 750 330 750 104
s 670 590 700 590 105
w 128
s 700 420 760 420 122
a 0 s 3 0 730 420 hln 100 LABEL=Q1
s 700 510 700 420 123
s 300 510 700 510 124
s 300 580 300 510 125
s 300 580 330 580 126
s 670 420 700 420 127
w 150
s 700 250 760 250 144
a 0 s 3 0 730 250 hln 100 LABEL=Q0
s 670 250 700 250 145
s 700 340 700 250 146
s 300 340 700 340 147
s 300 410 300 340 148
s 300 410 330 410 149
w 167
s 100 140 330 140 166
a 0 s 3 0 110 140 hln 100 LABEL=CE
w 175
s 430 250 550 250 174
a 0 s 3 0 510 250 hln 100 LABEL=MD0
w 189
s 430 420 550 420 188
a 0 s 3 0 510 420 hln 100 LABEL=MD1
w 203
s 430 760 550 760 202
a 0 s 3 0 510 760 hln 100 LABEL=MD3
w 217
s 430 590 550 590 216
a 0 s 3 0 510 590 hln 100 LABEL=MD2
w 239
s 410 150 500 150 230
a 0 s 3 0 410 150 hln 100 LABEL=L_OR_CE
s 500 780 500 610 236
s 500 270 550 270 231
s 500 440 500 270 232
s 500 440 550 440 233
s 500 610 500 440 234
s 500 610 550 610 235
s 500 780 550 780 237
s 500 270 500 150 238
w 281
s 100 600 330 600 280
a 0 s 3 0 110 600 hln 100 LABEL=D2
w 289
s 100 260 330 260 288
a 0 s 3 0 110 260 hln 100 LABEL=D0
w 297
s 100 430 330 430 296
a 0 s 3 0 110 430 hln 100 LABEL=D1
w 305
s 100 240 330 240 304
a 0 s 3 0 110 240 hln 100 LABEL=SLI
w 313
s 100 770 330 770 312
a 0 s 3 0 110 770 hln 100 LABEL=D3
w 328
s 100 830 460 830 320
a 0 s 3 0 110 830 hln 100 LABEL=R
s 460 830 460 660 321
s 460 660 550 660 322
s 460 660 460 490 323
s 460 490 550 490 324
s 460 490 460 320 325
s 460 320 550 320 326
s 460 830 550 830 327
w 371
s 100 850 480 850 362
a 0 s 3 0 110 850 hln 100 LABEL=C
s 480 850 480 800 365
s 480 800 550 800 364
s 480 800 480 630 366
s 480 630 550 630 367
s 480 630 480 460 368
s 480 460 550 460 369
s 480 460 480 290 370
s 480 290 550 290 363
@junction
j 280 790
+ w 46
+ w 46
j 280 620
+ w 46
+ w 46
j 280 280
+ w 46
+ w 46
j 280 450
+ w 46
+ w 46
j 330 160
+ p 26 I0
+ w 46
j 330 790
+ p 32 S0
+ w 46
j 330 620
+ p 33 S0
+ w 46
j 330 450
+ p 34 S0
+ w 46
j 330 280
+ p 35 S0
+ w 46
j 670 760
+ p 18 Q
+ w 93
j 700 590
+ w 106
+ w 106
j 670 590
+ p 19 Q
+ w 106
j 330 750
+ p 32 D0
+ w 106
j 700 420
+ w 128
+ w 128
j 670 420
+ p 20 Q
+ w 128
j 330 580
+ p 33 D0
+ w 128
j 700 250
+ w 150
+ w 150
j 670 250
+ p 21 Q
+ w 150
j 330 410
+ p 34 D0
+ w 150
j 330 140
+ p 26 I1
+ w 167
j 550 250
+ p 21 D
+ w 175
j 430 250
+ p 35 O
+ w 175
j 550 420
+ p 20 D
+ w 189
j 430 420
+ p 34 O
+ w 189
j 550 760
+ p 18 D
+ w 203
j 430 760
+ p 32 O
+ w 203
j 550 590
+ p 19 D
+ w 217
j 430 590
+ p 33 O
+ w 217
j 500 610
+ w 239
+ w 239
j 500 270
+ w 239
+ w 239
j 500 440
+ w 239
+ w 239
j 550 780
+ p 18 CE
+ w 239
j 550 610
+ p 19 CE
+ w 239
j 550 440
+ p 20 CE
+ w 239
j 550 270
+ p 21 CE
+ w 239
j 410 150
+ p 26 O
+ w 239
j 330 600
+ p 33 D1
+ w 281
j 330 260
+ p 35 D1
+ w 289
j 330 430
+ p 34 D1
+ w 297
j 330 240
+ p 35 D0
+ w 305
j 330 770
+ p 32 D1
+ w 313
j 460 830
+ w 328
+ w 328
j 460 660
+ w 328
+ w 328
j 460 490
+ w 328
+ w 328
j 550 830
+ p 18 R
+ w 328
j 550 660
+ p 19 R
+ w 328
j 550 490
+ p 20 R
+ w 328
j 550 320
+ p 21 R
+ w 328
j 480 800
+ w 371
+ w 371
j 480 630
+ w 371
+ w 371
j 480 460
+ w 371
+ w 371
j 550 800
+ p 18 C
+ w 371
j 550 630
+ p 19 C
+ w 371
j 550 460
+ p 20 C
+ w 371
j 550 290
+ p 21 C
+ w 371
j 760 760
+ s 408
+ w 93
j 760 590
+ s 409
+ w 106
j 760 420
+ s 410
+ w 128
j 760 250
+ s 411
+ w 150
j 100 770
+ s 412
+ w 313
j 100 600
+ s 413
+ w 281
j 100 430
+ s 414
+ w 297
j 100 260
+ s 415
+ w 289
j 100 240
+ s 416
+ w 305
j 100 830
+ s 417
+ w 328
j 100 850
+ s 418
+ w 371
j 100 140
+ s 419
+ w 167
j 100 790
+ s 420
+ w 46
@attributes
@text
s 5 30 1060 hln 100 DRAWN BY KS
s 5 30 1070 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 410 1030 hln 100 PARA-OUT SHIFT REG W/ ENABLE & SYNC RESET
s 5 700 1070 hln 100 A
s 5 700 1050 hln 100 1
s 5 500 1020 hln 100 4-BIT LOADABLE SER/PARA-IN
s 5 460 1050 hln 100 22ND FEBRUARY 1993
s 5 500 1000 hln 100 XC2000 FAMILY SR4RLE MACRO
