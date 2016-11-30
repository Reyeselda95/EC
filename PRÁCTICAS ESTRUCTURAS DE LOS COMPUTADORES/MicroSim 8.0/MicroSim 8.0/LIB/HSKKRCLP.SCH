*version 6.0 2021642996
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
u 74
R? 5
C? 3
EAMP? 2
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
pageloc 1 0 2515 
@status
c 68:00:01:00:00:00;0
c 91:00:06:23:41:05;726363665
c 93:11:02:13:57:08;817999028
*page 1 0 970 720 iA
@ports
port 8 INTERFACE 70 140 h
a 1 s 3 0 19 8 hcn 100 LABEL=IN
port 9 INTERFACE 400 160 u
a 1 s 3 0 19 8 hcn 100 LABEL=OUT
port 24 AGND 200 260 h
port 39 AGND 270 300 h
@parts
part 1 R 80 140 h
a 0 u 13 0 15 25 hln 100 value=@R1VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R1
a 0 s 0 0 0 0 hln 100 PKGREF=R1
part 2 R 140 140 h
a 0 u 13 0 15 25 hln 100 value=@R2VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R2
a 0 s 0 0 0 0 hln 100 PKGREF=R2
part 3 R 270 290 v
a 0 u 13 0 15 63 hln 100 value=@R3VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R3
a 0 s 0 0 0 0 hln 100 PKGREF=R3
part 4 R 300 230 h
a 0 u 13 0 15 25 hln 100 value=@R4VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R4
a 0 s 0 0 0 0 hln 100 PKGREF=R4
part 5 C 230 90 h
a 0 u 13 0 15 25 hln 100 value=@C1VAL
a 0 ap 9 0 15 0 hln 100 REFDES=C1
a 0 s 0 0 0 0 hln 100 PKGREF=C1
part 6 C 200 240 v
a 0 u 13 0 15 57 hln 100 value=@C2VAL
a 0 ap 9 0 15 0 hln 100 REFDES=C2
a 0 s 0 0 0 0 hln 100 PKGREF=C2
part 7 EAMP 280 140 h
a 0 u 13 0 58 70 hln 100 GAIN=10000
a 0 s 0 0 36 68 hln 100 PART=EAMP
a 1 xp 9 0 18 44 hln 100 REFDES=EAMP1
a 0 s 0 0 0 0 hln 100 PKGREF=EAMP1
@conn
w 11
s 70 140 80 140 10
w 15
a 0 s 0 0 132 115 hln 100 LABEL=N1
s 130 140 130 90 61
a 0 s 3 0 114 105 hln 100 LABEL=N1
s 120 140 130 140 14
s 130 140 140 140 64
s 130 90 230 90 65
w 19
a 0 s 0 0 190 138 hln 100 LABEL=N2
s 180 140 200 140 18
a 0 s 3 0 184 134 hln 100 LABEL=N2
s 200 140 200 210 21
s 200 140 280 140 29
w 26
s 200 260 200 240 25
w 34
a 0 s 0 0 272 205 hln 100 LABEL=N3
s 270 180 270 230 36
a 0 s 3 0 252 205 hln 100 LABEL=N3
s 280 180 270 180 33
s 270 230 270 250 48
s 270 230 300 230 44
w 41
s 270 300 270 290 40
w 50
s 340 230 380 230 49
s 380 230 380 160 52
s 380 160 360 160 54
s 380 160 400 160 57
s 260 90 380 90 68
s 380 90 380 160 71
@junction
j 80 140
+ p 1 1
+ w 11
j 70 140
+ s 8
+ w 11
j 120 140
+ p 1 2
+ w 15
j 140 140
+ p 2 1
+ w 15
j 180 140
+ p 2 2
+ w 19
j 200 210
+ p 6 2
+ w 19
j 200 240
+ p 6 1
+ w 26
j 200 260
+ s 24
+ w 26
j 280 140
+ p 7 +
+ w 19
j 200 140
+ w 19
+ w 19
j 280 180
+ p 7 -
+ w 34
j 270 250
+ p 3 2
+ w 34
j 270 290
+ p 3 1
+ w 41
j 270 300
+ s 39
+ w 41
j 300 230
+ p 4 1
+ w 34
j 270 230
+ w 34
+ w 34
j 340 230
+ p 4 2
+ w 50
j 360 160
+ p 7 OUT
+ w 50
j 400 160
+ s 9
+ w 50
j 380 160
+ w 50
+ w 50
j 130 140
+ w 15
+ w 15
j 230 90
+ p 5 1
+ w 15
j 260 90
+ p 5 2
+ w 50
@attributes
a 0 s 13 0 0 0 hln 100 PAGETITLE=
a 0 s 13 0 0 0 hln 100 PAGENO=1
a 0 s 13 0 0 0 hln 100 PAGESIZE=A
a 0 s 13 0 0 0 hln 100 PAGECOUNT=1
@text
s 5 310 190 hln 100 GAIN=
