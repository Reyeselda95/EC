*version 6.2 199545622
u 347
R? 6
V? 4
E? 3
U? 9
@libraries
@analysis
@targets
@attributes
@translators
a 0 u 13 0 0 0 hln 100 PSPICE=DEFAULT
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
a 0 u 13 0 0 0 hln 100 PRINT=DEFAULT
@index
pageloc 1 0 3055 
@status
c 95:07:09:08:53:24;807958404
*page 1 0 970 720 iA
@ports
port 263 interface 410 180 H
a 1 s 14 0 21 6 hcn 100 LABEL=out
@parts
block 238 blocksym0 100 40 h
a 0 x 9 0 -8 -2 hln 100 REFDES=VCO
a 0 s 0 0 0 0 hln 100 PKGREF=VCO
*symbol blocksym238
d 
@type p
@attributes
a 0 s 9 0 0 0 hln 100 REFDES=U?
a 0 s 0 0 0 0 hln 100 PART=
@views
a 0 u 13 0 0 0 hln 100 DEFAULT=fsk11
@pins
p 1 38 25 hrb 100 out l 40 20 d
@graphics 40 40 0 0 10
r 0 0 0 40 40
*end blocksym
block 239 blocksym0 100 120 h
a 0 x 9 0 -8 -6 hln 100 REFDES=INTER1
a 0 u 13 0 36 -6 hln 100 FC=35Meg
a 0 s 0 0 0 0 hln 100 PKGREF=INTER1
*symbol blocksym239
d 
@type p
@attributes
a 0 s 9 0 0 0 hln 100 REFDES=U?
a 0 s 0 0 0 0 hln 100 PART=
@views
a 0 u 13 0 0 0 hln 100 DEFAULT=fsk12
@pins
p 1 38 25 hrb 100 out l 40 20 d
@graphics 40 40 0 0 10
r 0 0 0 40 40
*end blocksym
block 241 blocksym0 100 200 h
a 0 x 9 0 -8 -6 hln 100 REFDES=INTER2
a 0 u 13 0 36 -6 hln 100 FC=65Meg
a 0 s 0 0 0 0 hln 100 PKGREF=INTER2
*symbol blocksym241
d 
@type p
@attributes
a 0 s 9 0 0 0 hln 100 REFDES=U?
a 0 s 0 0 0 0 hln 100 PART=
@views
a 0 u 13 0 0 0 hln 100 DEFAULT=fsk12
@pins
p 1 38 25 hrb 100 out l 40 20 d
@graphics 40 40 0 0 10
r 0 0 0 40 40
*end blocksym
block 268 blocksym0 350 160 h
a 0 x 9 0 2 -10 hln 100 REFDES=Attenuator
a 0 u 13 13 8 10 hln 100 dB=40
a 0 s 0 0 0 0 hln 100 PKGREF=Attenuator
*symbol blocksym268
d 
@type p
@attributes
a 0 s 9 0 0 0 hln 100 REFDES=U?
a 0 s 0 0 0 0 hln 100 PART=
@views
a 0 u 13 0 0 0 hln 100 DEFAULT=fsk14
@pins
p 1 2 25 hlb 100 in l 0 20 d
p 1 48 25 hrb 100 out l 50 20 d
@graphics 50 40 0 0 10
r 0 0 0 50 40
*end blocksym
block 277 blocksym0 100 280 h
a 0 a 9 0 0 -4 hln 100 REFDES=AC
a 0 s 0 0 0 0 hln 100 PKGREF=AC
*symbol blocksym277
d 
@type p
@attributes
a 0 s 9 0 0 0 hln 100 REFDES=U?
a 0 s 0 0 0 0 hln 100 PART=
@views
a 0 u 13 0 0 0 hln 100 DEFAULT=fsk15
@pins
p 1 38 25 hrb 100 out l 40 20 d
@graphics 40 40 0 0 10
r 0 0 0 40 40
*end blocksym
part 319 summer 260 160 h
a 0 s 0 0 16 50 hln 100 PART=summer
a 0 ap 9 0 -2 -8 hln 100 REFDES=Summer
a 0 s 0 0 0 0 hln 100 PKGREF=Summer
part 346 readme 300 70 h
a 0 u 3 0 22 34 hln 100 filename=fsksub.rdm
a 0 sp 0 0 17 20 hln 200 PART=readme
a 0 a 0 0 0 0 hln 100 PKGREF=
@conn
w 244
s 140 60 210 60 243
s 210 60 210 160 325
s 210 160 260 160 329
w 280
s 140 300 210 300 279
s 210 300 210 200 327
s 210 200 260 200 338
w 295
s 140 140 190 140 294
s 190 140 190 170 297
s 190 170 260 170 332
w 302
s 140 220 190 220 301
s 190 220 190 190 304
s 190 190 260 190 335
w 313
s 300 180 350 180 312
w 316
s 400 180 410 180 315
@junction
j 140 60
+ p 238 out
+ w 244
j 140 300
+ p 277 out
+ w 280
j 140 140
+ p 239 out
+ w 295
j 140 220
+ p 241 out
+ w 302
j 350 180
+ p 268 in
+ w 313
j 400 180
+ p 268 out
+ w 316
j 410 180
+ s 263
+ w 316
j 260 160
+ p 319 in1
+ w 244
j 260 200
+ p 319 in4
+ w 280
j 260 170
+ p 319 in2
+ w 295
j 260 190
+ p 319 in3
+ w 302
j 300 180
+ p 319 out
+ w 313
@attributes
a 0 s 13 0 0 0 hln 100 PAGETITLE=
a 0 s 13 0 0 0 hln 100 PAGENO=1
a 0 s 13 0 0 0 hln 100 PAGESIZE=A
a 0 s 13 0 0 0 hln 100 PAGECOUNT=1
@text
