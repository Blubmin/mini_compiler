target triple="x86_64"
declare i8* @malloc(i64)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.printhex = private unnamed_addr constant [9 x i8] c"0x%016X\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i64 0, align 8


@global1 = common global i64 0, align 8
@global2 = common global i64 0, align 8
@global3 = common global i64 0, align 8

define i64 @constantFolding () {
LU0:
	%r0 = mul i64 8, 9
	%r1 = sdiv i64 72, 4
	%r2 = add i64 18, 2
	%r3 = mul i64 5, 8
	%r4 = sub i64 20, 40
	%r5 = add i64 -20, 9
	%r6 = sub i64 -11, 12
	%r7 = add i64 -23, 6
	%r8 = sub i64 -17, 9
	%r9 = sub i64 -26, 18
	%r10 = mul i64 23, 3
	%r11 = sdiv i64 69, 23
	%r12 = mul i64 3, 90
	%r13 = add i64 -44, 270
	br label %LU1
LU1:
	ret i64 226
}

define i64 @constantPropagation () {
LU2:
	%r15 = add i64 4, 7
	%r16 = add i64 8, 5
	%r17 = add i64 11, 21
	%r18 = add i64 11, 13
	%r19 = mul i64 32, 24
	%r20 = mul i64 13, 32
	%r21 = add i64 11, 416
	%r22 = sub i64 427, 768
	%r23 = mul i64 32, 24
	%r24 = sub i64 13, 768
	%r25 = sdiv i64 768, -341
	%r26 = add i64 -755, -2
	%r27 = add i64 11, 21
	%r28 = add i64 32, 11
	%r29 = add i64 43, 13
	%r30 = add i64 56, 32
	%r31 = sub i64 88, 24
	%r32 = sub i64 64, -757
	%r33 = add i64 821, 13
	%r34 = sub i64 834, 4
	%r35 = sub i64 830, 7
	%r36 = add i64 768, -341
	%r37 = sub i64 427, 11
	%r38 = sub i64 416, 13
	%r39 = sub i64 7, 4
	%r40 = mul i64 3, 5
	%r41 = sub i64 15, 32
	%r42 = mul i64 -341, 8
	%r43 = mul i64 -2728, 5
	%r44 = add i64 -13640, 823
	%r45 = mul i64 7, 4
	%r46 = mul i64 28, 8
	%r47 = sdiv i64 224, 11
	%r48 = sub i64 20, 823
	%r49 = add i64 32, 768
	%r50 = add i64 800, 8
	%r51 = sub i64 808, 403
	%r52 = add i64 64, 823
	%r53 = mul i64 21, 4
	%r54 = sub i64 887, 84
	%r55 = mul i64 4, 7
	%r56 = sub i64 28, 768
	%r57 = sub i64 -740, -341
	%r58 = sub i64 -399, -803
	%r59 = mul i64 -12817, 5
	%r60 = sub i64 404, -64085
	%r61 = sub i64 823, 64489
	%r62 = sub i64 -63666, -399
	%r63 = sub i64 -63267, 64
	%r64 = mul i64 403, -63331
	%r65 = mul i64 -25522393, 405
	%r66 = sub i64 -10336569165, 64489
	%r67 = mul i64 -63331, -10336633654
	%r68 = sub i64 64489, 654629345941474
	%r69 = add i64 -654629345876985, 768
	br label %LU3
LU3:
	ret i64 -654629345876217
}

define i64 @deadCodeElimination () {
LU4:
	store i64 11, i64* @global1
	store i64 5, i64* @global1
	store i64 9, i64* @global1
	%r71 = add i64 8, 8
	%r72 = add i64 16, 9
	%r73 = add i64 25, 3
	%r74 = add i64 28, 10
	br label %LU5
LU5:
	ret i64 38
}

define i64 @sum (i64 %r76) {
LU6:
	br label %LU9
LU9:
	%r77 = icmp sgt i64 %r76, 0
	br i1 %r77, label %LU10, label %LU8
LU10:
	%r79 = phi i64 [ %r76, %LU9 ], [ %r81, %LU10 ]
	%r78 = phi i64 [ 0, %LU9 ], [ %r80, %LU10 ]
	%r80 = add i64 %r78, %r79
	%r81 = sub i64 %r79, 1
	%r82 = icmp sgt i64 %r81, 0
	br i1 %r82, label %LU10, label %LU8
LU8:
	%r83 = phi i64 [ 0, %LU9 ], [ %r80, %LU10 ]
	br label %LU7
LU7:
	ret i64 %r83
}

define i64 @doesntModifyGlobals () {
LU11:
	%r85 = add i64 1, 2
	br label %LU12
LU12:
	ret i64 3
}

define i64 @interProceduralOptimization () {
LU13:
	store i64 1, i64* @global1
	store i64 0, i64* @global2
	store i64 0, i64* @global3
	%r87 = call i64 @sum(i64 100)
	%r88 = load i64* @global1
	%r89 = icmp eq i64 %r88, 1
	br i1 %r89, label %LU16, label %LU17
LU16:
	%r90 = call i64 @sum(i64 10000)
	br label %LU15
LU17:
	%r91 = load i64* @global2
	%r92 = icmp eq i64 %r91, 2
	br i1 %r92, label %LU19, label %LU18
LU19:
	%r93 = call i64 @sum(i64 20000)
	br label %LU18
LU18:
	%r97 = phi i64 [ %r93, %LU19 ], [ %r87, %LU17 ]
	%r94 = load i64* @global3
	%r95 = icmp eq i64 %r94, 3
	br i1 %r95, label %LU21, label %LU20
LU21:
	%r96 = call i64 @sum(i64 30000)
	br label %LU20
LU20:
	%r98 = phi i64 [ %r96, %LU21 ], [ %r97, %LU18 ]
	br label %LU15
LU15:
	%r99 = phi i64 [ %r90, %LU16 ], [ %r98, %LU20 ]
	br label %LU14
LU14:
	ret i64 %r99
}

define i64 @commonSubexpressionElimination () {
LU22:
	%r101 = mul i64 11, 22
	%r102 = sdiv i64 33, 44
	%r103 = mul i64 55, 66
	%r104 = mul i64 11, 22
	%r105 = sdiv i64 33, 44
	%r106 = add i64 242, 0
	%r107 = mul i64 55, 66
	%r108 = sub i64 242, 3630
	%r109 = add i64 -3388, 77
	%r110 = mul i64 11, 22
	%r111 = sdiv i64 33, 44
	%r112 = add i64 242, 0
	%r113 = mul i64 55, 66
	%r114 = sub i64 242, 3630
	%r115 = add i64 -3388, 77
	%r116 = mul i64 11, 22
	%r117 = sdiv i64 33, 44
	%r118 = add i64 242, 0
	%r119 = mul i64 55, 66
	%r120 = sub i64 242, 3630
	%r121 = add i64 -3388, 77
	%r122 = mul i64 11, 22
	%r123 = sdiv i64 33, 44
	%r124 = add i64 242, 0
	%r125 = mul i64 55, 66
	%r126 = sub i64 242, 3630
	%r127 = add i64 -3388, 77
	%r128 = mul i64 11, 22
	%r129 = sdiv i64 33, 44
	%r130 = add i64 242, 0
	%r131 = mul i64 55, 66
	%r132 = sub i64 242, 3630
	%r133 = add i64 -3388, 77
	%r134 = mul i64 11, 22
	%r135 = sdiv i64 33, 44
	%r136 = add i64 242, 0
	%r137 = mul i64 55, 66
	%r138 = sub i64 242, 3630
	%r139 = add i64 -3388, 77
	%r140 = mul i64 11, 22
	%r141 = sdiv i64 33, 44
	%r142 = add i64 242, 0
	%r143 = mul i64 55, 66
	%r144 = sub i64 242, 3630
	%r145 = add i64 -3388, 77
	%r146 = mul i64 11, 22
	%r147 = sdiv i64 33, 44
	%r148 = add i64 242, 0
	%r149 = mul i64 55, 66
	%r150 = sub i64 242, 3630
	%r151 = add i64 -3388, 77
	%r152 = mul i64 11, 22
	%r153 = sdiv i64 33, 44
	%r154 = add i64 242, 0
	%r155 = mul i64 55, 66
	%r156 = sub i64 242, 3630
	%r157 = add i64 -3388, 77
	%r158 = mul i64 11, 22
	%r159 = sdiv i64 33, 44
	%r160 = add i64 242, 0
	%r161 = mul i64 55, 66
	%r162 = sub i64 242, 3630
	%r163 = add i64 -3388, 77
	%r164 = mul i64 11, 22
	%r165 = sdiv i64 33, 44
	%r166 = add i64 242, 0
	%r167 = mul i64 55, 66
	%r168 = sub i64 242, 3630
	%r169 = add i64 -3388, 77
	%r170 = mul i64 22, 11
	%r171 = sdiv i64 33, 44
	%r172 = add i64 242, 0
	%r173 = mul i64 55, 66
	%r174 = sub i64 242, 3630
	%r175 = add i64 -3388, 77
	%r176 = mul i64 11, 22
	%r177 = sdiv i64 33, 44
	%r178 = add i64 242, 0
	%r179 = mul i64 66, 55
	%r180 = sub i64 242, 3630
	%r181 = add i64 -3388, 77
	%r182 = mul i64 11, 22
	%r183 = add i64 77, 242
	%r184 = sdiv i64 33, 44
	%r185 = add i64 319, 0
	%r186 = mul i64 55, 66
	%r187 = sub i64 319, 3630
	%r188 = mul i64 11, 22
	%r189 = sdiv i64 33, 44
	%r190 = add i64 242, 0
	%r191 = mul i64 55, 66
	%r192 = sub i64 242, 3630
	%r193 = add i64 -3388, 77
	%r194 = sdiv i64 33, 44
	%r195 = mul i64 11, 22
	%r196 = add i64 0, 242
	%r197 = mul i64 55, 66
	%r198 = sub i64 242, 3630
	%r199 = add i64 -3388, 77
	%r200 = add i64 11, 22
	%r201 = add i64 33, 33
	%r202 = add i64 66, 44
	%r203 = add i64 110, 55
	%r204 = add i64 165, 66
	%r205 = add i64 231, 77
	%r206 = add i64 308, 242
	%r207 = add i64 550, 0
	%r208 = add i64 550, 3630
	%r209 = add i64 4180, -3311
	%r210 = add i64 869, -3311
	%r211 = add i64 -2442, -3311
	%r212 = add i64 -5753, -3311
	%r213 = add i64 -9064, -3311
	%r214 = add i64 -12375, -3311
	%r215 = add i64 -15686, -3311
	%r216 = add i64 -18997, -3311
	%r217 = add i64 -22308, -3311
	%r218 = add i64 -25619, -3311
	%r219 = add i64 -28930, -3311
	%r220 = add i64 -32241, -3311
	%r221 = add i64 -35552, -3311
	%r222 = add i64 -38863, -3311
	%r223 = add i64 -42174, -3311
	%r224 = add i64 -45485, -3311
	br label %LU23
LU23:
	ret i64 -48796
}

define i64 @hoisting () {
LU24:
	br label %LU27
LU27:
	%r226 = icmp slt i64 0, 1000000
	br label %LU28
LU28:
	%r238 = phi i64 [ 0, %LU27 ], [ %r239, %LU28 ]
	%r237 = phi i64 [ 0, %LU27 ], [ 13, %LU28 ]
	%r233 = phi i64 [ 0, %LU27 ], [ 6, %LU28 ]
	%r227 = phi i64 [ 0, %LU27 ], [ 5, %LU28 ]
	%r230 = add i64 1, 2
	%r232 = add i64 3, 3
	%r235 = add i64 3, 4
	%r236 = add i64 7, 6
	%r239 = add i64 %r238, 1
	%r240 = icmp slt i64 %r239, 1000000
	br i1 %r240, label %LU28, label %LU26
LU26:
	br label %LU25
LU25:
	ret i64 2
}

define i64 @doubleIf () {
LU29:
	%r243 = icmp eq i64 1, 1
	br label %LU32
LU32:
	%r244 = icmp eq i64 1, 1
	br label %LU34
LU34:
	br label %LU33
LU33:
	br label %LU31
LU31:
	%r246 = phi i64 [ 50, %LU33 ]
	br label %LU30
LU30:
	ret i64 50
}

define i64 @integerDivide () {
LU36:
	%r248 = sdiv i64 3000, 2
	%r249 = mul i64 1500, 4
	%r250 = sdiv i64 6000, 8
	%r251 = sdiv i64 750, 16
	%r252 = mul i64 46, 32
	%r253 = sdiv i64 1472, 64
	%r254 = mul i64 23, 128
	%r255 = sdiv i64 2944, 4
	br label %LU37
LU37:
	ret i64 736
}

define i64 @association () {
LU38:
	%r257 = mul i64 10, 2
	%r258 = sdiv i64 20, 2
	%r259 = mul i64 3, 10
	%r260 = sdiv i64 30, 3
	%r261 = mul i64 10, 4
	%r262 = sdiv i64 40, 4
	%r263 = add i64 10, 4
	%r264 = sub i64 14, 4
	%r265 = mul i64 10, 50
	%r266 = sdiv i64 500, 50
	br label %LU39
LU39:
	ret i64 10
}

define i64 @tailRecursionHelper (i64 %r268, i64 %r269) {
LU40:
	%r270 = icmp eq i64 %r268, 0
	br i1 %r270, label %LU43, label %LU44
LU43:
	br label %LU41
LU44:
	%r271 = sub i64 %r268, 1
	%r272 = add i64 %r269, %r268
	%r273 = call i64 @tailRecursionHelper(i64 %r271, i64 %r272)
	br label %LU41
LU41:
	%r275 = phi i64 [ %r269, %LU43 ], [ %r273, %LU44 ]
	ret i64 %r275
}

define i64 @tailRecursion (i64 %r276) {
LU45:
	%r277 = call i64 @tailRecursionHelper(i64 %r276, i64 0)
	br label %LU46
LU46:
	ret i64 %r277
}

define i64 @unswitching () {
LU47:
	br label %LU50
LU50:
	%r279 = icmp slt i64 1, 1000000
	br label %LU51
LU51:
	%r282 = phi i64 [ 1, %LU50 ], [ %r283, %LU52 ]
	%r280 = phi i64 [ 2, %LU50 ], [ %r280, %LU52 ]
	%r281 = icmp eq i64 2, 2
	br label %LU53
LU53:
	%r283 = add i64 %r282, 1
	br label %LU52
LU52:
	%r285 = phi i64 [ %r283, %LU53 ]
	%r286 = icmp slt i64 %r283, 1000000
	br i1 %r286, label %LU51, label %LU49
LU49:
	%r288 = phi i64 [ %r283, %LU52 ]
	br label %LU48
LU48:
	ret i64 %r283
}

define i64 @randomCalculation (i64 %r290) {
LU55:
	br label %LU58
LU58:
	%r291 = icmp slt i64 0, %r290
	br i1 %r291, label %LU59, label %LU57
LU59:
	%r301 = phi i64 [ 0, %LU58 ], [ %r308, %LU59 ]
	%r299 = phi i64 [ 0, %LU58 ], [ %r300, %LU59 ]
	%r298 = phi i64 [ 0, %LU58 ], [ 19, %LU59 ]
	%r296 = phi i64 [ 0, %LU58 ], [ 11, %LU59 ]
	%r294 = phi i64 [ 0, %LU58 ], [ 8, %LU59 ]
	%r293 = phi i64 [ 0, %LU58 ], [ 7, %LU59 ]
	%r292 = phi i64 [ 0, %LU58 ], [ 4, %LU59 ]
	%r295 = add i64 4, 7
	%r297 = add i64 11, 8
	%r300 = add i64 %r299, 19
	%r302 = mul i64 %r301, 2
	%r303 = sdiv i64 %r302, 2
	%r304 = mul i64 3, %r303
	%r305 = sdiv i64 %r304, 3
	%r306 = mul i64 %r305, 4
	%r307 = sdiv i64 %r306, 4
	%r308 = add i64 %r307, 1
	%r310 = icmp slt i64 %r308, %r290
	br i1 %r310, label %LU59, label %LU57
LU57:
	%r311 = phi i64 [ 0, %LU58 ], [ %r300, %LU59 ]
	br label %LU56
LU56:
	ret i64 %r311
}

define i64 @iterativeFibonacci (i64 %r313) {
LU60:
	%r314 = sub i64 0, 1
	br label %LU63
LU63:
	%r315 = icmp slt i64 0, %r313
	br i1 %r315, label %LU64, label %LU62
LU64:
	%r320 = phi i64 [ 0, %LU63 ], [ %r321, %LU64 ]
	%r319 = phi i64 [ 0, %LU63 ], [ %r318, %LU64 ]
	%r317 = phi i64 [ -1, %LU63 ], [ %r316, %LU64 ]
	%r316 = phi i64 [ 1, %LU63 ], [ %r318, %LU64 ]
	%r318 = add i64 %r316, %r317
	%r321 = add i64 %r320, 1
	%r323 = icmp slt i64 %r321, %r313
	br i1 %r323, label %LU64, label %LU62
LU62:
	%r324 = phi i64 [ 1, %LU63 ], [ %r318, %LU64 ]
	br label %LU61
LU61:
	ret i64 %r324
}

define i64 @recursiveFibonacci (i64 %r326) {
LU65:
	%r327 = icmp sle i64 %r326, 0
	%r328 = icmp eq i64 %r326, 1
	%r329 = or i1 %r327, %r328
	br i1 %r329, label %LU68, label %LU69
LU68:
	br label %LU66
LU69:
	%r330 = sub i64 %r326, 1
	%r331 = call i64 @recursiveFibonacci(i64 %r330)
	%r332 = sub i64 %r326, 2
	%r333 = call i64 @recursiveFibonacci(i64 %r332)
	%r334 = add i64 %r331, %r333
	br label %LU66
LU66:
	%r336 = phi i64 [ %r326, %LU68 ], [ %r334, %LU69 ]
	ret i64 %r336
}

define i64 @main () {
LU70:
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r337 = load i64* @.read_scratch
	br label %LU73
LU73:
	%r338 = icmp slt i64 1, %r337
	br i1 %r338, label %LU74, label %LU72
LU74:
	%r358 = phi i64 [ 1, %LU73 ], [ %r359, %LU74 ]
	%r340 = phi i64 [ 0, %LU73 ], [ %r357, %LU74 ]
	%r339 = call i64 @constantFolding()
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r339)
	%r341 = call i64 @constantPropagation()
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r341)
	%r342 = call i64 @deadCodeElimination()
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r342)
	%r343 = call i64 @interProceduralOptimization()
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r343)
	%r344 = call i64 @commonSubexpressionElimination()
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r344)
	%r345 = call i64 @hoisting()
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r345)
	%r346 = call i64 @doubleIf()
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r346)
	%r347 = call i64 @integerDivide()
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r347)
	%r348 = call i64 @association()
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r348)
	%r350 = sdiv i64 %r337, 1000
	%r351 = call i64 @tailRecursion(i64 %r350)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r351)
	%r352 = call i64 @unswitching()
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r352)
	%r353 = call i64 @randomCalculation(i64 %r337)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r353)
	%r354 = sdiv i64 %r337, 5
	%r355 = call i64 @iterativeFibonacci(i64 %r354)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r355)
	%r356 = sdiv i64 %r337, 1000
	%r357 = call i64 @recursiveFibonacci(i64 %r356)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r357)
	%r359 = add i64 %r358, 1
	%r360 = icmp slt i64 %r359, %r337
	br i1 %r360, label %LU74, label %LU72
LU72:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 9999)
	br label %LU71
LU71:
	ret i64 0
}

