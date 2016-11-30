*version 6.2 468458177
u 123
E? 3
R? 5
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
pageloc 1 0 2410 
@status
c 95:07:09:08:52:47;807958367
*page 1 0 970 720 iA
@ports
port 1 interface 90 90 h
a 1 s 14 0 21 8 hcn 100 LABEL=in
port 2 interface 380 90 H
a 1 s 14 0 21 6 hcn 100 LABEL=out
port 102 agnd 240 130 h
@parts
part 3 evalue 140 90 h
a 0 u 0 0 10 44 hln 100 EXPR=V(%IN+, %IN-)
a 0 s 0 0 10 34 hln 100 PART=evalue
a 1 xp 0 0 10 2 hln 100 REFDES=E1
a 0 s 0 0 0 0 hln 100 PKGREF=E1
part 4 evalue 280 90 h
a 0 u 0 0 10 44 hln 100 EXPR=V(%IN+, %IN-)
a 0 s 0 0 10 34 hln 100 PART=evalue
a 1 xp 0 0 10 2 hln 100 REFDES=E2
a 0 s 0 0 0 0 hln 100 PKGREF=E2
part 5 r 200 90 h
a 0 u 13 0 -23 -3 hln 100 value={PWR(10,@DB/10)}
a 1 xp 0 0 3 0 hln 100 REFDES=R1
a 0 s 0 0 0 0 hln 100 PKGREF=R1
part 6 r 250 130 v
a 0 u 13 0 19 25 hln 100 value=1
a 1 xp 0 0 21 32 hln 100 REFDES=R2
a 0 s 0 0 0 0 hln 100 PKGREF=R2
part 7 r 360 130 v
a 0 u 0 0 11 31 hln 100 value=1k
a 1 xp 0 0 21 36 hln 100 REFDES=Rout
a 0 s 0 0 0 0 hln 100 PKGREF=Rout
part 8 r 120 130 v
a 0 u 0 0 5 -49 hln 100 value=1Meg
a 1 xp 0 0 15 0 hln 100 REFDES=Rin
a 0 s 0 0 0 0 hln 100 PKGREF=Rin
part 122 readme 120 160 h
a 0 u 3 0 22 34 hln 100 filename=fsksub.rdm
a 0 sp 0 0 17 20 hln 200 PART=readme
a 0 a 0 0 0 0 hln 100 PKGREF=
@conn
w 18
s 90 90 120 90 17
s 120 90 140 90 20
w 29
s 190 90 200 90 28
w 33
s 240 90 250 90 32
s 250 90 280 90 57
w 85
s 280 130 340 130 51
s 280 100 280 130 54
s 250 130 280 130 60
s 190 130 240 130 42
s 140 130 190 130 27
s 190 100 190 130 38
s 120 130 140 130 15
s 140 100 140 130 23
s 100 130 120 130 9
s 360 130 370 130 100
s 240 130 250 130 103
s 330 90 340 90 117
s 340 130 360 130 121
s 340 90 340 130 119
w 91
s 360 90 380 90 92
s 350 90 360 90 114
s 350 100 350 90 112
s 330 100 350 100 115
@junction
j 250 130
+ p 6 1
+ w 85
j 120 130
+ p 8 1
+ w 85
j 140 90
+ p 3 IN+
+ w 18
j 120 90
+ p 8 2
+ w 18
j 90 90
+ s 1
+ w 18
j 140 100
+ p 3 IN-
+ w 85
j 140 130
+ w 85
+ w 85
j 190 90
+ p 3 OUT+
+ w 29
j 200 90
+ p 5 1
+ w 29
j 240 90
+ p 5 2
+ w 33
j 250 90
+ p 6 2
+ w 33
j 190 100
+ p 3 OUT-
+ w 85
j 190 130
+ w 85
+ w 85
j 280 100
+ p 4 IN-
+ w 85
j 280 90
+ p 4 IN+
+ w 33
j 250 130
+ w 85
+ w 85
j 280 130
+ w 85
+ w 85
j 360 130
+ p 7 1
+ w 85
j 360 90
+ p 7 2
+ w 91
j 380 90
+ s 2
+ w 91
j 240 130
+ s 102
+ w 85
j 330 100
+ p 4 OUT-
+ w 91
j 330 90
+ p 4 OUT+
+ w 85
j 340 130
+ w 85
+ w 85
@attributes
a 0 s 13 0 0 0 hln 100 PAGETITLE=
a 0 s 13 0 0 0 hln 100 PAGENO=1
a 0 s 13 0 0 0 hln 100 PAGESIZE=A
a 0 s 13 0 0 0 hln 100 PAGECOUNT=1
@text
