*version 6.3 3046504957
u 41
XC5200 83916472
U? 2
@libraries
XC5200 [.slb]
@analysis
@targets
@attributes
a FAMILY=XC5200
a IMPL=XILINX
@translators
@setup
unconnectedPins 0
connectViaLabel 1
connectViaLocalLabels 0
NoStim4ExtIFPortsWarnings 1
AutoGenStim4ExtIFPorts 1
@index
pageloc 1 0 1094 1
@status
*page 1 0 1100 850 iX
@ports
port 42 IF_IN 300 370 h
a 0 s 3 0 10 8 hln 80 LABEL=C
port 43 IF_OUT 860 330 h
a 0 s 3 0 20 8 hln 50 LABEL=OSC1
port 44 IF_OUT 860 370 h
a 0 s 3 0 20 8 hln 50 LABEL=OSC2
@parts
part 16 OSC52 520 370 h
a 0 sp 9 0 120 0 hrn 100 REFDES=U1
a 0 sp 11 0 60 20 hcn 200 PART=OSC52
a 0 u 13 13 20 120 hln 70 DIVIDE1_BY=@DIVIDE1_BY
a 0 u 13 13 20 130 hln 70 DIVIDE2_BY=@DIVIDE2_BY
a 0 u 13 13 20 110 hln 70 OSC="USER_CLK"
a 0 a 0 0 0 0 hln 100 PKGREF=U1
@conn
w 18
s 640 330 860 330 17
a 0 s 3 0 810 330 hln 100 LABEL=OSC1
w 26
s 640 370 860 370 25
a 0 s 3 0 810 370 hln 100 LABEL=OSC2
w 34
s 300 370 520 370 33
a 0 s 3 0 310 370 hln 100 LABEL=C
@junction
j 640 330
+ p 16 OSC1
+ w 18
j 640 370
+ p 16 OSC2
+ w 26
j 520 370
+ p 16 C
+ w 34
j 300 370
+ s 42
+ w 34
j 860 330
+ s 43
+ w 18
j 860 370
+ s 44
+ w 26
@attributes
@text
s 5 750 770 hln 100 CLOCK DIVIDER
s 5 750 750 hln 100 XC5200 FAMILY CK_DIV MACRO
s 5 30 820 hln 100 COPYRIGHT (C) 1994, XILINX INC.
s 5 30 810 hln 100 DRAWN BY KS
s 5 950 800 hln 100 1
s 5 950 820 hln 100 A
s 5 710 800 hln 100 13TH OCTOBER 1994
