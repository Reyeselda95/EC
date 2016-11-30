*version 6.2 1047930434
u 140
U? 1
HB? 1
? 12
STM? 4
@libraries
@analysis
.TRAN 1 0 0 0
+0 20ns
+1 800ns
.OP 0 
.PROBE 0 0 1 1 0 2
.STMLIB DECODER1.stl
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
pageloc 1 0 1378 
@status
n 0 96:00:24:13:23:54;822489834 e 
s 2833 96:00:24:14:05:07;822492307 e 
c 95:07:18:09:51:59;808739519
*page 1 0 1520 970 iB
@ports
port 25 global 250 90 H
a 14 s 3 0 15 8 hcn 100 LABEL=D0
port 26 global 250 100 H
a 14 s 3 0 15 8 hcn 100 LABEL=D1
port 27 global 250 110 H
a 14 s 3 0 15 8 hcn 100 LABEL=D2
port 28 global 250 120 H
a 14 s 3 0 15 8 hcn 100 LABEL=D3
port 29 global 250 130 H
a 14 s 3 0 15 8 hcn 100 LABEL=D4
port 30 global 250 140 H
a 14 s 3 0 15 8 hcn 100 LABEL=D5
port 31 global 250 150 H
a 14 s 3 0 15 8 hcn 100 LABEL=D6
port 32 global 250 160 H
a 14 s 3 0 15 8 hcn 100 LABEL=D7
@parts
part 85 DIGSTIM 110 100 h
a 0 ur 13 0 40 3 hln 70 STIMULUS=IN0
a 0 x 0 0 0 0 hln 100 PKGREF=STM1
a 1 xp 9 0 13 -1 hcn 100 REFDES=STM1
part 86 DIGSTIM 110 120 h
a 0 ur 13 0 40 3 hln 70 STIMULUS=IN1
a 0 x 0 0 0 0 hln 100 PKGREF=STM2
a 1 xp 9 0 13 -1 hcn 100 REFDES=STM2
part 87 DIGSTIM 110 140 h
a 0 ur 13 0 40 3 hln 70 STIMULUS=IN2
a 0 x 0 0 0 0 hln 100 PKGREF=STM3
a 1 xp 9 0 13 -1 hcn 100 REFDES=STM3
part 139 readme 140 50 h
a 0 u 3 0 22 34 hln 100 filename=decoder1.rdm
a 0 sp 0 0 17 20 hln 200 PART=readme
a 0 a 0 0 0 0 hln 100 PKGREF=
part 0 titleblk 1520 970 h
a 1 s 13 0 350 10 hcn 100 PageSize=B
a 1 s 13 0 180 60 hcn 100 PageTitle=
a 1 s 13 0 300 95 hrn 100 PageNO=1
a 1 s 13 0 340 95 hrn 100 PageCount=1
@conn
@junction
@attributes
a 0 s 0 0 0 0 hln 100 PAGETITLE=
a 0 s 0 0 0 0 hln 100 PAGENO=1
a 0 s 0 0 0 0 hln 100 PAGESIZE=B
a 0 s 0 0 0 0 hln 100 PAGECOUNT=1
@text
