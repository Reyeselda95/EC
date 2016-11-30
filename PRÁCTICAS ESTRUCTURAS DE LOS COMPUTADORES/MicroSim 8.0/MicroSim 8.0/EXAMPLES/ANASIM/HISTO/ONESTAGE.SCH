*version 6.2 614864652
u 300
U? 4
V? 7
R? 7
C? 5
? 2
@libraries
@analysis
.AC 1 3 0
+0 50
+1 100
+2 1Meg
.TRAN 0 0 0 0
+0 1us
+1 10ms
.MC 1 2 1 1 1 2 0 1 1 0
+0 100
+1 V(OUT)
.PROBE 0 1 0 1 0 2
.LIB onestage.lib
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
pageloc 1 0 3335 One Stage
@status
n 0 93:03:21:16:07:00;735408420 e 
s 8033 93:04:07:18:12:17;736798337 e 
c 95:07:16:09:32:48;808565568
*page 1 0 1520 970 iB
@ports
port 3 agnd 240 190 h
port 49 AGND 170 190 h
port 188 IF_OUT 350 170 h
a 1 x 3 0 31 8 hcn 100 LABEL=OUT
port 189 IF_IN 120 150 h
a 1 x 3 0 19 8 hcn 100 LABEL=IN
port 240 agnd 180 320 h
port 12 offpage 280 140 u
a 1 x 14 0 49 15 hcn 100 LABEL=V-
port 15 offpage 280 200 v
a 1 x 14 0 46 2 hcn 100 LABEL=V+
port 241 offpage 180 280 d
a 1 x 14 0 2 12 hcn 100 LABEL=V+
port 242 offpage 220 280 d
a 1 x 14 0 2 8 hcn 100 LABEL=V-
@parts
part 1 LT1013/LT 240 190 U
a 0 s 11 0 95 0 hln 100 PART=LT1013/LT
a 0 a 0 0 0 0 hln 100 PKGREF=U1
a 0 s 0 0 0 0 hln 100 GATE=
a 0 ap 9 0 59 10 hln 100 REFDES=U1
part 238 vsrc 180 280 h
a 1 u 0 0 0 0 hcn 100 DC=15
a 0 x 0 0 0 0 hln 100 PKGREF=V1
a 1 xp 9 0 20 10 hcn 100 refdes=V1
part 239 vsrc 220 280 h
a 1 u 0 0 0 0 hcn 100 DC=-15
a 0 x 0 0 0 0 hln 100 PKGREF=V2
a 1 xp 9 0 20 10 hcn 100 refdes=V2
part 16 R 120 150 h
a 0 u 13 0 11 27 hln 100 VALUE=6.34k
a 0 s 0 0 0 10 hlb 100 PART=R
a 0 a 0 0 0 0 hln 100 PKGREF=R1
a 0 ap 9 0 15 0 hln 100 REFDES=R1
a 0 u 13 0 16 38 hlb 100 TOLERANCE=1%
part 17 R 170 150 d
a 0 u 13 0 30 5 hln 100 VALUE=@Rin
a 0 x 0 0 0 10 hlb 100 PART=R
a 0 a 0 0 0 0 hln 100 PKGREF=R2
a 0 ap 9 0 20 0 hln 100 REFDES=R2
a 0 u 13 0 44 0 hlb 100 TOLERANCE=1%
part 18 R 250 90 h
a 0 u 13 0 5 25 hln 100 VALUE=@Rfeedback
a 0 s 0 0 0 10 hlb 100 PART=R
a 0 a 0 0 0 0 hln 100 PKGREF=R3
a 0 ap 9 0 15 0 hln 100 REFDES=R3
a 0 u 13 0 16 38 hlb 100 TOLERANCE=1%
part 22 C 190 150 h
a 0 u 13 0 15 25 hln 100 VALUE=10n
a 0 x 0 0 0 10 hlb 100 PART=C
a 0 a 0 0 0 0 hln 100 PKGREF=C1
a 0 ap 9 0 15 0 hln 100 REFDES=C1
a 0 u 13 0 16 38 hlb 100 TOLERANCE=5%
part 23 C 250 50 h
a 0 u 13 0 20 20 hln 100 VALUE=10n
a 0 x 0 0 0 10 hlb 100 PART=C
a 0 a 0 0 0 0 hln 100 PKGREF=C2
a 0 ap 9 0 15 0 hln 100 REFDES=C2
a 0 u 13 0 22 32 hlb 100 TOLERANCE=5%
part 297 readme 410 50 h
a 0 u 3 0 22 34 hln 100 filename=onestage.rdm
a 0 sp 0 0 17 20 hln 200 PART=readme
a 0 a 0 0 0 0 hln 100 PKGREF=
part 0 titleblk 1520 970 h
a 1 s 13 0 350 10 hcn 100 PageSize=B
a 1 s 13 0 180 60 hcn 100 PageTitle=
a 1 s 13 0 300 95 hrn 100 PageNO=1
a 1 s 13 0 340 95 hrn 100 PageCount=1
@conn
w 265
s 240 150 230 150 268
s 230 90 250 90 266
s 230 150 220 150 272
s 230 150 230 90 270
w 274
s 190 150 180 150 275
s 180 150 180 50 277
s 180 50 250 50 280
s 180 150 170 150 282
s 170 150 160 150 299
w 285
s 180 320 220 320 284
w 287
s 350 50 350 90 288
s 350 90 350 170 292
s 350 90 290 90 290
s 350 170 320 170 293
s 350 50 280 50 295
@junction
j 240 150
+ p 1 -
+ w 265
j 230 150
+ w 265
+ w 265
j 180 150
+ w 274
+ w 274
j 180 320
+ p 238 -
+ w 285
j 220 320
+ p 239 -
+ w 285
j 180 320
+ s 240
+ w 285
j 350 170
+ s 188
+ w 287
j 350 90
+ w 287
+ w 287
j 320 170
+ p 1 OUT
+ w 287
j 240 190
+ p 1 +
+ s 3
j 280 140
+ p 1 V-
+ s 12
j 280 200
+ p 1 V+
+ s 15
j 180 320
+ p 238 -
+ s 240
j 180 280
+ p 238 +
+ s 241
j 220 280
+ p 239 +
+ s 242
j 120 150
+ p 16 1
+ s 189
j 160 150
+ p 16 2
+ w 274
j 170 190
+ p 17 2
+ s 49
j 170 150
+ p 17 1
+ w 274
j 250 90
+ p 18 1
+ w 265
j 290 90
+ p 18 2
+ w 287
j 220 150
+ p 22 2
+ w 265
j 190 150
+ p 22 1
+ w 274
j 250 50
+ p 23 1
+ w 274
j 280 50
+ p 23 2
+ w 287
@attributes
a 0 s 0 0 0 0 hln 100 PAGETITLE=
a 0 s 0 0 0 0 hln 100 PAGENO=1
a 0 s 0 0 0 0 hln 100 PAGESIZE=B
a 0 s 0 0 0 0 hln 100 PAGECOUNT=1
@text
s 5 80 20 hln 200 Band Pass RC Biquad Stage
