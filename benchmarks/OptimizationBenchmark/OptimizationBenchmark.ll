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
	%r1 = sdiv i64 %r0, 4
	%r2 = add i64 %r1, 2
	%r3 = mul i64 5, 8
	%r4 = sub i64 %r2, %r3
	%r5 = add i64 %r4, 9
	%r6 = sub i64 %r5, 12
	%r7 = add i64 %r6, 6
	%r8 = sub i64 %r7, 9
	%r9 = sub i64 %r8, 18
	%r10 = mul i64 23, 3
	%r11 = sdiv i64 %r10, 23
	%r12 = mul i64 %r11, 90
	%r13 = add i64 %r9, %r12
	br label %LU1
LU1:
	ret i64 %r13
}

define i64 @constantPropagation () {
LU2:
	%r15 = add i64 4, 7
	%r16 = add i64 8, 5
	%r17 = add i64 11, 21
	%r18 = add i64 %r15, %r16
	%r19 = mul i64 %r17, %r18
	%r20 = mul i64 %r16, %r17
	%r21 = add i64 11, %r20
	%r22 = sub i64 %r21, %r19
	%r23 = mul i64 %r17, %r18
	%r24 = sub i64 %r16, %r23
	%r25 = sdiv i64 %r19, %r22
	%r26 = add i64 %r24, %r25
	%r27 = add i64 11, 21
	%r28 = add i64 %r27, %r15
	%r29 = add i64 %r28, %r16
	%r30 = add i64 %r29, %r17
	%r31 = sub i64 %r30, %r18
	%r32 = sub i64 %r31, %r26
	%r33 = add i64 %r32, %r16
	%r34 = sub i64 %r33, 4
	%r35 = sub i64 %r34, 7
	%r36 = add i64 %r19, %r22
	%r37 = sub i64 %r36, %r15
	%r38 = sub i64 %r37, %r16
	%r39 = sub i64 7, 4
	%r40 = mul i64 %r39, 5
	%r41 = sub i64 %r40, %r17
	%r42 = mul i64 %r22, 8
	%r43 = mul i64 %r42, 5
	%r44 = add i64 %r43, %r35
	%r45 = mul i64 7, 4
	%r46 = mul i64 %r45, 8
	%r47 = sdiv i64 %r46, 11
	%r48 = sub i64 %r47, %r35
	%r49 = add i64 %r17, %r19
	%r50 = add i64 %r49, 8
	%r51 = sub i64 %r50, %r38
	%r52 = add i64 %r31, %r35
	%r53 = mul i64 21, 4
	%r54 = sub i64 %r52, %r53
	%r55 = mul i64 4, 7
	%r56 = sub i64 %r55, %r19
	%r57 = sub i64 %r56, %r22
	%r58 = sub i64 %r57, %r48
	%r59 = mul i64 %r44, 5
	%r60 = sub i64 %r58, %r59
	%r61 = sub i64 %r35, %r60
	%r62 = sub i64 %r61, %r57
	%r63 = sub i64 %r62, %r31
	%r64 = mul i64 %r38, %r63
	%r65 = mul i64 %r64, %r51
	%r66 = sub i64 %r65, %r60
	%r67 = mul i64 %r63, %r66
	%r68 = sub i64 %r60, %r67
	%r69 = add i64 %r68, %r19
	br label %LU3
LU3:
	ret i64 %r69
}

define i64 @deadCodeElimination () {
LU4:
	store i64 11, i64* @global1
	store i64 5, i64* @global1
	store i64 9, i64* @global1
	%r71 = add i64 8, 8
	%r72 = add i64 %r71, 9
	%r73 = add i64 %r72, 3
	%r74 = add i64 %r73, 10
	br label %LU5
LU5:
	ret i64 %r74
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
	ret i64 %r85
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
	%r94 = load i64* @global3
	%r95 = icmp eq i64 %r94, 3
	br i1 %r95, label %LU21, label %LU20
LU21:
	%r96 = call i64 @sum(i64 30000)
	br label %LU20
LU20:
	br label %LU15
LU15:
	%r97 = phi i64 [ %r90, %LU16 ], [ %r87, %LU17 ]
	br label %LU14
LU14:
	ret i64 %r97
}

define i64 @commonSubexpressionElimination () {
LU22:
	%r99 = mul i64 11, 22
	%r100 = sdiv i64 33, 44
	%r101 = mul i64 55, 66
	%r102 = mul i64 11, 22
	%r103 = sdiv i64 33, 44
	%r104 = add i64 %r102, %r103
	%r105 = mul i64 55, 66
	%r106 = sub i64 %r104, %r105
	%r107 = add i64 %r106, 77
	%r108 = mul i64 11, 22
	%r109 = sdiv i64 33, 44
	%r110 = add i64 %r108, %r109
	%r111 = mul i64 55, 66
	%r112 = sub i64 %r110, %r111
	%r113 = add i64 %r112, 77
	%r114 = mul i64 11, 22
	%r115 = sdiv i64 33, 44
	%r116 = add i64 %r114, %r115
	%r117 = mul i64 55, 66
	%r118 = sub i64 %r116, %r117
	%r119 = add i64 %r118, 77
	%r120 = mul i64 11, 22
	%r121 = sdiv i64 33, 44
	%r122 = add i64 %r120, %r121
	%r123 = mul i64 55, 66
	%r124 = sub i64 %r122, %r123
	%r125 = add i64 %r124, 77
	%r126 = mul i64 11, 22
	%r127 = sdiv i64 33, 44
	%r128 = add i64 %r126, %r127
	%r129 = mul i64 55, 66
	%r130 = sub i64 %r128, %r129
	%r131 = add i64 %r130, 77
	%r132 = mul i64 11, 22
	%r133 = sdiv i64 33, 44
	%r134 = add i64 %r132, %r133
	%r135 = mul i64 55, 66
	%r136 = sub i64 %r134, %r135
	%r137 = add i64 %r136, 77
	%r138 = mul i64 11, 22
	%r139 = sdiv i64 33, 44
	%r140 = add i64 %r138, %r139
	%r141 = mul i64 55, 66
	%r142 = sub i64 %r140, %r141
	%r143 = add i64 %r142, 77
	%r144 = mul i64 11, 22
	%r145 = sdiv i64 33, 44
	%r146 = add i64 %r144, %r145
	%r147 = mul i64 55, 66
	%r148 = sub i64 %r146, %r147
	%r149 = add i64 %r148, 77
	%r150 = mul i64 11, 22
	%r151 = sdiv i64 33, 44
	%r152 = add i64 %r150, %r151
	%r153 = mul i64 55, 66
	%r154 = sub i64 %r152, %r153
	%r155 = add i64 %r154, 77
	%r156 = mul i64 11, 22
	%r157 = sdiv i64 33, 44
	%r158 = add i64 %r156, %r157
	%r159 = mul i64 55, 66
	%r160 = sub i64 %r158, %r159
	%r161 = add i64 %r160, 77
	%r162 = mul i64 11, 22
	%r163 = sdiv i64 33, 44
	%r164 = add i64 %r162, %r163
	%r165 = mul i64 55, 66
	%r166 = sub i64 %r164, %r165
	%r167 = add i64 %r166, 77
	%r168 = mul i64 22, 11
	%r169 = sdiv i64 33, 44
	%r170 = add i64 %r168, %r169
	%r171 = mul i64 55, 66
	%r172 = sub i64 %r170, %r171
	%r173 = add i64 %r172, 77
	%r174 = mul i64 11, 22
	%r175 = sdiv i64 33, 44
	%r176 = add i64 %r174, %r175
	%r177 = mul i64 66, 55
	%r178 = sub i64 %r176, %r177
	%r179 = add i64 %r178, 77
	%r180 = mul i64 11, 22
	%r181 = add i64 77, %r180
	%r182 = sdiv i64 33, 44
	%r183 = add i64 %r181, %r182
	%r184 = mul i64 55, 66
	%r185 = sub i64 %r183, %r184
	%r186 = mul i64 11, 22
	%r187 = sdiv i64 33, 44
	%r188 = add i64 %r186, %r187
	%r189 = mul i64 55, 66
	%r190 = sub i64 %r188, %r189
	%r191 = add i64 %r190, 77
	%r192 = sdiv i64 33, 44
	%r193 = mul i64 11, 22
	%r194 = add i64 %r192, %r193
	%r195 = mul i64 55, 66
	%r196 = sub i64 %r194, %r195
	%r197 = add i64 %r196, 77
	%r198 = add i64 11, 22
	%r199 = add i64 %r198, 33
	%r200 = add i64 %r199, 44
	%r201 = add i64 %r200, 55
	%r202 = add i64 %r201, 66
	%r203 = add i64 %r202, 77
	%r204 = add i64 %r203, %r99
	%r205 = add i64 %r204, %r100
	%r206 = add i64 %r205, %r101
	%r207 = add i64 %r206, %r107
	%r208 = add i64 %r207, %r113
	%r209 = add i64 %r208, %r119
	%r210 = add i64 %r209, %r125
	%r211 = add i64 %r210, %r131
	%r212 = add i64 %r211, %r137
	%r213 = add i64 %r212, %r143
	%r214 = add i64 %r213, %r149
	%r215 = add i64 %r214, %r155
	%r216 = add i64 %r215, %r161
	%r217 = add i64 %r216, %r167
	%r218 = add i64 %r217, %r173
	%r219 = add i64 %r218, %r179
	%r220 = add i64 %r219, %r185
	%r221 = add i64 %r220, %r191
	%r222 = add i64 %r221, %r197
	br label %LU23
LU23:
	ret i64 %r222
}

define i64 @hoisting () {
LU24:
	br label %LU27
LU27:
	%r224 = icmp slt i64 0, 1000000
	br i1 %r224, label %LU28, label %LU26
LU28:
	%r236 = phi i64 [ 0, %LU27 ], [ %r237, %LU28 ]
	%r235 = phi i64 [ 0, %LU27 ], [ %r234, %LU28 ]
	%r231 = phi i64 [ 0, %LU27 ], [ %r230, %LU28 ]
	%r225 = phi i64 [ 0, %LU27 ], [ 5, %LU28 ]
	%r228 = add i64 1, 2
	%r230 = add i64 %r228, 3
	%r233 = add i64 3, 4
	%r234 = add i64 %r233, %r230
	%r237 = add i64 %r236, 1
	%r238 = icmp slt i64 %r237, 1000000
	br i1 %r238, label %LU28, label %LU26
LU26:
	br label %LU25
LU25:
	ret i64 2
}

define i64 @doubleIf () {
LU29:
	%r241 = icmp eq i64 1, 1
	br i1 %r241, label %LU32, label %LU31
LU32:
	%r242 = icmp eq i64 1, 1
	br i1 %r242, label %LU34, label %LU35
LU34:
	br label %LU33
LU35:
	br label %LU33
LU33:
	br label %LU31
LU31:
	br label %LU30
LU30:
	ret i64 0
}

define i64 @integerDivide () {
LU36:
	%r245 = sdiv i64 3000, 2
	%r246 = mul i64 %r245, 4
	%r247 = sdiv i64 %r246, 8
	%r248 = sdiv i64 %r247, 16
	%r249 = mul i64 %r248, 32
	%r250 = sdiv i64 %r249, 64
	%r251 = mul i64 %r250, 128
	%r252 = sdiv i64 %r251, 4
	br label %LU37
LU37:
	ret i64 %r252
}

define i64 @association () {
LU38:
	%r254 = mul i64 10, 2
	%r255 = sdiv i64 %r254, 2
	%r256 = mul i64 3, %r255
	%r257 = sdiv i64 %r256, 3
	%r258 = mul i64 %r257, 4
	%r259 = sdiv i64 %r258, 4
	%r260 = add i64 %r259, 4
	%r261 = sub i64 %r260, 4
	%r262 = mul i64 %r261, 50
	%r263 = sdiv i64 %r262, 50
	br label %LU39
LU39:
	ret i64 %r263
}

define i64 @tailRecursionHelper (i64 %r265, i64 %r266) {
LU40:
	%r267 = icmp eq i64 %r265, 0
	br i1 %r267, label %LU43, label %LU44
LU43:
	br label %LU41
LU44:
	%r268 = sub i64 %r265, 1
	%r269 = add i64 %r266, %r265
	%r270 = call i64 @tailRecursionHelper(i64 %r268, i64 %r269)
	br label %LU41
LU41:
	%r272 = phi i64 [ %r266, %LU43 ], [ %r270, %LU44 ]
	ret i64 %r272
}

define i64 @tailRecursion (i64 %r273) {
LU45:
	%r274 = call i64 @tailRecursionHelper(i64 %r273, i64 0)
	br label %LU46
LU46:
	ret i64 %r274
}

define i64 @unswitching () {
LU47:
	br label %LU50
LU50:
	%r276 = icmp slt i64 1, 1000000
	br i1 %r276, label %LU51, label %LU49
LU51:
	%r279 = phi i64 [ 1, %LU50 ], [ %r282, %LU52 ]
	%r277 = phi i64 [ 2, %LU50 ], [ %r277, %LU52 ]
	%r278 = icmp eq i64 %r277, 2
	br i1 %r278, label %LU53, label %LU54
LU53:
	%r280 = add i64 %r279, 1
	br label %LU52
LU54:
	%r281 = add i64 %r279, 2
	br label %LU52
LU52:
	%r282 = phi i64 [ %r280, %LU53 ], [ %r281, %LU54 ]
	%r283 = icmp slt i64 %r282, 1000000
	br i1 %r283, label %LU51, label %LU49
LU49:
	%r285 = phi i64 [ 1, %LU50 ], [ %r282, %LU52 ]
	br label %LU48
LU48:
	ret i64 %r285
}

define i64 @randomCalculation (i64 %r287) {
LU55:
	br label %LU58
LU58:
	%r288 = icmp slt i64 0, %r287
	br i1 %r288, label %LU59, label %LU57
LU59:
	%r298 = phi i64 [ 0, %LU58 ], [ %r305, %LU59 ]
	%r296 = phi i64 [ 0, %LU58 ], [ %r297, %LU59 ]
	%r295 = phi i64 [ 0, %LU58 ], [ %r294, %LU59 ]
	%r293 = phi i64 [ 0, %LU58 ], [ %r292, %LU59 ]
	%r291 = phi i64 [ 0, %LU58 ], [ 8, %LU59 ]
	%r290 = phi i64 [ 0, %LU58 ], [ 7, %LU59 ]
	%r289 = phi i64 [ 0, %LU58 ], [ 4, %LU59 ]
	%r292 = add i64 4, 7
	%r294 = add i64 %r292, 8
	%r297 = add i64 %r296, %r294
	%r299 = mul i64 %r298, 2
	%r300 = sdiv i64 %r299, 2
	%r301 = mul i64 3, %r300
	%r302 = sdiv i64 %r301, 3
	%r303 = mul i64 %r302, 4
	%r304 = sdiv i64 %r303, 4
	%r305 = add i64 %r304, 1
	%r307 = icmp slt i64 %r305, %r287
	br i1 %r307, label %LU59, label %LU57
LU57:
	%r308 = phi i64 [ 0, %LU58 ], [ %r297, %LU59 ]
	br label %LU56
LU56:
	ret i64 %r308
}

define i64 @iterativeFibonacci (i64 %r310) {
LU60:
	%r311 = sub i64 0, 1
	br label %LU63
LU63:
	%r312 = icmp slt i64 0, %r310
	br i1 %r312, label %LU64, label %LU62
LU64:
	%r317 = phi i64 [ 0, %LU63 ], [ %r318, %LU64 ]
	%r316 = phi i64 [ 0, %LU63 ], [ %r315, %LU64 ]
	%r314 = phi i64 [ %r311, %LU63 ], [ %r313, %LU64 ]
	%r313 = phi i64 [ 1, %LU63 ], [ %r315, %LU64 ]
	%r315 = add i64 %r313, %r314
	%r318 = add i64 %r317, 1
	%r320 = icmp slt i64 %r318, %r310
	br i1 %r320, label %LU64, label %LU62
LU62:
	%r321 = phi i64 [ 1, %LU63 ], [ %r315, %LU64 ]
	br label %LU61
LU61:
	ret i64 %r321
}

define i64 @recursiveFibonacci (i64 %r323) {
LU65:
	%r324 = icmp sle i64 %r323, 0
	%r325 = icmp eq i64 %r323, 1
	%r326 = or i1 %r324, %r325
	br i1 %r326, label %LU68, label %LU69
LU68:
	br label %LU66
LU69:
	%r327 = sub i64 %r323, 1
	%r328 = call i64 @recursiveFibonacci(i64 %r327)
	%r329 = sub i64 %r323, 2
	%r330 = call i64 @recursiveFibonacci(i64 %r329)
	%r331 = add i64 %r328, %r330
	br label %LU66
LU66:
	%r333 = phi i64 [ %r323, %LU68 ], [ %r331, %LU69 ]
	ret i64 %r333
}

define i64 @main () {
LU70:
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r334 = load i64* @.read_scratch
	br label %LU73
LU73:
	%r335 = icmp slt i64 1, %r334
	br i1 %r335, label %LU74, label %LU72
LU74:
	%r355 = phi i64 [ 1, %LU73 ], [ %r356, %LU74 ]
	%r337 = phi i64 [ 0, %LU73 ], [ %r354, %LU74 ]
	%r336 = call i64 @constantFolding()
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r336)
	%r338 = call i64 @constantPropagation()
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r338)
	%r339 = call i64 @deadCodeElimination()
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r339)
	%r340 = call i64 @interProceduralOptimization()
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r340)
	%r341 = call i64 @commonSubexpressionElimination()
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r341)
	%r342 = call i64 @hoisting()
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r342)
	%r343 = call i64 @doubleIf()
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r343)
	%r344 = call i64 @integerDivide()
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r344)
	%r345 = call i64 @association()
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r345)
	%r347 = sdiv i64 %r334, 1000
	%r348 = call i64 @tailRecursion(i64 %r347)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r348)
	%r349 = call i64 @unswitching()
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r349)
	%r350 = call i64 @randomCalculation(i64 %r334)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r350)
	%r351 = sdiv i64 %r334, 5
	%r352 = call i64 @iterativeFibonacci(i64 %r351)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r352)
	%r353 = sdiv i64 %r334, 1000
	%r354 = call i64 @recursiveFibonacci(i64 %r353)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r354)
	%r356 = add i64 %r355, 1
	%r357 = icmp slt i64 %r356, %r334
	br i1 %r357, label %LU74, label %LU72
LU72:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 9999)
	br label %LU71
LU71:
	ret i64 0
}

