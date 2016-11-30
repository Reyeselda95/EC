*version 6.2 1123587702
lib D:\MSIM62\sa_adc.slb 895173817
u 1477
U? 2
V? 4
DIFF? 3
GLIMIT? 2
GAIN? 2
LIMIT? 3
HB? 3
R? 2
? 39
CONST? 2
HS? 4
DSTM? 3
@libraries
sa_adc  [.slb]
@analysis
.TRAN 1 0 0 0
+0 20ns
+1 10us
.OPT 0 0 0 0 0 0 0 0 0 0 0 0 0 0
DIGMNTYMX 3
.OP 0 
.PROBE 0 0 1 0 1 2
.STMLIB SA_ADC.stl
.IMPL 1 0 2
+0 25n
+1 $G_DPWR
+2 $G_DGND
@targets
@attributes
@translators
a 0 u 13 0 0 0 hln 100 PSPICE=PSPICE
a 0 u 13 0 0 0 hln 100 PCBOARDS=PCB
a 0 u 13 0 0 0 hln 100 CADSTAR=PCB
a 0 u 13 0 0 0 hln 100 EDIF=PCB
a 0 u 13 0 0 0 hln 100 ORCAD=PCB
a 0 u 13 0 0 0 hln 100 PADS=PCB
a 0 u 13 0 0 0 hln 100 PCAD=PCB
a 0 u 13 0 0 0 hln 100 PROTEL=PCB
a 0 u 13 0 0 0 hln 100 TANGO=PCB
a 0 u 13 0 0 0 hln 100 SCICARDS=PCB
a 0 u 13 0 0 0 hln 100 POLARIS=PCB
@index
pageloc 1 0 7306 
@status
c 95:07:24:17:13:30;809284410
*page 1 0 1520 970 iA
@ports
port 5 egnd 370 430 h
port 6 egnd 350 430 h
port 21 egnd 220 310 h
port 1087 global 640 200 H
a 0 xr 3 0 20 8 hcn 100 LABEL=D[11-0]
port 309 egnd 400 430 h
@parts
part 2 vsrc 370 390 h
a 1 u 0 0 0 0 hcn 100 DC=10.24V
a 0 a 0 0 0 0 hln 100 PKGREF=V1
a 1 ap 9 0 20 10 hcn 100 REFDES=V1
part 12 DIFF 330 270 U
a 0 sp 0 0 16 32 hln 100 PART=DIFF
a 0 a 0 0 0 0 hln 100 PKGREF=DIFF1
a 1 ap 0 0 10 2 hln 100 REFDES=DIFF1
part 14 GAIN 360 270 h
a 0 sp 0 0 0 30 hln 100 PART=GAIN
a 0 a 0 0 0 0 hln 100 PKGREF=GAIN1
a 1 ap 0 0 0 0 hln 100 REFDES=GAIN1
a 0 u 13 0 12 24 hln 100 GAIN=10E3
block 24 blocksym0 510 160 h
a 0 x 0 0 0 0 hln 100 PKGREF=HB2
a 0 xp 9 0 2 -2 hln 100 REFDES=HB2
a 0 u 0 0 0 0 hln 100 plmodel=sapr
a 0 u 13 0 6 8 hln 100 desc=Converter Logic
*symbol blocksym24
d 
@type p
@attributes
a 0 sp 9 0 0 0 hln 100 REFDES=HB?
a 0 s 0 0 0 0 hln 100 PART=
@views
a 0 u 13 0 0 0 hln 100 DEFAULT=sapr.dsl
@pins
p 2 78 45 hrb 100 D[11-0] l 80 40 d
a 0 u 0 0 20 -30 hln 100 float=n
a 0 u 0 0 20 -30 hln 100 ERC=o
a 0 u 1 0 81 38 hln 100 pin=
p 2 2 25 hlb 100 C[3-0] l 0 20 d
a 0 u 0 0 0 -30 hln 100 float=r
a 0 u 0 0 0 -30 hln 100 ERC=i
a 0 u 1 0 1 18 hln 100 pin=
p 2 2 95 hlb 100 CMP l 0 90 d
a 0 u 0 0 0 -30 hln 100 float=n
a 0 u 0 0 0 -30 hln 100 ERC=i
a 0 u 1 0 1 88 hln 100 pin=
p 2 2 64 hlb 100 CLK l 0 60 d
a 0 u 0 0 0 -10 hln 100 float=n
a 0 u 0 0 0 -10 hln 100 ERC=i
a 0 u 1 0 1 58 hln 100 pin=
@graphics 80 110 0 0 10
r 0 0 0 80 110
*end blocksym
block 242 blocksym0 360 140 h
a 0 x 0 0 0 0 hln 100 PKGREF=HB1
a 0 xp 9 0 0 -2 hln 100 REFDES=HB1
a 0 u 0 0 0 0 hln 100 plmodel=sapr_cnt
a 0 u 13 0 4 8 hln 100 desc=4-bit Counter
*symbol blocksym242
d 
@type p
@attributes
a 0 sp 9 0 0 0 hln 100 REFDES=HB?
a 0 s 0 0 0 0 hln 100 PART=
@views
a 0 u 13 0 0 0 hln 100 DEFAULT=sapr_cnt.dsl
@pins
p 2 68 45 hrb 100 C[3-0] l 70 40 d
a 0 u 0 0 30 -10 hln 100 float=r
a 0 u 0 0 30 -10 hln 100 ERC=o
a 0 u 1 0 71 38 hln 100 pin=
p 2 2 24 hlb 100 CONV l 0 20 d
a 0 u 0 0 0 -10 hln 100 float=n
a 0 u 0 0 0 -10 hln 100 ERC=i
a 0 u 1 0 1 18 hln 100 pin=
p 2 2 64 hlb 100 CLK l 0 60 d
a 0 u 0 0 0 -10 hln 100 float=n
a 0 u 0 0 0 -10 hln 100 ERC=i
a 0 u 1 0 1 58 hln 100 pin=
@graphics 70 80 0 0 10
r 0 0 0 70 80
*end blocksym
part 15 LIMIT 410 270 h
a 0 s 0 0 14 48 hln 100 PART=LIMIT
a 0 a 0 0 0 0 hln 100 PKGREF=LIMIT1
a 0 ap 0 0 -12 -2 hln 100 REFDES=LIMIT1
a 0 u 13 0 16 10 hln 100 HI=5
part 485 CONST 350 320 H
a 0 u 13 0 1 12 hln 100 VALUE=1.25mV
a 0 sp 0 0 16 32 hln 100 PART=CONST
a 0 a 0 0 0 0 hln 100 PKGREF=CONST1
a 1 ap 0 0 10 2 hln 100 REFDES=CONST1
part 486 DIFF 340 330 V
a 0 sp 0 0 16 32 hln 100 PART=DIFF
a 0 a 0 0 0 0 hln 100 PKGREF=DIFF2
a 1 ap 0 0 10 2 hln 100 REFDES=DIFF2
part 891 digstim 280 160 h
a 0 u 13 13 -6 17 hln 70 STIMULUS=Convert
a 0 a 0 0 0 0 hln 100 PKGREF=DSTM1
a 1 ap 9 0 19 -1 hcn 100 REFDES=DSTM1
part 892 digstim 280 230 h
a 0 u 13 13 -6 17 hln 70 STIMULUS=Clock
a 0 a 0 0 0 0 hln 100 PKGREF=DSTM2
a 1 ap 9 0 19 -1 hcn 100 REFDES=DSTM2
part 893 vstim 220 270 h
a 0 u 13 13 14 36 hln 70 STIMULUS=VIN
a 0 x 0 0 0 0 hln 100 PKGREF=VIN
a 1 xp 9 0 -6 8 hcn 100 REFDES=VIN
part 308 r 400 430 v
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 a 0 0 0 0 hln 100 PKGREF=R1
a 0 ap 9 0 29 28 hln 100 REFDES=R1
a 0 u 13 0 7 27 hln 100 VALUE=1k
part 1348 DAC12 240 330 h
a 0 u 13 13 12 118 hln 100 Tsw_typ=50ns
a 0 s 11 0 38 -2 hln 100 PART=DAC12
a 0 x 0 0 0 0 hln 100 PKGREF=U1
a 0 xp 9 0 12 -2 hln 100 REFDES=U1
part 1476 readme 650 140 h
a 0 u 3 0 22 34 hln 100 filename=sa_adc.rdm
a 0 sp 0 0 17 20 hln 200 PART=readme
a 0 a 0 0 0 0 hln 100 PKGREF=
part 0 titleblk 970 720 h
a 1 s 13 0 350 10 hcn 100 PageSize=A
a 1 x 13 0 180 60 hcn 150 PageTitle=Successive Approximation A-to-D Converter
a 1 s 13 0 300 95 hrn 100 PageNO=1
a 1 s 13 0 340 95 hrn 100 PageCount=1
part 318 nodeMarker 400 350 h
a 0 a 0 0 4 22 hlb 100 LABEL=1
part 385 nodeMarker 300 160 v
a 0 a 0 0 4 22 hlb 100 LABEL=20
part 387 nodeMarker 300 200 v
a 0 a 0 0 4 22 hlb 100 LABEL=21
part 559 nodeMarker 640 200 v
a 0 a 0 0 4 22 hlb 100 LABEL=32
part 1102 nodeMarker 220 270 v
a 0 x 0 0 4 22 hlb 100 LABEL=3
part 1104 nodeMarker 490 270 v
a 0 a 0 0 4 22 hlb 100 LABEL=36
@conn
w 1420
a 0 s 3 0 303 228 hln 100 LABEL=Clock
s 450 230 300 230 1419
a 0 s 3 0 303 228 hln 100 LABEL=Clock
s 300 200 360 200 1421
s 300 230 300 200 1423
s 280 230 300 230 1425
s 510 220 450 220 1427
s 450 230 450 220 1429
w 1432
a 0 s 3 0 470 280 hln 100 LABEL=Compare
s 490 270 460 270 1431
a 0 s 3 0 470 280 hln 100 LABEL=Compare
s 490 250 510 250 1433
s 490 270 490 250 1435
w 1438
a 0 s 3 0 295 158 hln 100 LABEL=Convert
s 300 160 360 160 1437
a 0 s 3 0 295 158 hln 100 LABEL=Convert
s 280 160 300 160 1439
w 1442
s 340 300 340 280 1441
w 1444
s 220 270 330 270 1443
w 1446
s 320 390 370 390 1445
w 1448
s 320 420 350 420 1447
s 350 420 350 430 1449
w 1452
s 400 350 400 390 1451
s 320 350 340 350 1455
s 340 350 400 350 1459
s 340 350 340 330 1457
b 1461
a 0 s 3 0 453 176 hln 100 LABEL=C[3-0]
s 510 180 430 180 1460
a 0 s 3 0 453 176 hln 100 LABEL=C[3-0]
b 1465
a 0 s 3 0 577 456 hln 100 LABEL=D[11-0]
s 620 200 640 200 1475
a 0 s 3 0 577 456 hln 100 LABEL=D[11-0]
s 220 370 220 460 1464
s 220 370 240 370 1466
s 590 200 620 200 1472
s 620 200 620 460 1470
s 220 460 620 460 1473
@junction
j 360 200
+ p 242 CLK
+ w 1420
j 300 200
+ p 387 pin1
+ w 1420
j 280 230
+ p 892 *OUT
+ w 1420
j 300 230
+ w 1420
+ w 1420
j 510 220
+ p 24 CLK
+ w 1420
j 460 270
+ p 15 OUT
+ w 1432
j 490 270
+ p 1104 pin1
+ w 1432
j 510 250
+ p 24 CMP
+ w 1432
j 360 160
+ p 242 CONV
+ w 1438
j 300 160
+ p 385 pin1
+ w 1438
j 280 160
+ p 891 *OUT
+ w 1438
j 340 280
+ p 12 IN1
+ w 1442
j 340 300
+ p 486 OUT
+ w 1442
j 330 270
+ p 12 IN2
+ w 1444
j 220 270
+ p 893 +
+ w 1444
j 220 270
+ p 1102 pin1
+ w 1444
j 370 390
+ p 2 +
+ w 1446
j 320 390
+ p 1348 REF
+ w 1446
j 320 420
+ p 1348 GND
+ w 1448
j 350 430
+ s 6
+ w 1448
j 400 390
+ p 308 2
+ w 1452
j 400 350
+ p 318 pin1
+ w 1452
j 320 350
+ p 1348 OUT
+ w 1452
j 340 330
+ p 486 IN2
+ w 1452
j 340 350
+ w 1452
+ w 1452
j 510 180
+ P 24 C[3-0]
C[3]
C[2]
C[1]
C[0]
+ b 1461
C[3]
C[2]
C[1]
C[0]
j 430 180
+ P 242 C[3-0]
C[3]
C[2]
C[1]
C[0]
+ b 1461
C[3]
C[2]
C[1]
C[0]
j 640 200
+ S 1087
D[11]
D[10]
D[9]
D[8]
D[7]
D[6]
D[5]
D[4]
D[3]
D[2]
D[1]
D[0]
+ b 1465
D[11]
D[10]
D[9]
D[8]
D[7]
D[6]
D[5]
D[4]
D[3]
D[2]
D[1]
D[0]
j 640 200
+ p 559 pin1
+ b 1465
j 240 370
+ P 1348 D[11-0]
D[11]
D[10]
D[9]
D[8]
D[7]
D[6]
D[5]
D[4]
D[3]
D[2]
D[1]
D[0]
+ b 1465
D[11]
D[10]
D[9]
D[8]
D[7]
D[6]
D[5]
D[4]
D[3]
D[2]
D[1]
D[0]
j 590 200
+ P 24 D[11-0]
D[11]
D[10]
D[9]
D[8]
D[7]
D[6]
D[5]
D[4]
D[3]
D[2]
D[1]
D[0]
+ b 1465
D[11]
D[10]
D[9]
D[8]
D[7]
D[6]
D[5]
D[4]
D[3]
D[2]
D[1]
D[0]
j 620 200
+ b 1465
D[11]
D[10]
D[9]
D[8]
D[7]
D[6]
D[5]
D[4]
D[3]
D[2]
D[1]
D[0]
+ b 1465
D[11]
D[10]
D[9]
D[8]
D[7]
D[6]
D[5]
D[4]
D[3]
D[2]
D[1]
D[0]
j 370 430
+ p 2 -
+ s 5
j 360 270
+ p 12 OUT
+ p 14 IN
j 410 270
+ p 14 OUT
+ p 15 IN
j 350 320
+ p 485 OUT
+ p 486 IN1
j 220 310
+ p 893 -
+ s 21
j 220 270
+ p 893 +
+ p 1102 pin1
j 400 430
+ p 308 1
+ s 309
j 640 200
+ s 1087
+ p 559 pin1
@attributes
a 0 s 0 0 0 0 hln 100 PAGETITLE=
a 0 s 0 0 0 0 hln 100 PAGENO=1
a 0 s 0 0 0 0 hln 100 PAGESIZE=A
a 0 s 0 0 0 0 hln 100 PAGECOUNT=1
@text
s 5 190 110 hln 180 12-bit Successive Approximation Analog-to-Digital Converter
