*version 6.0 3319419697
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
lib C:\MSIM60\EXAMPLES\FRQCHK\frqchkx.slb 3350850013
u 90
U? 2
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
pageloc 1 0 1526 
@status
c 93:11:03:09:33:56;818069636
*page 1 0 800 400 iX
@ports
port 1 interface 50 90 D
a 1 s 3 0 13 -22 hcn 100 LABEL=P11
port 2 interface 120 90 D
a 1 s 3 0 13 -22 hcn 100 LABEL=P21
port 3 interface 190 90 D
a 1 s 3 0 15 -22 hcn 100 LABEL=P31
port 4 interface 70 90 D
a 1 s 3 0 29 10 hcn 100 LABEL=S11
port 5 interface 140 90 D
a 1 s 3 0 29 10 hcn 100 LABEL=S21
port 6 interface 210 90 D
a 1 s 3 0 27 12 hcn 100 LABEL=S31
port 78 global 50 150 v
a 14 s 3 0 -5 14 hcn 100 LABEL=P2
port 80 global 120 150 v
a 14 s 3 0 -5 14 hcn 100 LABEL=P2
port 82 global 190 150 v
a 14 s 3 0 -5 12 hcn 100 LABEL=P2
port 84 global 70 150 v
a 14 s 3 0 -5 12 hcn 100 LABEL=S2
port 86 global 140 150 v
a 14 s 3 0 -5 12 hcn 100 LABEL=S2
port 88 global 210 150 v
a 14 s 3 0 -5 12 hcn 100 LABEL=S2
@parts
part 7 3phase 50 90 h
a 0 s 11 0 172 68 hln 100 PART=3phase
a 0 xp 9 0 172 18 hln 100 REFDES=U1
a 0 s 0 0 0 0 hln 100 PKGREF=U1
part 0 titleblk 800 400 h
a 1 s 13 0 350 10 hcn 100 PageSize=1
a 1 s 13 0 180 60 hcn 100 PageTitle=
a 1 s 13 0 300 95 hrn 100 PageNO=1
a 1 s 13 0 340 95 hrn 100 PageCount=1
@conn
@junction
j 50 90
+ p 7 P11
+ s 1
j 120 90
+ p 7 P21
+ s 2
j 190 90
+ p 7 P31
+ s 3
j 70 90
+ p 7 S11
+ s 4
j 140 90
+ p 7 S21
+ s 5
j 210 90
+ p 7 S31
+ s 6
j 50 150
+ s 78
+ p 7 P12
j 120 150
+ s 80
+ p 7 P22
j 190 150
+ s 82
+ p 7 P32
j 70 150
+ s 84
+ p 7 S12
j 140 150
+ s 86
+ p 7 S22
j 210 150
+ s 88
+ p 7 S32
@attributes
a 0 s 13 0 0 0 hln 100 PAGETITLE=
a 0 s 13 0 0 0 hln 100 PAGENO=1
a 0 s 13 0 0 0 hln 100 PAGESIZE=1
a 0 s 13 0 0 0 hln 100 PAGECOUNT=1
@text
