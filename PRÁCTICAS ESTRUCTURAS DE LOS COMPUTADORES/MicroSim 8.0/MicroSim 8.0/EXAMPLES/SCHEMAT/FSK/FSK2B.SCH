*version 6.2 4055951037
u 174
R? 3
G? 5
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
pageloc 1 0 1995 
@status
c 95:07:09:08:49:28;807958168
*page 1 0 970 720 iA
@ports
port 1 interface 130 90 h
a 1 s 14 0 21 8 hcn 100 LABEL=in
port 2 interface 280 90 H
a 1 s 14 0 21 8 hcn 100 LABEL=out
port 46 agnd 170 140 h
@parts
part 4 r 140 140 v
a 0 u 13 0 13 3 hln 100 value=150
a 0 xp 9 0 23 2 hln 100 REFDES=Rin
a 0 s 0 0 0 0 hln 100 PKGREF=Rin
part 5 r 270 140 v
a 0 u 13 0 15 43 hln 100 value=150
a 0 xp 9 0 25 46 hln 100 REFDES=Rout
a 0 s 0 0 0 0 hln 100 PKGREF=Rout
part 12 GFREQX 180 120 h
a 0 u 13 0 -100 62 hlb 200 T1=0,-40,180
a 0 u 13 0 -104 102 hlb 200 T2=25Meg,-40,170
a 0 u 13 0 -104 142 hlb 200 T3=40Meg,-25,150
a 0 u 13 0 78 64 hlb 200 T4=45Meg,-5,90
a 0 u 13 0 78 102 hlb 200 T5=55Meg,-5,-90
a 0 u 13 0 78 142 hlb 200 T6=60Meg,-25,-150
a 0 u 13 0 240 64 hlb 200 T7=100Meg,-40,-170
a 0 u 13 0 240 102 hlb 200 T8=500Meg,-40,-180
a 0 u 13 0 260 144 hlb 200 T9=
a 0 s 11 0 60 40 hln 100 PART=GFREQX
a 1 ap 9 0 58 0 hln 100 REFDES=G4
a 0 s 0 0 0 0 hln 100 PKGREF=G4
part 173 readme 410 70 h
a 0 u 3 0 22 34 hln 100 filename=fsksub.rdm
a 0 sp 0 0 17 20 hln 200 PART=readme
a 0 a 0 0 0 0 hln 100 PKGREF=
@conn
w 100
s 270 140 290 140 116
s 170 130 170 140 103
s 170 140 140 140 105
s 180 130 170 130 32
s 170 140 240 140 166
s 240 140 270 140 170
s 240 140 240 120 168
s 240 120 230 120 171
w 122
s 130 90 140 90 121
s 140 90 140 100 124
s 140 100 170 100 127
s 170 100 170 120 130
s 170 120 180 120 132
w 136
s 270 100 270 90 148
s 270 90 280 90 151
s 230 130 250 130 160
s 250 130 250 100 162
s 250 100 270 100 164
@junction
j 180 130
+ p 12 IN-
+ w 100
j 140 140
+ p 4 1
+ w 100
j 270 140
+ p 5 1
+ w 100
j 130 90
+ s 1
+ w 122
j 140 100
+ p 4 2
+ w 122
j 180 120
+ p 12 IN+
+ w 122
j 270 100
+ p 5 2
+ w 136
j 280 90
+ s 2
+ w 136
j 170 140
+ s 46
+ w 100
j 230 130
+ p 12 OUT-
+ w 136
j 240 140
+ w 100
+ w 100
j 230 120
+ p 12 OUT+
+ w 100
@attributes
a 0 s 13 0 0 0 hln 100 PAGETITLE=
a 0 s 13 0 0 0 hln 100 PAGENO=1
a 0 s 13 0 0 0 hln 100 PAGESIZE=A
a 0 s 13 0 0 0 hln 100 PAGECOUNT=1
@text
s 5 150 50 hln 250 Bandpass Filter
