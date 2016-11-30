*version 6.2 294262764
u 863
R? 8
C? 6
TX? 2
Q? 2
L? 2
V? 2
@libraries
@analysis
@targets
@attributes
@translators
a 0 u 13 0 0 0 hln 100 PSPICE=DEFAULT
a 0 u 13 0 0 0 hln 100 PCBOARDS=PCB
a 0 u 13 0 0 0 hln 100 CADSTAR=PCB
a 0 u 13 0 0 0 hln 100 EDIF=PCB
a 0 u 13 0 0 0 hln 100 ORCAD=PCB
a 0 u 13 0 0 0 hln 100 PADS=PCB
a 0 u 13 0 0 0 hln 100 PCAD=PCB
a 0 u 13 0 0 0 hln 100 PROTEL=PCB
a 0 u 13 0 0 0 hln 100 TANGO=PCB
a 0 u 13 0 0 0 hln 100 SCICARDS=PCB
a 0 u 13 0 0 0 hln 100 POLARIS=PCB
a 0 u 13 0 0 0 hln 100 PRINT=DEFAULT
@index
pageloc 1 0 4771 
@status
c 95:07:09:08:50:38;807958238
*page 1 0 970 720 iA
@ports
port 1 interface 80 110 h
a 1 s 14 0 19 8 hcn 100 LABEL=in
port 2 interface 410 80 H
a 1 s 14 0 19 6 hcn 100 LABEL=out
port 102 agnd 320 170 h
port 129 bubble 320 120 d
a 1 s 14 0 8 -20 hcn 100 LABEL=VCC
port 170 bubble 390 20 d
a 1 s 14 0 8 -18 hcn 100 LABEL=VCC
port 358 agnd 360 200 V
a 1 s 14 0 2 32 hln 100 LABEL=0
port 360 bubble 400 200 V
a 1 s 14 0 10 -4 hcn 100 LABEL=VCC
port 399 agnd 120 170 h
@parts
part 8 c 130 160 v
a 0 u 13 0 23 11 hln 100 value=187p
a 1 xp 0 0 15 0 hln 100 REFDES=C1
a 0 s 0 0 0 0 hln 100 PKGREF=C1
part 9 xfrm_linear 160 110 h
a 0 u 13 0 -20 34 hln 100 L1_VALUE=69nH
a 0 u 13 0 34 34 hln 100 L2_VALUE=6.9nH
a 1 xp 0 0 20 0 hln 100 REFDES=TX1
a 0 u 0 0 15 25 hln 100 coupling=0.99999
a 0 s 0 0 0 0 hln 100 PKGREF=TX1
part 83 r 200 110 h
a 0 u 13 0 17 25 hln 100 value=1k
a 1 xp 0 0 -3 24 hln 100 REFDES=R2
a 0 s 0 0 0 0 hln 100 PKGREF=R2
part 84 c 210 90 h
a 0 u 13 0 7 -1 hln 100 value=10n
a 1 xp 0 0 -5 0 hln 100 REFDES=C2
a 0 s 0 0 0 0 hln 100 PKGREF=C2
part 85 q2n2222 280 110 V
a 0 sp 13 0 5 6 hln 100 PART=q2n2222
a 1 xp 0 0 29 1 hln 100 refdes=Q1
a 0 s 0 0 0 0 hln 100 PKGREF=Q1
part 86 r 280 170 v
a 0 u 13 0 13 35 hln 100 value=20k
a 1 xp 0 0 21 34 hln 100 REFDES=R3
a 0 s 0 0 0 0 hln 100 PKGREF=R3
part 90 c 260 160 v
a 0 u 13 0 1 7 hln 100 value=10n
a 1 xp 0 0 23 4 hln 100 REFDES=C3
a 0 s 0 0 0 0 hln 100 PKGREF=C3
part 125 r 280 120 h
a 0 u 13 0 13 23 hln 100 value=35k
a 1 xp 0 0 39 22 hln 100 REFDES=R4
a 0 s 0 0 0 0 hln 100 PKGREF=R4
part 137 l 300 80 v
a 0 u 13 0 29 3 hln 100 value=57.5nH
a 1 xp 0 0 15 0 hln 100 REFDES=L1
a 0 s 0 0 0 0 hln 100 PKGREF=L1
part 138 c 330 70 v
a 0 u 13 0 23 11 hln 100 value=152p
a 1 xp 0 0 15 0 hln 100 REFDES=C4
a 0 s 0 0 0 0 hln 100 PKGREF=C4
part 139 r 360 70 v
a 0 u 13 0 25 37 hln 100 value=300
a 1 xp 0 0 15 0 hln 100 REFDES=R5
a 0 s 0 0 0 0 hln 100 PKGREF=R5
part 172 c 370 80 h
a 0 u 13 0 7 25 hln 100 value=10n
a 1 xp 0 0 15 0 hln 100 REFDES=C5
a 0 s 0 0 0 0 hln 100 PKGREF=C5
part 174 r 410 150 v
a 0 u 13 0 15 37 hln 100 value=300
a 1 xp 0 0 15 0 hln 100 REFDES=R6
a 0 s 0 0 0 0 hln 100 PKGREF=R6
part 357 vsrc 400 200 V
a 1 u 13 0 28 26 hcn 100 DC=5v
a 1 xp 0 0 20 10 hcn 100 refdes=V1
a 0 s 0 0 0 0 hln 100 PKGREF=V1
part 667 r 80 110 h
a 0 u 13 0 11 25 hln 100 value=150
a 1 xp 0 0 15 0 hln 100 REFDES=R7
a 0 s 0 0 0 0 hln 100 PKGREF=R7
part 862 readme 170 210 h
a 0 u 3 0 22 34 hln 100 filename=fsksub.rdm
a 0 sp 0 0 17 20 hln 200 PART=readme
a 0 a 0 0 0 0 hln 100 PKGREF=
@conn
w 675
s 250 90 260 90 676
s 250 110 250 90 679
s 240 110 250 110 685
s 250 90 240 90 850
w 689
s 330 40 330 20 688
s 330 20 300 20 691
s 330 20 360 20 697
s 360 20 390 20 703
s 360 20 360 30 699
w 705
s 260 120 280 120 704
s 280 110 280 120 707
s 280 120 280 130 711
s 260 120 260 130 715
w 719
s 70 170 120 170 720
s 120 170 130 170 731
s 130 170 160 170 738
s 130 160 130 170 734
w 747
s 160 110 130 110 753
s 130 110 130 130 756
s 120 110 130 110 858
w 762
s 280 170 320 170 761
s 200 170 260 170 768
s 260 170 280 170 775
s 260 160 260 170 771
s 320 170 410 170 776
s 410 170 420 170 821
s 410 150 410 170 817
w 792
s 300 80 330 80 791
s 330 70 330 80 794
s 300 90 300 80 797
s 330 80 360 80 801
s 360 80 360 70 805
s 360 80 370 80 822
w 814
s 410 80 410 110 813
s 400 80 410 80 826
w 839
s 210 90 200 90 838
s 200 90 200 110 841
@junction
j 360 200
+ p 357 -
+ s 358
j 400 200
+ p 357 +
+ s 360
j 260 90
+ p 85 e
+ w 675
j 330 40
+ p 138 2
+ w 689
j 300 20
+ p 137 2
+ w 689
j 330 20
+ w 689
+ w 689
j 360 30
+ p 139 2
+ w 689
j 360 20
+ w 689
+ w 689
j 280 120
+ p 125 1
+ w 705
j 280 110
+ p 85 b
+ w 705
j 280 130
+ p 86 2
+ w 705
j 260 130
+ p 90 2
+ w 705
j 120 170
+ s 399
+ w 719
j 160 170
+ p 9 2
+ w 719
j 130 160
+ p 8 1
+ w 719
j 130 170
+ w 719
+ w 719
j 160 110
+ p 9 1
+ w 747
j 130 130
+ p 8 2
+ w 747
j 280 170
+ p 86 1
+ w 762
j 320 170
+ s 102
+ w 762
j 200 170
+ p 9 4
+ w 762
j 260 160
+ p 90 1
+ w 762
j 260 170
+ w 762
+ w 762
j 320 170
+ w 762
+ w 762
j 300 80
+ p 137 1
+ w 792
j 330 70
+ p 138 1
+ w 792
j 300 90
+ p 85 c
+ w 792
j 330 80
+ w 792
+ w 792
j 360 70
+ p 139 1
+ w 792
j 320 120
+ p 125 2
+ s 129
j 390 20
+ s 170
+ w 689
j 410 110
+ p 174 2
+ w 814
j 410 80
+ s 2
+ w 814
j 410 150
+ p 174 1
+ w 762
j 410 170
+ w 762
+ w 762
j 370 80
+ p 172 1
+ w 792
j 360 80
+ w 792
+ w 792
j 400 80
+ p 172 2
+ w 814
j 200 110
+ p 83 1
+ p 9 3
j 240 110
+ p 83 2
+ w 675
j 200 110
+ p 9 3
+ w 839
j 200 110
+ p 83 1
+ w 839
j 250 90
+ w 675
+ w 675
j 240 90
+ p 84 2
+ w 675
j 210 90
+ p 84 1
+ w 839
j 80 110
+ p 667 1
+ s 1
j 120 110
+ p 667 2
+ w 747
j 130 110
+ w 747
+ w 747
@attributes
a 0 s 13 0 0 0 hln 100 PAGETITLE=
a 0 s 13 0 0 0 hln 100 PAGENO=1
a 0 s 13 0 0 0 hln 100 PAGESIZE=A
a 0 s 13 0 0 0 hln 100 PAGECOUNT=1
@text
