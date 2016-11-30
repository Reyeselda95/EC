*version 8.0 4168956903
u 45
R? 2
C? 2
V? 4
? 9
@libraries
@analysis
.AC 1 2 0
+0 101
+1 10
+2 1G
.TRAN 0 0 0 0
+0 20ns
+1 100ms
+3 0.2ms
.OPT 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
DIGINITSTATE 0
.OP 0 
@targets
@attributes
@translators
a 0 u 13 0 0 0 hln 100 TANGO=PCB
a 0 u 13 0 0 0 hln 100 SCICARDS=PCB
a 0 u 13 0 0 0 hln 100 PROTEL=PCB
a 0 u 13 0 0 0 hln 100 PCBOARDS=PCB
a 0 u 13 0 0 0 hln 100 PCAD=PCB
a 0 u 13 0 0 0 hln 100 PADS=PCB
a 0 u 13 0 0 0 hln 100 ORCAD=PCB
a 0 u 13 0 0 0 hln 100 EDIF=PCB
a 0 u 13 0 0 0 hln 100 CADSTAR=PCB
a 0 u 13 0 0 0 hln 100 PSPICE=PSPICE
a 0 u 13 0 0 0 hln 100 XILINX=XILINX
a 0 u 13 0 0 0 hln 100 POLARIS=PSPICE
@setup
unconnectedPins 1
connectViaLabel 0
connectViaLocalLabels 0
NoStim4ExtIFPortsWarnings 1
AutoGenStim4ExtIFPorts 1
@index
pageloc 1 0 1944 
@status
n 0 103:08:14:16:26:15;1063549575 e 
s 0 103:08:15:10:36:15;1063614975 e 
c 103:08:15:10:36:48;1063615008
*page 1 0 1520 970 iB
@ports
port 20 AGND 290 230 h
@parts
part 2 R 280 150 h
a 0 sp 0 0 0 10 hlb 100 PART=R
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R1
a 0 ap 9 0 15 0 hln 100 REFDES=R1
a 0 u 13 0 15 25 hln 100 VALUE=4.7k
part 44 VSIN 220 170 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=V3
a 1 ap 9 0 20 10 hcn 100 REFDES=V3
a 1 u 0 0 0 0 hcn 100 VAMPL=10
a 1 u 0 0 0 0 hcn 100 VOFF=0
a 1 u 0 0 0 0 hcn 100 FREQ=1k
a 1 u 0 0 0 0 hcn 100 AC=5
part 3 C 360 200 v
a 0 sp 0 0 0 10 hlb 100 PART=C
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=CK05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=C1
a 0 ap 9 0 15 0 hln 100 REFDES=C1
a 0 u 13 0 5 3 hln 100 VALUE=100nF
part 1 titleblk 1520 970 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=B
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
a 1 s 13 0 300 95 hrn 100 PAGENO=1
part 41 nodeMarker 360 150 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=7
@conn
w 5
a 0 up 0:33 0 0 0 hln 100 V=
a 0 sr 0 0 0 0 hln 100 LABEL=Vcond
s 320 150 360 150 4
a 0 up 0:33 0 340 149 hct 100 V=
a 0 sr 3 0 340 148 hcn 100 LABEL=Vcond
s 360 150 360 170 6
w 16
a 0 up 0:33 0 0 0 hln 100 V=
s 220 210 220 230 22
s 360 230 290 230 10
s 360 200 360 230 17
s 220 230 290 230 32
a 0 up 0:33 0 333 255 hct 100 V=
w 25
a 0 up 0:33 0 0 0 hln 100 V=
a 0 sr 0 0 0 0 hln 100 LABEL=Ventrada
s 220 150 280 150 37
a 0 sr 3 0 250 148 hcn 100 LABEL=Ventrada
a 0 up 0:33 0 250 149 hct 100 V=
s 220 170 220 150 24
@junction
j 360 170
+ p 3 2
+ w 5
j 360 200
+ p 3 1
+ w 16
j 290 230
+ s 20
+ w 16
j 320 150
+ p 2 2
+ w 5
j 280 150
+ p 2 1
+ w 25
j 360 150
+ p 41 pin1
+ w 5
j 220 210
+ p 44 -
+ w 16
j 220 170
+ p 44 +
+ w 25
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=B
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
