*version 6.0 590792000
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
u 154
EAMP? 4
C? 3
R? 8
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
pageloc 1 0 4399 
@status
c 68:00:01:00:00:00;0
c 91:00:06:23:28:20;726362900
c 91:00:06:23:35:42;726363342
c 91:00:07:17:42:48;726428568
c 93:11:02:13:24:42;817997082
*page 1 0 970 720 iA
@ports
port 12 INTERFACE 60 250 h
a 1 s 3 0 19 8 hcn 100 LABEL=IN
port 13 INTERFACE 650 80 u
a 1 s 3 0 19 8 hcn 100 LABEL=OUT
port 72 AGND 290 220 h
port 74 AGND 470 240 h
@parts
part 1 EAMP 150 190 U
a 0 u 13 0 102 16 hln 100 GAIN=10000
a 0 s 0 0 36 68 hln 100 PART=EAMP
a 1 xp 9 0 44 44 hln 100 REFDES=EAMP1
a 0 s 0 0 0 0 hln 100 PKGREF=EAMP1
part 2 EAMP 310 210 U
a 0 u 13 0 82 16 hln 100 GAIN=10000
a 0 s 0 0 36 68 hln 100 PART=EAMP
a 1 xp 9 0 48 46 hln 100 REFDES=EAMP2
a 0 s 0 0 0 0 hln 100 PKGREF=EAMP2
part 3 EAMP 490 230 U
a 0 u 13 0 92 16 hln 100 GAIN=10000
a 0 s 0 0 36 68 hln 100 PART=EAMP
a 1 xp 9 0 44 44 hln 100 REFDES=EAMP3
a 0 s 0 0 0 0 hln 100 PKGREF=EAMP3
part 4 C 330 110 h
a 0 u 13 0 15 25 hln 100 value=@C1VAL
a 0 ap 9 0 15 0 hln 100 REFDES=C1
a 0 s 0 0 0 0 hln 100 PKGREF=C1
part 5 C 520 120 h
a 0 u 13 0 15 25 hln 100 value=@C2VAL
a 0 ap 9 0 15 0 hln 100 REFDES=C2
a 0 s 0 0 0 0 hln 100 PKGREF=C2
part 6 R 250 170 h
a 0 u 13 0 15 25 hln 100 value=@R1VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R1
a 0 s 0 0 0 0 hln 100 PKGREF=R1
part 7 R 430 190 h
a 0 u 13 0 15 25 hln 100 value=@R2VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R2
a 0 s 0 0 0 0 hln 100 PKGREF=R2
part 8 R 70 250 h
a 0 u 13 0 15 25 hln 100 value=@R3VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R3
a 0 s 0 0 0 0 hln 100 PKGREF=R3
part 9 R 220 250 h
a 0 u 13 0 15 25 hln 100 value=@R4VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R4
a 0 s 0 0 0 0 hln 100 PKGREF=R4
part 10 R 90 150 h
a 0 u 13 0 15 25 hln 100 value=@R5VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R5
a 0 s 0 0 0 0 hln 100 PKGREF=R5
part 11 R 160 80 h
a 0 u 13 0 15 25 hln 100 value=@R6VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R6
a 0 s 0 0 0 0 hln 100 PKGREF=R6
part 126 R 600 80 h
a 0 u 13 0 15 25 hln 100 value=1
a 0 xp 9 0 15 0 hln 100 REFDES=RX
a 0 s 0 0 0 0 hln 100 PKGREF=RX
@conn
w 15
s 60 250 70 250 14
w 19
a 0 s 0 0 122 220 hln 100 LABEL=N4
s 120 250 120 190 21
a 0 s 3 0 102 220 hln 100 LABEL=N4
s 110 250 120 250 18
s 120 190 150 190 23
s 120 250 220 250 26
w 30
a 0 s 0 0 142 115 hln 100 LABEL=N1
s 140 80 140 150 47
a 0 s 3 0 122 115 hln 100 LABEL=N1
s 150 150 140 150 29
s 160 80 140 80 44
s 140 150 130 150 50
w 34
a 0 s 0 0 220 78 hln 100 LABEL=A1
s 240 80 200 80 41
a 0 s 3 0 220 78 hln 100 LABEL=A1
s 230 170 240 170 33
s 240 170 250 170 40
s 240 170 240 80 37
s 240 80 600 80 146
w 54
a 0 s 0 0 390 108 hln 100 LABEL=A2
s 360 110 420 110 102
a 0 s 3 0 390 108 hln 100 LABEL=A2
s 260 250 410 250 53
s 410 250 410 190 56
s 410 190 390 190 58
s 410 190 420 190 81
s 420 190 430 190 108
s 420 110 420 190 105
w 63
s 290 220 290 210 62
s 290 210 310 210 65
w 69
a 0 s 0 0 302 140 hln 100 LABEL=N2
s 300 170 300 110 95
a 0 s 3 0 284 126 hln 100 LABEL=N2
s 290 170 300 170 68
s 300 170 310 170 98
s 300 110 330 110 99
w 86
a 0 s 0 0 482 155 hln 100 LABEL=N3
s 480 190 480 120 109
a 0 s 3 0 486 113 hln 100 LABEL=N3
s 470 190 480 190 85
s 480 190 490 190 112
s 480 120 520 120 113
w 90
s 470 240 470 230 89
s 470 230 490 230 92
w 117
s 550 120 580 120 116
s 580 120 580 210 119
s 570 210 580 210 121
s 90 150 80 150 132
s 80 150 80 30 135
s 80 30 580 30 137
s 580 30 580 120 139
w 150
s 640 80 650 80 149
@junction
j 70 250
+ p 8 1
+ w 15
j 60 250
+ s 12
+ w 15
j 110 250
+ p 8 2
+ w 19
j 150 190
+ p 1 +
+ w 19
j 120 250
+ w 19
+ w 19
j 150 150
+ p 1 -
+ w 30
j 130 150
+ p 10 2
+ w 30
j 230 170
+ p 1 OUT
+ w 34
j 250 170
+ p 6 1
+ w 34
j 240 170
+ w 34
+ w 34
j 200 80
+ p 11 2
+ w 34
j 160 80
+ p 11 1
+ w 30
j 140 150
+ w 30
+ w 30
j 220 250
+ p 9 1
+ w 19
j 260 250
+ p 9 2
+ w 54
j 390 190
+ p 2 OUT
+ w 54
j 310 210
+ p 2 +
+ w 63
j 310 170
+ p 2 -
+ w 69
j 290 170
+ p 6 2
+ w 69
j 290 220
+ s 72
+ w 63
j 430 190
+ p 7 1
+ w 54
j 410 190
+ w 54
+ w 54
j 490 190
+ p 3 -
+ w 86
j 470 190
+ p 7 2
+ w 86
j 470 240
+ s 74
+ w 90
j 490 230
+ p 3 +
+ w 90
j 300 170
+ w 69
+ w 69
j 330 110
+ p 4 1
+ w 69
j 360 110
+ p 4 2
+ w 54
j 420 190
+ w 54
+ w 54
j 480 190
+ w 86
+ w 86
j 520 120
+ p 5 1
+ w 86
j 550 120
+ p 5 2
+ w 117
j 570 210
+ p 3 OUT
+ w 117
j 90 150
+ p 10 1
+ w 117
j 580 30
+ w 117
+ w 117
j 580 120
+ w 117
+ w 117
j 240 80
+ w 34
+ w 34
j 640 80
+ p 126 2
+ w 150
j 650 80
+ s 13
+ w 150
j 600 80
+ p 126 1
+ w 34
@attributes
a 0 s 13 0 0 0 hln 100 PAGETITLE=
a 0 s 13 0 0 0 hln 100 PAGENO=1
a 0 s 13 0 0 0 hln 100 PAGESIZE=A
a 0 s 13 0 0 0 hln 100 PAGECOUNT=1
@text
s 5 190 200 hln 100 GAIN=
s 5 330 220 hln 100 GAIN=
s 5 520 240 hln 100 GAIN=
