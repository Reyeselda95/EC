*version 6.2 1557670728
u 325
E? 7
R? 7
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
pageloc 1 0 3691 
@status
c 95:07:09:08:51:57;807958317
*page 1 0 970 720 iA
@ports
port 1 interface 130 140 h
a 1 s 14 0 21 8 hcn 100 LABEL=in1
port 2 interface 130 170 h
a 1 s 14 0 19 8 hcn 100 LABEL=in2
port 3 interface 130 200 h
a 1 s 14 0 21 8 hcn 100 LABEL=in3
port 4 interface 400 180 H
a 1 s 14 0 21 6 hcn 100 LABEL=out
port 166 interface 130 230 h
a 1 s 14 0 19 8 hcn 100 LABEL=in4
port 265 agnd 260 270 h
@parts
part 167 esum 170 140 h
a 0 s 11 0 10 34 hln 100 PART=esum
a 1 xp 0 0 10 2 hln 100 REFDES=E4
a 0 s 0 0 0 0 hln 100 PKGREF=E4
part 168 esum 170 200 h
a 0 s 11 0 10 34 hln 100 PART=esum
a 1 xp 0 0 10 2 hln 100 REFDES=E5
a 0 s 0 0 0 0 hln 100 PKGREF=E5
part 169 esum 280 170 h
a 0 s 11 0 10 34 hln 100 PART=esum
a 1 xp 0 0 10 2 hln 100 REFDES=E6
a 0 s 0 0 0 0 hln 100 PKGREF=E6
part 268 r 250 190 v
a 0 u 0 0 15 25 hln 100 value=1k
a 1 xp 0 0 15 0 hln 100 REFDES=R3
a 0 s 0 0 0 0 hln 100 PKGREF=R3
part 276 r 250 250 v
a 0 u 0 0 15 25 hln 100 value=1k
a 1 xp 0 0 15 0 hln 100 REFDES=R4
a 0 s 0 0 0 0 hln 100 PKGREF=R4
part 310 r 370 250 v
a 0 u 0 0 15 25 hln 100 value=1k
a 1 xp 0 0 15 0 hln 100 REFDES=R6
a 0 s 0 0 0 0 hln 100 PKGREF=R6
part 324 readme 270 100 h
a 0 u 3 0 22 34 hln 100 filename=fsksub.rdm
a 0 sp 0 0 17 20 hln 200 PART=readme
a 0 a 0 0 0 0 hln 100 PKGREF=
@conn
w 171
s 130 140 170 140 170
w 175
s 130 170 170 170 174
w 179
s 130 200 170 200 178
w 183
s 130 230 170 230 182
w 187
s 170 150 160 150 186
s 160 150 160 180 189
s 160 180 160 210 195
s 160 180 170 180 191
s 160 210 160 240 200
s 160 210 170 210 196
s 160 240 160 270 205
s 160 240 170 240 201
s 240 230 240 250 245
s 230 230 240 230 227
s 280 180 270 180 232
s 270 180 270 210 241
s 270 210 270 270 247
s 270 210 280 210 237
s 140 270 160 270 242
s 160 270 240 270 248
s 240 270 260 270 250
s 270 270 350 270 252
s 340 200 350 200 258
s 350 270 370 270 264
s 350 200 350 270 261
s 260 270 270 270 266
s 240 250 240 270 283
s 240 250 250 250 279
s 240 170 240 190 231
s 240 190 250 190 271
s 230 170 240 170 222
s 240 190 240 230 289
s 370 270 380 270 323
s 370 250 370 270 319
w 207
s 230 150 250 150 206
s 260 150 260 170 209
s 260 170 280 170 211
s 250 150 260 150 269
w 215
s 260 210 260 200 217
s 260 200 280 200 219
s 250 210 260 210 277
s 230 210 250 210 297
w 255
s 340 180 370 180 311
s 370 180 400 180 318
s 370 180 370 210 314
@junction
j 170 140
+ p 167 IN1+
+ w 171
j 130 140
+ s 1
+ w 171
j 170 170
+ p 167 IN2+
+ w 175
j 130 170
+ s 2
+ w 175
j 170 200
+ p 168 IN1+
+ w 179
j 130 200
+ s 3
+ w 179
j 170 230
+ p 168 IN2+
+ w 183
j 130 230
+ s 166
+ w 183
j 170 150
+ p 167 IN1-
+ w 187
j 170 180
+ p 167 IN2-
+ w 187
j 160 180
+ w 187
+ w 187
j 170 210
+ p 168 IN1-
+ w 187
j 160 210
+ w 187
+ w 187
j 170 240
+ p 168 IN2-
+ w 187
j 160 240
+ w 187
+ w 187
j 230 150
+ p 167 OUT+
+ w 207
j 280 170
+ p 169 IN1+
+ w 207
j 280 200
+ p 169 IN2+
+ w 215
j 230 170
+ p 167 OUT-
+ w 187
j 230 230
+ p 168 OUT-
+ w 187
j 280 180
+ p 169 IN1-
+ w 187
j 280 210
+ p 169 IN2-
+ w 187
j 270 210
+ w 187
+ w 187
j 160 270
+ w 187
+ w 187
j 240 270
+ w 187
+ w 187
j 270 270
+ w 187
+ w 187
j 340 180
+ p 169 OUT+
+ w 255
j 340 200
+ p 169 OUT-
+ w 187
j 350 270
+ w 187
+ w 187
j 260 270
+ s 265
+ w 187
j 250 150
+ p 268 2
+ w 207
j 250 190
+ p 268 1
+ w 187
j 250 210
+ p 276 2
+ w 215
j 250 250
+ p 276 1
+ w 187
j 240 250
+ w 187
+ w 187
j 240 190
+ w 187
+ w 187
j 240 230
+ w 187
+ w 187
j 230 210
+ p 168 OUT+
+ w 215
j 400 180
+ s 4
+ w 255
j 370 210
+ p 310 2
+ w 255
j 370 180
+ w 255
+ w 255
j 370 250
+ p 310 1
+ w 187
j 370 270
+ w 187
+ w 187
@attributes
a 0 s 13 0 0 0 hln 100 PAGETITLE=
a 0 s 13 0 0 0 hln 100 PAGENO=1
a 0 s 13 0 0 0 hln 100 PAGESIZE=A
a 0 s 13 0 0 0 hln 100 PAGECOUNT=1
@text
s 5 150 80 hln 250 4-input Summer
