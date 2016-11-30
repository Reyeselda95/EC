*version 6.0 704553645
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
u 98
C? 2
L? 2
PM? 2
R? 3
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
pageloc 1 0 1542 
@status
c 68:00:01:00:00:00;0
c 91:00:07:00:25:44;726366344
c 93:11:02:14:14:49;818000089
*page 1 0 970 720 iA
@ports
port 1 INTERFACE 80 140 h
a 1 s 3 0 19 8 hcn 100 LABEL=IN
port 2 INTERFACE 330 140 u
a 1 s 3 0 19 8 hcn 100 LABEL=OUT
@parts
part 3 C 200 90 h
a 0 u 13 0 15 25 hln 100 value=@C1VAL
a 0 ap 9 0 15 0 hln 100 REFDES=C1
a 0 s 0 0 0 0 hln 100 PKGREF=C1
part 4 L 190 180 h
a 0 u 13 0 15 25 hln 100 value=@L1VAL
a 0 ap 9 0 15 0 hln 100 REFDES=L1
a 0 s 0 0 0 0 hln 100 PKGREF=L1
part 6 R 120 140 h
a 0 u 13 0 -25 27 hln 100 value={1E-5*@RSCALE}
a 0 xp 9 0 -1 -2 hln 100 REFDES=RDUM1
a 0 s 0 0 0 0 hln 100 PKGREF=RDUM1
part 7 R 200 230 h
a 0 u 13 0 -3 25 hln 100 value={1.0E5*@RSCALE}
a 0 xp 9 0 15 0 hln 100 REFDES=RDUM2
a 0 s 0 0 0 0 hln 100 PKGREF=RDUM2
@conn
w 45
s 80 140 90 140 79
s 90 140 120 140 85
s 90 140 90 230 82
s 90 230 200 230 86
w 49
s 160 140 170 140 48
s 170 140 170 90 51
s 170 90 200 90 53
s 170 140 170 180 56
s 170 180 190 180 59
w 63
s 250 180 270 180 62
s 270 90 230 90 67
s 270 180 270 140 70
s 270 140 270 90 75
s 330 140 320 140 92
s 240 230 320 230 89
s 320 140 270 140 97
s 320 140 320 230 94
@junction
j 120 140
+ p 6 1
+ w 45
j 160 140
+ p 6 2
+ w 49
j 200 90
+ p 3 1
+ w 49
j 170 140
+ w 49
+ w 49
j 190 180
+ p 4 1
+ w 49
j 250 180
+ p 4 2
+ w 63
j 230 90
+ p 3 2
+ w 63
j 270 140
+ w 63
+ w 63
j 330 140
+ s 2
+ w 63
j 80 140
+ s 1
+ w 45
j 90 140
+ w 45
+ w 45
j 200 230
+ p 7 1
+ w 45
j 240 230
+ p 7 2
+ w 63
j 320 140
+ w 63
+ w 63
@attributes
a 0 s 13 0 0 0 hln 100 PAGETITLE=
a 0 s 13 0 0 0 hln 100 PAGENO=1
a 0 s 13 0 0 0 hln 100 PAGESIZE=A
a 0 s 13 0 0 0 hln 100 PAGECOUNT=1
@text
