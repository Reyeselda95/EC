*version 8.0 165490263
lib "C:\MICROSIM 8.0\LIB\XC5200\XC5200.slb" 3370125637
lib "C:\MICROSIM 8.0\LIB\XBLOX\XBLOX.slb" 1301226310
u 57
R? 3
C? 3
V? 4
? 9
@libraries
XC5200 [.slb]
XBLOX [.slb]
@analysis
.AC 1 2 0
+0 101
+1 10
+2 100K
.TRAN 0 0 0 0
+0 20ns
+1 100ms
+3 0.2ms
.OPT 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
DIGINITSTATE 0
.OP 0 
.opt_param 0
.XILINX 1
@targets
@attributes
a IMPL=
a FAMILY=XC5200
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
connectViaLabel 1
connectViaLocalLabels 0
NoStim4ExtIFPortsWarnings 1
AutoGenStim4ExtIFPorts 1
@index
pageloc 1 0 1886 
@status
n 0 100:05:02:18:28:48;959963328 e 
s 2832 103:08:14:16:34:45;1063550085 e 
i XILINX 103:08:14:16:34:29;1063550069 e -1 
*page 1 0 1520 970 iB
@ports
port 20 AGND 290 230 h
@parts
part 44 VSIN 220 170 h
a 1 u 0 0 0 0 hcn 100 AC=5
a 0 a 0:13 0 0 0 hln 100 PKGREF=V3
a 1 ap 9 0 20 10 hcn 100 REFDES=V3
a 1 u 0 0 0 0 hcn 100 VAMPL=10
a 1 u 0 0 0 0 hcn 100 VOFF=0
a 1 u 0 0 0 0 hcn 100 FREQ=1k
part 53 R 360 210 v
a 0 sp 0 0 0 10 hlb 100 PART=R
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=RC05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=R2
a 0 ap 9 0 15 0 hln 100 REFDES=R2
a 0 u 13 0 15 39 hln 100 VALUE=4.7k
part 49 C 310 130 u
a 0 sp 0 0 0 10 hlb 100 PART=C
a 0 s 0:13 0 0 0 hln 100 PKGTYPE=CK05
a 0 s 0:13 0 0 0 hln 100 GATE=
a 0 a 0:13 0 0 0 hln 100 PKGREF=C2
a 0 ap 9 0 15 0 hln 100 REFDES=C2
a 0 u 13 0 17 27 hln 100 VALUE=10n
part 1 titleblk 1520 970 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=B
a 1 s 13 0 300 95 hrn 100 PAGENO=1
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
part 41 nodeMarker 360 150 h
a 0 s 0 0 0 0 hln 100 PROBEVAR=
a 0 a 0 0 4 22 hlb 100 LABEL=7
@conn
w 25
a 0 sr 0 0 0 0 hln 100 LABEL=Ventrada
a 0 up 0:33 0 0 0 hln 100 V=
s 220 130 280 130 37
a 0 sr 3 0 250 128 hcn 100 LABEL=Ventrada
a 0 up 0:33 0 250 129 hct 100 V=
s 220 170 220 130 24
w 16
a 0 up 0:33 0 0 0 hln 100 V=
s 220 210 220 230 22
s 360 230 290 230 10
s 220 230 290 230 32
a 0 up 0:33 0 333 255 hct 100 V=
s 360 210 360 230 17
w 5
a 0 up 0:33 0 0 0 hln 100 V=
a 0 sr 0:3 0 340 128 hcn 100 LABEL=Vsalida
s 310 130 360 130 55
a 0 up 0:33 0 340 129 hct 100 V=
a 0 sr 3 0 340 128 hcn 100 LABEL=Vsalida
s 360 150 360 170 6
s 360 130 360 150 45
@junction
j 290 230
+ s 20
+ w 16
j 360 150
+ p 41 pin1
+ w 5
j 220 210
+ p 44 -
+ w 16
j 220 170
+ p 44 +
+ w 25
j 280 130
+ p 49 2
+ w 25
j 360 170
+ p 53 2
+ w 5
j 360 210
+ p 53 1
+ w 16
j 310 130
+ p 49 1
+ w 5
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=B
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
