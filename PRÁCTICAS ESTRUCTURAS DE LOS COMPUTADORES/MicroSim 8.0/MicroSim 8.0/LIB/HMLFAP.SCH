*version 6.0 719704630
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
u 71
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
pageloc 1 0 2534 
@status
c 68:00:01:00:00:00;0
c 91:00:06:23:44:25;726363865
c 91:00:07:19:16:53;726434213
c 93:11:02:14:00:35;817999235
*page 1 0 970 720 iA
@ports
port 7 INTERFACE 90 150 h
a 1 s 3 0 19 8 hcn 100 LABEL=IN
port 8 INTERFACE 420 170 u
a 1 s 3 0 19 8 hcn 100 LABEL=OUT
port 42 AGND 190 260 h
@parts
part 1 R 110 150 h
a 0 u 13 0 15 25 hln 100 value=@R1VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R1
a 0 s 0 0 0 0 hln 100 PKGREF=R1
part 2 R 280 130 v
a 0 u 13 0 15 61 hln 100 value=@R2VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R2
a 0 s 0 0 0 0 hln 100 PKGREF=R2
part 3 R 110 190 h
a 0 u 13 0 15 25 hln 100 value=@R3VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R3
a 0 s 0 0 0 0 hln 100 PKGREF=R3
part 4 R 190 240 v
a 0 u 13 0 17 61 hln 100 value=@R4VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R4
a 0 s 0 0 0 0 hln 100 PKGREF=R4
part 5 C 220 150 h
a 0 u 13 0 15 25 hln 100 value=@C1VAL
a 0 ap 9 0 15 0 hln 100 REFDES=C1
a 0 s 0 0 0 0 hln 100 PKGREF=C1
part 6 C 190 130 v
a 0 u 13 0 15 61 hln 100 value=@C2VAL
a 0 ap 9 0 15 0 hln 100 REFDES=C2
a 0 s 0 0 0 0 hln 100 PKGREF=C2
part 9 EAMP 320 190 U
a 0 u 13 0 90 16 hln 100 GAIN=10000
a 0 s 0 0 36 68 hln 100 PART=EAMP
a 1 xp 9 0 70 68 hln 100 REFDES=EAMP1
a 0 s 0 0 0 0 hln 100 PKGREF=EAMP1
@conn
w 11
s 400 170 410 170 10
s 190 100 190 80 52
s 190 80 280 80 55
s 280 80 280 90 57
s 280 80 410 80 66
s 410 170 420 170 70
s 410 80 410 170 68
w 15
s 90 150 100 150 14
s 100 150 110 150 21
s 100 150 100 190 18
s 100 190 110 190 22
w 26
a 0 s 0 0 170 148 hln 100 LABEL=N1
s 150 150 190 150 25
a 0 s 3 0 170 148 hln 100 LABEL=N1
s 190 150 220 150 51
s 190 150 190 130 47
w 30
a 0 s 0 0 265 148 hln 100 LABEL=N2
s 250 150 280 150 29
a 0 s 3 0 257 148 hln 100 LABEL=N2
s 280 150 320 150 64
s 280 130 280 150 60
w 34
a 0 s 0 0 170 188 hln 100 LABEL=N3
s 150 190 190 190 33
a 0 s 3 0 170 188 hln 100 LABEL=N3
s 190 190 320 190 41
s 190 200 190 190 37
w 44
s 190 240 190 260 43
@junction
j 400 170
+ p 9 OUT
+ w 11
j 420 170
+ s 8
+ w 11
j 110 150
+ p 1 1
+ w 15
j 90 150
+ s 7
+ w 15
j 100 150
+ w 15
+ w 15
j 110 190
+ p 3 1
+ w 15
j 150 150
+ p 1 2
+ w 26
j 220 150
+ p 5 1
+ w 26
j 250 150
+ p 5 2
+ w 30
j 320 150
+ p 9 -
+ w 30
j 150 190
+ p 3 2
+ w 34
j 320 190
+ p 9 +
+ w 34
j 190 200
+ p 4 2
+ w 34
j 190 190
+ w 34
+ w 34
j 190 240
+ p 4 1
+ w 44
j 190 260
+ s 42
+ w 44
j 190 130
+ p 6 1
+ w 26
j 190 150
+ w 26
+ w 26
j 190 100
+ p 6 2
+ w 11
j 280 90
+ p 2 2
+ w 11
j 280 130
+ p 2 1
+ w 30
j 280 150
+ w 30
+ w 30
j 280 80
+ w 11
+ w 11
j 410 170
+ w 11
+ w 11
@attributes
a 0 s 13 0 0 0 hln 100 PAGETITLE=
a 0 s 13 0 0 0 hln 100 PAGENO=1
a 0 s 13 0 0 0 hln 100 PAGESIZE=A
a 0 s 13 0 0 0 hln 100 PAGECOUNT=1
@text
s 5 350 200 hln 100 GAIN=
