*version 6.2 961787824
u 50
U? 3
IN? 2
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
pageloc 1 0 1148 
@status
c 95:07:09:08:54:00;807958440
*page 1 0 970 720 iA
@ports
port 1 interface 130 120 h
a 1 s 14 0 21 8 hcn 100 LABEL=D
port 2 interface 130 140 h
a 1 s 14 0 21 8 hcn 100 LABEL=CLK
port 3 interface 270 120 H
a 1 s 14 0 19 8 hcn 100 LABEL=Q
port 4 interface 270 140 H
a 1 s 14 0 19 8 hcn 100 LABEL=\Q\
@parts
part 40 include 300 70 h
a 0 u 13 0 48 9 hln 100 FILENAME=fsk32.inc
a 1 xp 0 0 30 0 hcn 100 refdes=IN1
a 0 s 0 0 0 0 hln 100 PKGREF=IN1
part 41 flipflop 180 120 h
a 0 s 11 0 44 80 hln 100 PART=flipflop
a 0 ap 9 0 40 8 hln 100 REFDES=U2
a 0 s 0 0 0 0 hln 100 PKGREF=U2
part 49 readme 320 190 h
a 0 u 3 0 22 34 hln 100 filename=fsksub.rdm
a 0 sp 0 0 17 20 hln 200 PART=readme
a 0 a 0 0 0 0 hln 100 PKGREF=
@conn
w 7
s 130 120 180 120 6
w 11
s 240 120 270 120 10
w 15
s 240 140 270 140 14
w 46
s 130 140 180 140 45
@junction
j 130 120
+ s 1
+ w 7
j 270 120
+ s 3
+ w 11
j 270 140
+ s 4
+ w 15
j 180 120
+ p 41 D
+ w 7
j 240 120
+ p 41 Q
+ w 11
j 240 140
+ p 41 \Q\
+ w 15
j 180 140
+ p 41 CLK
+ w 46
j 130 140
+ s 2
+ w 46
@attributes
a 0 s 13 0 0 0 hln 100 PAGETITLE=
a 0 s 13 0 0 0 hln 100 PAGENO=1
a 0 s 13 0 0 0 hln 100 PAGESIZE=A
a 0 s 13 0 0 0 hln 100 PAGECOUNT=1
@text
