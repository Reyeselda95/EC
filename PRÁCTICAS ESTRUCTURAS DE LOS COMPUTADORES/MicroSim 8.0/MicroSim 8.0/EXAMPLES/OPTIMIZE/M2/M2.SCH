*version 6.1 430057837
u 386
M? 7
R? 6
C? 6
V? 4
PM? 2
I? 2
@libraries
@analysis
.AC 1 3 0
+0 3
+1 100
+2 100Meg
.DC 1 0 3 0 1 1
+ 0 0 V2
+ 0 7 10v
.INC m2.inc
@targets
@attributes
@translators
a 0 u 13 0 0 0 hln 100 PSPICE=PSPICE
a 0 u 13 0 0 0 hln 100 PADS=PCB
a 0 u 13 0 0 0 hln 100 PCAD=PCB
a 0 u 13 0 0 0 hln 100 PROTEL=PCB
a 0 u 13 0 0 0 hln 100 TANGO=PCB
a 0 u 13 0 0 0 hln 100 CADSTAR=PCB
a 0 u 13 0 0 0 hln 100 EDIF=PCB
a 0 u 13 0 0 0 hln 100 SCICARDS=PCB
a 0 u 13 0 0 0 hln 100 POLARIS=PCB
@index
pageloc 1 0 6423 
@status
n 0 94:05:01:09:57:58;770464678 e 
s 0 94:05:01:09:58:06;770464686 e 
*page 1 0 1520 970 iB
@ports
port 14 agnd 230 300 h
port 71 bubble 150 270 v
a 1 x 14 0 20 5 hcn 100 LABEL=Vin
port 72 bubble 330 230 d
a 1 x 14 0 0 0 hcn 100 LABEL=Vout
port 78 bubble 300 100 d
a 1 x 14 0 0 0 hcn 100 LABEL=Vdd
port 96 bubble 480 250 h
a 1 x 14 0 0 0 hcn 100 LABEL=Vin
port 102 bubble 510 280 h
a 1 x 14 0 0 0 hcn 100 LABEL=Vdd
port 234 agnd 90 220 h
port 266 agnd 500 340 h
@parts
part 40 c 290 270 v
a 0 u 13 0 5 45 hln 100 VALUE=5pF
a 0 sp 0 0 0 10 hlb 100 PART=c
a 0 x 0 0 0 0 hln 100 PKGREF=Cload
a 0 xp 9 0 20 50 hln 100 REFDES=Cload
part 101 vsrc 510 280 h
a 1 u 0 0 0 0 hcn 100 DC=10v
a 0 a 0 0 0 0 hln 100 PKGREF=V2
a 1 ap 9 0 20 10 hcn 100 REFDES=V2
part 203 MbreakN3 170 240 h
a 0 u 13 13 35 60 hln 100 L={L1}
a 0 u 13 13 35 45 hln 100 W={W1}
a 0 sp 11 0 37 25 hln 100 MODEL=MN
a 0 x 0 0 0 0 hln 100 PKGREF=M1
a 0 xp 9 0 35 10 hln 100 REFDES=M1
part 205 MbreakP3 170 150 U
a 0 u 13 13 -5 40 hln 100 L=10u
a 0 u 13 13 -5 55 hln 100 W=50u
a 0 sp 11 0 51 20 hln 100 MODEL=MP
a 0 x 0 0 0 0 hln 100 PKGREF=M4
a 0 xp 9 0 50 35 hln 100 REFDES=M4
part 206 MbreakP3 120 150 u
a 0 u 0 0 0 0 hln 100 L=10u
a 0 u 0 0 0 0 hln 100 W=50u
a 0 sp 11 0 51 20 hln 100 MODEL=MP
a 0 x 0 0 0 0 hln 100 PKGREF=M3
a 0 xp 9 0 50 35 hln 100 REFDES=M3
part 228 isrc 90 180 h
a 1 u 13 0 -15 35 hcn 100 DC={Iref}
a 0 a 0 0 0 0 hln 100 PKGREF=I1
a 1 ap 9 0 -10 10 hcn 100 REFDES=I1
part 272 r 190 210 u
a 0 u 13 0 40 25 hln 100 VALUE=10Meg
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 a 0 0 0 0 hln 100 PKGREF=R4
a 0 ap 9 0 30 35 hln 100 REFDES=R4
part 318 MbreakN3 230 190 h
a 0 u 13 13 55 45 hln 100 L=10u
a 0 u 13 13 55 30 hln 100 W=50u
a 0 sp 11 0 37 25 hln 100 MODEL=MN
a 0 x 0 0 0 0 hln 100 PKGREF=M2
a 0 xp 9 0 35 10 hln 100 REFDES=M2
part 333 r 260 270 v
a 0 u 13 0 5 35 hln 100 VALUE=10k
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 x 0 0 0 0 hln 100 PKGREF=Ro
a 0 xp 9 0 35 30 hln 100 REFDES=Ro
part 353 vpwl 480 280 h
a 1 u 0 0 0 0 hcn 100 AC=1v
a 1 u 0 0 0 0 hcn 100 T1=0
a 1 u 0 0 0 0 hcn 100 V1=0
a 1 u 0 0 0 0 hcn 100 T2=10ns
a 1 u 0 0 0 0 hcn 100 V2=0.001v
a 1 u 0 0 0 0 hcn 100 T3=1us
a 1 u 0 0 0 0 hcn 100 V3=0v
a 0 x 0 0 0 0 hln 100 PKGREF=V1
a 1 xp 9 0 20 10 hcn 100 REFDES=V1
part 103 OPTPARAM 420 140 h
a 0 u 13 0 0 28 hln 100 NAME1=W1
a 0 u 0 0 0 10 hlb 100 ENABLE1=Y
a 0 u 13 0 50 30 hlb 100 INITVAL1=75u
a 0 u 13 0 90 30 hlb 100 CURVAL1=75u
a 0 u 0 0 0 10 hlb 100 LOVAL1=10u
a 0 u 0 0 0 10 hlb 100 HIVAL1=150u
a 0 u 0 0 0 10 hlb 100 TOL1=0
a 0 u 13 0 0 38 hln 100 NAME2=L1
a 0 u 0 0 0 10 hlb 100 ENABLE2=Y
a 0 u 13 0 50 40 hlb 100 INITVAL2=5u
a 0 u 13 0 90 40 hlb 100 CURVAL2=5u
a 0 u 0 0 0 10 hlb 100 LOVAL2=2u
a 0 u 0 0 0 10 hlb 100 HIVAL2=50u
a 0 u 0 0 0 20 hlb 100 TOL2=0
a 0 u 13 0 0 48 hln 100 NAME3=Iref
a 0 u 0 0 0 10 hlb 100 ENABLE3=Y
a 0 u 13 0 50 50 hlb 100 INITVAL3=100uA
a 0 u 13 0 90 50 hlb 100 CURVAL3=100uA
a 0 u 0 0 0 10 hlb 100 LOVAL3=10uA
a 0 u 0 0 0 10 hlb 100 HIVAL3=500uA
a 0 u 0 0 0 30 hlb 100 TOL3=0
a 0 u 13 0 0 58 hln 100 NAME4=
a 0 u 0 0 0 10 hlb 100 ENABLE4=
a 0 u 13 0 50 60 hlb 100 INITVAL4=
a 0 u 13 0 90 60 hlb 100 CURVAL4=
a 0 u 0 0 0 10 hlb 100 LOVAL4=
a 0 u 0 0 0 10 hlb 100 HIVAL4=
a 0 u 0 0 0 40 hlb 100 TOL4=
a 0 u 13 0 0 68 hln 100 NAME5=
a 0 u 0 0 0 10 hlb 100 ENABLE5=
a 0 u 13 0 50 70 hlb 100 INITVAL5=
a 0 u 13 0 90 70 hlb 100 CURVAL5=
a 0 u 0 0 0 10 hlb 100 LOVAL5=
a 0 u 0 0 0 10 hlb 100 HIVAL5=
a 0 u 0 0 0 50 hlb 100 TOL5=
a 0 u 13 0 0 78 hln 100 NAME6=
a 0 u 0 0 0 10 hlb 100 ENABLE6=
a 0 u 13 0 50 80 hlb 100 INITVAL6=
a 0 u 13 0 90 80 hlb 100 CURVAL6=
a 0 u 0 0 0 10 hlb 100 LOVAL6=
a 0 u 0 0 0 10 hlb 100 HIVAL6=
a 0 u 0 0 0 60 hlb 100 TOL6=
a 0 u 13 0 0 88 hln 100 NAME7=
a 0 u 0 0 0 10 hlb 100 ENABLE7=
a 0 u 13 0 50 90 hlb 100 INITVAL7=
a 0 u 13 0 90 90 hlb 100 CURVAL7=
a 0 u 0 0 0 10 hlb 100 LOVAL7=
a 0 u 0 0 0 10 hlb 100 HIVAL7=
a 0 s 0 0 0 10 hlb 100 PART=OPTPARAM
a 0 a 0 0 0 0 hln 100 PKGREF=PM1
a 1 ap 0 0 10 -2 hcn 100 refdes=PM1
part 361 c 480 280 v
a 0 u 13 0 -1 1 hln 100 VALUE=10u
a 0 sp 0 0 0 10 hlb 100 PART=c
a 0 a 0 0 0 0 hln 100 PKGREF=C5
a 0 ap 9 0 15 0 hln 100 REFDES=C5
part 0 titleblk 1520 970 h
a 1 s 13 0 350 10 hcn 100 PageSize=B
a 1 s 13 0 180 60 hcn 100 PageTitle=
a 1 s 13 0 300 95 hrn 100 PageNO=1
a 1 s 13 0 340 95 hrn 100 PageCount=1
@conn
w 154
s 70 100 90 100 157
s 90 100 200 100 211
s 90 100 90 130 209
s 200 100 200 130 212
s 200 100 260 100 325
s 260 100 300 100 329
s 260 170 260 100 327
w 208
s 90 170 90 180 225
s 140 150 140 180 220
s 120 150 140 150 207
s 140 150 170 150 222
s 140 180 90 180 240
w 256
s 230 300 260 300 133
s 200 300 230 300 127
s 200 260 200 300 123
s 260 270 260 300 336
s 260 300 290 300 339
s 290 270 290 300 341
s 100 300 200 300 357
s 290 300 350 300 359
w 309
s 200 170 200 190 215
s 200 210 200 220 308
s 200 210 190 210 306
s 200 190 200 210 332
s 200 190 230 190 330
w 335
s 260 210 260 220 334
s 260 220 260 230 347
s 260 220 290 220 345
s 290 220 290 230 348
s 290 230 290 240 352
s 290 230 330 230 350
w 354
s 150 240 170 240 284
s 150 210 150 240 305
s 150 240 150 270 355
w 379
s 480 320 480 340 378
s 480 340 500 340 380
s 510 320 510 340 382
s 500 340 510 340 384
@junction
j 230 300
+ s 14
+ w 256
j 200 220
+ p 203 d
+ w 309
j 200 260
+ p 203 s
+ w 256
j 170 150
+ p 205 g
+ w 208
j 120 150
+ p 206 g
+ w 208
j 90 130
+ p 206 s
+ w 154
j 90 100
+ w 154
+ w 154
j 200 130
+ p 205 s
+ w 154
j 200 170
+ p 205 d
+ w 309
j 90 170
+ p 206 d
+ w 208
j 140 150
+ w 208
+ w 208
j 200 100
+ w 154
+ w 154
j 200 300
+ w 256
+ w 256
j 90 180
+ p 228 +
+ w 208
j 90 220
+ s 234
+ p 228 -
j 170 240
+ p 203 g
+ w 354
j 150 210
+ p 272 2
+ w 354
j 190 210
+ p 272 1
+ w 309
j 200 210
+ w 309
+ w 309
j 260 170
+ p 318 d
+ w 154
j 260 100
+ w 154
+ w 154
j 230 190
+ p 318 g
+ w 309
j 200 190
+ w 309
+ w 309
j 260 210
+ p 318 s
+ w 335
j 260 230
+ p 333 2
+ w 335
j 260 270
+ p 333 1
+ w 256
j 260 300
+ w 256
+ w 256
j 290 270
+ p 40 1
+ w 256
j 290 300
+ w 256
+ w 256
j 260 220
+ w 335
+ w 335
j 290 240
+ p 40 2
+ w 335
j 330 230
+ s 72
+ w 335
j 290 230
+ w 335
+ w 335
j 300 100
+ s 78
+ w 154
j 150 270
+ s 71
+ w 354
j 150 240
+ w 354
+ w 354
j 480 320
+ p 353 -
+ w 379
j 500 340
+ s 266
+ w 379
j 510 320
+ p 101 -
+ w 379
j 510 280
+ p 101 +
+ s 102
j 480 280
+ p 353 +
+ p 361 1
j 480 250
+ p 361 2
+ s 96
@attributes
a 0 s 0 0 0 0 hln 100 PAGETITLE=
a 0 s 0 0 0 0 hln 100 PAGENO=1
a 0 s 0 0 0 0 hln 100 PAGESIZE=B
a 0 s 0 0 0 0 hln 100 PAGECOUNT=1
@text
s 5 180 50 hln 250 CMOS Amplifier
