*version 7.1 627146038
@index
symloc F1007/PF:AK 0 25
symloc F1008/PF:AK 25 25
symloc F1072/PF:AH 50 25
symloc F1074/PF:AR 75 25
symloc F2001/PF:AP 100 25
symloc F2002/PF:AP 125 25
symloc F2012/PF:AP 150 25
symloc F1020/PF 175 74
symloc F2021/PF:AP 249 25
symloc F1027/PF:AR 274 25
symloc F1120 299 71
symloc F1021 370 71
symloc F1022:F1021 441 25
symloc F1174:F1120 466 25
symloc F1240:F1260 491 25
symloc F1260 516 69
symloc L2081 585 70
symloc L2082:L2081 655 25
symloc L2083:L2081 680 25
symloc P123 705 63
symloc F2201S 768 71
symloc F2202S 839 71
symloc AK 910 82 b
symloc AH 992 82 b
symloc AP 1074 74 b
symloc AR 1148 82 b
*package F1007/PF ako AK
*package F1008/PF ako AK
*package F1072/PF ako AH
*package F1074/PF ako AR
*package F2001/PF ako AP
*package F2002/PF ako AP
*package F2012/PF ako AP
*package F1020/PF
@types 2
g 1 A,B
@pinout
t AK
g 1
p G 3,4
p D 1,2
s S 5
*package F2021/PF ako AP
*package F1027/PF ako AR
*package F1120
@types 2
g 1 A,B
@pinout
t AR
g 1
p g 4,3
p d 1,2
s S 5
*package F1021
@types 2
g 1 A,B
@pinout
t AK
g 1
p g 4,3
p d 1,2
s S 5
*package F1022 ako F1021
*package F1174 ako F1120
*package F1240 ako F1260
*package F1260
@types 1
g 1
@pinout
t F1240-AT
g 1
p S 1
p D 2
p G 5
*package L2081
@types 1
g 1
@pinout
t L2081-LX2
g 1
p s 3
p g 2
p d 1
*package L2082 ako L2081
*package L2083 ako L2081
*package P123
@types 1
g 1
@pinout
t SO8
g 1
p S 1
p D 2
p G 6
*package F2201S
@types 1
g 1
@pinout
t F2201S-CD
g 1
p S 1
p D 2
p G 4
*package F2202S
@types 1
g 1
@pinout
t F2201S-CD
g 1
p D 2
p G 4
p S 1
*package AK b
@types 2
g 1 A,B
@attributes
@pinout
t AK
g 1
p D 1,2
p G 3,4
s S 5
*package AH b
@types 2
g 1 A,B
@attributes
@pinout
t AH
g 1
p D 1,2
p G 3,4
s S 5
*package AP b
@types 1
g 1
@attributes
@pinout
t AP
g 1
p D 1
p G 2
p S 3
*package AR b
@types 2
g 1 A,B
@attributes
@pinout
t AR
g 1
p D 1,2
p G 3,4
s S 5
