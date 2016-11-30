*version 8.0 183869842
u 94
HB? 4
? 10
PM? 2
@libraries
@analysis
.TRAN 1 0 1 0
+0 20ns
+1 7u
.OPT 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
DIGINITSTATE 0
DIGIOLVL 2
DIGMNTYMX 1
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
unconnectedPins 0
connectViaLabel 0
connectViaLocalLabels 0
NoStim4ExtIFPortsWarnings 1
AutoGenStim4ExtIFPorts 1
@index
pageloc 1 0 4852 
@status
n 0 103:08:05:12:54:08;1062759248 e 
s 2832 103:08:15:11:06:33;1063616793 e 
i PCBOARDS 99:11:02:13:51:32;944139092 e 2500 
c 103:08:05:12:53:58;1062759238
*page 1 0 297 210 ma
@ports
@parts
block 7 blocksym7 120 350 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=HB3
a 0 ap 9 0 0 0 hln 100 REFDES=HB3
*symbol blocksym7
d 
@type p
@attributes
a 0 sp 9 0 0 0 hln 100 REFDES=HB?
a 0 s 0 0 0 0 hln 100 PART=
@views
a 0 u 13 0 0 0 hln 100 DEFAULT=E:\MicroSim\manotaslib\RELOJ2.sch
@pins
p 2 163 53 hrb 200 reloj l 165 40 u
a 0 s 0:13 0 -5 -10 hln 100 ERC=o
a 0 s 0:13 0 -5 -10 hln 100 FLOAT=n
a 0 s 1 0 166 38 hln 100 PIN=
@graphics 165 90 0 0 10
r 0 0 0 165 90
*end blocksym
block 4 blocksym4 855 205 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=HB2
a 0 ap 9 0 0 0 hln 100 REFDES=HB2
*symbol blocksym4
d 
@type p
@attributes
a 0 sp 9 0 0 0 hln 100 REFDES=HB?
a 0 s 0 0 0 0 hln 100 PART=
@views
a 0 u 13 0 0 0 hln 100 DEFAULT=E:\MicroSim\manotaslib\memoria64kx8.sch
@pins
p 2 2 120 hlb 200 AD[15-0] l 0 115 h
a 0 s 0:13 0 0 0 hln 100 ERC=i
a 0 s 0:13 0 0 0 hln 100 FLOAT=n
a 0 s 1 0 1 113 hln 100 PIN=
p 2 90 250 hcb 200 BD[7-0] l 90 250 v
a 0 s 0:13 0 0 0 hln 100 ERC=b
a 0 s 0:13 0 0 0 hln 100 FLOAT=n
a 0 s 1 0 91 248 hln 100 PIN=
p 2 25 0 hrt 200 L/E l 25 0 d
a 0 s 0:13 0 0 0 hln 100 ERC=i
a 0 s 0:13 0 0 0 hln 100 FLOAT=n
a 0 s 1 0 26 -2 hln 100 PIN=
p 2 45 0 hlt 200 CS l 45 0 d
a 0 s 0:13 0 0 0 hln 100 ERC=i
a 0 s 0:13 0 0 0 hln 100 FLOAT=n
a 0 s 1 0 46 -2 hln 100 PIN=
@graphics 165 250 0 0 10
r 0 0 0 165 250
*end blocksym
block 2 blocksym2 385 205 h
a 0 a 0:13 0 0 0 hln 100 PKGREF=HB1
a 0 ap 9 0 0 0 hln 100 REFDES=HB1
*symbol blocksym2
d 
@type p
@attributes
a 0 sp 9 0 0 0 hln 100 REFDES=HB?
a 0 s 0 0 0 0 hln 100 PART=
@views
a 0 u 13 0 0 0 hln 100 DEFAULT=E:\MicroSim\manotaslib\CPU.sch
@pins
p 2 2 198 hlb 200 reloj l 0 185 h
a 0 s 0:13 0 0 0 hln 100 ERC=i
a 0 s 0:13 0 0 0 hln 100 FLOAT=n
a 0 s 1 0 1 183 hln 100 PIN=
p 2 233 120 hrb 200 AD[15-0] l 235 115 u
a 0 s 0:13 0 0 0 hln 100 ERC=o
a 0 s 0:13 0 0 0 hln 100 FLOAT=n
a 0 s 1 0 236 113 hln 100 PIN=
p 2 120 250 hcb 200 BD[7-0] l 120 250 v
a 0 s 0:13 0 0 0 hln 100 ERC=i
a 0 s 0:13 0 0 0 hln 100 FLOAT=n
a 0 s 1 0 121 248 hln 100 PIN=
p 2 205 0 hlt 200 L/E l 205 0 d
a 0 s 0:13 0 0 0 hln 100 ERC=o
a 0 s 0:13 0 0 0 hln 100 FLOAT=n
a 0 s 1 0 206 -2 hln 100 PIN=
p 2 185 0 hrt 200 CS l 185 0 d
a 0 s 0:13 0 0 0 hln 100 ERC=o
a 0 s 0:13 0 0 0 hln 100 FLOAT=n
a 0 s 1 0 186 -2 hln 100 PIN=
@graphics 235 250 0 0 10
r 0 0 0 235 250
*end blocksym
part 1 TITLEBLK 1188 840 h
a 1 s 13 0 350 10 hcn 100 PAGESIZE=A4
a 1 s 13 0 340 95 hrn 100 PAGECOUNT=1
a 1 s 13 0 300 95 hrn 100 PAGENO=1
@conn
w 58
a 0 up 0:33 0 0 0 hln 100 LVL=
a 0 sr 0:3 0 780 168 hcn 100 LABEL=CS
s 570 170 900 170 56
a 0 sr 3 0 780 168 hcn 100 LABEL=CS
a 0 up 33 0 780 169 hct 100 LVL=
s 900 170 900 205 38
s 570 205 570 170 34
w 59
a 0 up 0:33 0 0 0 hln 100 LVL=
a 0 sr 0:3 0 770 188 hcn 100 LABEL=L/E
s 590 190 880 190 30
a 0 up 33 0 770 189 hct 100 LVL=
a 0 sr 3 0 770 188 hcn 100 LABEL=L/E
s 880 190 880 205 32
s 590 205 590 190 28
w 10
a 0 up 0:33 0 0 0 hln 100 LVL=
a 0 sr 0 0 0 0 hln 100 LABEL=reloj
s 385 390 285 390 67
a 0 sr 3 0 329 388 hcn 100 LABEL=reloj
a 0 up 33 0 329 389 hct 100 LVL=
b 16
a 0 sr 0 0 0 0 hln 100 LABEL=BD[7-0]
s 505 515 945 515 17
a 0 sr 3 0 725 513 hcn 100 LABEL=BD[7-0]
s 945 515 945 455 19
s 505 455 505 515 15
b 12
a 0 sr 0 0 0 0 hln 100 LABEL=AD[15-0]
s 620 320 855 320 13
a 0 sr 3 0 736 318 hcn 100 LABEL=AD[15-0]
@junction
j 900 205
+ p 4 CS
+ w 58
j 880 205
+ p 4 L/E
+ w 59
j 945 455
+ P 4 BD[7-0]
 BD[7]
 BD[6]
 BD[5]
 BD[4]
 BD[3]
 BD[2]
 BD[1]
 BD[0]
+ b 16
 BD[7]
 BD[6]
 BD[5]
 BD[4]
 BD[3]
 BD[2]
 BD[1]
 BD[0]
j 285 390
+ p 7 reloj
+ w 10
j 855 320
+ P 4 AD[15-0]
 AD[15]
 AD[14]
 AD[13]
 AD[12]
 AD[11]
 AD[10]
 AD[9]
 AD[8]
 AD[7]
 AD[6]
 AD[5]
 AD[4]
 AD[3]
 AD[2]
 AD[1]
 AD[0]
+ b 12
 AD[15]
 AD[14]
 AD[13]
 AD[12]
 AD[11]
 AD[10]
 AD[9]
 AD[8]
 AD[7]
 AD[6]
 AD[5]
 AD[4]
 AD[3]
 AD[2]
 AD[1]
 AD[0]
j 570 205
+ p 2 CS
+ w 58
j 590 205
+ p 2 L/E
+ w 59
j 385 390
+ p 2 reloj
+ w 10
j 505 455
+ P 2 BD[7-0]
 BD[7]
 BD[6]
 BD[5]
 BD[4]
 BD[3]
 BD[2]
 BD[1]
 BD[0]
+ b 16
 BD[7]
 BD[6]
 BD[5]
 BD[4]
 BD[3]
 BD[2]
 BD[1]
 BD[0]
j 620 320
+ P 2 AD[15-0]
 AD[15]
 AD[14]
 AD[13]
 AD[12]
 AD[11]
 AD[10]
 AD[9]
 AD[8]
 AD[7]
 AD[6]
 AD[5]
 AD[4]
 AD[3]
 AD[2]
 AD[1]
 AD[0]
+ b 12
 AD[15]
 AD[14]
 AD[13]
 AD[12]
 AD[11]
 AD[10]
 AD[9]
 AD[8]
 AD[7]
 AD[6]
 AD[5]
 AD[4]
 AD[3]
 AD[2]
 AD[1]
 AD[0]
@attributes
a 0 s 0:13 0 0 0 hln 100 PAGETITLE=
a 0 s 0:13 0 0 0 hln 100 PAGENO=1
a 0 s 0:13 0 0 0 hln 100 PAGESIZE=A4
a 0 s 0:13 0 0 0 hln 100 PAGECOUNT=1
@graphics
t 22 t 5 665 322 820 350 0 18 d_info:,,,,,,,,,,,,,15, 
Bus de direcciones
t 3 t 5 440 307 575 350 0 6 d_info:,,,,,,,,,,,,,39, 
C.P.U.
t 8 t 5 130 402 278 434 0 9 d_info:,,,,,,,,,,,,,23, 
OSCILADOR
t 6 t 5 900 382 978 414 0 5 d_info:,,,,,,,,,,,,,23, 
64Kx8
t 5 t 5 875 337 1030 385 0 7 d_info:,,,,,,,,,,,,,27, 
MEMORIA
t 23 t 5 660 512 815 540 0 12 d_info:,,,,,,,,,,,,,15, 
Bus de datos
