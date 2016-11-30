*version 6.0 1509662590
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
u 254
EAMP? 4
R? 9
C? 3
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
pageloc 1 0 4963 
@status
c 68:00:01:00:00:00;0
c 91:00:06:22:47:24;726360444
c 91:00:06:23:33:56;726363236
c 93:11:02:13:14:41;817996481
*page 1 0 970 720 iA
@ports
port 1 INTERFACE 60 170 h
a 1 s 3 0 19 8 hcn 100 LABEL=IN
port 2 INTERFACE 620 230 u
a 1 s 3 0 19 8 hcn 100 LABEL=OUT
port 16 AGND 130 220 h
port 17 AGND 330 270 h
port 18 AGND 510 270 h
@parts
part 3 EAMP 160 210 U
a 0 u 13 0 98 16 hln 100 GAIN=10000
a 0 s 0 0 36 68 hln 100 PART=EAMP
a 1 xp 9 0 68 68 hln 100 REFDES=EAMP1
a 0 s 0 0 0 0 hln 100 PKGREF=EAMP1
part 4 EAMP 340 230 U
a 0 u 13 0 96 16 hln 100 GAIN=10000
a 0 s 0 0 36 68 hln 100 PART=EAMP
a 1 xp 9 0 78 64 hln 100 REFDES=EAMP2
a 0 s 0 0 0 0 hln 100 PKGREF=EAMP2
part 5 EAMP 520 250 U
a 0 u 13 0 100 16 hln 100 GAIN=10000
a 0 s 0 0 36 68 hln 100 PART=EAMP
a 1 xp 9 0 78 66 hln 100 REFDES=EAMP3
a 0 s 0 0 0 0 hln 100 PKGREF=EAMP3
part 6 R 160 80 h
a 0 u 13 0 15 25 hln 100 value=@R1VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R1
a 0 s 0 0 0 0 hln 100 PKGREF=R1
part 7 R 440 210 h
a 0 u 13 0 15 25 hln 100 value=@R2VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R2
a 0 s 0 0 0 0 hln 100 PKGREF=R2
part 8 R 250 50 h
a 0 u 13 0 15 25 hln 100 value=@R3VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R3
a 0 s 0 0 0 0 hln 100 PKGREF=R3
part 9 R 90 170 h
a 0 u 13 0 15 25 hln 100 value=@R4VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R4
a 0 s 0 0 0 0 hln 100 PKGREF=R4
part 10 R 250 310 h
a 0 u 13 0 15 25 hln 100 value=@R5VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R5
a 0 s 0 0 0 0 hln 100 PKGREF=R5
part 11 R 170 260 h
a 0 u 13 0 15 25 hln 100 value=@R6VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R6
a 0 s 0 0 0 0 hln 100 PKGREF=R6
part 12 R 260 190 h
a 0 u 13 0 15 25 hln 100 value=@R7VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R7
a 0 s 0 0 0 0 hln 100 PKGREF=R7
part 13 R 350 120 h
a 0 u 13 0 15 25 hln 100 value=@R8VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R8
a 0 s 0 0 0 0 hln 100 PKGREF=R8
part 14 C 160 120 h
a 0 u 13 0 15 25 hln 100 value=@C1VAL
a 0 ap 9 0 15 0 hln 100 REFDES=C1
a 0 s 0 0 0 0 hln 100 PKGREF=C1
part 15 C 540 150 h
a 0 u 13 0 15 25 hln 100 value=@C2VAL
a 0 ap 9 0 15 0 hln 100 REFDES=C2
a 0 s 0 0 0 0 hln 100 PKGREF=C2
@conn
w 20
s 130 220 130 210 19
s 130 210 160 210 22
w 38
s 60 170 70 170 37
s 170 260 70 260 64
s 70 170 90 170 70
s 70 260 70 170 67
s 70 260 70 310 71
s 70 310 250 310 74
w 42
a 0 s 0 0 200 48 hln 100 LABEL=N1
s 150 50 250 50 61
a 0 s 3 0 200 48 hln 100 LABEL=N1
s 130 170 150 170 41
s 150 170 160 170 48
s 150 170 150 120 45
s 150 120 160 120 49
s 150 120 150 80 52
s 150 80 160 80 55
s 150 80 150 50 58
w 84
a 0 s 0 0 335 118 hln 100 LABEL=N2
s 320 120 350 120 219
a 0 s 3 0 335 118 hln 100 LABEL=N2
s 210 260 310 260 109
s 310 260 310 190 111
s 300 190 310 190 119
s 310 190 320 190 122
s 320 190 340 190 134
s 320 190 320 120 217
w 90
a 0 s 0 0 225 78 hln 100 LABEL=A1
s 250 80 200 80 97
a 0 s 3 0 225 78 hln 100 LABEL=A1
s 240 190 250 190 89
s 250 190 250 120 93
s 250 120 250 80 104
s 190 120 250 120 100
s 250 190 260 190 105
w 114
s 340 230 330 230 113
s 330 230 330 270 116
w 139
a 0 s 0 0 590 148 hln 100 LABEL=A3
s 570 150 610 150 193
a 0 s 3 0 590 148 hln 100 LABEL=A3
s 440 210 430 210 143
s 610 150 610 230 196
s 610 230 600 230 198
s 290 50 610 50 201
s 610 50 610 120 204
s 610 230 620 230 208
s 610 120 610 150 226
s 390 120 430 120 222
s 430 210 420 210 233
s 430 120 610 120 235
s 430 210 430 120 227
w 151
a 0 s 0 0 520 148 hln 100 LABEL=N3
s 500 150 540 150 190
a 0 s 3 0 520 148 hln 100 LABEL=N3
s 290 310 490 310 150
s 490 310 490 210 153
s 490 210 480 210 155
s 490 210 500 210 162
s 500 210 500 150 176
s 500 210 520 210 180
w 185
s 520 250 510 250 184
s 510 250 510 270 187
@junction
j 130 220
+ s 16
+ w 20
j 90 170
+ p 9 1
+ w 38
j 60 170
+ s 1
+ w 38
j 130 170
+ p 9 2
+ w 42
j 150 170
+ w 42
+ w 42
j 160 120
+ p 14 1
+ w 42
j 150 120
+ w 42
+ w 42
j 160 80
+ p 6 1
+ w 42
j 150 80
+ w 42
+ w 42
j 250 50
+ p 8 1
+ w 42
j 170 260
+ p 11 1
+ w 38
j 70 170
+ w 38
+ w 38
j 70 260
+ w 38
+ w 38
j 250 310
+ p 10 1
+ w 38
j 210 260
+ p 11 2
+ w 84
j 200 80
+ p 6 2
+ w 90
j 190 120
+ p 14 2
+ w 90
j 250 120
+ w 90
+ w 90
j 260 190
+ p 12 1
+ w 90
j 250 190
+ w 90
+ w 90
j 330 270
+ s 17
+ w 114
j 300 190
+ p 12 2
+ w 84
j 310 190
+ w 84
+ w 84
j 320 190
+ w 84
+ w 84
j 440 210
+ p 7 1
+ w 139
j 290 310
+ p 10 2
+ w 151
j 480 210
+ p 7 2
+ w 151
j 490 210
+ w 151
+ w 151
j 500 210
+ w 151
+ w 151
j 510 270
+ s 18
+ w 185
j 540 150
+ p 15 1
+ w 151
j 570 150
+ p 15 2
+ w 139
j 290 50
+ p 8 2
+ w 139
j 620 230
+ s 2
+ w 139
j 350 120
+ p 13 1
+ w 84
j 390 120
+ p 13 2
+ w 139
j 610 230
+ w 139
+ w 139
j 610 120
+ w 139
+ w 139
j 610 150
+ w 139
+ w 139
j 430 210
+ w 139
+ w 139
j 430 120
+ w 139
+ w 139
j 160 210
+ p 3 +
+ w 20
j 160 170
+ p 3 -
+ w 42
j 240 190
+ p 3 OUT
+ w 90
j 340 190
+ p 4 -
+ w 84
j 340 230
+ p 4 +
+ w 114
j 420 210
+ p 4 OUT
+ w 139
j 600 230
+ p 5 OUT
+ w 139
j 520 210
+ p 5 -
+ w 151
j 520 250
+ p 5 +
+ w 185
@attributes
a 0 s 13 0 0 0 hln 100 PAGETITLE=
a 0 s 13 0 0 0 hln 100 PAGENO=1
a 0 s 13 0 0 0 hln 100 PAGESIZE=A
a 0 s 13 0 0 0 hln 100 PAGECOUNT=1
@text
s 5 550 260 hln 100 GAIN =
s 5 370 240 hln 100 GAIN =
s 5 190 220 hln 100 GAIN =
