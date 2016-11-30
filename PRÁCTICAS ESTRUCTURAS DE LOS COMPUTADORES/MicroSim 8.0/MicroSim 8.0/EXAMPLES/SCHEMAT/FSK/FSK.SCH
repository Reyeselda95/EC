*version 6.2 1170572392
lib D:\MSIM62\FSK.slb 0
u 155
U? 5
R? 2
? 18
@libraries
fsk  [.slb]
@analysis
.AC 0 3 0
+0 20
+1 10Meg
+2 200Meg
.TRAN 1 0 0 0
+0 20ns
+1 400ns
.OPT 0 0 0 0 0 0 0 0 0 0 0 0 0 0
RELTOL 0.001
.PROBE 0 0 1 1 0 2
@targets
@attributes
@translators
a 0 u 13 0 0 0 hln 100 PSPICE=behavioral
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
pageloc 1 0 2582 
@status
n 0 94:06:20:11:30:19;774703819 e 
s 2833 94:06:20:12:24:14;774707054 e 
c 95:07:09:08:53:43;807958423
*page 1 0 970 720 iA
@ports
port 24 global 460 150 H
a 14 s 14 0 17 8 hcn 100 LABEL=55MHz
port 22 global 460 110 H
a 14 s 14 0 15 8 hcn 100 LABEL=45MHz
@parts
block 1 blocksym0 20 90 h
a 1 x 0 0 72 80 hln 100 REFDES=Test
a 0 s 0 0 0 0 hln 100 PKGREF=Test
*symbol blocksym1
d 
@type p
@attributes
a 0 s 9 0 0 0 hln 100 REFDES=U?
a 0 s 0 0 0 0 hln 100 PART=
@views
a 0 u 13 0 0 0 hln 100 DEFAULT=fsk1
@pins
p 1 88 35 hrb 100 out l 90 30 d
@graphics 90 70 0 0 10
r 0 0 0 90 70
*end blocksym
block 2 blocksym0 180 70 h
a 1 x 0 0 74 110 hln 100 REFDES=Bpass
a 0 s 0 0 0 0 hln 100 PKGREF=Bpass
*symbol blocksym2
d 
@type p
@attributes
a 0 s 9 0 0 0 hln 100 REFDES=U?
a 0 s 0 0 0 0 hln 100 PART=
@views
a 0 u 13 0 0 0 hln 100 TRANSISTOR=fsk2t
a 0 u 13 0 0 0 hln 100 BEHAVIORAL=fsk2b
a 0 u 13 0 0 0 hln 100 DEFAULT=fsk2t
@pins
p 1 98 55 hrb 100 out l 100 50 d
p 1 2 55 hlb 100 in l 0 50 d
@graphics 100 100 0 0 10
r 0 0 0 100 100
*end blocksym
block 3 blocksym0 340 70 h
a 1 x 0 0 70 110 hln 100 REFDES=Demod
a 0 s 0 0 0 0 hln 100 PKGREF=Demod
*symbol blocksym3
d 
@type p
@attributes
a 0 s 9 0 0 0 hln 100 REFDES=U?
a 0 s 0 0 0 0 hln 100 PART=
@views
a 0 u 13 0 0 0 hln 100 DEFAULT=fsk3
@pins
p 1 2 55 hlb 100 in l 0 50 d
p 1 98 45 hrb 100 out1 l 100 40 d
p 1 98 85 hrb 100 out2 l 100 80 d
@graphics 100 100 0 0 10
r 0 0 0 100 100
*end blocksym
part 154 readme 190 270 h
a 0 u 3 0 22 34 hln 100 filename=fsk_demo.rdm
a 0 sp 0 0 17 20 hln 200 PART=readme
a 0 a 0 0 0 0 hln 100 PKGREF=
part 97 nodeMarker 280 120 h
a 0 s 0 0 0 0 hln 100 MARKERTYPE=NODE
a 0 a 0 0 4 22 hlb 100 LABEL=15
part 100 nodeMarker 460 110 h
a 0 s 0 0 0 0 hln 100 MARKERTYPE=NODE
a 0 a 0 0 4 22 hlb 100 LABEL=16
part 103 nodeMarker 460 150 h
a 0 s 0 0 0 0 hln 100 MARKERTYPE=NODE
a 0 a 0 0 4 22 hlb 100 LABEL=17
@conn
w 29
s 280 120 340 120 28
w 33
s 110 120 180 120 32
w 125
s 440 110 460 110 124
w 149
s 440 150 460 150 148
@junction
j 280 120
+ p 2 out
+ w 29
j 340 120
+ p 3 in
+ w 29
j 110 120
+ p 1 out
+ w 33
j 180 120
+ p 2 in
+ w 33
j 280 120
+ p 97 pin1
+ p 2 out
j 280 120
+ p 97 pin1
+ w 29
j 440 110
+ p 3 out1
+ w 125
j 460 110
+ p 100 pin1
+ w 125
j 440 150
+ p 3 out2
+ w 149
j 460 150
+ s 24
+ w 149
j 460 150
+ p 103 pin1
+ s 24
j 460 150
+ p 103 pin1
+ w 149
j 460 110
+ s 22
+ p 100 pin1
j 460 110
+ s 22
+ w 125
@attributes
a 0 s 13 0 0 0 hln 100 PAGETITLE=
a 0 s 13 0 0 0 hln 100 PAGENO=1
a 0 s 13 0 0 0 hln 100 PAGESIZE=A
a 0 s 13 0 0 0 hln 100 PAGECOUNT=1
@text
s 5 30 110 hln 125 Test Source
s 5 190 100 hln 125 Bandpass Filter
s 5 350 100 hln 125 Demodulator
s 5 160 240 hln 250 FSK Receiver
