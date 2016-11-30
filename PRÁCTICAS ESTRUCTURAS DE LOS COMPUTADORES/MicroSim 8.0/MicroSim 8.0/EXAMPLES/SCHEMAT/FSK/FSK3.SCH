*version 6.2 1119001670
u 219
R? 7
U? 4
T? 2
? 8
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
pageloc 1 0 2487 
@status
c 95:07:09:08:49:54;807958194
*page 1 0 970 720 iA
@ports
port 1 interface 80 150 h
a 1 s 14 0 19 8 hcn 100 LABEL=in
port 2 interface 460 140 H
a 1 s 14 0 21 8 hcn 100 LABEL=out1
port 3 interface 460 160 H
a 1 s 14 0 23 8 hcn 100 LABEL=out2
port 95 agnd 210 130 h
port 97 agnd 310 130 h
port 178 agnd 350 150 h
@parts
block 73 blocksym0 100 120 h
a 0 a 9 0 -2 -6 hln 100 REFDES=Comparator
a 0 s 0 0 0 0 hln 100 PKGREF=Comparator
*symbol blocksym73
d 
@type p
@attributes
a 0 s 9 0 0 0 hln 100 REFDES=U?
a 0 s 0 0 0 0 hln 100 PART=
@views
a 0 u 13 0 0 0 hln 100 DEFAULT=fsk31
@pins
p 1 68 35 hrb 100 out l 70 30 d
p 1 2 35 hlb 100 in l 0 30 d
@graphics 70 60 0 0 10
r 0 0 0 70 60
*end blocksym
part 75 t 210 110 h
a 0 xp 9 0 36 2 hln 100 REFDES=Delay
a 0 u 0 0 0 0 hln 100 Z0=300
a 0 u 13 0 44 42 hln 100 TD=20ns
a 0 s 0 0 0 0 hln 100 PKGREF=Delay
part 158 r 350 150 v
a 0 u 13 0 15 5 hln 100 value=300
a 0 ap 9 0 25 10 hln 100 REFDES=Rterm
a 0 s 0 0 0 0 hln 100 PKGREF=Rterm
block 189 blocksym0 390 120 h
a 0 a 9 0 -2 -4 hln 100 REFDES=FlipFlop
a 0 s 0 0 0 0 hln 100 PKGREF=FlipFlop
*symbol blocksym189
d 
@type p
@attributes
a 0 s 9 0 0 0 hln 100 REFDES=U?
a 0 s 0 0 0 0 hln 100 PART=
@views
a 0 u 13 0 0 0 hln 100 DEFAULT=fsk32
@pins
p 1 2 25 hlb 100 D l 0 20 d
p 1 2 45 hlb 100 CLK l 0 40 d
p 1 38 25 hrb 100 Q l 40 20 d
p 1 38 45 hrb 100 \Q\ l 40 40 d
@graphics 40 60 0 0 10
r 0 0 0 40 60
*end blocksym
part 218 readme 410 60 h
a 0 u 3 0 22 34 hln 100 filename=fsksub.rdm
a 0 sp 0 0 17 20 hln 200 PART=readme
a 0 a 0 0 0 0 hln 100 PKGREF=
@conn
w 101
s 170 150 190 150 100
s 190 150 190 110 103
s 190 110 210 110 105
s 190 150 190 190 130
s 370 190 370 160 139
s 190 190 370 190 148
s 370 160 390 160 193
w 135
s 370 110 370 140 141
s 310 110 350 110 174
s 350 110 370 110 176
s 370 140 390 140 190
w 151
s 430 140 460 140 196
w 155
s 430 160 460 160 199
w 171
s 80 150 100 150 170
@junction
j 310 130
+ p 75 B-
+ s 97
j 170 150
+ p 73 out
+ w 101
j 210 110
+ p 75 A+
+ w 101
j 210 130
+ s 95
+ p 75 A-
j 310 110
+ p 75 B+
+ w 135
j 190 150
+ w 101
+ w 101
j 460 140
+ s 2
+ w 151
j 460 160
+ s 3
+ w 155
j 100 150
+ p 73 in
+ w 171
j 80 150
+ s 1
+ w 171
j 350 110
+ p 158 2
+ w 135
j 350 150
+ s 178
+ p 158 1
j 390 160
+ p 189 CLK
+ w 101
j 390 140
+ p 189 D
+ w 135
j 430 140
+ p 189 Q
+ w 151
j 430 160
+ p 189 \Q\
+ w 155
@attributes
a 0 s 13 0 0 0 hln 100 PAGETITLE=
a 0 s 13 0 0 0 hln 100 PAGENO=1
a 0 s 13 0 0 0 hln 100 PAGESIZE=A
a 0 s 13 0 0 0 hln 100 PAGECOUNT=1
@text
s 5 200 50 hln 250 FSK Detector
