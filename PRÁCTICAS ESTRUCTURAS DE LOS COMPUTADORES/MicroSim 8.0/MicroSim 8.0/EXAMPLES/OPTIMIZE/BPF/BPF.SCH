*version 6.1 3294932679
u 151
U? 2
R? 8
C? 3
V? 5
PM? 2
@libraries
@analysis
.AC 1 3 0
+0 100
+1 1
+2 100
.OP 0 
@targets
@attributes
@translators
a 0 u 13 0 0 0 hln 100 PSPICE=PSPICE
a 0 u 13 0 0 0 hln 100 PADS=PCB
a 0 u 13 0 0 0 hln 100 PCAD=PCB
a 0 u 13 0 0 0 hln 100 PROTEL=PCB
a 0 u 13 0 0 0 hln 100 TANGO=PCB
a 0 u 13 0 0 0 hln 100 CADSTAR=PCB
a 0 u 13 0 0 0 hln 100 EDIF=PCB
a 0 u 13 0 0 0 hln 100 SCICARDS=PCB
a 0 u 13 0 0 0 hln 100 POLARIS=PCB
@index
pageloc 1 0 6040 
@status
n 0 94:04:12:15:27:55;768756475 e 
s 0 94:04:12:15:16:39;768755799 e 
c 94:04:12:15:34:18;768756858
*page 1 0 970 720 iA
@ports
port 2 agnd 230 240 d
port 3 agnd 70 220 h
port 5 bubble 270 230 h
a 1 x 14 0 0 0 hcn 100 LABEL=Vcc
port 6 bubble 270 290 u
a 1 x 14 0 0 0 hcn 100 LABEL=Vee
port 41 agnd 260 160 h
port 48 agnd 320 210 h
port 59 bubble 130 40 v
a 1 x 14 0 0 0 hcn 100 LABEL=in
port 60 bubble 380 260 d
a 1 x 14 0 0 0 hcn 100 LABEL=out
port 71 bubble 70 180 h
a 1 x 14 0 0 0 hcn 100 LABEL=in
port 78 agnd 430 360 h
port 80 bubble 410 320 h
a 1 x 14 0 0 0 hcn 100 LABEL=Vcc
port 81 bubble 450 320 h
a 1 x 14 0 0 0 hcn 100 LABEL=Vee
@parts
part 1 ua741 230 240 h
a 0 sp 11 0 0 70 hcn 100 PART=ua741
a 0 a 0 0 0 0 hln 100 PKGREF=U1
a 0 s 0 0 0 0 hln 100 GATE=
a 0 ap 9 0 14 0 hln 100 REFDES=U1
part 4 r 200 190 h
a 0 u 13 0 15 25 hln 100 VALUE=220k
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 x 0 0 0 0 hln 100 PKGREF=R3
a 0 xp 9 0 15 0 hln 100 REFDES=R3
part 7 c 200 80 h
a 0 u 13 0 15 25 hln 100 VALUE=1u
a 0 sp 0 0 0 10 hlb 100 PART=c
a 0 a 0 0 0 0 hln 100 PKGREF=C1
a 0 ap 9 0 15 0 hln 100 REFDES=C1
part 8 c 280 80 h
a 0 u 13 0 15 25 hln 100 VALUE=1u
a 0 sp 0 0 0 10 hlb 100 PART=c
a 0 a 0 0 0 0 hln 100 PKGREF=C2
a 0 ap 9 0 15 0 hln 100 REFDES=C2
part 23 r 260 120 v
a 0 u 13 0 15 25 hln 100 VALUE=620
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 a 0 0 0 0 hln 100 PKGREF=R2
a 0 ap 9 0 15 0 hln 100 REFDES=R2
part 42 pot 320 170 d
a 0 u 0 0 30 28 hln 100 VALUE=10k
a 0 u 0 0 0 20 hln 100 SET=abw
a 0 sp 11 0 20 25 hln 100 PART=pot
a 0 x 0 0 0 0 hln 100 PKGREF=Rbw
a 0 xp 9 0 15 0 hln 100 REFDES=Rbw
part 51 pot 260 160 v
a 0 u 0 0 30 28 hln 100 VALUE=500
a 0 u 0 0 0 20 hln 100 SET=afc
a 0 sp 11 0 20 25 hln 100 PART=pot
a 0 x 0 0 0 0 hln 100 PKGREF=Rfc
a 0 xp 9 0 15 0 hln 100 REFDES=Rfc
part 56 pot 250 40 D
a 0 u 0 0 30 28 hln 100 VALUE=10k
a 0 u 0 0 0 20 hln 100 SET=again
a 0 sp 11 0 20 25 hln 100 PART=pot
a 0 x 0 0 0 0 hln 100 PKGREF=Rgain
a 0 xp 9 0 33 40 hln 100 REFDES=Rgain
part 58 r 160 40 h
a 0 u 13 0 15 25 hln 100 VALUE=10k
a 0 sp 0 0 0 10 hlb 100 PART=r
a 0 x 0 0 0 0 hln 100 PKGREF=R1
a 0 xp 9 0 15 0 hln 100 REFDES=R1
part 72 vsrc 410 320 h
a 1 u 0 0 0 0 hcn 100 DC=15v
a 0 a 0 0 0 0 hln 100 PKGREF=V2
a 1 ap 9 0 20 10 hcn 100 refdes=V2
part 73 vsrc 450 320 h
a 1 u 0 0 0 0 hcn 100 DC=-15v
a 0 a 0 0 0 0 hln 100 PKGREF=V3
a 1 ap 9 0 20 10 hcn 100 refdes=V3
part 82 vsrc 70 180 h
a 1 u 0 0 0 0 hcn 100 AC=1v
a 0 x 0 0 0 0 hln 100 PKGREF=V1
a 1 xp 9 0 20 10 hcn 100 refdes=V1
part 149 optparam 450 60 h
a 0 u 13 0 0 28 hln 100 NAME1=aFc
a 0 up 0 0 0 10 hlb 100 ENABLE1=Y
a 0 u 13 0 50 30 hlb 100 INITVAL1=0.5
a 0 u 13 0 90 30 hlb 100 CURVAL1=0.5
a 0 up 0 0 0 10 hlb 100 LOVAL1=0.01
a 0 up 0 0 0 10 hlb 100 HIVAL1=1.0
a 0 up 0 0 0 10 hlb 100 TOL1=0
a 0 u 13 0 0 38 hln 100 NAME2=aBW
a 0 up 0 0 0 10 hlb 100 ENABLE2=Y
a 0 u 13 0 50 40 hlb 100 INITVAL2=0.5
a 0 u 13 0 90 40 hlb 100 CURVAL2=0.5
a 0 up 0 0 0 10 hlb 100 LOVAL2=0.01
a 0 up 0 0 0 10 hlb 100 HIVAL2=1.0
a 0 up 0 0 0 20 hlb 100 TOL2=0
a 0 u 13 0 0 48 hln 100 NAME3=aGain
a 0 up 0 0 0 10 hlb 100 ENABLE3=Y
a 0 u 13 0 50 50 hlb 100 INITVAL3=0.5
a 0 u 13 0 90 50 hlb 100 CURVAL3=0.5
a 0 up 0 0 0 10 hlb 100 LOVAL3=0.01
a 0 up 0 0 0 10 hlb 100 HIVAL3=1.0
a 0 up 0 0 0 30 hlb 100 TOL3=0
a 0 u 13 0 0 58 hln 100 NAME4=
a 0 up 0 0 0 10 hlb 100 ENABLE4=
a 0 u 13 0 50 60 hlb 100 INITVAL4=
a 0 u 13 0 90 60 hlb 100 CURVAL4=
a 0 up 0 0 0 10 hlb 100 LOVAL4=
a 0 up 0 0 0 10 hlb 100 HIVAL4=
a 0 up 0 0 0 40 hlb 100 TOL4=
a 0 u 13 0 0 68 hln 100 NAME5=
a 0 up 0 0 0 10 hlb 100 ENABLE5=
a 0 u 13 0 50 70 hlb 100 INITVAL5=
a 0 u 13 0 90 70 hlb 100 CURVAL5=
a 0 up 0 0 0 10 hlb 100 LOVAL5=
a 0 up 0 0 0 10 hlb 100 HIVAL5=
a 0 up 0 0 0 50 hlb 100 TOL5=
a 0 u 13 0 0 78 hln 100 NAME6=
a 0 up 0 0 0 10 hlb 100 ENABLE6=
a 0 u 13 0 50 80 hlb 100 INITVAL6=
a 0 u 13 0 90 80 hlb 100 CURVAL6=
a 0 up 0 0 0 10 hlb 100 LOVAL6=
a 0 up 0 0 0 10 hlb 100 HIVAL6=
a 0 up 0 0 0 60 hlb 100 TOL6=
a 0 u 13 0 0 88 hln 100 NAME7=
a 0 up 0 0 0 10 hlb 100 ENABLE7=
a 0 u 13 0 50 90 hlb 100 INITVAL7=
a 0 u 13 0 90 90 hlb 100 CURVAL7=
a 0 up 0 0 0 10 hlb 100 LOVAL7=
a 0 up 0 0 0 10 hlb 100 HIVAL7=
a 0 s 0 0 0 10 hlb 100 PART=optparam
a 0 a 0 0 0 0 hln 100 PKGREF=PM1
a 1 ap 0 0 10 -2 hcn 100 refdes=PM1
part 0 titleblk 970 720 h
a 1 s 13 0 350 10 hcn 100 PageSize=A
a 1 s 13 0 180 60 hcn 100 PageTitle=
a 1 s 13 0 300 95 hrn 100 PageNO=1
a 1 s 13 0 340 95 hrn 100 PageCount=1
@conn
w 94
s 310 260 350 260 93
s 350 80 310 80 95
s 350 80 350 160 101
s 320 170 320 160 99
s 350 160 350 260 105
s 320 160 350 160 103
s 350 260 380 260 106
w 109
s 180 280 230 280 108
s 200 80 180 80 110
s 180 80 180 190 114
s 180 190 180 280 118
s 180 190 200 190 116
w 120
s 260 80 250 80 127
s 280 80 270 80 125
s 270 80 260 80 130
s 270 60 270 80 128
s 250 80 230 80 150
w 132
s 240 190 300 190 131
w 134
s 280 140 280 160 133
s 280 160 260 160 135
w 138
s 130 40 160 40 137
w 140
s 200 40 250 40 139
w 142
s 400 360 410 360 141
s 410 360 430 360 143
s 450 360 460 360 145
s 430 360 450 360 147
@junction
j 310 260
+ p 1 OUT
+ w 94
j 310 80
+ p 8 2
+ w 94
j 320 170
+ p 42 1
+ w 94
j 350 160
+ w 94
+ w 94
j 380 260
+ s 60
+ w 94
j 350 260
+ w 94
+ w 94
j 230 280
+ p 1 -
+ w 109
j 200 80
+ p 7 1
+ w 109
j 200 190
+ p 4 1
+ w 109
j 180 190
+ w 109
+ w 109
j 280 80
+ p 8 1
+ w 120
j 260 80
+ p 23 2
+ w 120
j 230 80
+ p 7 2
+ w 120
j 270 80
+ w 120
+ w 120
j 240 190
+ p 4 2
+ w 132
j 300 190
+ p 42 t
+ w 132
j 280 140
+ p 51 t
+ w 134
j 260 160
+ p 51 1
+ w 134
j 260 160
+ s 41
+ w 134
j 160 40
+ p 58 1
+ w 138
j 130 40
+ s 59
+ w 138
j 200 40
+ p 58 2
+ w 140
j 410 360
+ p 72 -
+ w 142
j 430 360
+ s 78
+ w 142
j 450 360
+ p 73 -
+ w 142
j 230 240
+ p 1 +
+ s 2
j 270 230
+ p 1 V+
+ s 5
j 270 290
+ p 1 V-
+ s 6
j 260 120
+ p 23 1
+ p 51 2
j 320 210
+ p 42 2
+ s 48
j 260 160
+ p 51 1
+ s 41
j 410 320
+ p 72 +
+ s 80
j 450 320
+ p 73 +
+ s 81
j 70 220
+ p 82 -
+ s 3
j 70 180
+ p 82 +
+ s 71
j 250 80
+ p 56 2
+ w 120
j 270 60
+ p 56 t
+ w 120
j 250 40
+ p 56 1
+ w 140
@attributes
a 0 s 0 0 0 0 hln 100 PAGETITLE=
a 0 s 0 0 0 0 hln 100 PAGENO=1
a 0 s 0 0 0 0 hln 100 PAGESIZE=A
a 0 s 0 0 0 0 hln 100 PAGECOUNT=1
@text
