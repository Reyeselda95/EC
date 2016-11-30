*version 6.0 503916222
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
u 69
R? 3
C? 3
L? 3
PM? 3
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
pageloc 1 0 2308 
@status
c 68:00:01:00:00:00;0
c 91:00:07:00:26:43;726366403
c 91:00:07:18:29:59;726431399
c 93:11:02:14:15:24;818000124
*page 1 0 970 720 iA
@ports
port 1 INTERFACE 80 130 h
a 1 s 3 0 19 8 hcn 100 LABEL=IN
port 3 INTERFACE 420 130 u
a 1 s 3 0 19 8 hcn 100 LABEL=OUT
@parts
part 4 R 100 130 h
a 0 u 13 0 15 25 hln 100 value={1E-5*@RSCALE}
a 0 xp 9 0 5 -2 hln 100 REFDES=RDUM1
a 0 s 0 0 0 0 hln 100 PKGREF=RDUM1
part 5 R 230 230 h
a 0 u 13 0 -9 25 hln 100 value={1.0E5*@RSCALE}
a 0 xp 9 0 15 0 hln 100 REFDES=RDUM2
a 0 s 0 0 0 0 hln 100 PKGREF=RDUM2
part 6 C 180 100 h
a 0 u 13 0 15 25 hln 100 value=@C1VAL
a 0 ap 9 0 15 0 hln 100 REFDES=C1
a 0 s 0 0 0 0 hln 100 PKGREF=C1
part 7 C 320 100 h
a 0 u 13 0 15 25 hln 100 value=@C2VAL
a 0 ap 9 0 15 0 hln 100 REFDES=C2
a 0 s 0 0 0 0 hln 100 PKGREF=C2
part 8 L 180 190 h
a 0 u 13 0 15 25 hln 100 value=@L1VAL
a 0 ap 9 0 15 0 hln 100 REFDES=L1
a 0 s 0 0 0 0 hln 100 PKGREF=L1
part 9 L 290 190 h
a 0 u 13 0 15 25 hln 100 value=@L2VAL
a 0 ap 9 0 15 0 hln 100 REFDES=L2
a 0 s 0 0 0 0 hln 100 PKGREF=L2
@conn
w 11
a 0 s 0 0 160 228 hln 100 LABEL=T1
s 90 230 230 230 47
a 0 s 3 0 160 228 hln 100 LABEL=T1
s 80 130 90 130 10
s 90 130 100 130 46
s 90 130 90 230 43
w 15
a 0 s 0 0 165 98 hln 100 LABEL=N0
s 180 100 150 100 14
a 0 s 3 0 165 98 hln 100 LABEL=N0
s 150 100 150 130 17
s 150 190 180 190 19
s 150 130 150 190 26
s 140 130 150 130 22
w 28
a 0 s 3 0 265 98 hln 100 LABEL=N1
s 260 100 320 100 64
a 0 s 3 0 265 98 hln 100 LABEL=N1
s 210 100 260 100 27
s 290 190 260 190 39
s 260 190 240 190 66
s 260 100 260 190 61
w 32
a 0 s 0 0 335 228 hln 100 LABEL=T2
s 270 230 400 230 50
a 0 s 3 0 335 228 hln 100 LABEL=T2
s 350 100 400 100 31
s 400 100 400 130 34
s 400 190 350 190 36
s 400 230 400 190 53
s 400 130 400 190 60
s 420 130 400 130 56
@junction
j 100 130
+ p 4 1
+ w 11
j 80 130
+ s 1
+ w 11
j 180 100
+ p 6 1
+ w 15
j 180 190
+ p 8 1
+ w 15
j 140 130
+ p 4 2
+ w 15
j 150 130
+ w 15
+ w 15
j 210 100
+ p 6 2
+ w 28
j 320 100
+ p 7 1
+ w 28
j 350 100
+ p 7 2
+ w 32
j 350 190
+ p 9 2
+ w 32
j 240 190
+ p 8 2
+ w 28
j 290 190
+ p 9 1
+ w 28
j 90 130
+ w 11
+ w 11
j 230 230
+ p 5 1
+ w 11
j 270 230
+ p 5 2
+ w 32
j 400 190
+ w 32
+ w 32
j 420 130
+ s 3
+ w 32
j 400 130
+ w 32
+ w 32
j 260 100
+ w 28
+ w 28
j 260 190
+ w 28
+ w 28
@attributes
a 0 s 13 0 0 0 hln 100 PAGETITLE=
a 0 s 13 0 0 0 hln 100 PAGENO=1
a 0 s 13 0 0 0 hln 100 PAGESIZE=A
a 0 s 13 0 0 0 hln 100 PAGECOUNT=1
@text
