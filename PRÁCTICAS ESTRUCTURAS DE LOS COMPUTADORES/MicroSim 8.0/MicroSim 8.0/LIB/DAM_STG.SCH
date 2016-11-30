*version 6.0 88235258
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
u 201
R? 9
C? 4
EAMP? 4
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
pageloc 1 0 5163 
@status
c 68:00:01:00:00:00;0
c 91:00:06:22:49:28;726360568
c 91:00:06:23:34:35;726363275
c 93:11:02:13:19:23;817996763
*page 1 0 970 720 iA
@ports
port 1 INTERFACE 60 200 h
a 1 s 3 0 19 8 hcn 100 LABEL=IN
port 2 INTERFACE 560 240 u
a 1 s 3 0 19 8 hcn 100 LABEL=OUT
port 54 AGND 130 260 h
port 69 AGND 280 190 h
port 143 AGND 430 280 h
@parts
part 3 R 190 90 h
a 0 u 13 0 15 25 hln 100 value=@R1VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R1
a 0 s 0 0 0 0 hln 100 PKGREF=R1
part 4 R 330 200 v
a 0 u 13 0 15 61 hln 100 value=@R2VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R2
a 0 s 0 0 0 0 hln 100 PKGREF=R2
part 5 R 350 220 h
a 0 u 13 0 15 25 hln 100 value=@R3VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R3
a 0 s 0 0 0 0 hln 100 PKGREF=R3
part 6 R 330 320 h
a 0 u 13 0 15 25 hln 100 value=@R4VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R4
a 0 s 0 0 0 0 hln 100 PKGREF=R4
part 7 R 300 280 v
a 0 u 13 0 15 61 hln 100 value=@R5VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R5
a 0 s 0 0 0 0 hln 100 PKGREF=R5
part 8 R 440 110 h
a 0 u 13 0 15 25 hln 100 value=@R6VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R6
a 0 s 0 0 0 0 hln 100 PKGREF=R6
part 9 R 250 40 h
a 0 u 13 0 15 25 hln 100 value=@R7VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R7
a 0 s 0 0 0 0 hln 100 PKGREF=R7
part 10 R 80 200 h
a 0 u 13 0 15 25 hln 100 value=@R8VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R8
a 0 s 0 0 0 0 hln 100 PKGREF=R8
part 11 C 140 160 h
a 0 u 13 0 15 25 hln 100 value=@C1VAL
a 0 ap 9 0 15 0 hln 100 REFDES=C1
a 0 s 0 0 0 0 hln 100 PKGREF=C1
part 12 C 440 140 h
a 0 u 13 0 15 25 hln 100 value=@C2VAL
a 0 ap 9 0 1 4 hln 100 REFDES=C2
a 0 s 0 0 0 0 hln 100 PKGREF=C2
part 13 EAMP 140 240 U
a 0 u 13 0 96 16 hln 100 GAIN=10000
a 0 s 0 0 36 68 hln 100 PART=EAMP
a 1 xp 9 0 42 44 hln 100 REFDES=EAMP1
a 0 s 0 0 0 0 hln 100 PKGREF=EAMP1
part 14 EAMP 270 180 u
a 0 u 13 0 44 76 hln 100 GAIN=10000
a 0 s 0 0 36 68 hln 100 PART=EAMP
a 1 xp 9 0 44 46 hln 100 REFDES=EAMP2
a 0 s 0 0 0 0 hln 100 PKGREF=EAMP2
part 15 EAMP 440 260 U
a 0 u 13 0 104 16 hln 100 GAIN=10000
a 0 s 0 0 36 68 hln 100 PART=EAMP
a 1 xp 9 0 68 72 hln 100 REFDES=EAMP3
a 0 s 0 0 0 0 hln 100 PKGREF=EAMP3
part 53 C 330 290 h
a 0 u 13 0 21 19 hln 100 value=@C3VAL
a 0 ap 9 0 15 0 hln 100 REFDES=C3
a 0 s 0 0 0 0 hln 100 PKGREF=C3
@conn
w 17
s 60 200 70 200 16
s 70 200 80 200 195
s 70 200 70 320 192
s 300 280 300 290 112
s 300 290 330 290 115
s 300 290 300 320 126
s 300 320 330 320 129
s 70 320 300 320 196
w 21
a 0 s 0 0 132 100 hln 100 LABEL=N1
s 130 160 130 40 150
a 0 s 3 0 112 100 hln 100 LABEL=N1
s 120 200 130 200 20
s 130 200 140 200 27
s 130 200 130 160 24
s 130 160 140 160 28
s 130 40 250 40 153
w 32
s 170 160 180 160 31
s 180 160 190 160 38
s 180 160 180 90 35
s 180 90 190 90 39
w 43
a 0 s 0 0 275 218 hln 100 LABEL=A1
s 330 220 220 220 81
a 0 s 3 0 223 218 hln 100 LABEL=A1
s 330 220 350 220 105
s 330 200 330 220 101
w 56
s 130 260 130 240 55
s 130 240 140 240 58
w 71
s 270 180 280 180 70
s 280 180 280 190 73
w 106
a 0 s 0 0 255 88 hln 100 LABEL=N2
s 230 90 280 90 42
a 0 s 3 0 255 88 hln 100 LABEL=N2
s 280 140 300 140 77
s 280 90 280 140 45
s 280 140 270 140 47
s 330 140 330 160 98
s 300 140 330 140 111
s 300 140 300 240 107
w 119
a 0 s 0 0 415 218 hln 100 LABEL=N3
s 400 220 430 220 139
a 0 s 3 0 407 216 hln 100 LABEL=N3
s 360 290 400 290 118
s 400 290 400 220 121
s 400 220 390 220 123
s 370 320 400 320 132
s 400 320 400 290 135
s 430 220 440 220 159
s 430 220 430 140 156
s 430 140 440 140 160
s 430 140 430 110 163
s 430 110 440 110 166
w 145
s 430 280 430 260 144
s 430 260 440 260 147
w 170
s 290 40 530 40 169
s 530 40 530 110 172
s 530 140 470 140 174
s 530 110 530 140 181
s 480 110 530 110 177
s 530 140 530 240 182
s 530 240 520 240 185
s 530 240 560 240 188
@junction
j 80 200
+ p 10 1
+ w 17
j 60 200
+ s 1
+ w 17
j 120 200
+ p 10 2
+ w 21
j 140 200
+ p 13 -
+ w 21
j 130 200
+ w 21
+ w 21
j 140 160
+ p 11 1
+ w 21
j 170 160
+ p 11 2
+ w 32
j 190 160
+ p 14 OUT
+ w 32
j 180 160
+ w 32
+ w 32
j 190 90
+ p 3 1
+ w 32
j 230 90
+ p 3 2
+ w 106
j 270 140
+ p 14 -
+ w 106
j 130 260
+ s 54
+ w 56
j 140 240
+ p 13 +
+ w 56
j 220 220
+ p 13 OUT
+ w 43
j 270 180
+ p 14 +
+ w 71
j 280 190
+ s 69
+ w 71
j 280 140
+ w 106
+ w 106
j 350 220
+ p 5 1
+ w 43
j 330 160
+ p 4 2
+ w 106
j 330 200
+ p 4 1
+ w 43
j 330 220
+ w 43
+ w 43
j 300 240
+ p 7 2
+ w 106
j 300 140
+ w 106
+ w 106
j 300 280
+ p 7 1
+ w 17
j 330 290
+ p 53 1
+ w 17
j 360 290
+ p 53 2
+ w 119
j 390 220
+ p 5 2
+ w 119
j 330 320
+ p 6 1
+ w 17
j 370 320
+ p 6 2
+ w 119
j 400 320
+ w 119
+ w 119
j 400 290
+ w 119
+ w 119
j 440 220
+ p 15 -
+ w 119
j 400 220
+ w 119
+ w 119
j 430 280
+ s 143
+ w 145
j 440 260
+ p 15 +
+ w 145
j 130 160
+ w 21
+ w 21
j 250 40
+ p 9 1
+ w 21
j 430 220
+ w 119
+ w 119
j 440 140
+ p 12 1
+ w 119
j 430 140
+ w 119
+ w 119
j 440 110
+ p 8 1
+ w 119
j 290 40
+ p 9 2
+ w 170
j 470 140
+ p 12 2
+ w 170
j 480 110
+ p 8 2
+ w 170
j 530 110
+ w 170
+ w 170
j 530 140
+ w 170
+ w 170
j 520 240
+ p 15 OUT
+ w 170
j 530 240
+ w 170
+ w 170
j 560 240
+ s 2
+ w 170
j 70 200
+ w 17
+ w 17
j 300 290
+ w 17
+ w 17
j 70 320
+ w 17
+ w 17
j 300 320
+ w 17
+ w 17
@attributes
a 0 s 13 0 0 0 hln 100 PAGETITLE=
a 0 s 13 0 0 0 hln 100 PAGENO=1
a 0 s 13 0 0 0 hln 100 PAGESIZE=A
a 0 s 13 0 0 0 hln 100 PAGECOUNT=1
@text
s 5 170 250 hln 100 GAIN =
s 5 190 130 hln 100 GAIN =
s 5 480 270 hln 100 GAIN =
