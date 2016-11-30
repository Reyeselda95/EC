*version 6.0 999082547
lib C:\MSIM60\LIB\MAGNETIC.slb 3110767113
lib C:\MSIM60\LIB\jeffs.slb 1026840983
lib C:\MSIM60\LIB\abm.slb 215270066
lib C:\MSIM60\LIB\adv_lin.slb 0
lib C:\MSIM60\LIB\analog.slb 369984918
lib C:\MSIM60\LIB\anlg_dev.slb 3400865847
lib C:\MSIM60\LIB\apex.slb 0
lib C:\MSIM60\LIB\bipolar.slb 355819204
lib C:\MSIM60\LIB\breakout.slb 2177354797
lib C:\MSIM60\LIB\burr_brn.slb 0
lib C:\MSIM60\LIB\cd4000.slb 3865315825
lib C:\MSIM60\LIB\comlinr.slb 247273465
lib C:\MSIM60\LIB\connect.slb 30686778
lib C:\MSIM60\LIB\dig_1.slb 83399735
lib C:\MSIM60\LIB\dig_2.slb 969175561
lib C:\MSIM60\LIB\dig_3.slb 0
lib C:\MSIM60\LIB\dig_4.slb 60154586
lib C:\MSIM60\LIB\dig_ecl.slb 0
lib C:\MSIM60\LIB\dig_gal.slb 0
lib C:\MSIM60\LIB\dig_misc.slb 0
lib C:\MSIM60\LIB\dig_pal.slb 39300
lib C:\MSIM60\LIB\dig_prim.slb 41804
lib C:\MSIM60\LIB\diode.slb 168510880
lib C:\MSIM60\LIB\elantec.slb 0
lib C:\MSIM60\LIB\filtsub.slb 54713
lib C:\MSIM60\LIB\harris.slb 0
lib C:\MSIM60\LIB\jfet.slb 2147968631
lib C:\MSIM60\LIB\lin_tech.slb 0
lib C:\MSIM60\LIB\misc.slb 39993989
lib C:\MSIM60\LIB\motoramp.slb 0
lib C:\MSIM60\LIB\motormos.slb 0
lib C:\MSIM60\LIB\motor_rf.slb 685727686
lib C:\MSIM60\LIB\nat_semi.slb 0
lib C:\MSIM60\LIB\opamp.slb 2646229813
lib C:\MSIM60\LIB\opto.slb 0
lib C:\MSIM60\LIB\polyfet.slb 0
lib C:\MSIM60\LIB\port.slb 829386875
lib C:\MSIM60\LIB\pwrbjt.slb 313931602
lib C:\MSIM60\LIB\pwrmos.slb 285435544
lib C:\MSIM60\LIB\source.slb 3966435359
lib C:\MSIM60\LIB\special.slb 783116903
lib C:\MSIM60\LIB\swit_rav.slb 0
lib C:\MSIM60\LIB\swit_reg.slb 901016876
lib C:\MSIM60\LIB\tex_inst.slb 0
lib C:\MSIM60\LIB\thyristr.slb 10006698
lib C:\MSIM60\LIB\tline.slb 2432855345
lib C:\MSIM60\LIB\xtal.slb 0
lib C:\MSIM60\LIB\user.slb 243569444
u 70
R? 4
C? 3
EAMP? 2
@libraries
@analysis
@targets
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
pageloc 1 0 2221 
@status
c 94:05:28:13:36:04;835968964
*page 1 0 970 720 iA
@ports
port 7 AGND 160 230 h
port 8 INTERFACE 80 150 h
a 1 s 3 0 19 8 hcn 100 LABEL=IN
port 9 INTERFACE 420 170 u
a 1 s 3 0 19 8 hcn 100 LABEL=OUT
port 55 AGND 280 210 h
@parts
part 1 R 100 150 h
a 0 u 13 0 15 25 hln 100 value=@R1VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R1
a 0 s 0 0 0 0 hln 100 PKGREF=R1
part 2 R 160 130 v
a 0 u 13 0 17 63 hln 100 value=@R2VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R2
a 0 s 0 0 0 0 hln 100 PKGREF=R2
part 3 R 220 150 h
a 0 u 13 0 15 25 hln 100 value=@R3VAL
a 0 ap 9 0 15 0 hln 100 REFDES=R3
a 0 s 0 0 0 0 hln 100 PKGREF=R3
part 4 C 160 200 v
a 0 u 13 0 11 63 hln 100 value=@C1VAL
a 0 ap 9 0 15 0 hln 100 REFDES=C1
a 0 s 0 0 0 0 hln 100 PKGREF=C1
part 5 C 280 120 v
a 0 u 13 0 9 58 hln 100 value=@C2VAL
a 0 ap 9 0 15 0 hln 100 REFDES=C2
a 0 s 0 0 0 0 hln 100 PKGREF=C2
part 6 EAMP 300 190 U
a 0 u 13 0 56 70 hln 100 GAIN=10000
a 0 s 0 0 36 68 hln 100 PART=EAMP
a 1 xp 9 0 21 6 hln 100 REFDES=EAMP1
a 0 s 0 0 0 0 hln 100 PKGREF=EAMP1
@conn
w 12
a 0 s 0 0 270 148 hln 100 LABEL=N2
s 260 150 280 150 11
a 0 s 3 0 260 146 hln 100 LABEL=N2
s 280 150 300 150 19
s 280 150 280 120 15
w 21
s 380 170 390 170 20
s 160 90 160 80 24
s 160 80 280 80 27
s 280 80 280 90 29
s 280 80 390 80 65
s 390 170 420 170 69
s 390 80 390 170 67
w 33
a 0 s 0 0 150 148 hln 100 LABEL=N1
s 160 150 140 150 38
a 0 s 3 0 142 146 hln 100 LABEL=N1
s 160 130 160 150 32
s 160 150 220 150 35
s 160 150 160 170 46
w 43
s 80 150 100 150 42
w 52
s 160 200 160 230 51
w 60
s 300 190 280 190 59
s 280 190 280 210 62
@junction
j 260 150
+ p 3 2
+ w 12
j 280 120
+ p 5 1
+ w 12
j 280 150
+ w 12
+ w 12
j 420 170
+ s 9
+ w 21
j 160 90
+ p 2 2
+ w 21
j 280 90
+ p 5 2
+ w 21
j 160 130
+ p 2 1
+ w 33
j 220 150
+ p 3 1
+ w 33
j 160 150
+ w 33
+ w 33
j 140 150
+ p 1 2
+ w 33
j 100 150
+ p 1 1
+ w 43
j 80 150
+ s 8
+ w 43
j 160 170
+ p 4 2
+ w 33
j 160 200
+ p 4 1
+ w 52
j 160 230
+ s 7
+ w 52
j 280 210
+ s 55
+ w 60
j 280 80
+ w 21
+ w 21
j 390 170
+ w 21
+ w 21
j 300 150
+ p 6 -
+ w 12
j 380 170
+ p 6 OUT
+ w 21
j 300 190
+ p 6 +
+ w 60
@attributes
a 0 s 13 0 0 0 hln 100 PAGETITLE=
a 0 s 13 0 0 0 hln 100 PAGENO=1
a 0 s 13 0 0 0 hln 100 PAGESIZE=A
a 0 s 13 0 0 0 hln 100 PAGECOUNT=1
@text
s 5 350 190 hln 100 GAIN=
