*version 6.0 829914282
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
u 83
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
pageloc 1 0 2569 
@status
c 68:00:01:00:00:00;0
c 91:00:06:23:42:17;726363737
c 93:11:02:13:59:20;817999160
*page 1 0 970 720 iA
@ports
port 1 AGND 240 260 h
port 2 AGND 320 310 h
port 11 INTERFACE 80 150 h
a 1 s 3 0 19 8 hcn 100 LABEL=IN
port 12 INTERFACE 460 170 u
a 1 s 3 0 19 8 hcn 100 LABEL=OUT
@parts
part 3 R 240 100 h
a 0 u 13 0 15 25 hln 100 value=@R1VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R1
a 0 s 0 0 0 0 hln 100 PKGREF=R1
part 4 R 240 230 v
a 0 u 13 0 15 59 hln 100 value=@R2VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R2
a 0 s 0 0 0 0 hln 100 PKGREF=R2
part 5 R 320 300 v
a 0 u 13 0 15 59 hln 100 value=@R3VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R3
a 0 s 0 0 0 0 hln 100 PKGREF=R3
part 6 R 340 250 h
a 0 u 13 0 15 25 hln 100 value=@R4VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R4
a 0 s 0 0 0 0 hln 100 PKGREF=R4
part 7 C 100 150 h
a 0 u 13 0 15 25 hln 100 value=@C1VAL
a 0 ap 9 0 15 0 hln 100 REFDES=C1
a 0 s 0 0 0 0 hln 100 PKGREF=C1
part 8 C 160 150 h
a 0 u 13 0 15 25 hln 100 value=@C2VAL
a 0 ap 9 0 15 0 hln 100 REFDES=C2
a 0 s 0 0 0 0 hln 100 PKGREF=C2
part 9 EAMP 340 150 h
a 0 u 13 0 64 70 hln 100 GAIN=10000
a 0 s 0 0 36 68 hln 100 PART=EAMP
a 1 xp 9 0 10 8 hln 100 REFDES=EAMP1
a 0 s 0 0 0 0 hln 100 PKGREF=EAMP1
@conn
w 14
s 420 170 440 170 13
s 380 250 450 250 17
s 450 170 460 170 23
s 450 250 450 170 20
s 280 100 440 100 40
s 440 170 450 170 46
s 440 100 440 170 43
w 25
s 320 310 320 300 24
w 29
a 0 s 0 0 322 220 hln 100 LABEL=N3
s 320 250 320 190 34
a 0 s 3 0 302 218 hln 100 LABEL=N3
s 320 260 320 250 28
s 320 250 340 250 31
s 320 190 340 190 37
w 56
s 80 150 100 150 55
w 60
a 0 s 0 0 195 98 hln 100 LABEL=N1
s 240 100 150 100 76
a 0 s 3 0 195 98 hln 100 LABEL=N1
s 130 150 150 150 59
s 150 150 160 150 82
s 150 100 150 150 79
w 64
a 0 s 0 0 215 148 hln 100 LABEL=N2
s 190 150 240 150 63
a 0 s 3 0 215 148 hln 100 LABEL=N2
s 240 150 340 150 71
s 240 150 240 190 67
w 73
s 240 230 240 260 72
@junction
j 420 170
+ p 9 OUT
+ w 14
j 460 170
+ s 12
+ w 14
j 380 250
+ p 6 2
+ w 14
j 450 170
+ w 14
+ w 14
j 320 300
+ p 5 1
+ w 25
j 320 310
+ s 2
+ w 25
j 320 260
+ p 5 2
+ w 29
j 340 250
+ p 6 1
+ w 29
j 320 250
+ w 29
+ w 29
j 340 190
+ p 9 -
+ w 29
j 280 100
+ p 3 2
+ w 14
j 440 170
+ w 14
+ w 14
j 100 150
+ p 7 1
+ w 56
j 80 150
+ s 11
+ w 56
j 130 150
+ p 7 2
+ w 60
j 160 150
+ p 8 1
+ w 60
j 190 150
+ p 8 2
+ w 64
j 340 150
+ p 9 +
+ w 64
j 240 190
+ p 4 2
+ w 64
j 240 150
+ w 64
+ w 64
j 240 230
+ p 4 1
+ w 73
j 240 260
+ s 1
+ w 73
j 240 100
+ p 3 1
+ w 60
j 150 150
+ w 60
+ w 60
@attributes
a 0 s 13 0 0 0 hln 100 PAGETITLE=
a 0 s 13 0 0 0 hln 100 PAGENO=1
a 0 s 13 0 0 0 hln 100 PAGESIZE=A
a 0 s 13 0 0 0 hln 100 PAGECOUNT=1
@text
s 5 370 200 hln 100 GAIN=
