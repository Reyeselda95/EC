*version 6.3 1349287190
u 79
XC3000 927141666
U? 4
@libraries
XC3000 [.slb]
@analysis
@targets
@attributes
a FAMILY=XC3000
a IMPL=XILINX
@translators
@index
pageloc 1 0 1382 1
@status
*page 1 0 1100 850 iX
@ports
port 80 IF_OUT 810 340 h
a 0 s 3 0 20 8 hln 80 LABEL=Q
port 81 IF_IN 250 340 h
a 0 s 3 0 10 8 hln 80 LABEL=D
port 82 IF_IN 250 380 h
a 0 s 3 0 10 8 hln 80 LABEL=C
@parts
part 18 FDCE 470 340 h
a 0 sp 9 0 120 0 hrn 100 REFDES=U1
a 0 sp 11 0 60 20 hcn 200 PART=FDCE
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 21 GND 440 440 h
a 0 sp 0 0 40 0 hrn 100 REFDES=U2
a 0 sp 11 0 5 40 hln 100 PART=GND
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 24 VCC 440 320 h
a 0 sp 0 0 40 0 hrn 100 REFDES=U3
a 0 sp 11 0 20 10 hcn 100 PART=VCC
a 0 a 0 0 0 0 hln 100 PKGREF=U3
@conn
w 27
s 440 410 470 410 25
s 440 440 440 410 26
w 42
s 440 360 440 320 40
s 440 360 470 360 41
w 56
s 590 340 810 340 55
a 0 s 3 0 790 340 hln 100 LABEL=Q
w 64
s 250 380 470 380 63
a 0 s 3 0 260 380 hln 100 LABEL=C
w 72
s 250 340 470 340 71
a 0 s 3 0 260 340 hln 100 LABEL=D
@junction
j 470 410
+ p 18 CLR
+ w 27
j 440 440
+ p 21 GROUND
+ w 27
j 470 360
+ p 18 CE
+ w 42
j 440 320
+ p 24 VCC
+ w 42
j 590 340
+ p 18 Q
+ w 56
j 470 380
+ p 18 C
+ w 64
j 470 340
+ p 18 D
+ w 72
j 810 340
+ s 80
+ w 56
j 250 340
+ s 81
+ w 72
j 250 380
+ s 82
+ w 64
@attributes
@text
s 5 750 770 hln 100 D FLIP-FLOP
s 5 750 750 hln 100 XC3000 FAMILY FD MACRO
s 5 710 800 hln 100 23RD DECEMBER 1992
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
s 5 30 820 hln 100 COPYRIGHT (C) 1993, XILINX INC.
s 5 30 810 hln 100 DRAWN BY KS
