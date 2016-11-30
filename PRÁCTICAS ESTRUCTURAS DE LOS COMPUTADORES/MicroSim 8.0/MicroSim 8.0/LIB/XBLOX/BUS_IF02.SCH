*version 6.3 1344491310
u 56
XBLOX 777589470
U? 3
@libraries
XBLOX [.slb]
@analysis
@targets
@attributes
a FAMILY=XBLOX
a IMPL=XILINX
@translators
@index
pageloc 1 0 1100 1
@status
*page 1 0 850 1100 iX
@ports
port 57 IF_IN 140 600 h
a 0 s 3 0 10 8 hln 80 LABEL=X
port 58 IF_IN 600 600 h
a 0 s 3 0 10 8 hln 50 LABEL=B[1:0]
@parts
part 15 ELEMENT 270 540 h
a 0 sp 9 0 130 10 hrn 100 REFDES=U1
a 0 sp 11 0 80 0 hct 120 PART=ELEMENT
a 0 u 13 13 0 51 hln 70 ELEM=1
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 16 ELEMENT 270 600 h
a 0 sp 9 0 130 10 hrn 100 REFDES=U2
a 0 sp 11 0 80 0 hct 120 PART=ELEMENT
a 0 u 13 13 0 51 hln 70 ELEM=0
a 0 a 0 0 0 0 hln 100 PKGREF=U2
@conn
b 18
s 600 600 650 600 17
a 0 s 3 0 590 590 hln 100 LABEL=B[1:0]
b 23
s 140 600 250 600 19
a 0 s 3 0 150 590 hln 100 LABEL=X
s 250 600 250 540 21
s 250 540 270 540 20
s 250 600 270 600 22
w 41
s 420 600 540 600 40
a 0 s 3 0 440 600 hln 100 LABEL=B[0]
w 49
s 420 540 540 540 48
a 0 s 3 0 440 540 hln 100 LABEL=B[1]
@junction
j 250 600
+ b 23
+ b 23
j 270 540
+ p 15 XBLOX_BUS
+ b 23
j 270 600
+ p 16 XBLOX_BUS
+ b 23
j 420 600
+ p 16 ELEM
+ w 41
j 420 540
+ p 15 ELEM
+ w 49
j 140 600
+ s 57
+ b 23
j 600 600
+ S 58
B[1]
B[0]
+ b 18
B[1]
B[0]
@attributes
@text
s 5 630 1000 hln 100 BUS_IF02
s 5 741 1000 hln 100 7/21/93
