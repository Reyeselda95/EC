*version 6.2 702030881
u 26
V? 2
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
pageloc 1 0 975 
@status
c 95:07:09:08:52:29;807958349
*page 1 0 970 720 iA
@ports
port 1 interface 140 70 H
a 1 s 14 0 19 6 hcn 100 LABEL=out
port 12 agnd 120 130 h
@parts
part 2 vsrc 110 80 h
a 1 u 0 0 0 0 hcn 100 AC=1v
a 1 xp 0 0 20 10 hcn 100 refdes=V1
a 0 s 0 0 0 0 hln 100 PKGREF=V1
part 3 r 140 120 v
a 0 u 0 0 15 25 hln 100 value=1Meg
a 1 xp 0 0 15 0 hln 100 REFDES=R1
a 0 s 0 0 0 0 hln 100 PKGREF=R1
part 25 readme 230 60 h
a 0 u 3 0 22 34 hln 100 filename=fsksub.rdm
a 0 sp 0 0 17 20 hln 200 PART=readme
a 0 a 0 0 0 0 hln 100 PKGREF=
@conn
w 5
s 110 120 110 130 4
s 110 130 120 130 7
s 140 130 140 120 9
s 120 130 140 130 13
w 16
s 110 80 110 70 15
s 110 70 140 70 18
s 140 70 140 80 20
@junction
j 110 120
+ p 2 -
+ w 5
j 140 120
+ p 3 1
+ w 5
j 120 130
+ s 12
+ w 5
j 110 80
+ p 2 +
+ w 16
j 140 80
+ p 3 2
+ w 16
j 140 70
+ s 1
+ w 16
@attributes
a 0 s 13 0 0 0 hln 100 PAGETITLE=
a 0 s 13 0 0 0 hln 100 PAGENO=1
a 0 s 13 0 0 0 hln 100 PAGESIZE=A
a 0 s 13 0 0 0 hln 100 PAGECOUNT=1
@text
s 5 210 40 hln 200 AC Source
