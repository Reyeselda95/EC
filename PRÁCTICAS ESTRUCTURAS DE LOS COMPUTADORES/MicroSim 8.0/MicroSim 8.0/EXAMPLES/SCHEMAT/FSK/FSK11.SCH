*version 6.2 366220178
u 290
R? 7
V? 4
E? 3
? 3
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
pageloc 1 0 1820 
@status
c 95:07:09:08:53:09;807958389
*page 1 0 970 720 iA
@ports
port 35 agnd 190 90 h
port 37 agnd 140 90 h
port 39 agnd 100 110 h
port 246 interface 230 60 H
a 1 s 14 0 21 8 hcn 100 LABEL=out
port 281 agnd 220 100 h
@parts
part 6 evalue 140 80 h
a 0 u 0 0 10 44 hln 100 EXPR=SIN(6.28*1E6*TIME*V(%IN+, %IN-))
a 0 s 0 0 10 34 hln 100 PART=evalue
a 1 xp 9 0 10 2 hln 100 REFDES=Evco
a 0 s 0 0 0 0 hln 100 PKGREF=Evco
part 7 vpulse 80 60 h
a 1 xp 9 0 -18 22 hcn 100 refdes=Vfsk
a 1 u 0 0 0 0 hcn 100 v1=55v
a 1 u 0 0 0 0 hcn 100 v2=45v
a 1 u 0 0 0 0 hcn 100 td=0
a 1 u 0 0 0 0 hcn 100 tr=5ns
a 1 u 0 0 0 0 hcn 100 tf=5ns
a 1 u 0 0 0 0 hcn 100 pw=190ns
a 1 u 0 0 0 0 hcn 100 per=1us
a 0 s 0 0 0 0 hln 100 PKGREF=Vfsk
part 62 r 110 110 v
a 0 u 0 0 15 25 hln 100 value=1k
a 1 xp 0 0 15 6 hln 100 REFDES=R2
a 0 s 0 0 0 0 hln 100 PKGREF=R2
part 278 r 220 100 v
a 0 u 0 0 15 25 hln 100 value=1k
a 1 xp 0 0 15 0 hln 100 REFDES=R6
a 0 s 0 0 0 0 hln 100 PKGREF=R6
part 289 readme 140 140 h
a 0 u 3 0 22 34 hln 100 filename=fsksub.rdm
a 0 sp 0 0 17 20 hln 200 PART=readme
a 0 a 0 0 0 0 hln 100 PKGREF=
@conn
w 192
s 80 100 80 110 191
s 80 110 100 110 194
s 100 110 110 110 197
w 252
s 80 60 80 50 251
s 80 50 110 50 254
s 110 50 110 60 256
s 110 60 110 70 262
s 110 60 140 60 259
s 140 60 140 80 263
w 273
s 190 80 190 60 272
s 190 60 220 60 275
s 220 60 230 60 279
@junction
j 80 100
+ p 7 -
+ w 192
j 100 110
+ s 39
+ w 192
j 110 110
+ p 62 1
+ w 192
j 190 90
+ p 6 OUT-
+ s 35
j 140 90
+ p 6 IN-
+ s 37
j 80 60
+ p 7 +
+ w 252
j 110 70
+ p 62 2
+ w 252
j 110 60
+ w 252
+ w 252
j 140 80
+ p 6 IN+
+ w 252
j 190 80
+ p 6 OUT+
+ w 273
j 230 60
+ s 246
+ w 273
j 220 60
+ p 278 2
+ w 273
j 220 100
+ s 281
+ p 278 1
@attributes
a 0 s 13 0 0 0 hln 100 PAGETITLE=
a 0 s 13 0 0 0 hln 100 PAGENO=1
a 0 s 13 0 0 0 hln 100 PAGESIZE=A
a 0 s 13 0 0 0 hln 100 PAGECOUNT=1
@text
