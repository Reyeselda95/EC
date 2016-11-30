*version 6.3 187700811
u 32
XC5200 2679874671
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
pageloc 1 0 769 1
@status
*page 1 0 1100 850 iX
@ports
port 33 IF_IN 300 390 h
a 0 s 3 0 10 8 hln 80 LABEL=I
port 34 IF_OUT 770 390 h
a 0 s 3 0 20 8 hln 80 LABEL=O
@parts
part 15 BUFG 500 390 h
a 0 sp 9 0 70 0 hrn 100 REFDES=U1
a 0 sp 11 0 30 14 hlt 100 PART=BUFG
a 0 a 0 0 0 0 hln 100 PKGREF=U1
@conn
w 17
s 570 390 770 390 16
a 0 s 3 0 750 390 hln 100 LABEL=O
w 25
s 300 390 500 390 24
a 0 s 3 0 310 390 hln 100 LABEL=I
@junction
j 570 390
+ p 15 O
+ w 17
j 500 390
+ p 15 I
+ w 25
j 300 390
+ s 33
+ w 25
j 770 390
+ s 34
+ w 17
@attributes
@text
s 5 1000 750 hrn 100 XC5200 FAMILY BUFGS MACRO
s 5 880 770 hrn 100 GLOBAL BUFFER
s 5 30 810 hln 100 DRAWN BY KS
s 5 960 800 hrn 100 1
s 5 950 820 hln 100 A
s 5 880 800 hrn 100 25TH JANUARY 1994
s 5 30 820 hln 100 COPYRIGHT (C) 1994, XILINX INC.
