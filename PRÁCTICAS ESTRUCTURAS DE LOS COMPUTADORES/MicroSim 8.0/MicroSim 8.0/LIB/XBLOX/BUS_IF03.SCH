*version 6.3 2684613459
u 75
XBLOX 926127568
U? 4
@libraries
XBLOX [.slb]
@analysis
@targets
@attributes
a FAMILY=XBLOX
a IMPL=XILINX
@translators
@index
pageloc 1 0 1465 1
@status
*page 1 0 850 1100 iX
@ports
port 76 IF_IN 140 600 h
a 0 s 3 0 10 8 hln 80 LABEL=X
port 77 IF_IN 600 600 h
a 0 s 3 0 10 8 hln 50 LABEL=B[2:0]
@parts
part 15 ELEMENT 270 600 h
a 0 sp 9 0 130 10 hrn 100 REFDES=U1
a 0 sp 11 0 80 0 hct 120 PART=ELEMENT
a 0 u 13 13 0 51 hln 70 ELEM=0
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 16 ELEMENT 270 480 h
a 0 sp 9 0 130 10 hrn 100 REFDES=U2
a 0 sp 11 0 80 0 hct 120 PART=ELEMENT
a 0 u 13 13 0 51 hln 70 ELEM=2
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 17 ELEMENT 270 540 h
a 0 sp 9 0 130 10 hrn 100 REFDES=U3
a 0 sp 11 0 80 0 hct 120 PART=ELEMENT
a 0 u 13 13 0 51 hln 70 ELEM=1
a 0 a 0 0 0 0 hln 100 PKGREF=U3
@conn
b 19
s 600 600 650 600 18
a 0 s 3 0 590 590 hln 100 LABEL=B[2:0]
b 26
s 140 600 250 600 20
a 0 s 3 0 150 590 hln 100 LABEL=X
s 250 600 270 600 21
s 250 600 250 540 22
s 250 540 250 480 23
s 250 480 270 480 24
s 250 540 270 540 25
w 52
s 420 480 540 480 51
a 0 s 3 0 440 480 hln 100 LABEL=B[2]
w 60
s 420 600 540 600 59
a 0 s 3 0 440 600 hln 100 LABEL=B[0]
w 68
s 420 540 540 540 67
a 0 s 3 0 440 540 hln 100 LABEL=B[1]
@junction
j 250 600
+ b 26
+ b 26
j 250 540
+ b 26
+ b 26
j 270 600
+ p 15 XBLOX_BUS
+ b 26
j 270 480
+ p 16 XBLOX_BUS
+ b 26
j 270 540
+ p 17 XBLOX_BUS
+ b 26
j 420 480
+ p 16 ELEM
+ w 52
j 420 600
+ p 15 ELEM
+ w 60
j 420 540
+ p 17 ELEM
+ w 68
j 140 600
+ s 76
+ b 26
j 600 600
+ S 77
B[2]
B[1]
B[0]
+ b 19
B[2]
B[1]
B[0]
@attributes
@text
s 5 742 1000 hln 100 7/21/93
s 5 630 1000 hln 100 BUS_IF03
