*version 6.1 496577555
u 65
V? 3
R? 5
I? 2
PM? 2
@libraries
@analysis
.DC 1 0 3 0 1 1
+ 0 0 V1
+ 0 7 5v
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
pageloc 1 0 3972 
@status
n 0 94:04:11:11:24:15;768655455 e 
s 0 94:04:11:13:09:53;768661793 e 
*page 1 0 1520 970 iB
@ports
port 4 agnd 60 140 h
a 1 x 14 0 14 20 hln 100 LABEL=0
port 5 bubble 60 40 h
a 1 x 14 0 0 0 hcn 100 LABEL=+5v
port 19 bubble 80 80 d
a 1 x 14 0 0 0 hcn 100 LABEL=Vc
port 27 agnd 160 140 h
a 1 x 14 0 14 20 hln 100 LABEL=0
port 29 bubble 180 80 d
a 1 x 14 0 0 0 hcn 100 LABEL=Vr
port 49 agnd 160 40 u
a 1 x 14 0 14 20 hln 100 LABEL=0
port 51 agnd 270 230 h
port 52 bubble 270 190 h
a 1 x 14 0 0 0 hcn 100 LABEL=+5v
@parts
part 2 R 60 80 v
a 0 u 13 0 5 10 hln 100 VALUE={R1val}
a 0 sp 0 0 0 10 hlb 100 PART=R
a 0 a 0 0 0 0 hln 100 PKGREF=R1
a 0 ap 9 0 20 0 hln 100 REFDES=R1
part 3 R 60 120 v
a 0 u 13 0 5 10 hln 100 VALUE={R2val}
a 0 sp 0 0 0 10 hlb 100 PART=R
a 0 a 0 0 0 0 hln 100 PKGREF=R2
a 0 ap 9 0 20 0 hln 100 REFDES=R2
part 25 R 160 80 v
a 0 u 13 0 5 10 hln 100 VALUE={R1val}
a 0 sp 0 0 0 10 hlb 100 PART=R
a 0 x 0 0 0 0 hln 100 PKGREF=R1a
a 0 xp 9 0 20 0 hln 100 REFDES=R1a
part 26 R 160 120 v
a 0 u 13 0 5 10 hln 100 VALUE={R2val}
a 0 sp 0 0 0 10 hlb 100 PART=R
a 0 x 0 0 0 0 hln 100 PKGREF=R2a
a 0 xp 9 0 20 0 hln 100 REFDES=R2a
part 32 Isrc 180 130 u
a 0 a 0 0 0 0 hln 100 PKGREF=I1
a 1 ap 9 0 0 8 hcn 100 REFDES=I1
a 1 u 13 0 0 -4 hcn 100 DC=1A
part 50 vsrc 270 190 h
a 1 u 13 0 -10 28 hcn 100 DC=5v
a 0 x 0 0 0 0 hln 100 PKGREF=V1
a 1 xp 9 0 -10 16 hcn 100 REFDES=V1
part 53 optparam 260 40 h
a 0 u 13 0 0 28 hln 100 NAME1=R1val
a 0 up 0 0 0 10 hlb 100 ENABLE1=Y
a 0 u 13 0 50 30 hlb 100 INITVAL1=500
a 0 u 13 0 90 30 hlb 100 CURVAL1=500
a 0 up 0 0 0 10 hlb 100 LOVAL1=100
a 0 up 0 0 0 10 hlb 100 HIVAL1=10k
a 0 up 0 0 0 10 hlb 100 TOL1=5%
a 0 u 13 0 0 38 hln 100 NAME2=R2val
a 0 up 0 0 0 10 hlb 100 ENABLE2=Y
a 0 u 13 0 50 40 hlb 100 INITVAL2=500
a 0 u 13 0 90 40 hlb 100 CURVAL2=500
a 0 up 0 0 0 10 hlb 100 LOVAL2=100
a 0 up 0 0 0 10 hlb 100 HIVAL2=10k
a 0 up 0 0 0 20 hlb 100 TOL2=5%
a 0 u 13 0 0 48 hln 100 NAME3=
a 0 up 0 0 0 10 hlb 100 ENABLE3=
a 0 u 13 0 50 50 hlb 100 INITVAL3=
a 0 u 13 0 90 50 hlb 100 CURVAL3=
a 0 up 0 0 0 10 hlb 100 LOVAL3=
a 0 up 0 0 0 10 hlb 100 HIVAL3=
a 0 up 0 0 0 30 hlb 100 TOL3=
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
part 0 titleblk 1520 970 h
a 1 s 13 0 350 10 hcn 100 PageSize=B
a 1 s 13 0 180 60 hcn 100 PageTitle=
a 1 s 13 0 300 95 hrn 100 PageNO=1
a 1 s 13 0 340 95 hrn 100 PageCount=1
@conn
w 21
s 60 80 80 80 20
w 34
s 60 120 60 140 47
w 56
s 160 80 180 80 55
s 180 80 180 90 57
w 60
s 160 140 180 140 59
s 160 120 160 140 61
s 180 130 180 140 63
@junction
j 60 80
+ p 2 1
+ p 3 2
j 60 40
+ p 2 2
+ s 5
j 60 80
+ p 2 1
+ w 21
j 60 80
+ p 3 2
+ w 21
j 80 80
+ s 19
+ w 21
j 60 120
+ p 3 1
+ w 34
j 60 140
+ s 4
+ w 34
j 270 230
+ p 50 -
+ s 51
j 270 190
+ p 50 +
+ s 52
j 160 80
+ p 25 1
+ w 56
j 160 80
+ p 26 2
+ w 56
j 180 80
+ s 29
+ w 56
j 180 90
+ p 32 -
+ w 56
j 160 140
+ s 27
+ w 60
j 160 120
+ p 26 1
+ w 60
j 180 130
+ p 32 +
+ w 60
j 160 80
+ p 25 1
+ p 26 2
j 160 40
+ p 25 2
+ s 49
@attributes
a 0 s 0 0 0 0 hln 100 PAGETITLE=
a 0 s 0 0 0 0 hln 100 PAGENO=1
a 0 s 0 0 0 0 hln 100 PAGESIZE=B
a 0 s 0 0 0 0 hln 100 PAGECOUNT=1
@text
