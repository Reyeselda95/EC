*version 6.3 1789461280
u 136
XBLOX 2317052673
U? 7
@libraries
XBLOX [.slb]
@analysis
@targets
@attributes
a FAMILY=XBLOX
a IMPL=XILINX
@translators
@index
pageloc 1 0 2576 1
@status
*page 1 0 850 1100 iX
@ports
port 137 IF_IN 140 600 h
a 0 s 3 0 10 8 hln 80 LABEL=X
port 138 IF_IN 600 600 h
a 0 s 3 0 10 8 hln 50 LABEL=B[5:0]
@parts
part 15 ELEMENT 270 300 h
a 0 sp 9 0 130 10 hrn 100 REFDES=U1
a 0 sp 11 0 80 0 hct 120 PART=ELEMENT
a 0 u 13 13 0 51 hln 70 ELEM=5
a 0 a 0 0 0 0 hln 100 PKGREF=U1
part 16 ELEMENT 270 360 h
a 0 sp 9 0 130 10 hrn 100 REFDES=U2
a 0 sp 11 0 80 0 hct 120 PART=ELEMENT
a 0 u 13 13 0 51 hln 70 ELEM=4
a 0 a 0 0 0 0 hln 100 PKGREF=U2
part 17 ELEMENT 270 420 h
a 0 sp 9 0 130 10 hrn 100 REFDES=U3
a 0 sp 11 0 80 0 hct 120 PART=ELEMENT
a 0 u 13 13 0 51 hln 70 ELEM=3
a 0 a 0 0 0 0 hln 100 PKGREF=U3
part 18 ELEMENT 270 540 h
a 0 sp 9 0 130 10 hrn 100 REFDES=U4
a 0 sp 11 0 80 0 hct 120 PART=ELEMENT
a 0 u 13 13 0 51 hln 70 ELEM=1
a 0 a 0 0 0 0 hln 100 PKGREF=U4
part 19 ELEMENT 270 600 h
a 0 sp 9 0 130 10 hrn 100 REFDES=U5
a 0 sp 11 0 80 0 hct 120 PART=ELEMENT
a 0 u 13 13 0 51 hln 70 ELEM=0
a 0 a 0 0 0 0 hln 100 PKGREF=U5
part 20 ELEMENT 270 480 h
a 0 sp 9 0 130 10 hrn 100 REFDES=U6
a 0 sp 11 0 80 0 hct 120 PART=ELEMENT
a 0 u 13 13 0 51 hln 70 ELEM=2
a 0 a 0 0 0 0 hln 100 PKGREF=U6
@conn
b 22
s 600 600 650 600 21
a 0 s 3 0 590 590 hln 100 LABEL=B[5:0]
b 35
s 140 600 250 600 23
a 0 s 3 0 150 590 hln 100 LABEL=X
s 250 600 250 540 33
s 250 540 270 540 24
s 250 540 250 480 25
s 250 480 270 480 26
s 250 480 250 420 27
s 250 420 270 420 28
s 250 420 250 360 29
s 250 360 270 360 30
s 250 360 250 300 31
s 250 300 270 300 32
s 250 600 270 600 34
w 89
s 420 600 540 600 88
a 0 s 3 0 440 600 hln 100 LABEL=B[0]
w 97
s 420 540 540 540 96
a 0 s 3 0 440 540 hln 100 LABEL=B[1]
w 105
s 420 420 540 420 104
a 0 s 3 0 440 420 hln 100 LABEL=B[3]
w 113
s 420 360 540 360 112
a 0 s 3 0 440 360 hln 100 LABEL=B[4]
w 121
s 420 300 540 300 120
a 0 s 3 0 440 300 hln 100 LABEL=B[5]
w 129
s 420 480 540 480 128
a 0 s 3 0 440 480 hln 100 LABEL=B[2]
@junction
j 250 600
+ b 35
+ b 35
j 250 540
+ b 35
+ b 35
j 250 480
+ b 35
+ b 35
j 250 420
+ b 35
+ b 35
j 250 360
+ b 35
+ b 35
j 270 300
+ p 15 XBLOX_BUS
+ b 35
j 270 360
+ p 16 XBLOX_BUS
+ b 35
j 270 420
+ p 17 XBLOX_BUS
+ b 35
j 270 540
+ p 18 XBLOX_BUS
+ b 35
j 270 600
+ p 19 XBLOX_BUS
+ b 35
j 270 480
+ p 20 XBLOX_BUS
+ b 35
j 420 600
+ p 19 ELEM
+ w 89
j 420 540
+ p 18 ELEM
+ w 97
j 420 420
+ p 17 ELEM
+ w 105
j 420 360
+ p 16 ELEM
+ w 113
j 420 300
+ p 15 ELEM
+ w 121
j 420 480
+ p 20 ELEM
+ w 129
j 140 600
+ s 137
+ b 35
j 600 600
+ S 138
B[5]
B[4]
B[3]
B[2]
B[1]
B[0]
+ b 22
B[5]
B[4]
B[3]
B[2]
B[1]
B[0]
@attributes
@text
s 5 630 1000 hln 100 BUS_IF06
s 5 742 1000 hln 100 7/21/93
