*version 6.2 1177279386
u 50
E? 2
R? 2
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
pageloc 1 0 1471 
@status
c 95:07:09:08:50:15;807958215
*page 1 0 970 720 iA
@ports
port 1 interface 190 160 h
a 1 s 14 0 21 8 hcn 100 LABEL=in
port 2 interface 300 160 H
a 1 s 14 0 19 8 hcn 100 LABEL=out
port 35 agnd 250 220 h
@parts
part 4 etable 220 160 h
a 0 u 0 0 -24 104 hln 100 EXPR=V(%IN+, %IN-)
a 0 u 13 13 -34 114 hln 100 TABLE=(-1uV,0.2V) (1uV,3.5V)
a 0 s 0 0 10 34 hln 100 PART=etable
a 1 xp 9 0 -6 0 hln 100 REFDES=Comparator
a 0 s 0 0 0 0 hln 100 PKGREF=Comparator
part 38 r 290 210 v
a 0 u 0 0 15 25 hln 100 value=1k
a 1 xp 0 0 15 0 hln 100 REFDES=R1
a 0 s 0 0 0 0 hln 100 PKGREF=R1
part 49 readme 270 90 h
a 0 u 3 0 22 34 hln 100 filename=fsksub.rdm
a 0 sp 0 0 17 20 hln 200 PART=readme
a 0 a 0 0 0 0 hln 100 PKGREF=
@conn
w 16
s 190 160 220 160 15
w 20
s 270 160 290 160 19
s 290 160 300 160 43
s 290 160 290 170 39
w 24
s 190 220 220 220 23
s 220 220 250 220 29
s 220 170 220 220 25
s 270 220 290 220 34
s 270 170 270 220 30
s 250 220 270 220 36
s 290 220 320 220 48
s 290 210 290 220 44
@junction
j 220 160
+ p 4 IN+
+ w 16
j 190 160
+ s 1
+ w 16
j 270 160
+ p 4 OUT+
+ w 20
j 300 160
+ s 2
+ w 20
j 220 170
+ p 4 IN-
+ w 24
j 220 220
+ w 24
+ w 24
j 270 170
+ p 4 OUT-
+ w 24
j 270 220
+ w 24
+ w 24
j 250 220
+ s 35
+ w 24
j 290 170
+ p 38 2
+ w 20
j 290 160
+ w 20
+ w 20
j 290 210
+ p 38 1
+ w 24
j 290 220
+ w 24
+ w 24
@attributes
a 0 s 13 0 0 0 hln 100 PAGETITLE=
a 0 s 13 0 0 0 hln 100 PAGENO=1
a 0 s 13 0 0 0 hln 100 PAGESIZE=A
a 0 s 13 0 0 0 hln 100 PAGECOUNT=1
@text
s 5 180 70 hln 250 Comparator
