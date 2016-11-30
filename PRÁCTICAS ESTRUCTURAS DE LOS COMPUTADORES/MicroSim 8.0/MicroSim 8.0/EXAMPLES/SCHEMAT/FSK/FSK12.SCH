*version 6.2 3317118125
u 21
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
pageloc 1 0 969 
@status
c 95:07:09:08:51:34;807958294
*page 1 0 970 720 iA
@ports
port 1 interface 190 120 H
a 1 s 14 0 21 8 hcn 100 LABEL=out
port 10 agnd 170 160 h
@parts
part 2 vsin 150 120 h
a 1 u 0 0 0 0 hcn 100 voff=0v
a 1 u 0 0 0 0 hcn 100 vampl=1v
a 1 u 0 0 0 0 hcn 100 freq=@FC
a 1 xp 9 0 20 10 hcn 100 refdes=V1
a 0 s 0 0 0 0 hln 100 PKGREF=V1
part 3 r 190 160 v
a 0 ap 9 0 15 0 hln 100 REFDES=R1
a 0 s 0 0 0 0 hln 100 PKGREF=R1
part 20 readme 150 200 h
a 0 u 3 0 22 34 hln 100 filename=fsksub.rdm
a 0 sp 0 0 17 20 hln 200 PART=readme
a 0 a 0 0 0 0 hln 100 PKGREF=
@conn
w 5
s 140 160 150 160 4
s 150 160 170 160 6
s 190 160 210 160 8
s 170 160 190 160 11
w 14
s 150 120 190 120 13
@junction
j 150 160
+ p 2 -
+ w 5
j 190 160
+ p 3 1
+ w 5
j 170 160
+ s 10
+ w 5
j 150 120
+ p 2 +
+ w 14
j 190 120
+ p 3 2
+ w 14
j 190 120
+ s 1
+ p 3 2
j 190 120
+ s 1
+ w 14
@attributes
a 0 s 13 0 0 0 hln 100 PAGETITLE=
a 0 s 13 0 0 0 hln 100 PAGENO=1
a 0 s 13 0 0 0 hln 100 PAGESIZE=A
a 0 s 13 0 0 0 hln 100 PAGECOUNT=1
@text
