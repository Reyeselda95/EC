*version 6.0 1790119688
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
u 259
L? 3
C? 3
R? 2
PM? 3
U? 2
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
pageloc 1 0 2054 
@status
c 68:00:01:00:00:00;0
c 91:00:07:00:28:40;726366520
c 93:11:02:14:16:28;818000188
*page 1 0 970 720 iA
@ports
port 1 INTERFACE 70 170 h
a 1 s 3 0 19 8 hcn 100 LABEL=IN
port 2 INTERFACE 420 170 u
a 1 s 3 0 19 8 hcn 100 LABEL=OUT
@parts
part 3 L 170 170 h
a 0 u 13 0 15 25 hln 100 value=@L1VAL
a 0 ap 9 0 15 0 hln 100 REFDES=L1
a 0 s 0 0 0 0 hln 100 PKGREF=L1
part 4 L 290 190 h
a 0 u 13 0 15 25 hln 100 value=@L2VAL
a 0 ap 9 0 15 0 hln 100 REFDES=L2
a 0 s 0 0 0 0 hln 100 PKGREF=L2
part 5 C 110 170 h
a 0 u 13 0 -7 25 hln 100 value=@C1VAL
a 0 ap 9 0 15 0 hln 100 REFDES=C1
a 0 s 0 0 0 0 hln 100 PKGREF=C1
part 6 C 290 150 h
a 0 u 13 0 -9 23 hln 100 value=@C2VAL
a 0 ap 9 0 15 0 hln 100 REFDES=C2
a 0 s 0 0 0 0 hln 100 PKGREF=C2
part 7 R 170 260 h
a 0 u 13 0 15 25 hln 100 value={1.0E5*@RSCALE}
a 0 xp 9 0 15 0 hln 100 REFDES=RDUM2
a 0 s 0 0 0 0 hln 100 PKGREF=RDUM2
@conn
w 211
a 0 s 0 0 75 168 hln 100 LABEL=T1
s 70 170 80 170 210
a 0 s 3 0 75 168 hln 100 LABEL=T1
s 170 260 80 260 252
s 80 170 110 170 258
s 80 260 80 170 255
w 215
a 0 s 0 0 155 168 hln 100 LABEL=N1
s 140 170 170 170 214
a 0 s 3 0 155 168 hln 100 LABEL=N1
w 219
a 0 s 0 0 250 168 hln 100 LABEL=N2
s 230 170 270 170 218
a 0 s 3 0 250 168 hln 100 LABEL=N2
s 270 170 270 150 221
s 270 150 290 150 223
s 270 170 270 190 226
s 270 190 290 190 229
w 233
a 0 s 0 0 400 168 hln 100 LABEL=T2
s 380 170 420 170 248
a 0 s 3 0 400 168 hln 100 LABEL=T2
s 320 150 360 150 232
s 360 150 360 170 235
s 350 190 360 190 237
s 360 170 360 190 244
s 360 170 380 170 240
s 380 170 380 260 245
s 380 260 210 260 249
@junction
j 110 170
+ p 5 1
+ w 211
j 70 170
+ s 1
+ w 211
j 170 170
+ p 3 1
+ w 215
j 140 170
+ p 5 2
+ w 215
j 230 170
+ p 3 2
+ w 219
j 290 150
+ p 6 1
+ w 219
j 270 170
+ w 219
+ w 219
j 290 190
+ p 4 1
+ w 219
j 320 150
+ p 6 2
+ w 233
j 350 190
+ p 4 2
+ w 233
j 420 170
+ s 2
+ w 233
j 360 170
+ w 233
+ w 233
j 380 170
+ w 233
+ w 233
j 210 260
+ p 7 2
+ w 233
j 170 260
+ p 7 1
+ w 211
j 80 170
+ w 211
+ w 211
@attributes
a 0 s 13 0 0 0 hln 100 PAGETITLE=
a 0 s 13 0 0 0 hln 100 PAGENO=1
a 0 s 13 0 0 0 hln 100 PAGESIZE=A
a 0 s 13 0 0 0 hln 100 PAGECOUNT=1
@text
