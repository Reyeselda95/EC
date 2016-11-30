*version 6.0 238682926
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
u 80
EAMP? 2
R? 4
C? 4
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
pageloc 1 0 2090 
@status
c 68:00:01:00:00:00;0
c 91:00:06:23:46:24;726363984
c 93:11:02:14:02:12;817999332
*page 1 0 970 720 iA
@ports
port 3 AGND 300 210 h
port 4 AGND 170 270 h
port 16 INTERFACE 70 150 h
a 1 s 3 0 19 8 hcn 100 LABEL=IN
port 17 INTERFACE 450 170 u
a 1 s 3 0 19 8 hcn 100 LABEL=OUT
@parts
part 1 EAMP 320 190 U
a 0 u 13 0 98 16 hln 100 GAIN=10000
a 0 s 0 0 36 68 hln 100 PART=EAMP
a 1 xp 9 0 74 68 hln 100 REFDES=EAMP1
a 0 s 0 0 0 0 hln 100 PKGREF=EAMP1
part 5 R 100 150 h
a 0 u 13 0 15 25 hln 100 value=@R1VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R1
a 0 s 0 0 0 0 hln 100 PKGREF=R1
part 6 R 280 130 v
a 0 u 13 0 15 65 hln 100 value=@R2VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R2
a 0 s 0 0 0 0 hln 100 PKGREF=R2
part 7 C 220 150 h
a 0 u 13 0 15 25 hln 100 value=@C1VAL
a 0 ap 9 0 15 0 hln 100 REFDES=C1
a 0 s 0 0 0 0 hln 100 PKGREF=C1
part 8 C 170 130 v
a 0 u 13 0 15 61 hln 100 value=@C2VAL
a 0 ap 9 0 15 0 hln 100 REFDES=C2
a 0 s 0 0 0 0 hln 100 PKGREF=C2
part 77 R 170 210 v
a 0 u 13 0 15 55 hln 100 value=@R3VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R3
a 0 s 0 0 0 0 hln 100 PKGREF=R3
@conn
w 11
s 320 190 300 190 10
s 300 190 300 210 13
w 23
s 170 150 220 150 30
s 170 130 170 150 26
s 170 150 170 170 31
s 140 150 170 150 74
w 35
s 170 210 170 270 34
w 39
s 250 150 280 150 38
s 280 150 320 150 46
s 280 150 280 130 42
w 48
s 280 90 280 80 47
s 280 80 170 80 50
s 170 80 170 100 52
s 280 80 420 80 55
s 420 80 420 170 58
s 420 170 400 170 60
s 420 170 450 170 63
w 71
s 70 150 100 150 70
@junction
j 320 190
+ p 1 +
+ w 11
j 300 210
+ s 3
+ w 11
j 170 130
+ p 8 1
+ w 23
j 170 150
+ w 23
+ w 23
j 170 270
+ s 4
+ w 35
j 320 150
+ p 1 -
+ w 39
j 280 130
+ p 6 1
+ w 39
j 280 150
+ w 39
+ w 39
j 280 90
+ p 6 2
+ w 48
j 170 100
+ p 8 2
+ w 48
j 280 80
+ w 48
+ w 48
j 400 170
+ p 1 OUT
+ w 48
j 450 170
+ s 17
+ w 48
j 420 170
+ w 48
+ w 48
j 220 150
+ p 7 1
+ w 23
j 250 150
+ p 7 2
+ w 39
j 100 150
+ p 5 1
+ w 71
j 70 150
+ s 16
+ w 71
j 140 150
+ p 5 2
+ w 23
j 170 170
+ p 77 2
+ w 23
j 170 210
+ p 77 1
+ w 35
@attributes
a 0 s 13 0 0 0 hln 100 PAGETITLE=
a 0 s 13 0 0 0 hln 100 PAGENO=1
a 0 s 13 0 0 0 hln 100 PAGESIZE=A
a 0 s 13 0 0 0 hln 100 PAGECOUNT=1
@text
s 5 360 200 hln 100 GAIN=
