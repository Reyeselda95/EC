*version 6.3 752530255
u 465
XC3000 21014224
U? 11
@libraries
XC3000 [.slb]
@analysis
@targets
@attributes
a FAMILY=XC3000
a IMPL=XILINX
@translators
@index
pageloc 1 0 6331 1
@status
*page 1 0 850 1100 iX
@ports
port 466 IF_OUT 800 810 h
a 0 s 3 0 20 8 hln 80 LABEL=CEO
port 467 IF_IN 60 720 h
a 0 s 3 0 10 8 hln 80 LABEL=R
port 468 IF_IN 60 690 h
a 0 s 3 0 10 8 hln 80 LABEL=C
port 469 IF_OUT 800 650 h
a 0 s 3 0 20 8 hln 80 LABEL=Q3
port 470 IF_OUT 800 450 h
a 0 s 3 0 20 8 hln 80 LABEL=Q2
port 471 IF_OUT 800 260 h
a 0 s 3 0 20 8 hln 80 LABEL=Q1
port 472 IF_OUT 800 80 h
a 0 s 3 0 20 8 hln 80 LABEL=Q0
port 473 IF_OUT 800 720 h
a 0 s 3 0 20 8 hln 80 LABEL=TC
port 474 IF_IN 60 670 h
a 0 s 3 0 10 8 hln 80 LABEL=CE
@parts
part 16 AND2 630 300 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U1
a 0 sp 11 0 10 40 hlt 100 PART=AND2
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 19 GND 230 770 h
a 0 sp 0 0 40 0 hrn 100 REFDES=U2
a 0 sp 11 0 5 40 hln 100 PART=GND
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 27 FTRSE 260 50 h
a 0 sp 9 0 80 110 hrn 100 REFDES=U3
a 0 sp 11 0 60 10 hcn 200 PART=FTRSE
a 0 a 0 0 0 0 hln 100 PKGREF=U3
part 28 FTRSE 260 230 h
a 0 sp 9 0 80 110 hrn 100 REFDES=U4
a 0 sp 11 0 60 10 hcn 200 PART=FTRSE
a 0 a 0 0 0 0 hln 100 PKGREF=U4
part 29 FTRSE 260 420 h
a 0 sp 9 0 80 110 hrn 100 REFDES=U5
a 0 sp 11 0 60 10 hcn 200 PART=FTRSE
a 0 a 0 0 0 0 hln 100 PKGREF=U5
part 30 FTRSE 260 620 h
a 0 sp 9 0 80 110 hrn 100 REFDES=U6
a 0 sp 11 0 60 10 hcn 200 PART=FTRSE
a 0 a 0 0 0 0 hln 100 PKGREF=U6
part 36 AND3 630 490 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U7
a 0 sp 11 0 10 60 hlt 100 PART=AND3
a 0 a 0 0 0 0 hln 100 PKGREF=U7
part 39 VCC 140 80 h
a 0 sp 0 0 40 0 hrn 100 REFDES=U8
a 0 sp 11 0 20 10 hcn 100 PART=VCC
a 0 a 0 0 0 0 hln 100 PKGREF=U8
part 46 AND4 630 690 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U9
a 0 sp 11 0 10 80 hlt 100 PART=AND4
a 0 a 0 0 0 0 hln 100 PKGREF=U9
part 47 AND2 630 800 h
a 0 sp 9 0 80 0 hrn 100 REFDES=U10
a 0 sp 11 0 10 40 hlt 100 PART=AND2
a 0 a 0 0 0 0 hln 100 PKGREF=U10
@conn
w 58
s 60 670 180 670 48
a 0 s 3 0 70 670 hln 100 LABEL=CE
s 180 820 180 670 50
s 180 820 630 820 49
s 180 670 180 470 51
s 180 470 180 280 52
s 180 280 180 100 53
s 180 100 260 100 54
s 180 280 260 280 55
s 180 470 260 470 56
s 180 670 260 670 57
w 107
s 230 420 260 420 99
s 230 620 230 420 100
s 230 420 230 230 102
s 230 230 260 230 101
s 230 620 260 620 104
s 230 230 230 50 105
s 230 50 260 50 103
s 230 770 230 620 106
w 157
s 60 720 140 720 149
a 0 s 3 0 70 720 hln 100 LABEL=R
s 140 720 140 520 155
s 140 150 260 150 150
s 140 330 140 150 151
s 140 330 260 330 152
s 140 520 140 330 153
s 140 520 260 520 154
s 140 720 260 720 156
w 193
s 140 80 260 80 192
w 214
s 470 260 800 260 206
a 0 s 3 0 770 260 hln 100 LABEL=Q1
s 470 320 470 260 207
s 470 510 470 320 208
s 470 710 470 510 209
s 470 710 630 710 210
s 470 510 630 510 211
s 470 320 630 320 212
s 380 260 470 260 213
w 254
s 490 450 800 450 248
a 0 s 3 0 770 450 hln 100 LABEL=Q2
s 490 530 490 450 249
s 490 730 490 530 250
s 490 730 630 730 251
s 490 530 630 530 252
s 380 450 490 450 253
w 283
s 510 650 800 650 279
a 0 s 3 0 770 650 hln 100 LABEL=Q3
s 380 650 510 650 280
s 510 750 510 650 281
s 510 750 630 750 282
w 307
s 60 690 160 690 299
a 0 s 3 0 70 690 hln 100 LABEL=C
s 160 690 260 690 300
s 160 690 160 490 301
s 160 490 260 490 302
s 160 490 160 300 303
s 160 300 260 300 304
s 160 300 160 120 305
s 160 120 260 120 306
w 353
s 450 80 800 80 341
a 0 s 3 0 770 80 hln 100 LABEL=Q0
s 450 300 450 180 344
s 450 690 630 690 345
s 450 690 450 490 346
s 450 490 630 490 347
s 450 490 450 300 348
s 450 300 630 300 349
s 450 180 450 80 350
s 380 80 450 80 351
s 200 180 450 180 352
s 200 260 200 180 342
s 200 260 260 260 343
w 402
s 710 310 740 310 397
a 0 s 3 0 720 310 hln 100 LABEL=T2
s 740 360 740 310 401
s 200 360 740 360 398
s 200 450 200 360 399
s 200 450 260 450 400
w 421
s 710 510 740 510 416
a 0 s 3 0 720 510 hln 100 LABEL=T3
s 740 560 740 510 420
s 200 650 260 650 417
s 200 650 200 560 418
s 200 560 740 560 419
w 441
s 730 720 800 720 435
a 0 s 3 0 770 720 hln 100 LABEL=TC
s 710 720 730 720 436
s 730 780 730 720 437
s 620 780 730 780 438
s 620 800 620 780 439
s 620 800 630 800 440
w 458
s 710 810 800 810 457
a 0 s 3 0 760 810 hln 100 LABEL=CEO
@junction
j 180 670
+ w 58
+ w 58
j 180 470
+ w 58
+ w 58
j 180 280
+ w 58
+ w 58
j 260 100
+ p 27 CE
+ w 58
j 260 280
+ p 28 CE
+ w 58
j 260 470
+ p 29 CE
+ w 58
j 260 670
+ p 30 CE
+ w 58
j 630 820
+ p 47 I0
+ w 58
j 230 420
+ w 107
+ w 107
j 230 620
+ w 107
+ w 107
j 230 230
+ w 107
+ w 107
j 230 770
+ p 19 GROUND
+ w 107
j 260 50
+ p 27 S
+ w 107
j 260 230
+ p 28 S
+ w 107
j 260 420
+ p 29 S
+ w 107
j 260 620
+ p 30 S
+ w 107
j 140 720
+ w 157
+ w 157
j 140 520
+ w 157
+ w 157
j 140 330
+ w 157
+ w 157
j 260 150
+ p 27 R
+ w 157
j 260 330
+ p 28 R
+ w 157
j 260 520
+ p 29 R
+ w 157
j 260 720
+ p 30 R
+ w 157
j 260 80
+ p 27 T
+ w 193
j 140 80
+ p 39 VCC
+ w 193
j 470 260
+ w 214
+ w 214
j 470 320
+ w 214
+ w 214
j 470 510
+ w 214
+ w 214
j 630 320
+ p 16 I0
+ w 214
j 380 260
+ p 28 Q
+ w 214
j 630 510
+ p 36 I1
+ w 214
j 630 710
+ p 46 I2
+ w 214
j 490 450
+ w 254
+ w 254
j 490 530
+ w 254
+ w 254
j 380 450
+ p 29 Q
+ w 254
j 630 530
+ p 36 I0
+ w 254
j 630 730
+ p 46 I1
+ w 254
j 510 650
+ w 283
+ w 283
j 380 650
+ p 30 Q
+ w 283
j 630 750
+ p 46 I0
+ w 283
j 160 690
+ w 307
+ w 307
j 160 490
+ w 307
+ w 307
j 160 300
+ w 307
+ w 307
j 260 120
+ p 27 C
+ w 307
j 260 300
+ p 28 C
+ w 307
j 260 490
+ p 29 C
+ w 307
j 260 690
+ p 30 C
+ w 307
j 450 80
+ w 353
+ w 353
j 450 300
+ w 353
+ w 353
j 450 180
+ w 353
+ w 353
j 450 490
+ w 353
+ w 353
j 630 300
+ p 16 I1
+ w 353
j 380 80
+ p 27 Q
+ w 353
j 260 260
+ p 28 T
+ w 353
j 630 490
+ p 36 I2
+ w 353
j 630 690
+ p 46 I3
+ w 353
j 710 310
+ p 16 O
+ w 402
j 260 450
+ p 29 T
+ w 402
j 260 650
+ p 30 T
+ w 421
j 710 510
+ p 36 O
+ w 421
j 730 720
+ w 441
+ w 441
j 710 720
+ p 46 O
+ w 441
j 630 800
+ p 47 I1
+ w 441
j 710 810
+ p 47 O
+ w 458
j 800 810
+ s 466
+ w 458
j 60 720
+ s 467
+ w 157
j 60 690
+ s 468
+ w 307
j 800 650
+ s 469
+ w 283
j 800 450
+ s 470
+ w 254
j 800 260
+ s 471
+ w 214
j 800 80
+ s 472
+ w 353
j 800 720
+ s 473
+ w 441
j 60 670
+ s 474
+ w 58
@attributes
@text
s 5 500 1000 hln 100 XC3000 FAMILY CB4RE MACRO
s 5 710 1050 hln 100 1
s 5 710 1070 hln 100 A
s 5 500 1020 hln 100 4-BIT CASCADABLE BINARY COUNTER
s 5 460 1050 hln 100 1ST MARCH 1993
s 5 500 1030 hln 100 WITH CLOCK ENABLE & SYNC RESET
s 5 30 1070 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 30 1060 hln 100 DRAWN BY KS
