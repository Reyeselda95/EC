*version 6.1 1419407018
u 52
Q? 3
V? 2
PM? 2
@libraries
@analysis
.DC 1 0 0 0 1 1
+ 0 0 Vbe
+ 0 4 0.4
+ 0 5 0.82
+ 0 6 0.01
.OP 0 
.INC bjtpar.inc
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
pageloc 1 0 3903 
@status
n 0 94:04:12:17:13:43;768762823 e 
s 0 94:04:12:16:42:51;768760971 e 
c 94:04:12:17:21:51;768763311
*page 1 0 1520 970 iB
@ports
port 4 agnd 40 150 h
port 5 bubble 40 110 h
a 1 x 14 0 10 -4 hcn 100 LABEL=Vbe
port 6 bubble 120 100 v
a 1 x 14 0 20 0 hcn 100 LABEL=Vbe
port 7 bubble 120 230 v
a 1 x 14 0 18 0 hcn 100 LABEL=Vbe
port 18 agnd 220 140 h
port 20 agnd 220 270 h
port 46 bubble 330 50 d
a 1 x 14 0 0 0 hcn 100 LABEL=Vce
port 47 bubble 330 180 d
a 1 x 14 0 0 0 hcn 100 LABEL=Vce
port 49 agnd 40 280 h
port 50 bubble 40 240 h
a 1 x 14 0 10 -4 hcn 100 LABEL=Vce
@parts
part 1 QbreakN 120 100 h
a 0 sp 11 0 27 34 hln 100 MODEL=Qx
a 0 sp 0 0 0 50 hln 100 PART=QbreakN
a 0 a 0 0 0 0 hln 100 PKGREF=Q1
a 0 ap 9 0 5 5 hln 100 REFDES=Q1
part 2 Q2N3055 120 230 h
a 0 sp 11 0 25 40 hln 100 PART=Q2N3055
a 0 a 0 0 0 0 hln 100 PKGREF=Q2
a 0 s 0 0 0 0 hln 100 PKGTYPE=TO3
a 0 s 0 0 0 0 hln 100 GATE=
a 0 ap 9 0 5 5 hln 100 REFDES=Q2
part 3 Vsrc 40 110 h
a 0 x 0 0 0 0 hln 100 PKGREF=Vbe
a 1 xp 9 0 20 10 hcn 100 REFDES=Vbe
part 48 Vsrc 40 240 h
a 0 x 0 0 0 0 hln 100 PKGREF=Vce
a 1 xp 9 0 20 10 hcn 100 REFDES=Vce
a 1 u 13 0 24 40 hcn 100 DC=10v
part 51 optparam 420 80 h
a 0 u 13 0 0 28 hln 100 NAME1=Is
a 0 up 0 0 0 10 hlb 100 ENABLE1=Y
a 0 u 13 0 50 30 hlb 100 INITVAL1=1e-13
a 0 u 13 0 90 30 hlb 100 CURVAL1=1e-13
a 0 up 0 0 0 10 hlb 100 LOVAL1=1e-14
a 0 up 0 0 0 10 hlb 100 HIVAL1=1e-11
a 0 up 0 0 0 10 hlb 100 TOL1=0
a 0 u 13 0 0 38 hln 100 NAME2=Ikf
a 0 up 0 0 0 10 hlb 100 ENABLE2=Y
a 0 u 13 0 50 40 hlb 100 INITVAL2=5
a 0 u 13 0 90 40 hlb 100 CURVAL2=5
a 0 up 0 0 0 10 hlb 100 LOVAL2=1
a 0 up 0 0 0 10 hlb 100 HIVAL2=10
a 0 up 0 0 0 20 hlb 100 TOL2=0
a 0 u 13 0 0 48 hln 100 NAME3=Br
a 0 up 0 0 0 10 hlb 100 ENABLE3=Y
a 0 u 13 0 50 50 hlb 100 INITVAL3=5
a 0 u 13 0 90 50 hlb 100 CURVAL3=5
a 0 up 0 0 0 10 hlb 100 LOVAL3=1
a 0 up 0 0 0 10 hlb 100 HIVAL3=10
a 0 up 0 0 0 30 hlb 100 TOL3=0
a 0 u 13 0 0 58 hln 100 NAME4=Bf
a 0 up 0 0 0 10 hlb 100 ENABLE4=Y
a 0 u 13 0 50 60 hlb 100 INITVAL4=50
a 0 u 13 0 90 60 hlb 100 CURVAL4=50
a 0 up 0 0 0 10 hlb 100 LOVAL4=20
a 0 up 0 0 0 10 hlb 100 HIVAL4=200
a 0 up 0 0 0 40 hlb 100 TOL4=0
a 0 u 13 0 0 68 hln 100 NAME5=Ise
a 0 up 0 0 0 10 hlb 100 ENABLE5=Y
a 0 u 13 0 50 70 hlb 100 INITVAL5=1e-10
a 0 u 13 0 90 70 hlb 100 CURVAL5=1e-10
a 0 up 0 0 0 10 hlb 100 LOVAL5=1e-11
a 0 up 0 0 0 10 hlb 100 HIVAL5=1e-8
a 0 up 0 0 0 50 hlb 100 TOL5=0
a 0 u 13 0 0 78 hln 100 NAME6=Ne
a 0 up 0 0 0 10 hlb 100 ENABLE6=Y
a 0 u 13 0 50 80 hlb 100 INITVAL6=1.5
a 0 u 13 0 90 80 hlb 100 CURVAL6=1.5
a 0 up 0 0 0 10 hlb 100 LOVAL6=1.2
a 0 up 0 0 0 10 hlb 100 HIVAL6=2
a 0 up 0 0 0 60 hlb 100 TOL6=0
a 0 u 13 0 0 88 hln 100 NAME7=
a 0 up 0 0 0 10 hlb 100 ENABLE7=
a 0 u 13 0 50 90 hlb 100 INITVAL7=
a 0 u 13 0 90 90 hlb 100 CURVAL7=
a 0 up 0 0 0 10 hlb 100 LOVAL7=
a 0 up 0 0 0 10 hlb 100 HIVAL7=
a 0 s 0 0 0 10 hlb 100 PART=optparam
a 0 a 0 0 0 0 hln 100 PKGREF=PM1
a 1 ap 0 0 10 -2 hcn 100 refdes=PM1
part 0 titleblk 1520 970 h
a 1 s 13 0 350 10 hcn 100 PageSize=B
a 1 s 13 0 180 60 hcn 100 PageTitle=
a 1 s 13 0 300 95 hrn 100 PageNO=1
a 1 s 13 0 340 95 hrn 100 PageCount=1
@conn
w 23
s 100 140 140 140 22
s 220 140 340 140 24
s 140 140 220 140 32
s 140 120 140 140 30
w 27
s 90 270 140 270 26
s 220 270 340 270 28
s 140 270 220 270 35
s 140 250 140 270 33
w 37
s 140 80 140 50 36
s 110 50 140 50 43
s 140 50 330 50 45
w 39
s 140 210 140 180 38
s 110 180 140 180 40
s 140 180 330 180 42
@junction
j 120 100
+ s 6
+ p 1 b
j 120 230
+ s 7
+ p 2 b
j 220 140
+ s 18
+ w 23
j 220 270
+ s 20
+ w 27
j 140 120
+ p 1 e
+ w 23
j 140 140
+ w 23
+ w 23
j 140 250
+ p 2 e
+ w 27
j 140 270
+ w 27
+ w 27
j 140 80
+ p 1 c
+ w 37
j 140 210
+ p 2 c
+ w 39
j 140 180
+ w 39
+ w 39
j 140 50
+ w 37
+ w 37
j 330 50
+ s 46
+ w 37
j 330 180
+ s 47
+ w 39
j 40 280
+ p 48 -
+ s 49
j 40 240
+ p 48 +
+ s 50
j 40 150
+ p 3 -
+ s 4
j 40 110
+ p 3 +
+ s 5
@attributes
a 0 s 0 0 0 0 hln 100 PAGETITLE=
a 0 s 0 0 0 0 hln 100 PAGENO=1
a 0 s 0 0 0 0 hln 100 PAGESIZE=B
a 0 s 0 0 0 0 hln 100 PAGECOUNT=1
@text
