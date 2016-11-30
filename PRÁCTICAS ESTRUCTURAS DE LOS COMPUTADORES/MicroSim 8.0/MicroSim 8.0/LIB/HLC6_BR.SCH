*version 6.0 198263464
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
u 206
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
pageloc 1 0 2103 
@status
c 68:00:01:00:00:00;0
c 91:00:07:00:27:40;726366460
c 93:11:02:14:15:57;818000157
*page 1 0 970 720 iA
@ports
port 1 INTERFACE 70 170 h
a 1 s 3 0 19 8 hcn 100 LABEL=IN
port 2 INTERFACE 420 170 u
a 1 s 3 0 19 8 hcn 100 LABEL=OUT
@parts
part 3 L 240 130 h
a 0 u 13 0 15 25 hln 100 value=@L1VAL
a 0 ap 9 0 15 0 hln 100 REFDES=L1
a 0 s 0 0 0 0 hln 100 PKGREF=L1
part 4 L 120 240 h
a 0 u 13 0 15 25 hln 100 value=@L2VAL
a 0 ap 9 0 15 0 hln 100 REFDES=L2
a 0 s 0 0 0 0 hln 100 PKGREF=L2
part 5 C 150 130 h
a 0 u 13 0 -7 25 hln 100 value=@C1VAL
a 0 ap 9 0 15 0 hln 100 REFDES=C1
a 0 s 0 0 0 0 hln 100 PKGREF=C1
part 6 C 150 200 h
a 0 u 13 0 -9 23 hln 100 value=@C2VAL
a 0 ap 9 0 15 0 hln 100 REFDES=C2
a 0 s 0 0 0 0 hln 100 PKGREF=C2
part 7 R 140 280 h
a 0 u 13 0 15 25 hln 100 value={1.0E5*@RSCALE}
a 0 xp 9 0 15 0 hln 100 REFDES=RDUM2
a 0 s 0 0 0 0 hln 100 PKGREF=RDUM2
@conn
w 9
a 0 s 0 0 80 168 hln 100 LABEL=T1
s 70 170 90 170 38
a 0 s 3 0 80 168 hln 100 LABEL=T1
s 90 280 90 220 146
s 90 280 140 280 155
s 90 170 90 130 174
s 90 130 150 130 177
s 120 240 110 240 139
s 150 200 110 200 184
s 110 200 110 220 187
s 90 220 90 170 192
s 110 220 110 240 194
s 110 220 90 220 189
w 17
a 0 s 0 0 200 128 hln 100 LABEL=N1
s 180 130 240 130 118
a 0 s 3 0 200 128 hln 100 LABEL=N1
w 117
a 0 s 3 0 390 168 hln 100 LABEL=N1
s 310 170 420 170 43
a 0 s 3 0 390 168 hln 100 LABEL=N1
s 310 280 310 220 164
s 310 130 310 170 47
s 300 130 310 130 20
s 180 280 310 280 168
s 180 240 220 240 104
s 180 200 220 200 195
s 220 200 220 220 198
s 310 220 310 170 203
s 220 220 220 240 205
s 220 220 310 220 200
@junction
j 70 170
+ s 1
+ w 9
j 420 170
+ s 2
+ w 117
j 180 130
+ p 5 2
+ w 17
j 300 130
+ p 3 2
+ w 117
j 150 130
+ p 5 1
+ w 9
j 180 240
+ p 4 2
+ w 117
j 310 170
+ w 117
+ w 117
j 240 130
+ p 3 1
+ w 17
j 120 240
+ p 4 1
+ w 9
j 140 280
+ p 7 1
+ w 9
j 180 280
+ p 7 2
+ w 117
j 90 170
+ w 9
+ w 9
j 150 200
+ p 6 1
+ w 9
j 90 220
+ w 9
+ w 9
j 110 220
+ w 9
+ w 9
j 180 200
+ p 6 2
+ w 117
j 310 220
+ w 117
+ w 117
j 220 220
+ w 117
+ w 117
@attributes
a 0 s 13 0 0 0 hln 100 PAGETITLE=
a 0 s 13 0 0 0 hln 100 PAGENO=1
a 0 s 13 0 0 0 hln 100 PAGESIZE=A
a 0 s 13 0 0 0 hln 100 PAGECOUNT=1
@text
