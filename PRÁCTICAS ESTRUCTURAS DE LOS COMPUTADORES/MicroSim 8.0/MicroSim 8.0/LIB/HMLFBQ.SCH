*version 6.0 1049416058
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
u 231
EAMP? 2
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
pageloc 1 0 3665 
@status
c 68:00:01:00:00:00;0
c 91:00:06:23:51:58;726364318
c 93:11:02:14:03:18;817999398
*page 1 0 970 720 iA
@ports
port 13 INTERFACE 70 200 h
a 1 s 3 0 19 8 hcn 100 LABEL=IN
port 14 INTERFACE 480 160 u
a 1 s 3 0 19 8 hcn 100 LABEL=OUT
port 227 AGND 230 330 h
@parts
part 1 EAMP 380 180 U
a 0 u 13 0 82 6 hln 100 GAIN=10000
a 0 s 0 0 36 68 hln 100 PART=EAMP
a 1 xp 9 0 80 64 hln 100 REFDES=EAMP1
a 0 s 0 0 0 0 hln 100 PKGREF=EAMP1
part 3 R 90 140 h
a 0 u 13 0 15 25 hln 100 value=@R1VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R1
a 0 s 0 0 0 0 hln 100 PKGREF=R1
part 4 R 230 110 v
a 0 u 13 0 15 57 hln 100 value=@R2VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R2
a 0 s 0 0 0 0 hln 100 PKGREF=R2
part 5 R 90 200 h
a 0 u 13 0 15 25 hln 100 value=@R3VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R3
a 0 s 0 0 0 0 hln 100 PKGREF=R3
part 6 R 150 310 v
a 0 u 13 0 17 59 hln 100 value=@R4VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R4
a 0 s 0 0 0 0 hln 100 PKGREF=R4
part 7 R 230 310 v
a 0 u 13 0 11 61 hln 100 value=@R5VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R5
a 0 s 0 0 0 0 hln 100 PKGREF=R5
part 8 R 310 310 v
a 0 u 13 0 13 63 hln 100 value=@R6VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R6
a 0 s 0 0 0 0 hln 100 PKGREF=R6
part 10 R 380 260 h
a 0 u 13 0 15 25 hln 100 value=@R7VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R7
a 0 s 0 0 0 0 hln 100 PKGREF=R7
part 11 C 160 140 h
a 0 u 13 0 15 25 hln 100 value=@C1VAL
a 0 ap 9 0 15 0 hln 100 REFDES=C1
a 0 s 0 0 0 0 hln 100 PKGREF=C1
part 12 C 150 110 v
a 0 u 13 0 15 25 hln 100 value=1
a 0 ap 9 0 15 0 hln 100 REFDES=C2
a 0 s 0 0 0 0 hln 100 PKGREF=C2
part 19 R 90 260 h
a 0 u 13 0 15 25 hln 100 value=@R8VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R8
a 0 s 0 0 0 0 hln 100 PKGREF=R8
@conn
w 120
s 460 160 470 160 133
s 150 80 150 60 122
s 150 60 230 60 125
s 230 60 230 70 127
s 230 60 470 60 130
s 470 160 480 160 140
s 470 60 470 160 136
s 420 260 470 260 141
s 470 260 470 160 144
w 147
s 70 200 80 200 149
s 80 200 90 200 155
s 80 200 80 140 152
s 80 140 90 140 156
s 80 260 80 200 159
s 80 260 90 260 161
w 165
a 0 s 3 0 136 132 hln 100 LABEL=N1
s 150 140 160 140 174
a 0 s 3 0 136 132 hln 100 LABEL=N1
s 130 140 150 140 167
s 150 140 150 110 170
s 150 270 150 140 175
w 179
a 0 s 3 0 210 138 hln 100 LABEL=N2
s 230 140 190 140 181
a 0 s 3 0 210 138 hln 100 LABEL=N2
s 230 110 230 140 178
s 230 140 380 140 184
s 230 270 230 200 188
s 230 200 130 200 191
s 230 200 230 140 194
w 198
a 0 s 3 0 204 258 hln 100 LABEL=N3
s 310 260 130 260 210
a 0 s 3 0 204 258 hln 100 LABEL=N3
s 380 180 310 180 197
s 310 180 310 260 202
s 310 260 310 270 209
s 380 260 310 260 205
w 214
s 150 310 150 320 213
s 150 320 230 320 216
s 230 320 230 310 218
s 230 320 310 320 221
s 310 320 310 310 224
s 230 330 230 320 228
@junction
j 460 160
+ p 1 OUT
+ w 120
j 150 80
+ p 12 2
+ w 120
j 230 70
+ p 4 2
+ w 120
j 480 160
+ s 14
+ w 120
j 230 60
+ w 120
+ w 120
j 470 160
+ w 120
+ w 120
j 420 260
+ p 10 2
+ w 120
j 70 200
+ s 13
+ w 147
j 90 200
+ p 5 1
+ w 147
j 80 200
+ w 147
+ w 147
j 90 140
+ p 3 1
+ w 147
j 90 260
+ p 19 1
+ w 147
j 130 140
+ p 3 2
+ w 165
j 160 140
+ p 11 1
+ w 165
j 150 110
+ p 12 1
+ w 165
j 150 140
+ w 165
+ w 165
j 150 270
+ p 6 2
+ w 165
j 230 110
+ p 4 1
+ w 179
j 190 140
+ p 11 2
+ w 179
j 380 140
+ p 1 -
+ w 179
j 230 140
+ w 179
+ w 179
j 230 270
+ p 7 2
+ w 179
j 130 200
+ p 5 2
+ w 179
j 230 200
+ w 179
+ w 179
j 380 180
+ p 1 +
+ w 198
j 310 270
+ p 8 2
+ w 198
j 380 260
+ p 10 1
+ w 198
j 310 260
+ w 198
+ w 198
j 130 260
+ p 19 2
+ w 198
j 150 310
+ p 6 1
+ w 214
j 230 310
+ p 7 1
+ w 214
j 230 320
+ w 214
+ w 214
j 310 310
+ p 8 1
+ w 214
j 230 330
+ s 227
+ w 214
@attributes
a 0 s 13 0 0 0 hln 100 PAGETITLE=
a 0 s 13 0 0 0 hln 100 PAGENO=1
a 0 s 13 0 0 0 hln 100 PAGESIZE=A
a 0 s 13 0 0 0 hln 100 PAGECOUNT=1
@text
s 5 400 200 hln 100 GAIN=
