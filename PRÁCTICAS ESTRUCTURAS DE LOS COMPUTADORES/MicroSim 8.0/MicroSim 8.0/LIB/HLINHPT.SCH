*version 6.0 601473496
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
u 147
C? 4
EAMP? 2
X? 3
V? 2
R? 2
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
pageloc 1 0 4259 
@status
c 68:00:01:00:00:00;0
c 91:00:07:00:09:50;726365390
c 91:00:07:18:46:57;726432417
c 91:00:07:22:20:40;726445240
c 93:11:02:14:08:02;817999682
*page 1 0 970 720 iA
@ports
port 5 INTERFACE 580 310 u
a 1 s 3 0 21 8 hcn 100 LABEL=OUT
port 6 INTERFACE 90 460 h
a 1 s 3 0 9 -4 hcn 100 LABEL=CLK[0-5]
port 7 INTERFACE 60 290 h
a 1 s 3 0 19 8 hcn 100 LABEL=IN
port 9 FOFFPAGE 450 100 v
a 1 s 3 0 23 50 hcn 100 LABEL=CP[0-5]
port 10 FOFFPAGE 240 100 v
a 1 s 3 0 23 28 hcn 100 LABEL=CP[0-5]
port 30 AGND 340 510 h
port 71 FOFFPAGE 150 460 u
a 1 s 3 0 9 8 hcn 100 LABEL=CP[0-5]
port 107 AGND 290 120 h
port 121 AGND 410 120 h
port 143 BUBBLE 230 330 v
a 1 x 14 0 20 6 hcn 100 LABEL=N5
port 144 BUBBLE 400 430 d
a 1 x 14 0 0 -14 hcn 100 LABEL=N5
@parts
part 1 C 120 290 h
a 0 u 13 0 15 25 hln 100 value=@C1VAL
a 0 ap 9 0 15 0 hln 100 REFDES=C1
a 0 s 0 0 0 0 hln 100 PKGREF=C1
part 2 C 350 60 h
a 0 u 13 0 15 25 hln 100 value=@C2VAL
a 0 ap 9 0 15 0 hln 100 REFDES=C2
a 0 s 0 0 0 0 hln 100 PKGREF=C2
part 3 C 270 240 h
a 0 u 13 0 15 25 hln 100 value=@CaVAL
a 0 xp 9 0 15 0 hln 100 REFDES=Ca
a 0 s 0 0 0 0 hln 100 PKGREF=Ca
part 4 EAMP 240 330 U
a 0 u 0 0 12 80 hln 100 EXPR=V(0,%-)*V(0,%+)*@GAIN
a 0 u 13 13 82 18 hln 100 GAIN=5000
a 0 s 0 0 36 68 hln 100 PART=EAMP
a 1 xp 9 0 46 42 hln 100 REFDES=EAMP1
a 0 s 0 0 0 0 hln 100 PKGREF=EAMP1
part 11 SWPAIR 230 40 h
a 0 s 0 0 0 80 hln 100 PART=SWPAIR
a 0 ap 9 0 14 8 hln 100 REFDES=X1
a 0 s 0 0 0 0 hln 100 PKGREF=X1
part 12 SWPAIRB 410 40 h
a 0 s 0 0 0 80 hln 100 PART=SWPAIRB
a 1 ap 9 0 14 8 hln 100 REFDES=X2
a 0 s 0 0 0 0 hln 100 PKGREF=X2
part 28 VSRC 340 440 h
a 1 u 13 13 -30 40 hcn 100 DC=1V
a 1 xp 9 0 -26 26 hcn 100 refdes=VSCALEV1
a 0 s 0 0 0 0 hln 100 PKGREF=VSCALEV1
part 29 R 400 480 v
a 0 u 13 0 9 57 hln 100 value=1MEG
a 0 xp 9 0 21 64 hln 100 REFDES=RSCALE
a 0 s 0 0 0 0 hln 100 PKGREF=RSCALE
@conn
w 14
s 60 290 120 290 13
w 18
a 0 s 3 0 185 288 hln 100 LABEL=N1
s 200 290 220 290 101
a 0 s 3 0 185 288 hln 100 LABEL=N1
s 150 290 200 290 17
s 220 290 240 290 79
s 220 290 220 240 76
s 220 240 270 240 80
s 220 60 200 60 95
s 200 60 200 290 98
w 51
s 340 510 340 490 56
s 400 480 400 490 53
s 340 490 340 480 62
s 400 490 340 490 59
w 64
a 0 s 0 0 370 428 hln 100 LABEL=N5
s 340 430 400 430 66
a 0 s 3 0 370 428 hln 100 LABEL=N5
s 340 440 340 430 63
s 400 430 400 440 68
w 84
a 0 s 0 0 415 308 hln 100 LABEL=OUT
s 340 310 540 310 133
a 0 s 3 0 415 308 hln 100 LABEL=OUT
s 300 240 340 240 83
s 340 240 340 310 86
s 340 310 320 310 88
s 540 310 540 60 135
s 470 60 540 60 137
s 540 310 580 310 139
w 103
a 0 s 0 0 320 58 hln 100 LABEL=N2
s 290 60 350 60 102
a 0 s 3 0 320 58 hln 100 LABEL=N2
w 109
s 260 100 260 110 108
s 260 110 290 110 111
s 290 110 290 120 113
w 117
a 0 s 0 0 390 58 hln 100 LABEL=N3
s 380 60 400 60 116
a 0 s 3 0 380 56 hln 100 LABEL=N3
w 123
s 410 120 410 110 122
s 410 110 430 110 125
s 430 110 430 100 127
w 146
s 230 330 240 330 145
b 73
a 0 s 0 0 120 458 hln 100 LABEL=CP[0-5]
s 90 460 150 460 72
a 0 s 3 0 102 454 hln 100 LABEL=CP[0-5]
@junction
j 120 290
+ p 1 1
+ w 14
j 60 290
+ s 7
+ w 14
j 150 290
+ p 1 2
+ w 18
j 240 290
+ p 4 -
+ w 18
j 340 510
+ s 30
+ w 51
j 400 480
+ p 29 1
+ w 51
j 340 480
+ p 28 -
+ w 51
j 340 490
+ w 51
+ w 51
j 340 440
+ p 28 +
+ w 64
j 400 440
+ p 29 2
+ w 64
j 90 460
+ S 6
CLK[0]
CLK[1]
CLK[2]
CLK[3]
CLK[4]
CLK[5]
+ b 73
CP[0]
CP[1]
CP[2]
CP[3]
CP[4]
CP[5]
j 150 460
+ S 71
CP[0]
CP[1]
CP[2]
CP[3]
CP[4]
CP[5]
+ b 73
CP[0]
CP[1]
CP[2]
CP[3]
CP[4]
CP[5]
j 220 290
+ w 18
+ w 18
j 270 240
+ p 3 1
+ w 18
j 300 240
+ p 3 2
+ w 84
j 320 310
+ p 4 OUT
+ w 84
j 340 310
+ w 84
+ w 84
j 220 60
+ p 11 IN
+ w 18
j 200 290
+ w 18
+ w 18
j 290 60
+ p 11 OUT
+ w 103
j 350 60
+ p 2 1
+ w 103
j 240 100
+ S 10
CP[0]
CP[1]
CP[2]
CP[3]
CP[4]
CP[5]
+ P 11 CLK0,CLK1,CLK2,CLK3,CLK4,CLK5
CLK0
CLK1
CLK2
CLK3
CLK4
CLK5
j 260 100
+ p 11 AGND
+ w 109
j 290 120
+ s 107
+ w 109
j 380 60
+ p 2 2
+ w 117
j 400 60
+ p 12 OUT
+ w 117
j 450 100
+ S 9
CP[0]
CP[1]
CP[2]
CP[3]
CP[4]
CP[5]
+ P 12 CLK0,CLK1,CLK2,CLK3,CLK4,CLK5
CLK0
CLK1
CLK2
CLK3
CLK4
CLK5
j 410 120
+ s 121
+ w 123
j 430 100
+ p 12 AGND
+ w 123
j 470 60
+ p 12 IN
+ w 84
j 580 310
+ s 5
+ w 84
j 540 310
+ w 84
+ w 84
j 400 430
+ s 144
+ w 64
j 240 330
+ p 4 +
+ w 146
j 230 330
+ s 143
+ w 146
@attributes
a 0 s 13 0 0 0 hln 100 PAGETITLE=
a 0 s 13 0 0 0 hln 100 PAGENO=1
a 0 s 13 0 0 0 hln 100 PAGESIZE=A
a 0 s 13 0 0 0 hln 100 PAGECOUNT=1
@text
