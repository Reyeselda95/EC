*version 6.2 1219578744
u 186
U? 2
R? 8
D? 3
C? 6
IC? 5
V? 3
J? 2
? 2
@libraries
@analysis
.TRAN 1 0 0 0
+0 1m
+1 200m
.PROBE 0 0 1 1 0 2
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
@index
pageloc 1 0 6913 
@status
n 0 95:10:24:21:38:58;817249138 e 
s 2833 94:00:19:23:29:31;759022171 e 
c 95:07:16:12:38:20;808576700
*page 1 0 970 720 iA
@ports
port 26 agnd 210 330 h
port 27 agnd 260 330 h
port 28 agnd 410 450 h
port 29 agnd 450 450 h
port 30 agnd 500 450 h
port 31 agnd 700 450 h
port 32 agnd 660 450 h
port 35 bubble 320 240 h
a 1 x 14 0 0 0 hcn 100 LABEL=-12V
port 36 bubble 660 410 h
a 1 x 14 0 0 0 hcn 100 LABEL=+12V
port 37 bubble 700 410 h
a 1 x 14 0 0 0 hcn 100 LABEL=-12V
port 38 bubble 320 300 u
a 1 x 14 0 0 0 hcn 100 LABEL=+12V
port 72 agnd 470 210 h
port 123 bubble 350 370 v
a 1 x 14 0 20 6 hcn 100 LABEL=-12V
@parts
part 1 ua741 280 290 U
a 0 sp 11 0 10 72 hcn 100 PART=ua741
a 0 a 0 0 0 0 hln 100 PKGREF=U1
a 0 s 0 0 0 0 hln 100 GATE=
a 0 ap 9 0 14 0 hln 100 REFDES=U1
part 2 r 160 250 h
a 0 u 13 0 15 25 hln 100 VALUE=11k
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 a 0 0 0 0 hln 100 PKGREF=R1
a 0 ap 9 0 15 0 hln 100 REFDES=R1
part 3 r 220 250 h
a 0 u 13 0 15 25 hln 100 VALUE=11k
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 a 0 0 0 0 hln 100 PKGREF=R2
a 0 ap 9 0 15 0 hln 100 REFDES=R2
part 4 r 470 150 v
a 0 u 13 0 7 1 hln 100 VALUE=3.6k
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 a 0 0 0 0 hln 100 PKGREF=R3
a 0 ap 9 0 21 -2 hln 100 REFDES=R3
part 5 r 550 360 v
a 0 u 13 0 11 7 hln 100 VALUE=10k
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 a 0 0 0 0 hln 100 PKGREF=R4
a 0 ap 9 0 23 2 hln 100 REFDES=R4
part 6 r 400 370 u
a 0 u 13 0 29 -1 hln 100 VALUE=390
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 a 0 0 0 0 hln 100 PKGREF=R5
a 0 ap 9 0 27 30 hln 100 REFDES=R5
part 8 pot 450 420 v
a 0 u 13 0 12 4 hln 100 VALUE=5K
a 0 sp 11 0 36 33 hln 100 PART=pot
a 0 a 0 0 0 0 hln 100 PKGREF=R7
a 0 ap 9 0 27 4 hln 100 REFDES=R7
a 0 u 13 0 24 32 hln 100 SET=0.52
part 9 d1n753 410 390 d
a 0 sp 11 0 29 59 hln 100 PART=d1n753
a 0 x 0 0 0 0 hln 100 PKGREF=D2
a 0 s 0 0 0 0 hln 100 PKGTYPE=DO204
a 0 s 0 0 0 0 hln 100 GATE=
a 0 xp 9 0 17 42 hln 100 refdes=D2
part 10 c 210 300 v
a 0 u 13 0 -1 9 hln 100 VALUE=.022u
a 0 sp 0 0 0 10 hlb 100 PART=c
a 0 a 0 0 0 0 hln 100 PKGREF=C1
a 0 ap 9 0 15 0 hln 100 REFDES=C1
part 11 c 360 110 h
a 0 u 13 0 7 29 hln 100 VALUE=.01u
a 0 sp 0 0 0 10 hlb 100 PART=c
a 0 a 0 0 0 0 hln 100 PKGREF=C2
a 0 ap 9 0 9 -2 hln 100 REFDES=C2
part 12 c 600 110 h
a 0 u 13 0 5 27 hln 100 VALUE=.01u
a 0 sp 0 0 0 10 hlb 100 PART=c
a 0 a 0 0 0 0 hln 100 PKGREF=C3
a 0 ap 9 0 9 0 hln 100 REFDES=C3
part 13 c 500 350 v
a 0 u 13 0 3 3 hln 100 VALUE=10u
a 0 sp 0 0 0 10 hlb 100 PART=c
a 0 a 0 0 0 0 hln 100 PKGREF=C4
a 0 ap 9 0 15 0 hln 100 REFDES=C4
part 14 c 500 440 v
a 0 u 13 0 1 7 hln 100 VALUE=10u
a 0 sp 0 0 0 10 hlb 100 PART=c
a 0 a 0 0 0 0 hln 100 PKGREF=C5
a 0 ap 9 0 15 0 hln 100 REFDES=C5
part 15 ic1 210 250 h
a 0 u 13 0 22 -7 hln 100 value=0
a 0 u 13 0 10 -7 hcn 100 text=IC=
a 0 a 0 0 0 0 hln 100 PKGREF=IC1
a 1 ap 0 0 6 -2 hcn 100 refdes=IC1
part 17 ic1 470 300 h
a 0 a 0 0 0 0 hln 100 PKGREF=IC3
a 1 ap 0 0 6 -2 hcn 100 refdes=IC3
part 18 ic1 590 360 h
a 0 u 13 0 40 9 hln 100 value=-2.25
a 0 a 0 0 0 0 hln 100 PKGREF=IC4
a 1 ap 0 0 6 -2 hcn 100 refdes=IC4
part 33 vsrc 660 410 h
a 1 u 0 0 0 0 hcn 100 DC=12V
a 0 a 0 0 0 0 hln 100 PKGREF=V1
a 1 ap 9 0 20 10 hcn 100 refdes=V1
part 34 vsrc 700 410 h
a 1 u 0 0 0 0 hcn 100 DC=-12V
a 0 a 0 0 0 0 hln 100 PKGREF=V2
a 1 ap 9 0 20 10 hcn 100 refdes=V2
part 71 tis74 500 180 H
a 0 sp 11 0 14 46 hcn 100 PART=tis74
a 0 a 0 0 0 0 hln 100 PKGREF=J1
a 0 s 0 0 0 0 hln 100 PKGTYPE=TO92
a 0 s 0 0 0 0 hln 100 GATE=
a 0 ap 9 0 5 10 hcn 100 refdes=J1
part 86 d1n914 630 300 h
a 0 sp 11 0 15 25 hln 100 PART=d1n914
a 0 x 0 0 0 0 hln 100 PKGREF=D1
a 0 s 0 0 0 0 hln 100 PKGTYPE=DO35
a 0 s 0 0 0 0 hln 100 GATE=
a 0 xp 9 0 15 0 hln 100 refdes=D1
part 185 readme 160 400 h
a 0 u 3 0 22 34 hln 100 filename=stabosc.rdm
a 0 sp 0 0 17 20 hln 200 PART=readme
a 0 a 0 0 0 0 hln 100 PKGREF=
part 0 titleblk 970 720 h
a 1 u 13 0 130 95 hln 100 Date=January 1, 2000
a 1 s 13 0 350 10 hcn 100 PageSize=A
a 1 s 13 0 180 60 hcn 100 PageTitle=
a 1 s 13 0 300 95 hrn 100 PageNO=1
a 1 s 13 0 340 95 hrn 100 PageCount=1
part 184 nodeMarker 680 270 h
a 0 a 0 0 4 22 hlb 100 LABEL=1
@conn
w 20
s 280 250 270 250 19
s 270 250 260 250 56
s 270 250 270 110 54
s 270 110 360 110 57
w 22
s 220 250 210 250 21
s 210 250 200 250 23
s 210 250 210 270 24
w 40
s 280 290 260 290 39
s 260 290 260 330 41
w 44
s 210 300 210 330 43
w 46
a 0 s 0 0 695 268 hln 100 LABEL=output
s 680 270 710 270 93
a 0 s 3 0 695 268 hln 100 LABEL=output
s 160 250 140 250 45
s 140 250 140 80 59
s 140 80 680 80 61
s 680 80 680 110 63
s 680 110 630 110 65
s 680 110 680 270 67
s 680 270 670 270 69
s 660 300 670 300 89
s 670 270 360 270 182
s 670 300 670 270 180
w 52
s 390 110 470 110 53
s 470 110 600 110 81
w 78
s 470 200 470 210 77
w 80
s 470 150 470 160 79
w 83
s 500 180 500 300 82
s 500 300 550 300 130
s 500 320 500 310 169
s 550 300 630 300 173
s 550 320 550 300 171
s 500 310 500 300 176
s 470 310 500 310 174
s 470 300 470 310 177
w 135
s 590 360 590 370 134
s 590 370 550 370 140
s 550 370 500 370 144
s 550 360 550 370 142
s 500 370 500 400 145
s 500 400 500 410 149
s 500 400 470 400 147
s 500 350 500 370 167
w 151
s 450 380 450 370 150
s 450 370 410 370 154
s 410 370 400 370 158
s 410 370 410 390 156
w 160
s 410 420 410 450 159
w 162
s 450 420 450 450 161
w 164
s 500 440 500 450 163
w 166
s 350 370 360 370 165
@junction
j 260 250
+ p 3 2
+ w 20
j 200 250
+ p 2 2
+ w 22
j 220 250
+ p 3 1
+ w 22
j 210 250
+ p 15 +
+ w 22
j 210 270
+ p 10 2
+ w 22
j 320 240
+ p 1 V-
+ s 35
j 320 300
+ p 1 V+
+ s 38
j 280 250
+ p 1 -
+ w 20
j 280 290
+ p 1 +
+ w 40
j 260 330
+ s 27
+ w 40
j 210 300
+ p 10 1
+ w 44
j 210 330
+ s 26
+ w 44
j 160 250
+ p 2 1
+ w 46
j 390 110
+ p 11 2
+ w 52
j 600 110
+ p 12 1
+ w 52
j 270 250
+ w 20
+ w 20
j 360 110
+ p 11 1
+ w 20
j 630 110
+ p 12 2
+ w 46
j 680 110
+ w 46
+ w 46
j 360 270
+ p 1 OUT
+ w 46
j 470 200
+ p 71 s
+ w 78
j 470 210
+ s 72
+ w 78
j 470 150
+ p 4 1
+ w 80
j 470 160
+ p 71 d
+ w 80
j 470 110
+ p 4 2
+ w 52
j 500 180
+ p 71 g
+ w 83
j 630 300
+ p 86 1
+ w 83
j 660 300
+ p 86 2
+ w 46
j 680 270
+ w 46
+ w 46
j 590 360
+ p 18 +
+ w 135
j 550 360
+ p 5 1
+ w 135
j 550 370
+ w 135
+ w 135
j 500 410
+ p 14 2
+ w 135
j 470 400
+ p 8 t
+ w 135
j 500 400
+ w 135
+ w 135
j 450 380
+ p 8 2
+ w 151
j 400 370
+ p 6 1
+ w 151
j 410 390
+ p 9 1
+ w 151
j 410 370
+ w 151
+ w 151
j 410 420
+ p 9 2
+ w 160
j 410 450
+ s 28
+ w 160
j 450 420
+ p 8 1
+ w 162
j 450 450
+ s 29
+ w 162
j 500 440
+ p 14 1
+ w 164
j 500 450
+ s 30
+ w 164
j 360 370
+ p 6 2
+ w 166
j 350 370
+ s 123
+ w 166
j 660 450
+ p 33 -
+ s 32
j 660 410
+ p 33 +
+ s 36
j 700 450
+ p 34 -
+ s 31
j 700 410
+ p 34 +
+ s 37
j 500 350
+ p 13 1
+ w 135
j 500 370
+ w 135
+ w 135
j 500 320
+ p 13 2
+ w 83
j 500 300
+ w 83
+ w 83
j 550 320
+ p 5 2
+ w 83
j 550 300
+ w 83
+ w 83
j 500 310
+ w 83
+ w 83
j 470 300
+ p 17 +
+ w 83
j 670 270
+ w 46
+ w 46
j 680 270
+ p 184 pin1
+ w 46
@attributes
a 0 s 0 0 0 0 hln 100 PAGETITLE=
a 0 s 0 0 0 0 hln 100 PAGENO=1
a 0 s 0 0 0 0 hln 100 PAGESIZE=A
a 0 s 0 0 0 0 hln 100 PAGECOUNT=1
@text
