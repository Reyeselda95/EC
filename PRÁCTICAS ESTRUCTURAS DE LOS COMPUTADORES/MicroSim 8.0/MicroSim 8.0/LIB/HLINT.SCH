*version 6.0 187701037
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
u 200
X? 4
EAMP? 3
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
pageloc 1 0 5922 
@status
c 68:00:01:00:00:00;0
c 91:00:07:00:08:43;726365323
c 91:00:07:18:08:09;726430089
c 91:00:07:18:45:04;726432304
c 91:00:07:22:19:08;726445148
c 93:11:02:14:07:21;817999641
*page 1 0 970 720 iA
@ports
port 1 INTERFACE 60 310 h
a 1 s 3 0 19 8 hcn 100 LABEL=IN
port 2 INTERFACE 100 480 h
a 1 s 3 0 17 -10 hcn 100 LABEL=CP[0-5]
port 3 INTERFACE 550 330 u
a 1 s 3 0 19 8 hcn 100 LABEL=OUT
port 27 AGND 170 390 h
port 82 FOFFPAGE 200 200 v
a 1 s 3 0 23 30 hcn 100 LABEL=CP[0-5]
port 96 AGND 250 220 h
port 108 AGND 250 100 h
port 139 FOFFPAGE 150 480 u
a 1 s 3 0 25 -10 hcn 100 LABEL=CP[0-5]
port 147 AGND 300 530 h
port 184 AGND 410 100 h
port 193 FOFFPAGE 200 80 v
a 1 s 3 0 23 30 hcn 100 LABEL=CP[0-5]
port 195 FOFFPAGE 450 80 v
a 1 s 3 0 23 30 hcn 100 LABEL=CP[0-5]
port 198 BUBBLE 230 350 v
a 1 x 14 0 6 14 hcn 100 LABEL=N5
port 199 BUBBLE 420 450 d
a 1 x 14 0 0 -14 hcn 100 LABEL=N5
@parts
part 4 SWPAIR 190 140 h
a 0 s 0 0 0 80 hln 100 PART=SWPAIR
a 0 ap 9 0 14 8 hln 100 REFDES=X1
a 0 s 0 0 0 0 hln 100 PKGREF=X1
part 5 SWPAIR 190 20 h
a 0 s 0 0 0 80 hln 100 PART=SWPAIR
a 0 ap 9 0 14 8 hln 100 REFDES=X2
a 0 s 0 0 0 0 hln 100 PKGREF=X2
part 6 SWPAIRB 410 20 h
a 0 s 0 0 0 80 hln 100 PART=SWPAIRB
a 1 ap 9 0 14 8 hln 100 REFDES=X3
a 0 s 0 0 0 0 hln 100 PKGREF=X3
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
part 17 R 170 370 v
a 0 u 13 0 3 1 hln 100 value=100MEG
a 0 xp 9 0 15 0 hln 100 REFDES=RDUM
a 0 s 0 0 0 0 hln 100 PKGREF=RDUM
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
part 146 C 420 500 v
a 0 u 13 0 9 45 hln 100 value=1P
a 0 xp 9 0 23 60 hln 100 REFDES=CSCALE
a 0 s 0 0 0 0 hln 100 PKGREF=CSCALE
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
s 170 310 170 330 21
s 170 310 230 310 29
s 230 310 240 310 44
s 230 310 230 260 41
s 230 260 250 260 45
s 170 310 170 160 59
s 170 160 180 160 61
w 25
s 170 370 170 390 24
w 35
s 230 350 240 350 37
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
w 149
a 0 s 0 0 380 448 hln 100 LABEL=N5
s 340 450 420 450 160
a 0 s 3 0 380 448 hln 100 LABEL=N5
s 300 460 300 450 148
s 300 450 340 450 151
s 420 450 420 470 153
s 340 450 340 460 156
w 162
s 300 500 300 510 161
s 300 510 300 530 168
s 300 510 340 510 165
s 420 510 420 500 169
s 340 510 420 510 176
s 340 500 340 510 172
w 186
s 410 100 410 90 185
s 410 90 430 90 188
s 430 90 430 80 190
b 141
a 0 s 0 0 125 478 hln 100 LABEL=CP[0-5]
s 100 480 150 480 140
a 0 s 3 0 109 474 hln 100 LABEL=CP[0-5]
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
j 170 330
+ p 17 2
+ w 19
j 170 370
+ p 17 1
+ w 25
j 170 390
+ s 27
+ w 25
j 240 310
+ p 7 -
+ w 19
j 170 310
+ w 19
+ w 19
j 240 350
+ p 7 +
+ w 35
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
j 180 160
+ p 4 IN
+ w 19
j 70 310
+ w 14
+ w 14
j 180 40
+ p 5 IN
+ w 14
j 200 200
+ S 82
CP[0]
CP[1]
CP[2]
CP[3]
CP[4]
CP[5]
+ P 4 CLK0,CLK1,CLK2,CLK3,CLK4,CLK5
CLK0
CLK1
CLK2
CLK3
CLK4
CLK5
j 220 200
+ p 4 AGND
+ w 88
j 250 220
+ s 96
+ w 88
j 220 80
+ p 5 AGND
+ w 100
j 250 100
+ s 108
+ w 100
j 250 40
+ p 5 OUT
+ w 112
j 300 40
+ p 110 1
+ w 112
j 330 40
+ p 110 2
+ w 121
j 360 40
+ p 115 1
+ w 121
j 400 40
+ p 6 OUT
+ w 125
j 390 40
+ p 115 2
+ w 125
j 470 40
+ p 6 IN
+ w 49
j 550 330
+ s 3
+ w 49
j 490 330
+ w 49
+ w 49
j 100 480
+ S 2
CP[0]
CP[1]
CP[2]
CP[3]
CP[4]
CP[5]
+ b 141
CP[0]
CP[1]
CP[2]
CP[3]
CP[4]
CP[5]
j 150 480
+ S 139
CP[0]
CP[1]
CP[2]
CP[3]
CP[4]
CP[5]
+ b 141
CP[0]
CP[1]
CP[2]
CP[3]
CP[4]
CP[5]
j 300 460
+ p 144 +
+ w 149
j 420 470
+ p 146 2
+ w 149
j 340 460
+ p 145 2
+ w 149
j 340 450
+ w 149
+ w 149
j 300 500
+ p 144 -
+ w 162
j 300 530
+ s 147
+ w 162
j 300 510
+ w 162
+ w 162
j 420 500
+ p 146 1
+ w 162
j 340 500
+ p 145 1
+ w 162
j 340 510
+ w 162
+ w 162
j 250 160
+ p 4 OUT
+ w 121
j 350 40
+ w 121
+ w 121
j 410 100
+ s 184
+ w 186
j 430 80
+ p 6 AGND
+ w 186
j 200 80
+ S 193
CP[0]
CP[1]
CP[2]
CP[3]
CP[4]
CP[5]
+ P 5 CLK0,CLK1,CLK2,CLK3,CLK4,CLK5
CLK0
CLK1
CLK2
CLK3
CLK4
CLK5
j 450 80
+ S 195
CP[0]
CP[1]
CP[2]
CP[3]
CP[4]
CP[5]
+ P 6 CLK0,CLK1,CLK2,CLK3,CLK4,CLK5
CLK0
CLK1
CLK2
CLK3
CLK4
CLK5
j 230 350
+ s 198
+ w 35
j 420 450
+ s 199
+ w 149
@attributes
a 0 s 13 0 0 0 hln 100 PAGETITLE=
a 0 s 13 0 0 0 hln 100 PAGENO=1
a 0 s 13 0 0 0 hln 100 PAGESIZE=A
a 0 s 13 0 0 0 hln 100 PAGECOUNT=1
@text
