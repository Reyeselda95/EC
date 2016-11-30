*version 6.0 771151675
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
u 65
FILTR? 2
E? 2
EAMP? 2
R? 3
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
pageloc 1 0 1814 
@status
c 68:00:01:00:00:00;0
c 91:00:06:22:45:02;726360302
c 91:00:06:23:33:12;726363192
c 93:11:02:13:14:09;817996449
*page 1 0 0 0 iA
@ports
port 4 interface 120 130 h
a 1 s 3 0 19 8 hcn 100 LABEL=IN
port 5 interface 360 150 u
a 1 s 3 0 19 8 hcn 100 LABEL=OUT
port 10 agnd 240 210 h
@parts
part 3 eamp 250 170 U
a 0 u 13 0 94 16 hln 100 GAIN=10000
a 0 s 0 0 36 68 hln 100 PART=eamp
a 1 xp 9 0 74 66 hln 100 REFDES=EAMP1
a 0 s 0 0 0 0 hln 100 PKGREF=EAMP1
part 6 r 160 130 h
a 0 u 13 0 15 25 hln 100 value=@R1VAL
a 0 xp 9 0 15 0 hln 100 REFDES=R1
a 0 s 0 0 0 0 hln 100 PKGREF=R1
part 7 r 250 60 h
a 0 u 13 0 15 19 hln 100 value=@R2VAL
a 0 xp 9 0 15 0 hln 100 REFDES=R2
a 0 s 0 0 0 0 hln 100 PKGREF=R2
part 8 c 160 90 h
a 0 u 13 0 15 25 hln 100 value=@C1VAL
a 0 xp 9 0 15 0 hln 100 REFDES=C1
a 0 s 0 0 0 0 hln 100 PKGREF=C1
part 9 c 250 90 h
a 0 u 13 0 15 25 hln 100 value=@C2VAL
a 0 xp 9 0 15 0 hln 100 REFDES=C2
a 0 s 0 0 0 0 hln 100 PKGREF=C2
@conn
w 12
s 120 130 150 130 11
s 160 90 150 90 15
s 150 130 160 130 21
s 150 90 150 130 18
w 23
a 0 s 0 0 215 88 hln 100 LABEL=N1
s 190 90 240 90 22
a 0 s 3 0 215 88 hln 100 LABEL=N1
s 250 60 240 60 26
s 240 90 250 90 32
s 240 60 240 90 29
s 240 90 240 130 33
s 240 130 250 130 35
s 240 130 200 130 38
w 43
s 250 170 240 170 42
s 240 170 240 210 45
w 50
s 330 150 350 150 49
s 290 60 350 60 53
s 350 150 360 150 59
s 350 60 350 90 56
s 350 90 350 150 64
s 280 90 350 90 60
@junction
j 160 130
+ p 6 1
+ w 12
j 120 130
+ s 4
+ w 12
j 160 90
+ p 8 1
+ w 12
j 150 130
+ w 12
+ w 12
j 190 90
+ p 8 2
+ w 23
j 250 90
+ p 9 1
+ w 23
j 250 60
+ p 7 1
+ w 23
j 240 90
+ w 23
+ w 23
j 250 130
+ p 3 -
+ w 23
j 200 130
+ p 6 2
+ w 23
j 240 130
+ w 23
+ w 23
j 250 170
+ p 3 +
+ w 43
j 240 210
+ s 10
+ w 43
j 330 150
+ p 3 OUT
+ w 50
j 360 150
+ s 5
+ w 50
j 290 60
+ p 7 2
+ w 50
j 350 150
+ w 50
+ w 50
j 280 90
+ p 9 2
+ w 50
j 350 90
+ w 50
+ w 50
@attributes
@text
s 5 280 180 hln 100 Gain=
