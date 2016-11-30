*version 7.1 2288596781
u 178
V? 2
P? 7
? 5
@libraries
@analysis
.TRAN 1 0 0 0
+0 1ns
+1 200ns
.OP 0 
@polaris
boardstack=D:\MSIM71\DHH\lib\2lpd1s.bst
pcbfile=D:\MSIM71\DHH\simex.asc
mode=list
maxradius=25mils
minparlength=750mils
polarsetup=1
@targets
@attributes
@translators
a 0 u 13 0 0 0 hln 100 PCBOARDS=PCB
a 0 u 13 0 0 0 hln 100 CADSTAR=PCB
a 0 u 13 0 0 0 hln 100 EDIF=PCB
a 0 u 13 0 0 0 hln 100 ORCAD=PCB
a 0 u 13 0 0 0 hln 100 PADS=PCB
a 0 u 13 0 0 0 hln 100 PCAD=PCB
a 0 u 13 0 0 0 hln 100 PROTEL=PCB
a 0 u 13 0 0 0 hln 100 TANGO=PCB
a 0 u 13 0 0 0 hln 100 SCICARDS=PCB
a 0 u 13 0 0 0 hln 100 PSPICE=PSPICE
a 0 u 13 0 0 0 hln 100 XILINX=XILINX
a 0 u 13 0 0 0 hln 100 POLARIS=PCB
@setup
unconnectedPins 0
connectViaLabel 0
connectViaLocalLabels 0
NoStim4ExtIFPortsWarnings 1
AutoGenStim4ExtIFPorts 1
@index
pageloc 1 0 3161 
@status
i PADS 93:03:20:08:44:36;735320676 e 0 
i POLARIS 93:04:10:09:43:55;737052235 e 0 
c 96:08:20:12:31:33;843247893
*page 1 0 970 720 iA
@ports
port 9 agnd 110 270 v
port 11 agnd 380 150 h
port 41 bubble 140 90 v
a 1 x 14 0 16 26 hcn 100 LABEL=drive
port 54 bubble 110 210 d
a 1 x 14 0 0 -12 hcn 100 LABEL=drive
port 112 agnd 200 60 d
port 113 agnd 550 60 v
@parts
part 2 vpulse 60 220 h
a 1 u 0 0 0 0 hcn 100 v1=0v
a 1 u 0 0 0 0 hcn 100 v2=5v
a 1 u 0 0 0 0 hcn 100 td=0
a 1 u 0 0 0 0 hcn 100 tr=10ns
a 1 u 0 0 0 0 hcn 100 tf=10ns
a 1 u 0 0 0 0 hcn 100 pw=30ns
a 1 u 0 0 0 0 hcn 100 per=100ns
a 0 x 0 0 0 0 hln 100 PKGREF=Vsrc
a 1 xp 9 0 -6 10 hcn 100 refdes=Vsrc
part 3 R 70 210 h
a 0 u 13 0 15 25 hln 100 VALUE=50
a 0 sp 0 0 0 10 hlb 100 PART=R
a 0 x 0 0 0 0 hln 100 PKGREF=Rsrc
a 0 xp 9 0 15 0 hln 100 REFDES=Rsrc
a 0 s 0 0 0 0 hln 100 SIMULATIONONLY=
part 5 R 180 140 v
a 0 u 13 0 13 3 hln 100 VALUE=92
a 0 sp 0 0 0 10 hlb 100 PART=R
a 0 x 0 0 0 0 hln 100 PKGREF=Rpar
a 0 xp 9 0 25 2 hln 100 REFDES=Rpar
part 6 R 260 90 u
a 0 u 13 0 17 23 hln 100 VALUE=39
a 0 sp 0 0 0 10 hlb 100 PART=R
a 0 x 0 0 0 0 hln 100 PKGREF=Rser
a 0 xp 9 0 45 24 hln 100 REFDES=Rser
part 7 R 540 90 u
a 0 u 13 0 7 23 hln 100 VALUE=68
a 0 sp 0 0 0 10 hlb 100 PART=R
a 0 x 0 0 0 0 hln 100 PKGREF=Rterm1
a 0 xp 9 0 43 24 hln 100 REFDES=Rterm1
part 110 R 260 60 u
a 0 u 13 0 11 25 hln 100 VALUE=68
a 0 sp 0 0 0 10 hlb 100 PART=R
a 0 x 0 0 0 0 hln 100 PKGREF=Rterm2
a 0 xp 9 0 53 24 hln 100 REFDES=Rterm2
part 111 R 540 60 u
a 0 u 13 0 7 23 hln 100 VALUE=68
a 0 sp 0 0 0 10 hlb 100 PART=R
a 0 x 0 0 0 0 hln 100 PKGREF=Rterm3
a 0 xp 9 0 43 24 hln 100 REFDES=Rterm3
part 20 titleblk 970 720 h
a 1 s 13 0 350 10 hcn 100 PageSize=A
a 1 s 13 0 180 60 hcn 100 PageTitle=
a 1 s 13 0 340 95 hrn 100 PageCount=1
a 1 s 13 0 300 95 hrn 100 PageNO=1
part 174 POLARIS 330 60 h
a 0 a 0 0 4 22 hlb 100 LABEL=3
part 176 POLARIS 330 90 h
a 0 a 0 0 4 22 hlb 100 LABEL=4
@conn
w 57
s 180 140 180 150 147
s 540 90 550 90 159
s 550 90 550 150 161
s 180 150 380 150 169
s 380 150 550 150 171
w 70
s 180 90 220 90 152
s 180 90 180 100 150
s 140 90 180 90 153
w 79
a 0 s 3 0 380 88 hln 100 LABEL=D
s 330 90 500 90 177
a 0 s 3 0 380 88 hln 100 LABEL=D
s 260 90 330 90 167
w 103
s 200 60 220 60 102
w 109
a 0 s 3 0 380 58 hln 100 LABEL=V
s 330 60 500 60 175
a 0 s 3 0 380 58 hln 100 LABEL=V
s 260 60 330 60 165
w 118
s 60 220 60 210 117
s 60 210 70 210 119
w 122
s 60 260 60 270 125
s 60 270 110 270 155
w 164
s 540 60 550 60 163
@junction
j 220 90
+ p 6 2
+ w 70
j 260 90
+ p 6 1
+ w 79
j 220 60
+ p 110 2
+ w 103
j 260 60
+ p 110 1
+ w 109
j 200 60
+ s 112
+ w 103
j 60 220
+ p 2 +
+ w 118
j 70 210
+ p 3 1
+ w 118
j 60 260
+ p 2 -
+ w 122
j 110 210
+ p 3 2
+ s 54
j 180 140
+ p 5 1
+ w 57
j 180 100
+ p 5 2
+ w 70
j 180 90
+ w 70
+ w 70
j 110 270
+ s 9
+ w 122
j 540 90
+ p 7 1
+ w 57
j 540 60
+ p 111 1
+ w 164
j 550 60
+ s 113
+ w 164
j 500 60
+ p 111 2
+ w 109
j 500 90
+ p 7 2
+ w 79
j 380 150
+ s 11
+ w 57
j 140 90
+ s 41
+ w 70
j 330 60
+ p 174 pin1
+ w 109
j 330 90
+ p 176 pin1
+ w 79
@attributes
a 0 s 0 0 0 0 hln 100 PAGETITLE=
a 0 s 0 0 0 0 hln 100 PAGENO=1
a 0 s 0 0 0 0 hln 100 PAGESIZE=A
a 0 s 0 0 0 0 hln 100 PAGECOUNT=1
@text
s 5 150 230 hln 250 50-ohm Source
s 5 150 250 hln 100 Note: Rsrc is SIMULATIONONLY
