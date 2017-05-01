declare i8* @malloc(i64)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.printhex = private unnamed_addr constant [6 x i8] c"0x%X\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i64 0, align 8


@global1 = common global i64 0, align 8
@global2 = common global i64 0, align 8
@global3 = common global i64 0, align 8

define i64 @constantFolding () {
LU0:
	%a = alloca i64
	%.ret = alloca i64
	%r1 = mul i64 8, 9
	%r2 = sdiv i64 %r1, 4
	%r3 = add i64 %r2, 2
	%r4 = mul i64 5, 8
	%r5 = sub i64 %r3, %r4
	%r6 = add i64 %r5, 9
	%r7 = sub i64 %r6, 12
	%r8 = add i64 %r7, 6
	%r9 = sub i64 %r8, 9
	%r10 = sub i64 %r9, 18
	%r11 = mul i64 23, 3
	%r12 = sdiv i64 %r11, 23
	%r13 = mul i64 %r12, 90
	%r14 = add i64 %r10, %r13
	store i64 %r14, i64* %a
	%r15 = load i64* %a
	store i64 %r15, i64* %.ret
	br label %LU1
LU1:
	%r0 = load i64* %.ret
	ret i64 %r0
}

define i64 @constantPropagation () {
LU2:
	%a = alloca i64
	%b = alloca i64
	%c = alloca i64
	%d = alloca i64
	%e = alloca i64
	%f = alloca i64
	%g = alloca i64
	%h = alloca i64
	%i = alloca i64
	%j = alloca i64
	%k = alloca i64
	%l = alloca i64
	%m = alloca i64
	%n = alloca i64
	%o = alloca i64
	%p = alloca i64
	%q = alloca i64
	%r = alloca i64
	%s = alloca i64
	%t = alloca i64
	%u = alloca i64
	%v = alloca i64
	%w = alloca i64
	%x = alloca i64
	%y = alloca i64
	%z = alloca i64
	%.ret = alloca i64
	store i64 4, i64* %a
	store i64 7, i64* %b
	store i64 8, i64* %c
	store i64 5, i64* %d
	store i64 11, i64* %e
	store i64 21, i64* %f
	%r17 = load i64* %a
	%r18 = load i64* %b
	%r19 = add i64 %r17, %r18
	store i64 %r19, i64* %g
	%r20 = load i64* %c
	%r21 = load i64* %d
	%r22 = add i64 %r20, %r21
	store i64 %r22, i64* %h
	%r23 = load i64* %e
	%r24 = load i64* %f
	%r25 = add i64 %r23, %r24
	store i64 %r25, i64* %i
	%r26 = load i64* %g
	%r27 = load i64* %h
	%r28 = add i64 %r26, %r27
	store i64 %r28, i64* %j
	%r29 = load i64* %i
	%r30 = load i64* %j
	%r31 = mul i64 %r29, %r30
	store i64 %r31, i64* %k
	%r32 = load i64* %e
	%r33 = load i64* %h
	%r34 = load i64* %i
	%r35 = mul i64 %r33, %r34
	%r36 = add i64 %r32, %r35
	%r37 = load i64* %k
	%r38 = sub i64 %r36, %r37
	store i64 %r38, i64* %l
	%r39 = load i64* %h
	%r40 = load i64* %i
	%r41 = load i64* %j
	%r42 = mul i64 %r40, %r41
	%r43 = sub i64 %r39, %r42
	%r44 = load i64* %k
	%r45 = load i64* %l
	%r46 = sdiv i64 %r44, %r45
	%r47 = add i64 %r43, %r46
	store i64 %r47, i64* %m
	%r48 = load i64* %e
	%r49 = load i64* %f
	%r50 = add i64 %r48, %r49
	%r51 = load i64* %g
	%r52 = add i64 %r50, %r51
	%r53 = load i64* %h
	%r54 = add i64 %r52, %r53
	%r55 = load i64* %i
	%r56 = add i64 %r54, %r55
	%r57 = load i64* %j
	%r58 = sub i64 %r56, %r57
	store i64 %r58, i64* %n
	%r59 = load i64* %n
	%r60 = load i64* %m
	%r61 = sub i64 %r59, %r60
	%r62 = load i64* %h
	%r63 = add i64 %r61, %r62
	%r64 = load i64* %a
	%r65 = sub i64 %r63, %r64
	%r66 = load i64* %b
	%r67 = sub i64 %r65, %r66
	store i64 %r67, i64* %o
	%r68 = load i64* %k
	%r69 = load i64* %l
	%r70 = add i64 %r68, %r69
	%r71 = load i64* %g
	%r72 = sub i64 %r70, %r71
	%r73 = load i64* %h
	%r74 = sub i64 %r72, %r73
	store i64 %r74, i64* %p
	%r75 = load i64* %b
	%r76 = load i64* %a
	%r77 = sub i64 %r75, %r76
	%r78 = load i64* %d
	%r79 = mul i64 %r77, %r78
	%r80 = load i64* %i
	%r81 = sub i64 %r79, %r80
	store i64 %r81, i64* %q
	%r82 = load i64* %l
	%r83 = load i64* %c
	%r84 = mul i64 %r82, %r83
	%r85 = load i64* %d
	%r86 = mul i64 %r84, %r85
	%r87 = load i64* %o
	%r88 = add i64 %r86, %r87
	store i64 %r88, i64* %r
	%r89 = load i64* %b
	%r90 = load i64* %a
	%r91 = mul i64 %r89, %r90
	%r92 = load i64* %c
	%r93 = mul i64 %r91, %r92
	%r94 = load i64* %e
	%r95 = sdiv i64 %r93, %r94
	%r96 = load i64* %o
	%r97 = sub i64 %r95, %r96
	store i64 %r97, i64* %s
	%r98 = load i64* %i
	%r99 = load i64* %k
	%r100 = add i64 %r98, %r99
	%r101 = load i64* %c
	%r102 = add i64 %r100, %r101
	%r103 = load i64* %p
	%r104 = sub i64 %r102, %r103
	store i64 %r104, i64* %t
	%r105 = load i64* %n
	%r106 = load i64* %o
	%r107 = add i64 %r105, %r106
	%r108 = load i64* %f
	%r109 = load i64* %a
	%r110 = mul i64 %r108, %r109
	%r111 = sub i64 %r107, %r110
	store i64 %r111, i64* %u
	%r112 = load i64* %a
	%r113 = load i64* %b
	%r114 = mul i64 %r112, %r113
	%r115 = load i64* %k
	%r116 = sub i64 %r114, %r115
	%r117 = load i64* %l
	%r118 = sub i64 %r116, %r117
	store i64 %r118, i64* %v
	%r119 = load i64* %v
	%r120 = load i64* %s
	%r121 = sub i64 %r119, %r120
	%r122 = load i64* %r
	%r123 = load i64* %d
	%r124 = mul i64 %r122, %r123
	%r125 = sub i64 %r121, %r124
	store i64 %r125, i64* %w
	%r126 = load i64* %o
	%r127 = load i64* %w
	%r128 = sub i64 %r126, %r127
	%r129 = load i64* %v
	%r130 = sub i64 %r128, %r129
	%r131 = load i64* %n
	%r132 = sub i64 %r130, %r131
	store i64 %r132, i64* %x
	%r133 = load i64* %p
	%r134 = load i64* %x
	%r135 = mul i64 %r133, %r134
	%r136 = load i64* %t
	%r137 = mul i64 %r135, %r136
	%r138 = load i64* %w
	%r139 = sub i64 %r137, %r138
	store i64 %r139, i64* %y
	%r140 = load i64* %w
	%r141 = load i64* %x
	%r142 = load i64* %y
	%r143 = mul i64 %r141, %r142
	%r144 = sub i64 %r140, %r143
	%r145 = load i64* %k
	%r146 = add i64 %r144, %r145
	store i64 %r146, i64* %z
	%r147 = load i64* %z
	store i64 %r147, i64* %.ret
	br label %LU3
LU3:
	%r16 = load i64* %.ret
	ret i64 %r16
}

define i64 @deadCodeElimination () {
LU4:
	%a = alloca i64
	%b = alloca i64
	%c = alloca i64
	%d = alloca i64
	%e = alloca i64
	%.ret = alloca i64
	store i64 4, i64* %a
	store i64 5, i64* %a
	store i64 7, i64* %a
	store i64 8, i64* %a
	store i64 6, i64* %b
	store i64 9, i64* %b
	store i64 12, i64* %b
	store i64 8, i64* %b
	store i64 10, i64* %c
	store i64 13, i64* %c
	store i64 9, i64* %c
	store i64 45, i64* %d
	store i64 12, i64* %d
	store i64 3, i64* %d
	store i64 23, i64* %e
	store i64 10, i64* %e
	store i64 11, i64* @global1
	store i64 5, i64* @global1
	store i64 9, i64* @global1
	%r149 = load i64* %a
	%r150 = load i64* %b
	%r151 = add i64 %r149, %r150
	%r152 = load i64* %c
	%r153 = add i64 %r151, %r152
	%r154 = load i64* %d
	%r155 = add i64 %r153, %r154
	%r156 = load i64* %e
	%r157 = add i64 %r155, %r156
	store i64 %r157, i64* %.ret
	br label %LU5
LU5:
	%r148 = load i64* %.ret
	ret i64 %r148
}

define i64 @sum (i64 %r158) {
LU6:
	%total = alloca i64
	%.ret = alloca i64
	%number = alloca i64
	store i64 %r158, i64* %number
	store i64 0, i64* %total
	br label %LU9
LU9:
	%r160 = load i64* %number
	%r161 = icmp sgt i64 %r160, 0
	br i1 %r161, label %LU10, label %LU8
LU10:
	%r162 = load i64* %total
	%r163 = load i64* %number
	%r164 = add i64 %r162, %r163
	store i64 %r164, i64* %total
	%r165 = load i64* %number
	%r166 = sub i64 %r165, 1
	store i64 %r166, i64* %number
	br label %LU9
LU8:
	%r167 = load i64* %total
	store i64 %r167, i64* %.ret
	br label %LU7
LU7:
	%r159 = load i64* %.ret
	ret i64 %r159
}

define i64 @doesntModifyGlobals () {
LU11:
	%a = alloca i64
	%b = alloca i64
	%.ret = alloca i64
	store i64 1, i64* %a
	store i64 2, i64* %b
	%r169 = load i64* %a
	%r170 = load i64* %b
	%r171 = add i64 %r169, %r170
	store i64 %r171, i64* %.ret
	br label %LU12
LU12:
	%r168 = load i64* %.ret
	ret i64 %r168
}

define i64 @interProceduralOptimization () {
LU13:
	%a = alloca i64
	%.ret = alloca i64
	store i64 1, i64* @global1
	store i64 0, i64* @global2
	store i64 0, i64* @global3
	%r173 = call i64 @sum(i64 100)
	store i64 %r173, i64* %a
	%r174 = load i64* @global1
	%r175 = icmp eq i64 %r174, 1
	br i1 %r175, label %LU16, label %LU17
LU16:
	%r176 = call i64 @sum(i64 10000)
	store i64 %r176, i64* %a
	br label %LU15
LU17:
	%r177 = load i64* @global2
	%r178 = icmp eq i64 %r177, 2
	br i1 %r178, label %LU19, label %LU18
LU19:
	%r179 = call i64 @sum(i64 20000)
	store i64 %r179, i64* %a
	br label %LU18
LU18:
	%r180 = load i64* @global3
	%r181 = icmp eq i64 %r180, 3
	br i1 %r181, label %LU21, label %LU20
LU21:
	%r182 = call i64 @sum(i64 30000)
	store i64 %r182, i64* %a
	br label %LU20
LU20:
	br label %LU15
LU15:
	%r183 = load i64* %a
	store i64 %r183, i64* %.ret
	br label %LU14
LU14:
	%r172 = load i64* %.ret
	ret i64 %r172
}

define i64 @commonSubexpressionElimination () {
LU22:
	%a = alloca i64
	%b = alloca i64
	%c = alloca i64
	%d = alloca i64
	%e = alloca i64
	%f = alloca i64
	%g = alloca i64
	%h = alloca i64
	%i = alloca i64
	%j = alloca i64
	%k = alloca i64
	%l = alloca i64
	%m = alloca i64
	%n = alloca i64
	%o = alloca i64
	%p = alloca i64
	%q = alloca i64
	%r = alloca i64
	%s = alloca i64
	%t = alloca i64
	%u = alloca i64
	%v = alloca i64
	%w = alloca i64
	%x = alloca i64
	%y = alloca i64
	%z = alloca i64
	%.ret = alloca i64
	store i64 11, i64* %a
	store i64 22, i64* %b
	store i64 33, i64* %c
	store i64 44, i64* %d
	store i64 55, i64* %e
	store i64 66, i64* %f
	store i64 77, i64* %g
	%r185 = load i64* %a
	%r186 = load i64* %b
	%r187 = mul i64 %r185, %r186
	store i64 %r187, i64* %h
	%r188 = load i64* %c
	%r189 = load i64* %d
	%r190 = sdiv i64 %r188, %r189
	store i64 %r190, i64* %i
	%r191 = load i64* %e
	%r192 = load i64* %f
	%r193 = mul i64 %r191, %r192
	store i64 %r193, i64* %j
	%r194 = load i64* %a
	%r195 = load i64* %b
	%r196 = mul i64 %r194, %r195
	%r197 = load i64* %c
	%r198 = load i64* %d
	%r199 = sdiv i64 %r197, %r198
	%r200 = add i64 %r196, %r199
	%r201 = load i64* %e
	%r202 = load i64* %f
	%r203 = mul i64 %r201, %r202
	%r204 = sub i64 %r200, %r203
	%r205 = load i64* %g
	%r206 = add i64 %r204, %r205
	store i64 %r206, i64* %k
	%r207 = load i64* %a
	%r208 = load i64* %b
	%r209 = mul i64 %r207, %r208
	%r210 = load i64* %c
	%r211 = load i64* %d
	%r212 = sdiv i64 %r210, %r211
	%r213 = add i64 %r209, %r212
	%r214 = load i64* %e
	%r215 = load i64* %f
	%r216 = mul i64 %r214, %r215
	%r217 = sub i64 %r213, %r216
	%r218 = load i64* %g
	%r219 = add i64 %r217, %r218
	store i64 %r219, i64* %l
	%r220 = load i64* %a
	%r221 = load i64* %b
	%r222 = mul i64 %r220, %r221
	%r223 = load i64* %c
	%r224 = load i64* %d
	%r225 = sdiv i64 %r223, %r224
	%r226 = add i64 %r222, %r225
	%r227 = load i64* %e
	%r228 = load i64* %f
	%r229 = mul i64 %r227, %r228
	%r230 = sub i64 %r226, %r229
	%r231 = load i64* %g
	%r232 = add i64 %r230, %r231
	store i64 %r232, i64* %m
	%r233 = load i64* %a
	%r234 = load i64* %b
	%r235 = mul i64 %r233, %r234
	%r236 = load i64* %c
	%r237 = load i64* %d
	%r238 = sdiv i64 %r236, %r237
	%r239 = add i64 %r235, %r238
	%r240 = load i64* %e
	%r241 = load i64* %f
	%r242 = mul i64 %r240, %r241
	%r243 = sub i64 %r239, %r242
	%r244 = load i64* %g
	%r245 = add i64 %r243, %r244
	store i64 %r245, i64* %n
	%r246 = load i64* %a
	%r247 = load i64* %b
	%r248 = mul i64 %r246, %r247
	%r249 = load i64* %c
	%r250 = load i64* %d
	%r251 = sdiv i64 %r249, %r250
	%r252 = add i64 %r248, %r251
	%r253 = load i64* %e
	%r254 = load i64* %f
	%r255 = mul i64 %r253, %r254
	%r256 = sub i64 %r252, %r255
	%r257 = load i64* %g
	%r258 = add i64 %r256, %r257
	store i64 %r258, i64* %o
	%r259 = load i64* %a
	%r260 = load i64* %b
	%r261 = mul i64 %r259, %r260
	%r262 = load i64* %c
	%r263 = load i64* %d
	%r264 = sdiv i64 %r262, %r263
	%r265 = add i64 %r261, %r264
	%r266 = load i64* %e
	%r267 = load i64* %f
	%r268 = mul i64 %r266, %r267
	%r269 = sub i64 %r265, %r268
	%r270 = load i64* %g
	%r271 = add i64 %r269, %r270
	store i64 %r271, i64* %p
	%r272 = load i64* %a
	%r273 = load i64* %b
	%r274 = mul i64 %r272, %r273
	%r275 = load i64* %c
	%r276 = load i64* %d
	%r277 = sdiv i64 %r275, %r276
	%r278 = add i64 %r274, %r277
	%r279 = load i64* %e
	%r280 = load i64* %f
	%r281 = mul i64 %r279, %r280
	%r282 = sub i64 %r278, %r281
	%r283 = load i64* %g
	%r284 = add i64 %r282, %r283
	store i64 %r284, i64* %q
	%r285 = load i64* %a
	%r286 = load i64* %b
	%r287 = mul i64 %r285, %r286
	%r288 = load i64* %c
	%r289 = load i64* %d
	%r290 = sdiv i64 %r288, %r289
	%r291 = add i64 %r287, %r290
	%r292 = load i64* %e
	%r293 = load i64* %f
	%r294 = mul i64 %r292, %r293
	%r295 = sub i64 %r291, %r294
	%r296 = load i64* %g
	%r297 = add i64 %r295, %r296
	store i64 %r297, i64* %r
	%r298 = load i64* %a
	%r299 = load i64* %b
	%r300 = mul i64 %r298, %r299
	%r301 = load i64* %c
	%r302 = load i64* %d
	%r303 = sdiv i64 %r301, %r302
	%r304 = add i64 %r300, %r303
	%r305 = load i64* %e
	%r306 = load i64* %f
	%r307 = mul i64 %r305, %r306
	%r308 = sub i64 %r304, %r307
	%r309 = load i64* %g
	%r310 = add i64 %r308, %r309
	store i64 %r310, i64* %s
	%r311 = load i64* %a
	%r312 = load i64* %b
	%r313 = mul i64 %r311, %r312
	%r314 = load i64* %c
	%r315 = load i64* %d
	%r316 = sdiv i64 %r314, %r315
	%r317 = add i64 %r313, %r316
	%r318 = load i64* %e
	%r319 = load i64* %f
	%r320 = mul i64 %r318, %r319
	%r321 = sub i64 %r317, %r320
	%r322 = load i64* %g
	%r323 = add i64 %r321, %r322
	store i64 %r323, i64* %t
	%r324 = load i64* %a
	%r325 = load i64* %b
	%r326 = mul i64 %r324, %r325
	%r327 = load i64* %c
	%r328 = load i64* %d
	%r329 = sdiv i64 %r327, %r328
	%r330 = add i64 %r326, %r329
	%r331 = load i64* %e
	%r332 = load i64* %f
	%r333 = mul i64 %r331, %r332
	%r334 = sub i64 %r330, %r333
	%r335 = load i64* %g
	%r336 = add i64 %r334, %r335
	store i64 %r336, i64* %u
	%r337 = load i64* %b
	%r338 = load i64* %a
	%r339 = mul i64 %r337, %r338
	%r340 = load i64* %c
	%r341 = load i64* %d
	%r342 = sdiv i64 %r340, %r341
	%r343 = add i64 %r339, %r342
	%r344 = load i64* %e
	%r345 = load i64* %f
	%r346 = mul i64 %r344, %r345
	%r347 = sub i64 %r343, %r346
	%r348 = load i64* %g
	%r349 = add i64 %r347, %r348
	store i64 %r349, i64* %v
	%r350 = load i64* %a
	%r351 = load i64* %b
	%r352 = mul i64 %r350, %r351
	%r353 = load i64* %c
	%r354 = load i64* %d
	%r355 = sdiv i64 %r353, %r354
	%r356 = add i64 %r352, %r355
	%r357 = load i64* %f
	%r358 = load i64* %e
	%r359 = mul i64 %r357, %r358
	%r360 = sub i64 %r356, %r359
	%r361 = load i64* %g
	%r362 = add i64 %r360, %r361
	store i64 %r362, i64* %w
	%r363 = load i64* %g
	%r364 = load i64* %a
	%r365 = load i64* %b
	%r366 = mul i64 %r364, %r365
	%r367 = add i64 %r363, %r366
	%r368 = load i64* %c
	%r369 = load i64* %d
	%r370 = sdiv i64 %r368, %r369
	%r371 = add i64 %r367, %r370
	%r372 = load i64* %e
	%r373 = load i64* %f
	%r374 = mul i64 %r372, %r373
	%r375 = sub i64 %r371, %r374
	store i64 %r375, i64* %x
	%r376 = load i64* %a
	%r377 = load i64* %b
	%r378 = mul i64 %r376, %r377
	%r379 = load i64* %c
	%r380 = load i64* %d
	%r381 = sdiv i64 %r379, %r380
	%r382 = add i64 %r378, %r381
	%r383 = load i64* %e
	%r384 = load i64* %f
	%r385 = mul i64 %r383, %r384
	%r386 = sub i64 %r382, %r385
	%r387 = load i64* %g
	%r388 = add i64 %r386, %r387
	store i64 %r388, i64* %y
	%r389 = load i64* %c
	%r390 = load i64* %d
	%r391 = sdiv i64 %r389, %r390
	%r392 = load i64* %a
	%r393 = load i64* %b
	%r394 = mul i64 %r392, %r393
	%r395 = add i64 %r391, %r394
	%r396 = load i64* %e
	%r397 = load i64* %f
	%r398 = mul i64 %r396, %r397
	%r399 = sub i64 %r395, %r398
	%r400 = load i64* %g
	%r401 = add i64 %r399, %r400
	store i64 %r401, i64* %z
	%r402 = load i64* %a
	%r403 = load i64* %b
	%r404 = add i64 %r402, %r403
	%r405 = load i64* %c
	%r406 = add i64 %r404, %r405
	%r407 = load i64* %d
	%r408 = add i64 %r406, %r407
	%r409 = load i64* %e
	%r410 = add i64 %r408, %r409
	%r411 = load i64* %f
	%r412 = add i64 %r410, %r411
	%r413 = load i64* %g
	%r414 = add i64 %r412, %r413
	%r415 = load i64* %h
	%r416 = add i64 %r414, %r415
	%r417 = load i64* %i
	%r418 = add i64 %r416, %r417
	%r419 = load i64* %j
	%r420 = add i64 %r418, %r419
	%r421 = load i64* %k
	%r422 = add i64 %r420, %r421
	%r423 = load i64* %l
	%r424 = add i64 %r422, %r423
	%r425 = load i64* %m
	%r426 = add i64 %r424, %r425
	%r427 = load i64* %n
	%r428 = add i64 %r426, %r427
	%r429 = load i64* %o
	%r430 = add i64 %r428, %r429
	%r431 = load i64* %p
	%r432 = add i64 %r430, %r431
	%r433 = load i64* %q
	%r434 = add i64 %r432, %r433
	%r435 = load i64* %r
	%r436 = add i64 %r434, %r435
	%r437 = load i64* %s
	%r438 = add i64 %r436, %r437
	%r439 = load i64* %t
	%r440 = add i64 %r438, %r439
	%r441 = load i64* %u
	%r442 = add i64 %r440, %r441
	%r443 = load i64* %v
	%r444 = add i64 %r442, %r443
	%r445 = load i64* %w
	%r446 = add i64 %r444, %r445
	%r447 = load i64* %x
	%r448 = add i64 %r446, %r447
	%r449 = load i64* %y
	%r450 = add i64 %r448, %r449
	%r451 = load i64* %z
	%r452 = add i64 %r450, %r451
	store i64 %r452, i64* %.ret
	br label %LU23
LU23:
	%r184 = load i64* %.ret
	ret i64 %r184
}

define i64 @hoisting () {
LU24:
	%a = alloca i64
	%b = alloca i64
	%c = alloca i64
	%d = alloca i64
	%e = alloca i64
	%f = alloca i64
	%g = alloca i64
	%h = alloca i64
	%i = alloca i64
	%.ret = alloca i64
	store i64 1, i64* %a
	store i64 2, i64* %b
	store i64 3, i64* %c
	store i64 4, i64* %d
	store i64 0, i64* %i
	br label %LU27
LU27:
	%r454 = load i64* %i
	%r455 = icmp slt i64 %r454, 1000000
	br i1 %r455, label %LU28, label %LU26
LU28:
	store i64 5, i64* %e
	%r456 = load i64* %a
	%r457 = load i64* %b
	%r458 = add i64 %r456, %r457
	%r459 = load i64* %c
	%r460 = add i64 %r458, %r459
	store i64 %r460, i64* %g
	%r461 = load i64* %c
	%r462 = load i64* %d
	%r463 = add i64 %r461, %r462
	%r464 = load i64* %g
	%r465 = add i64 %r463, %r464
	store i64 %r465, i64* %h
	%r466 = load i64* %i
	%r467 = add i64 %r466, 1
	store i64 %r467, i64* %i
	br label %LU27
LU26:
	%r468 = load i64* %b
	store i64 %r468, i64* %.ret
	br label %LU25
LU25:
	%r453 = load i64* %.ret
	ret i64 %r453
}

define i64 @doubleIf () {
LU29:
	%a = alloca i64
	%b = alloca i64
	%c = alloca i64
	%d = alloca i64
	%.ret = alloca i64
	store i64 1, i64* %a
	store i64 2, i64* %b
	store i64 3, i64* %c
	%r470 = load i64* %a
	%r471 = icmp eq i64 %r470, 1
	br i1 %r471, label %LU32, label %LU31
LU32:
	store i64 20, i64* %b
	%r472 = load i64* %a
	%r473 = icmp eq i64 %r472, 1
	br i1 %r473, label %LU34, label %LU35
LU34:
	store i64 200, i64* %b
	store i64 300, i64* %c
	br label %LU33
LU35:
	store i64 1, i64* %a
	store i64 2, i64* %b
	store i64 3, i64* %c
	br label %LU33
LU33:
	store i64 50, i64* %d
	br label %LU31
LU31:
	%r474 = load i64* %d
	store i64 %r474, i64* %.ret
	br label %LU30
LU30:
	%r469 = load i64* %.ret
	ret i64 %r469
}

define i64 @integerDivide () {
LU36:
	%a = alloca i64
	%.ret = alloca i64
	store i64 3000, i64* %a
	%r476 = load i64* %a
	%r477 = sdiv i64 %r476, 2
	store i64 %r477, i64* %a
	%r478 = load i64* %a
	%r479 = mul i64 %r478, 4
	store i64 %r479, i64* %a
	%r480 = load i64* %a
	%r481 = sdiv i64 %r480, 8
	store i64 %r481, i64* %a
	%r482 = load i64* %a
	%r483 = sdiv i64 %r482, 16
	store i64 %r483, i64* %a
	%r484 = load i64* %a
	%r485 = mul i64 %r484, 32
	store i64 %r485, i64* %a
	%r486 = load i64* %a
	%r487 = sdiv i64 %r486, 64
	store i64 %r487, i64* %a
	%r488 = load i64* %a
	%r489 = mul i64 %r488, 128
	store i64 %r489, i64* %a
	%r490 = load i64* %a
	%r491 = sdiv i64 %r490, 4
	store i64 %r491, i64* %a
	%r492 = load i64* %a
	store i64 %r492, i64* %.ret
	br label %LU37
LU37:
	%r475 = load i64* %.ret
	ret i64 %r475
}

define i64 @association () {
LU38:
	%a = alloca i64
	%.ret = alloca i64
	store i64 10, i64* %a
	%r494 = load i64* %a
	%r495 = mul i64 %r494, 2
	store i64 %r495, i64* %a
	%r496 = load i64* %a
	%r497 = sdiv i64 %r496, 2
	store i64 %r497, i64* %a
	%r498 = load i64* %a
	%r499 = mul i64 3, %r498
	store i64 %r499, i64* %a
	%r500 = load i64* %a
	%r501 = sdiv i64 %r500, 3
	store i64 %r501, i64* %a
	%r502 = load i64* %a
	%r503 = mul i64 %r502, 4
	store i64 %r503, i64* %a
	%r504 = load i64* %a
	%r505 = sdiv i64 %r504, 4
	store i64 %r505, i64* %a
	%r506 = load i64* %a
	%r507 = add i64 %r506, 4
	store i64 %r507, i64* %a
	%r508 = load i64* %a
	%r509 = sub i64 %r508, 4
	store i64 %r509, i64* %a
	%r510 = load i64* %a
	%r511 = mul i64 %r510, 50
	store i64 %r511, i64* %a
	%r512 = load i64* %a
	%r513 = sdiv i64 %r512, 50
	store i64 %r513, i64* %a
	%r514 = load i64* %a
	store i64 %r514, i64* %.ret
	br label %LU39
LU39:
	%r493 = load i64* %.ret
	ret i64 %r493
}

define i64 @tailRecursionHelper (i64 %r515, i64 %r516) {
LU40:
	%.ret = alloca i64
	%value = alloca i64
	store i64 %r515, i64* %value
	%sum = alloca i64
	store i64 %r516, i64* %sum
	%r518 = load i64* %value
	%r519 = icmp eq i64 %r518, 0
	br i1 %r519, label %LU43, label %LU44
LU43:
	%r520 = load i64* %sum
	store i64 %r520, i64* %.ret
	br label %LU41
LU44:
	%r521 = load i64* %value
	%r522 = sub i64 %r521, 1
	%r523 = load i64* %sum
	%r524 = load i64* %value
	%r525 = add i64 %r523, %r524
	%r526 = call i64 @tailRecursionHelper(i64 %r522, i64 %r525)
	store i64 %r526, i64* %.ret
	br label %LU41
LU41:
	%r517 = load i64* %.ret
	ret i64 %r517
}

define i64 @tailRecursion (i64 %r527) {
LU45:
	%.ret = alloca i64
	%value = alloca i64
	store i64 %r527, i64* %value
	%r529 = load i64* %value
	%r530 = call i64 @tailRecursionHelper(i64 %r529, i64 0)
	store i64 %r530, i64* %.ret
	br label %LU46
LU46:
	%r528 = load i64* %.ret
	ret i64 %r528
}

define i64 @unswitching () {
LU47:
	%a = alloca i64
	%b = alloca i64
	%.ret = alloca i64
	store i64 1, i64* %a
	store i64 2, i64* %b
	br label %LU50
LU50:
	%r532 = load i64* %a
	%r533 = icmp slt i64 %r532, 1000000
	br i1 %r533, label %LU51, label %LU49
LU51:
	%r534 = load i64* %b
	%r535 = icmp eq i64 %r534, 2
	br i1 %r535, label %LU53, label %LU54
LU53:
	%r536 = load i64* %a
	%r537 = add i64 %r536, 1
	store i64 %r537, i64* %a
	br label %LU52
LU54:
	%r538 = load i64* %a
	%r539 = add i64 %r538, 2
	store i64 %r539, i64* %a
	br label %LU52
LU52:
	br label %LU50
LU49:
	%r540 = load i64* %a
	store i64 %r540, i64* %.ret
	br label %LU48
LU48:
	%r531 = load i64* %.ret
	ret i64 %r531
}

define i64 @randomCalculation (i64 %r541) {
LU55:
	%a = alloca i64
	%b = alloca i64
	%c = alloca i64
	%d = alloca i64
	%e = alloca i64
	%i = alloca i64
	%sum = alloca i64
	%.ret = alloca i64
	%number = alloca i64
	store i64 %r541, i64* %number
	store i64 0, i64* %i
	store i64 0, i64* %sum
	br label %LU58
LU58:
	%r543 = load i64* %i
	%r544 = load i64* %number
	%r545 = icmp slt i64 %r543, %r544
	br i1 %r545, label %LU59, label %LU57
LU59:
	store i64 4, i64* %a
	store i64 7, i64* %b
	store i64 8, i64* %c
	%r546 = load i64* %a
	%r547 = load i64* %b
	%r548 = add i64 %r546, %r547
	store i64 %r548, i64* %d
	%r549 = load i64* %d
	%r550 = load i64* %c
	%r551 = add i64 %r549, %r550
	store i64 %r551, i64* %e
	%r552 = load i64* %sum
	%r553 = load i64* %e
	%r554 = add i64 %r552, %r553
	store i64 %r554, i64* %sum
	%r555 = load i64* %i
	%r556 = mul i64 %r555, 2
	store i64 %r556, i64* %i
	%r557 = load i64* %i
	%r558 = sdiv i64 %r557, 2
	store i64 %r558, i64* %i
	%r559 = load i64* %i
	%r560 = mul i64 3, %r559
	store i64 %r560, i64* %i
	%r561 = load i64* %i
	%r562 = sdiv i64 %r561, 3
	store i64 %r562, i64* %i
	%r563 = load i64* %i
	%r564 = mul i64 %r563, 4
	store i64 %r564, i64* %i
	%r565 = load i64* %i
	%r566 = sdiv i64 %r565, 4
	store i64 %r566, i64* %i
	%r567 = load i64* %i
	%r568 = add i64 %r567, 1
	store i64 %r568, i64* %i
	br label %LU58
LU57:
	%r569 = load i64* %sum
	store i64 %r569, i64* %.ret
	br label %LU56
LU56:
	%r542 = load i64* %.ret
	ret i64 %r542
}

define i64 @iterativeFibonacci (i64 %r570) {
LU60:
	%previous = alloca i64
	%result = alloca i64
	%count = alloca i64
	%i = alloca i64
	%sum = alloca i64
	%.ret = alloca i64
	%number = alloca i64
	store i64 %r570, i64* %number
	%r572 = sub i64 0, 1
	store i64 %r572, i64* %previous
	store i64 1, i64* %result
	store i64 0, i64* %i
	br label %LU63
LU63:
	%r573 = load i64* %i
	%r574 = load i64* %number
	%r575 = icmp slt i64 %r573, %r574
	br i1 %r575, label %LU64, label %LU62
LU64:
	%r576 = load i64* %result
	%r577 = load i64* %previous
	%r578 = add i64 %r576, %r577
	store i64 %r578, i64* %sum
	%r579 = load i64* %result
	store i64 %r579, i64* %previous
	%r580 = load i64* %sum
	store i64 %r580, i64* %result
	%r581 = load i64* %i
	%r582 = add i64 %r581, 1
	store i64 %r582, i64* %i
	br label %LU63
LU62:
	%r583 = load i64* %result
	store i64 %r583, i64* %.ret
	br label %LU61
LU61:
	%r571 = load i64* %.ret
	ret i64 %r571
}

define i64 @recursiveFibonacci (i64 %r584) {
LU65:
	%.ret = alloca i64
	%number = alloca i64
	store i64 %r584, i64* %number
	%r586 = load i64* %number
	%r587 = icmp sle i64 %r586, 0
	%r588 = load i64* %number
	%r589 = icmp eq i64 %r588, 1
	%r590 = or i1 %r587, %r589
	br i1 %r590, label %LU68, label %LU69
LU68:
	%r591 = load i64* %number
	store i64 %r591, i64* %.ret
	br label %LU66
LU69:
	%r592 = load i64* %number
	%r593 = sub i64 %r592, 1
	%r594 = call i64 @recursiveFibonacci(i64 %r593)
	%r595 = load i64* %number
	%r596 = sub i64 %r595, 2
	%r597 = call i64 @recursiveFibonacci(i64 %r596)
	%r598 = add i64 %r594, %r597
	store i64 %r598, i64* %.ret
	br label %LU66
LU66:
	%r585 = load i64* %.ret
	ret i64 %r585
}

define i64 @main () {
LU70:
	%input = alloca i64
	%result = alloca i64
	%i = alloca i64
	%.ret = alloca i64
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r600 = load i64* @.read_scratch
	store i64 %r600, i64* %input
	store i64 1, i64* %i
	br label %LU73
LU73:
	%r601 = load i64* %i
	%r602 = load i64* %input
	%r603 = icmp slt i64 %r601, %r602
	br i1 %r603, label %LU74, label %LU72
LU74:
	%r604 = call i64 @constantFolding()
	store i64 %r604, i64* %result
	%r605 = load i64* %result
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r605)
	%r606 = call i64 @constantPropagation()
	store i64 %r606, i64* %result
	%r607 = load i64* %result
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r607)
	%r608 = call i64 @deadCodeElimination()
	store i64 %r608, i64* %result
	%r609 = load i64* %result
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r609)
	%r610 = call i64 @interProceduralOptimization()
	store i64 %r610, i64* %result
	%r611 = load i64* %result
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r611)
	%r612 = call i64 @commonSubexpressionElimination()
	store i64 %r612, i64* %result
	%r613 = load i64* %result
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r613)
	%r614 = call i64 @hoisting()
	store i64 %r614, i64* %result
	%r615 = load i64* %result
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r615)
	%r616 = call i64 @doubleIf()
	store i64 %r616, i64* %result
	%r617 = load i64* %result
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r617)
	%r618 = call i64 @integerDivide()
	store i64 %r618, i64* %result
	%r619 = load i64* %result
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r619)
	%r620 = call i64 @association()
	store i64 %r620, i64* %result
	%r621 = load i64* %result
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r621)
	%r622 = load i64* %input
	%r623 = sdiv i64 %r622, 1000
	%r624 = call i64 @tailRecursion(i64 %r623)
	store i64 %r624, i64* %result
	%r625 = load i64* %result
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r625)
	%r626 = call i64 @unswitching()
	store i64 %r626, i64* %result
	%r627 = load i64* %result
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r627)
	%r628 = load i64* %input
	%r629 = call i64 @randomCalculation(i64 %r628)
	store i64 %r629, i64* %result
	%r630 = load i64* %result
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r630)
	%r631 = load i64* %input
	%r632 = sdiv i64 %r631, 5
	%r633 = call i64 @iterativeFibonacci(i64 %r632)
	store i64 %r633, i64* %result
	%r634 = load i64* %result
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r634)
	%r635 = load i64* %input
	%r636 = sdiv i64 %r635, 1000
	%r637 = call i64 @recursiveFibonacci(i64 %r636)
	store i64 %r637, i64* %result
	%r638 = load i64* %result
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r638)
	%r639 = load i64* %i
	%r640 = add i64 %r639, 1
	store i64 %r640, i64* %i
	br label %LU73
LU72:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 9999)
	store i64 0, i64* %.ret
	br label %LU71
LU71:
	%r599 = load i64* %.ret
	ret i64 %r599
}

