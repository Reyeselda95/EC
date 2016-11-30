*version 6.0 375885784
lib C:\MSIM60\LIB\abm.slb 738730976
lib C:\MSIM60\LIB\adv_lin.slb 0
lib C:\MSIM60\LIB\analog.slb 2746273205
lib C:\MSIM60\LIB\anlg_dev.slb 0
lib C:\MSIM60\LIB\apex.slb 0
lib C:\MSIM60\LIB\bipolar.slb 0
lib C:\MSIM60\LIB\breakout.slb 53764857
lib C:\MSIM60\LIB\burr_brn.slb 0
lib C:\MSIM60\LIB\cd4000.slb 1082765664
lib C:\MSIM60\LIB\comlinr.slb 0
lib C:\MSIM60\LIB\connect.slb 30686778
lib C:\MSIM60\LIB\dig_1.slb 0
lib C:\MSIM60\LIB\dig_2.slb 0
lib C:\MSIM60\LIB\dig_3.slb 0
lib C:\MSIM60\LIB\dig_4.slb 60154586
lib C:\MSIM60\LIB\dig_ecl.slb 0
lib C:\MSIM60\LIB\dig_gal.slb 0
lib C:\MSIM60\LIB\dig_misc.slb 0
lib C:\MSIM60\LIB\dig_pal.slb 0
lib C:\MSIM60\LIB\dig_prim.slb 0
lib C:\MSIM60\LIB\diode.slb 0
lib C:\MSIM60\LIB\elantec.slb 0
lib C:\MSIM60\LIB\filtsub.slb 0
lib C:\MSIM60\LIB\harris.slb 0
lib C:\MSIM60\LIB\jfet.slb 0
lib C:\MSIM60\LIB\lin_tech.slb 0
lib C:\MSIM60\LIB\misc.slb 0
lib C:\MSIM60\LIB\motoramp.slb 0
lib C:\MSIM60\LIB\motormos.slb 0
lib C:\MSIM60\LIB\motor_rf.slb 0
lib C:\MSIM60\LIB\nat_semi.slb 0
lib C:\MSIM60\LIB\opamp.slb 0
lib C:\MSIM60\LIB\opto.slb 0
lib C:\MSIM60\LIB\polyfet.slb 0
lib C:\MSIM60\LIB\port.slb 0
lib C:\MSIM60\LIB\pwrbjt.slb 0
lib C:\MSIM60\LIB\pwrmos.slb 0
lib C:\MSIM60\LIB\source.slb 0
lib C:\MSIM60\LIB\special.slb 25865778
lib C:\MSIM60\LIB\swit_rav.slb 0
lib C:\MSIM60\LIB\swit_reg.slb 0
lib C:\MSIM60\LIB\tex_inst.slb 0
lib C:\MSIM60\LIB\thyristr.slb 0
lib C:\MSIM60\LIB\tline.slb 0
lib C:\MSIM60\LIB\xtal.slb 0
lib C:\MSIM60\LIB\jbipolar.slb 0
lib C:\MSIM60\LIB\jdiode.slb 0
lib C:\MSIM60\LIB\jjfet.slb 0
lib C:\MSIM60\LIB\jopamp.slb 0
lib C:\MSIM60\LIB\jpwrbjt.slb 0
lib C:\MSIM60\LIB\jpwrmos.slb 0
lib C:\MSIM60\LIB\ebipolar.slb 0
lib C:\MSIM60\LIB\ediode.slb 0
lib C:\MSIM60\LIB\epwrbjt.slb 0
u 276
X? 7
EAMP? 2
C? 6
R? 3
V? 2
@libraries
@analysis
@attributes
@translators
a 0 u 13 0 0 0 hln 100 PSPICE=DEFAULT
a 0 u 13 0 0 0 hln 100 PADS=PCB
a 0 u 13 0 0 0 hln 100 PCAD=PCB
a 0 u 13 0 0 0 hln 100 PROTEL=PCB
a 0 u 13 0 0 0 hln 100 TANGO=PCB
a 0 u 13 0 0 0 hln 100 CADSTAR=PCB
a 0 u 13 0 0 0 hln 100 EDIF=PCB
a 0 u 13 0 0 0 hln 100 SCICARDS=PCB
a 0 u 13 0 0 0 hln 100 POLARIS=PCB
@index
pageloc 1 0 5150 
@status
c 68:00:01:00:00:00;0
c 91:00:07:00:11:13;726365473
c 91:00:07:18:08:58;726430138
c 91:00:07:18:47:50;726432470
c 91:00:07:21:25:00;726441900
c 91:00:07:22:22:15;726445335
c 91:00:08:16:30:37;726510637
c 91:00:08:17:08:13;726512893
c 91:00:08:17:32:28;726514348
c 91:00:08:17:39:09;726514749
c 91:00:08:17:49:18;726515358
c 91:00:08:18:22:10;726517330
c 93:11:02:14:08:46;817999726
*page 1 0 970 720 iA
@ports
port 1 INTERFACE 60 310 h
a 1 s 3 0 19 8 hcn 100 LABEL=IN
port 2 INTERFACE 100 480 h
a 1 s 3 0 17 -10 hcn 100 LABEL=CP[0-3]
port 3 INTERFACE 550 330 u
a 1 s 3 0 19 8 hcn 100 LABEL=OUT
port 96 AGND 250 220 h
port 108 AGND 250 100 h
port 147 AGND 300 530 h
port 184 AGND 410 100 h
port 241 BUBBLE 230 350 v
a 1 x 14 0 6 14 hcn 100 LABEL=N5
port 242 BUBBLE 340 450 d
a 1 x 14 0 0 -14 hcn 100 LABEL=N5
port 272 FOFFPAGE 200 80 v
a 1 x 3 0 23 50 hcn 100 LABEL=CP[0-3]
port 273 FOFFPAGE 450 80 v
a 1 x 3 0 23 50 hcn 100 LABEL=CP[0-3]
port 274 FOFFPAGE 200 480 u
a 1 x 3 0 41 -6 hcn 100 LABEL=CP[0-3]
port 275 FOFFPAGE 200 200 v
a 1 x 3 0 23 50 hcn 100 LABEL=CP[0-3]
@parts
part 7 EAMP 240 350 U
a 0 u 0 0 12 80 hln 100 EXPR=V(0,%-)*(V(0,%+)*@GAIN)
a 0 u 13 13 88 20 hln 100 GAIN=5000
a 0 s 0 0 36 68 hln 100 PART=EAMP
a 1 xp 9 0 46 40 hln 100 REFDES=EAMP1
a 0 s 0 0 0 0 hln 100 PKGREF=EAMP1
part 8 C 110 310 h
a 0 u 13 0 15 25 hln 100 value=@C1VAL
a 0 ap 9 0 15 0 hln 100 REFDES=C1
a 0 s 0 0 0 0 hln 100 PKGREF=C1
part 40 C 250 260 h
a 0 u 13 0 15 25 hln 100 value=@CaVAL
a 0 xp 9 0 15 0 hln 100 REFDES=CA
a 0 s 0 0 0 0 hln 100 PKGREF=CA
part 110 C 300 40 h
a 0 u 13 0 15 25 hln 100 value=@C2VAL
a 0 xp 9 0 15 0 hln 100 REFDES=C2
a 0 s 0 0 0 0 hln 100 PKGREF=C2
part 115 C 360 40 h
a 0 u 13 0 15 25 hln 100 value=@C3VAL
a 0 xp 9 0 15 0 hln 100 REFDES=C3
a 0 s 0 0 0 0 hln 100 PKGREF=C3
part 144 VSRC 300 460 h
a 1 u 13 0 -30 30 hcn 100 DC=1V
a 1 xp 9 0 -22 20 hcn 100 refdes=VSCALE
a 0 s 0 0 0 0 hln 100 PKGREF=VSCALE
part 145 R 340 500 v
a 0 u 13 0 17 45 hln 100 value=1MEG
a 0 xp 9 0 29 58 hln 100 REFDES=RSCALE
a 0 s 0 0 0 0 hln 100 PKGREF=RSCALE
part 224 ISWPAIR 190 20 h
a 0 s 0 0 0 80 hln 100 PART=ISWPAIR
a 0 xp 9 0 14 8 hln 100 REFDES=X1
a 0 s 0 0 0 0 hln 100 PKGREF=X1
part 229 ISWPAIR 190 140 h
a 0 s 0 0 0 80 hln 100 PART=ISWPAIR
a 0 xp 9 0 14 8 hln 100 REFDES=X2
a 0 s 0 0 0 0 hln 100 PKGREF=X2
part 234 ISWPAIRB 410 20 h
a 0 s 0 0 0 80 hln 100 PART=ISWPAIRB
a 1 xp 9 0 14 8 hln 100 REFDES=X3
a 0 s 0 0 0 0 hln 100 PKGREF=X3
@conn
w 14
a 0 s 3 0 85 308 hln 100 LABEL=IN
s 70 310 110 310 78
a 0 s 3 0 85 308 hln 100 LABEL=IN
s 60 310 70 310 13
s 70 310 70 40 75
s 70 40 180 40 79
w 19
a 0 s 0 0 155 308 hln 100 LABEL=N3
s 140 310 170 310 18
a 0 s 3 0 155 308 hln 100 LABEL=N3
s 170 310 230 310 29
s 230 310 240 310 44
s 230 310 230 260 41
s 230 260 250 260 45
s 170 310 170 160 59
s 170 160 180 160 61
w 49
a 0 s 0 0 520 328 hln 100 LABEL=OUT
s 490 330 550 330 135
a 0 s 3 0 520 328 hln 100 LABEL=OUT
s 280 260 350 260 48
a 0 s 3 0 315 258 hln 100 LABEL=OUT
s 350 260 350 330 51
s 320 330 350 330 53
s 350 330 490 330 131
s 470 40 490 40 128
s 490 330 490 40 133
w 88
s 220 200 220 210 87
s 220 210 250 210 91
s 250 210 250 220 94
w 100
s 220 80 220 90 99
s 220 90 250 90 103
s 250 90 250 100 106
w 112
a 0 s 0 0 275 38 hln 100 LABEL=N1
s 250 40 300 40 111
a 0 s 3 0 275 38 hln 100 LABEL=N1
w 121
a 0 s 0 0 300 158 hln 100 LABEL=N2
s 250 160 350 160 177
a 0 s 3 0 300 158 hln 100 LABEL=N2
s 330 40 350 40 120
s 350 40 360 40 183
s 350 160 350 40 180
w 125
a 0 s 0 0 395 38 hln 100 LABEL=N4
s 390 40 400 40 124
a 0 s 3 0 385 38 hln 100 LABEL=N4
w 186
s 410 100 410 90 185
s 410 90 430 90 188
s 430 90 430 80 190
w 239
a 0 s 0 0 320 448 hln 100 LABEL=N5
s 300 450 340 450 151
a 0 s 3 0 320 448 hln 100 LABEL=N5
s 340 450 340 460 156
s 300 460 300 450 148
w 240
s 300 510 340 510 165
s 340 500 340 510 172
s 300 500 300 510 161
s 300 510 300 530 168
w 244
s 230 350 240 350 243
b 267
a 0 s 3 0 109 474 hln 100 LABEL=CP[0-3]
s 100 480 200 480 251
a 0 s 3 0 109 474 hln 100 LABEL=CP[0-3]
@junction
j 110 310
+ p 8 1
+ w 14
j 60 310
+ s 1
+ w 14
j 140 310
+ p 8 2
+ w 19
j 240 310
+ p 7 -
+ w 19
j 170 310
+ w 19
+ w 19
j 230 310
+ w 19
+ w 19
j 250 260
+ p 40 1
+ w 19
j 280 260
+ p 40 2
+ w 49
j 320 330
+ p 7 OUT
+ w 49
j 350 330
+ w 49
+ w 49
j 70 310
+ w 14
+ w 14
j 250 220
+ s 96
+ w 88
j 250 100
+ s 108
+ w 100
j 300 40
+ p 110 1
+ w 112
j 330 40
+ p 110 2
+ w 121
j 360 40
+ p 115 1
+ w 121
j 390 40
+ p 115 2
+ w 125
j 550 330
+ s 3
+ w 49
j 490 330
+ w 49
+ w 49
j 300 460
+ p 144 +
+ w 239
j 340 460
+ p 145 2
+ w 239
j 300 500
+ p 144 -
+ w 240
j 300 530
+ s 147
+ w 240
j 300 510
+ w 240
+ w 240
j 340 500
+ p 145 1
+ w 240
j 350 40
+ w 121
+ w 121
j 410 100
+ s 184
+ w 186
j 180 40
+ p 224 IN
+ w 14
j 220 80
+ p 224 AGND
+ w 100
j 250 40
+ p 224 OUT
+ w 112
j 180 160
+ p 229 IN
+ w 19
j 220 200
+ p 229 AGND
+ w 88
j 250 160
+ p 229 OUT
+ w 121
j 470 40
+ p 234 IN
+ w 49
j 400 40
+ p 234 OUT
+ w 125
j 430 80
+ p 234 AGND
+ w 186
j 340 450
+ s 242
+ w 239
j 240 350
+ p 7 +
+ w 244
j 230 350
+ s 241
+ w 244
j 200 80
+ S 272
CP[0]
CP[1]
CP[2]
CP[3]
+ P 224 CLK0,CLK1,CLK2,CLK3
CLK0
CLK1
CLK2
CLK3
j 450 80
+ S 273
CP[0]
CP[1]
CP[2]
CP[3]
+ P 234 CLK0,CLK1,CLK2,CLK3
CLK0
CLK1
CLK2
CLK3
j 200 480
+ S 274
CP[0]
CP[1]
CP[2]
CP[3]
+ b 267
CP[0]
CP[1]
CP[2]
CP[3]
j 200 200
+ S 275
CP[0]
CP[1]
CP[2]
CP[3]
+ P 229 CLK0,CLK1,CLK2,CLK3
CLK0
CLK1
CLK2
CLK3
@attributes
a 0 s 13 0 0 0 hln 100 PAGETITLE=
a 0 s 13 0 0 0 hln 100 PAGENO=1
a 0 s 13 0 0 0 hln 100 PAGESIZE=A
a 0 s 13 0 0 0 hln 100 PAGECOUNT=1
@text
