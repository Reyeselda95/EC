*version 6.3 895311990
u 54
XC5200 574324178
U? 3
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
pageloc 1 0 1226 1
@status
*page 1 0 1100 850 iX
@ports
port 55 IF_OUT 620 320 h
a 0 s 3 0 20 8 hln 50 LABEL=COUT
port 56 IF_IN 390 490 h
a 0 s 3 0 10 8 hln 50 LABEL=INIT
@parts
part 17 CY_MUX 480 390 h
a 0 sp 9 0 100 0 hrn 100 REFDES=U1
a 0 sp 11 0 20 32 hln 100 PART=CY_MUX
a 0 u 13 13 -50 10 hln 100 RLOC=R0C0
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 20 GND 450 420 h
a 0 sp 0 0 40 0 hrn 100 REFDES=U2
a 0 sp 11 0 5 40 hln 100 PART=GND
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
w 23
s 530 320 620 320 21
a 0 s 3 0 570 320 hln 100 LABEL=COUT
s 530 350 530 320 22
w 32
s 450 390 480 390 30
s 450 420 450 390 31
w 47
s 390 490 520 490 45
a 0 s 3 0 400 490 hln 100 LABEL=INIT
s 520 490 520 420 46
@junction
j 530 350
+ p 17 CO
+ w 23
j 480 390
+ p 17 S
+ w 32
j 450 420
+ p 20 GROUND
+ w 32
j 520 420
+ p 17 DI
+ w 47
j 620 320
+ s 55
+ w 23
j 390 490
+ s 56
+ w 47
@attributes
@text
s 5 750 770 hln 100 INITIALIZATION FOR CY_MUX
s 5 750 750 hln 100 XC5200 FAMILY CY_INIT MACRO
s 5 610 350 hln 100 THE SELECT LINE IS FORCED LOW
s 5 610 370 hln 100 SO AS TO FORCE THE 'INIT' SIGNAL
s 5 610 390 hln 100 EITHER HIGH OR LOW AND THEREBY
s 5 610 410 hln 100 INITIALIZE THE CARRY CHAIN
s 5 950 820 hln 100 A
s 5 950 800 hln 100 1
s 5 710 800 hln 100 17TH DECEMBER 1993
