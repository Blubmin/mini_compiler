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
	%r167 = load i64* %number
	%r168 = icmp sgt i64 %r167, 0
	br i1 %r168, label %LU10, label %LU8
LU8:
	%r169 = load i64* %total
	store i64 %r169, i64* %.ret
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
	%r171 = load i64* %a
	%r172 = load i64* %b
	%r173 = add i64 %r171, %r172
	store i64 %r173, i64* %.ret
	br label %LU12
LU12:
	%r170 = load i64* %.ret
	ret i64 %r170
}

define i64 @interProceduralOptimization () {
LU13:
	%a = alloca i64
	%.ret = alloca i64
	store i64 1, i64* @global1
	store i64 0, i64* @global2
	store i64 0, i64* @global3
	%r175 = call i64 @sum(i64 100)
	store i64 %r175, i64* %a
	%r176 = load i64* @global1
	%r177 = icmp eq i64 %r176, 1
	br i1 %r177, label %LU16, label %LU17
LU16:
	%r178 = call i64 @sum(i64 10000)
	store i64 %r178, i64* %a
	br label %LU15
LU17:
	%r179 = load i64* @global2
	%r180 = icmp eq i64 %r179, 2
	br i1 %r180, label %LU19, label %LU18
LU19:
	%r181 = call i64 @sum(i64 20000)
	store i64 %r181, i64* %a
	br label %LU18
LU18:
	%r182 = load i64* @global3
	%r183 = icmp eq i64 %r182, 3
	br i1 %r183, label %LU21, label %LU20
LU21:
	%r184 = call i64 @sum(i64 30000)
	store i64 %r184, i64* %a
	br label %LU20
LU20:
	br label %LU15
LU15:
	%r185 = load i64* %a
	store i64 %r185, i64* %.ret
	br label %LU14
LU14:
	%r174 = load i64* %.ret
	ret i64 %r174
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
	%r187 = load i64* %a
	%r188 = load i64* %b
	%r189 = mul i64 %r187, %r188
	store i64 %r189, i64* %h
	%r190 = load i64* %c
	%r191 = load i64* %d
	%r192 = sdiv i64 %r190, %r191
	store i64 %r192, i64* %i
	%r193 = load i64* %e
	%r194 = load i64* %f
	%r195 = mul i64 %r193, %r194
	store i64 %r195, i64* %j
	%r196 = load i64* %a
	%r197 = load i64* %b
	%r198 = mul i64 %r196, %r197
	%r199 = load i64* %c
	%r200 = load i64* %d
	%r201 = sdiv i64 %r199, %r200
	%r202 = add i64 %r198, %r201
	%r203 = load i64* %e
	%r204 = load i64* %f
	%r205 = mul i64 %r203, %r204
	%r206 = sub i64 %r202, %r205
	%r207 = load i64* %g
	%r208 = add i64 %r206, %r207
	store i64 %r208, i64* %k
	%r209 = load i64* %a
	%r210 = load i64* %b
	%r211 = mul i64 %r209, %r210
	%r212 = load i64* %c
	%r213 = load i64* %d
	%r214 = sdiv i64 %r212, %r213
	%r215 = add i64 %r211, %r214
	%r216 = load i64* %e
	%r217 = load i64* %f
	%r218 = mul i64 %r216, %r217
	%r219 = sub i64 %r215, %r218
	%r220 = load i64* %g
	%r221 = add i64 %r219, %r220
	store i64 %r221, i64* %l
	%r222 = load i64* %a
	%r223 = load i64* %b
	%r224 = mul i64 %r222, %r223
	%r225 = load i64* %c
	%r226 = load i64* %d
	%r227 = sdiv i64 %r225, %r226
	%r228 = add i64 %r224, %r227
	%r229 = load i64* %e
	%r230 = load i64* %f
	%r231 = mul i64 %r229, %r230
	%r232 = sub i64 %r228, %r231
	%r233 = load i64* %g
	%r234 = add i64 %r232, %r233
	store i64 %r234, i64* %m
	%r235 = load i64* %a
	%r236 = load i64* %b
	%r237 = mul i64 %r235, %r236
	%r238 = load i64* %c
	%r239 = load i64* %d
	%r240 = sdiv i64 %r238, %r239
	%r241 = add i64 %r237, %r240
	%r242 = load i64* %e
	%r243 = load i64* %f
	%r244 = mul i64 %r242, %r243
	%r245 = sub i64 %r241, %r244
	%r246 = load i64* %g
	%r247 = add i64 %r245, %r246
	store i64 %r247, i64* %n
	%r248 = load i64* %a
	%r249 = load i64* %b
	%r250 = mul i64 %r248, %r249
	%r251 = load i64* %c
	%r252 = load i64* %d
	%r253 = sdiv i64 %r251, %r252
	%r254 = add i64 %r250, %r253
	%r255 = load i64* %e
	%r256 = load i64* %f
	%r257 = mul i64 %r255, %r256
	%r258 = sub i64 %r254, %r257
	%r259 = load i64* %g
	%r260 = add i64 %r258, %r259
	store i64 %r260, i64* %o
	%r261 = load i64* %a
	%r262 = load i64* %b
	%r263 = mul i64 %r261, %r262
	%r264 = load i64* %c
	%r265 = load i64* %d
	%r266 = sdiv i64 %r264, %r265
	%r267 = add i64 %r263, %r266
	%r268 = load i64* %e
	%r269 = load i64* %f
	%r270 = mul i64 %r268, %r269
	%r271 = sub i64 %r267, %r270
	%r272 = load i64* %g
	%r273 = add i64 %r271, %r272
	store i64 %r273, i64* %p
	%r274 = load i64* %a
	%r275 = load i64* %b
	%r276 = mul i64 %r274, %r275
	%r277 = load i64* %c
	%r278 = load i64* %d
	%r279 = sdiv i64 %r277, %r278
	%r280 = add i64 %r276, %r279
	%r281 = load i64* %e
	%r282 = load i64* %f
	%r283 = mul i64 %r281, %r282
	%r284 = sub i64 %r280, %r283
	%r285 = load i64* %g
	%r286 = add i64 %r284, %r285
	store i64 %r286, i64* %q
	%r287 = load i64* %a
	%r288 = load i64* %b
	%r289 = mul i64 %r287, %r288
	%r290 = load i64* %c
	%r291 = load i64* %d
	%r292 = sdiv i64 %r290, %r291
	%r293 = add i64 %r289, %r292
	%r294 = load i64* %e
	%r295 = load i64* %f
	%r296 = mul i64 %r294, %r295
	%r297 = sub i64 %r293, %r296
	%r298 = load i64* %g
	%r299 = add i64 %r297, %r298
	store i64 %r299, i64* %r
	%r300 = load i64* %a
	%r301 = load i64* %b
	%r302 = mul i64 %r300, %r301
	%r303 = load i64* %c
	%r304 = load i64* %d
	%r305 = sdiv i64 %r303, %r304
	%r306 = add i64 %r302, %r305
	%r307 = load i64* %e
	%r308 = load i64* %f
	%r309 = mul i64 %r307, %r308
	%r310 = sub i64 %r306, %r309
	%r311 = load i64* %g
	%r312 = add i64 %r310, %r311
	store i64 %r312, i64* %s
	%r313 = load i64* %a
	%r314 = load i64* %b
	%r315 = mul i64 %r313, %r314
	%r316 = load i64* %c
	%r317 = load i64* %d
	%r318 = sdiv i64 %r316, %r317
	%r319 = add i64 %r315, %r318
	%r320 = load i64* %e
	%r321 = load i64* %f
	%r322 = mul i64 %r320, %r321
	%r323 = sub i64 %r319, %r322
	%r324 = load i64* %g
	%r325 = add i64 %r323, %r324
	store i64 %r325, i64* %t
	%r326 = load i64* %a
	%r327 = load i64* %b
	%r328 = mul i64 %r326, %r327
	%r329 = load i64* %c
	%r330 = load i64* %d
	%r331 = sdiv i64 %r329, %r330
	%r332 = add i64 %r328, %r331
	%r333 = load i64* %e
	%r334 = load i64* %f
	%r335 = mul i64 %r333, %r334
	%r336 = sub i64 %r332, %r335
	%r337 = load i64* %g
	%r338 = add i64 %r336, %r337
	store i64 %r338, i64* %u
	%r339 = load i64* %b
	%r340 = load i64* %a
	%r341 = mul i64 %r339, %r340
	%r342 = load i64* %c
	%r343 = load i64* %d
	%r344 = sdiv i64 %r342, %r343
	%r345 = add i64 %r341, %r344
	%r346 = load i64* %e
	%r347 = load i64* %f
	%r348 = mul i64 %r346, %r347
	%r349 = sub i64 %r345, %r348
	%r350 = load i64* %g
	%r351 = add i64 %r349, %r350
	store i64 %r351, i64* %v
	%r352 = load i64* %a
	%r353 = load i64* %b
	%r354 = mul i64 %r352, %r353
	%r355 = load i64* %c
	%r356 = load i64* %d
	%r357 = sdiv i64 %r355, %r356
	%r358 = add i64 %r354, %r357
	%r359 = load i64* %f
	%r360 = load i64* %e
	%r361 = mul i64 %r359, %r360
	%r362 = sub i64 %r358, %r361
	%r363 = load i64* %g
	%r364 = add i64 %r362, %r363
	store i64 %r364, i64* %w
	%r365 = load i64* %g
	%r366 = load i64* %a
	%r367 = load i64* %b
	%r368 = mul i64 %r366, %r367
	%r369 = add i64 %r365, %r368
	%r370 = load i64* %c
	%r371 = load i64* %d
	%r372 = sdiv i64 %r370, %r371
	%r373 = add i64 %r369, %r372
	%r374 = load i64* %e
	%r375 = load i64* %f
	%r376 = mul i64 %r374, %r375
	%r377 = sub i64 %r373, %r376
	store i64 %r377, i64* %x
	%r378 = load i64* %a
	%r379 = load i64* %b
	%r380 = mul i64 %r378, %r379
	%r381 = load i64* %c
	%r382 = load i64* %d
	%r383 = sdiv i64 %r381, %r382
	%r384 = add i64 %r380, %r383
	%r385 = load i64* %e
	%r386 = load i64* %f
	%r387 = mul i64 %r385, %r386
	%r388 = sub i64 %r384, %r387
	%r389 = load i64* %g
	%r390 = add i64 %r388, %r389
	store i64 %r390, i64* %y
	%r391 = load i64* %c
	%r392 = load i64* %d
	%r393 = sdiv i64 %r391, %r392
	%r394 = load i64* %a
	%r395 = load i64* %b
	%r396 = mul i64 %r394, %r395
	%r397 = add i64 %r393, %r396
	%r398 = load i64* %e
	%r399 = load i64* %f
	%r400 = mul i64 %r398, %r399
	%r401 = sub i64 %r397, %r400
	%r402 = load i64* %g
	%r403 = add i64 %r401, %r402
	store i64 %r403, i64* %z
	%r404 = load i64* %a
	%r405 = load i64* %b
	%r406 = add i64 %r404, %r405
	%r407 = load i64* %c
	%r408 = add i64 %r406, %r407
	%r409 = load i64* %d
	%r410 = add i64 %r408, %r409
	%r411 = load i64* %e
	%r412 = add i64 %r410, %r411
	%r413 = load i64* %f
	%r414 = add i64 %r412, %r413
	%r415 = load i64* %g
	%r416 = add i64 %r414, %r415
	%r417 = load i64* %h
	%r418 = add i64 %r416, %r417
	%r419 = load i64* %i
	%r420 = add i64 %r418, %r419
	%r421 = load i64* %j
	%r422 = add i64 %r420, %r421
	%r423 = load i64* %k
	%r424 = add i64 %r422, %r423
	%r425 = load i64* %l
	%r426 = add i64 %r424, %r425
	%r427 = load i64* %m
	%r428 = add i64 %r426, %r427
	%r429 = load i64* %n
	%r430 = add i64 %r428, %r429
	%r431 = load i64* %o
	%r432 = add i64 %r430, %r431
	%r433 = load i64* %p
	%r434 = add i64 %r432, %r433
	%r435 = load i64* %q
	%r436 = add i64 %r434, %r435
	%r437 = load i64* %r
	%r438 = add i64 %r436, %r437
	%r439 = load i64* %s
	%r440 = add i64 %r438, %r439
	%r441 = load i64* %t
	%r442 = add i64 %r440, %r441
	%r443 = load i64* %u
	%r444 = add i64 %r442, %r443
	%r445 = load i64* %v
	%r446 = add i64 %r444, %r445
	%r447 = load i64* %w
	%r448 = add i64 %r446, %r447
	%r449 = load i64* %x
	%r450 = add i64 %r448, %r449
	%r451 = load i64* %y
	%r452 = add i64 %r450, %r451
	%r453 = load i64* %z
	%r454 = add i64 %r452, %r453
	store i64 %r454, i64* %.ret
	br label %LU23
LU23:
	%r186 = load i64* %.ret
	ret i64 %r186
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
	%r456 = load i64* %i
	%r457 = icmp slt i64 %r456, 1000000
	br i1 %r457, label %LU28, label %LU26
LU28:
	store i64 5, i64* %e
	%r458 = load i64* %a
	%r459 = load i64* %b
	%r460 = add i64 %r458, %r459
	%r461 = load i64* %c
	%r462 = add i64 %r460, %r461
	store i64 %r462, i64* %g
	%r463 = load i64* %c
	%r464 = load i64* %d
	%r465 = add i64 %r463, %r464
	%r466 = load i64* %g
	%r467 = add i64 %r465, %r466
	store i64 %r467, i64* %h
	%r468 = load i64* %i
	%r469 = add i64 %r468, 1
	store i64 %r469, i64* %i
	%r470 = load i64* %i
	%r471 = icmp slt i64 %r470, 1000000
	br i1 %r471, label %LU28, label %LU26
LU26:
	%r472 = load i64* %b
	store i64 %r472, i64* %.ret
	br label %LU25
LU25:
	%r455 = load i64* %.ret
	ret i64 %r455
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
	%r474 = load i64* %a
	%r475 = icmp eq i64 %r474, 1
	br i1 %r475, label %LU32, label %LU31
LU32:
	store i64 20, i64* %b
	%r476 = load i64* %a
	%r477 = icmp eq i64 %r476, 1
	br i1 %r477, label %LU34, label %LU35
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
	%r478 = load i64* %d
	store i64 %r478, i64* %.ret
	br label %LU30
LU30:
	%r473 = load i64* %.ret
	ret i64 %r473
}

define i64 @integerDivide () {
LU36:
	%a = alloca i64
	%.ret = alloca i64
	store i64 3000, i64* %a
	%r480 = load i64* %a
	%r481 = sdiv i64 %r480, 2
	store i64 %r481, i64* %a
	%r482 = load i64* %a
	%r483 = mul i64 %r482, 4
	store i64 %r483, i64* %a
	%r484 = load i64* %a
	%r485 = sdiv i64 %r484, 8
	store i64 %r485, i64* %a
	%r486 = load i64* %a
	%r487 = sdiv i64 %r486, 16
	store i64 %r487, i64* %a
	%r488 = load i64* %a
	%r489 = mul i64 %r488, 32
	store i64 %r489, i64* %a
	%r490 = load i64* %a
	%r491 = sdiv i64 %r490, 64
	store i64 %r491, i64* %a
	%r492 = load i64* %a
	%r493 = mul i64 %r492, 128
	store i64 %r493, i64* %a
	%r494 = load i64* %a
	%r495 = sdiv i64 %r494, 4
	store i64 %r495, i64* %a
	%r496 = load i64* %a
	store i64 %r496, i64* %.ret
	br label %LU37
LU37:
	%r479 = load i64* %.ret
	ret i64 %r479
}

define i64 @association () {
LU38:
	%a = alloca i64
	%.ret = alloca i64
	store i64 10, i64* %a
	%r498 = load i64* %a
	%r499 = mul i64 %r498, 2
	store i64 %r499, i64* %a
	%r500 = load i64* %a
	%r501 = sdiv i64 %r500, 2
	store i64 %r501, i64* %a
	%r502 = load i64* %a
	%r503 = mul i64 3, %r502
	store i64 %r503, i64* %a
	%r504 = load i64* %a
	%r505 = sdiv i64 %r504, 3
	store i64 %r505, i64* %a
	%r506 = load i64* %a
	%r507 = mul i64 %r506, 4
	store i64 %r507, i64* %a
	%r508 = load i64* %a
	%r509 = sdiv i64 %r508, 4
	store i64 %r509, i64* %a
	%r510 = load i64* %a
	%r511 = add i64 %r510, 4
	store i64 %r511, i64* %a
	%r512 = load i64* %a
	%r513 = sub i64 %r512, 4
	store i64 %r513, i64* %a
	%r514 = load i64* %a
	%r515 = mul i64 %r514, 50
	store i64 %r515, i64* %a
	%r516 = load i64* %a
	%r517 = sdiv i64 %r516, 50
	store i64 %r517, i64* %a
	%r518 = load i64* %a
	store i64 %r518, i64* %.ret
	br label %LU39
LU39:
	%r497 = load i64* %.ret
	ret i64 %r497
}

define i64 @tailRecursionHelper (i64 %r519, i64 %r520) {
LU40:
	%.ret = alloca i64
	%value = alloca i64
	store i64 %r519, i64* %value
	%sum = alloca i64
	store i64 %r520, i64* %sum
	%r522 = load i64* %value
	%r523 = icmp eq i64 %r522, 0
	br i1 %r523, label %LU43, label %LU44
LU43:
	%r524 = load i64* %sum
	store i64 %r524, i64* %.ret
	br label %LU41
LU44:
	%r525 = load i64* %value
	%r526 = sub i64 %r525, 1
	%r527 = load i64* %sum
	%r528 = load i64* %value
	%r529 = add i64 %r527, %r528
	%r530 = call i64 @tailRecursionHelper(i64 %r526, i64 %r529)
	store i64 %r530, i64* %.ret
	br label %LU41
LU41:
	%r521 = load i64* %.ret
	ret i64 %r521
}

define i64 @tailRecursion (i64 %r531) {
LU45:
	%.ret = alloca i64
	%value = alloca i64
	store i64 %r531, i64* %value
	%r533 = load i64* %value
	%r534 = call i64 @tailRecursionHelper(i64 %r533, i64 0)
	store i64 %r534, i64* %.ret
	br label %LU46
LU46:
	%r532 = load i64* %.ret
	ret i64 %r532
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
	%r536 = load i64* %a
	%r537 = icmp slt i64 %r536, 1000000
	br i1 %r537, label %LU51, label %LU49
LU51:
	%r538 = load i64* %b
	%r539 = icmp eq i64 %r538, 2
	br i1 %r539, label %LU53, label %LU54
LU53:
	%r540 = load i64* %a
	%r541 = add i64 %r540, 1
	store i64 %r541, i64* %a
	br label %LU52
LU54:
	%r542 = load i64* %a
	%r543 = add i64 %r542, 2
	store i64 %r543, i64* %a
	br label %LU52
LU52:
	%r544 = load i64* %a
	%r545 = icmp slt i64 %r544, 1000000
	br i1 %r545, label %LU51, label %LU49
LU49:
	%r546 = load i64* %a
	store i64 %r546, i64* %.ret
	br label %LU48
LU48:
	%r535 = load i64* %.ret
	ret i64 %r535
}

define i64 @randomCalculation (i64 %r547) {
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
	store i64 %r547, i64* %number
	store i64 0, i64* %i
	store i64 0, i64* %sum
	br label %LU58
LU58:
	%r549 = load i64* %i
	%r550 = load i64* %number
	%r551 = icmp slt i64 %r549, %r550
	br i1 %r551, label %LU59, label %LU57
LU59:
	store i64 4, i64* %a
	store i64 7, i64* %b
	store i64 8, i64* %c
	%r552 = load i64* %a
	%r553 = load i64* %b
	%r554 = add i64 %r552, %r553
	store i64 %r554, i64* %d
	%r555 = load i64* %d
	%r556 = load i64* %c
	%r557 = add i64 %r555, %r556
	store i64 %r557, i64* %e
	%r558 = load i64* %sum
	%r559 = load i64* %e
	%r560 = add i64 %r558, %r559
	store i64 %r560, i64* %sum
	%r561 = load i64* %i
	%r562 = mul i64 %r561, 2
	store i64 %r562, i64* %i
	%r563 = load i64* %i
	%r564 = sdiv i64 %r563, 2
	store i64 %r564, i64* %i
	%r565 = load i64* %i
	%r566 = mul i64 3, %r565
	store i64 %r566, i64* %i
	%r567 = load i64* %i
	%r568 = sdiv i64 %r567, 3
	store i64 %r568, i64* %i
	%r569 = load i64* %i
	%r570 = mul i64 %r569, 4
	store i64 %r570, i64* %i
	%r571 = load i64* %i
	%r572 = sdiv i64 %r571, 4
	store i64 %r572, i64* %i
	%r573 = load i64* %i
	%r574 = add i64 %r573, 1
	store i64 %r574, i64* %i
	%r575 = load i64* %i
	%r576 = load i64* %number
	%r577 = icmp slt i64 %r575, %r576
	br i1 %r577, label %LU59, label %LU57
LU57:
	%r578 = load i64* %sum
	store i64 %r578, i64* %.ret
	br label %LU56
LU56:
	%r548 = load i64* %.ret
	ret i64 %r548
}

define i64 @iterativeFibonacci (i64 %r579) {
LU60:
	%previous = alloca i64
	%result = alloca i64
	%count = alloca i64
	%i = alloca i64
	%sum = alloca i64
	%.ret = alloca i64
	%number = alloca i64
	store i64 %r579, i64* %number
	%r581 = sub i64 0, 1
	store i64 %r581, i64* %previous
	store i64 1, i64* %result
	store i64 0, i64* %i
	br label %LU63
LU63:
	%r582 = load i64* %i
	%r583 = load i64* %number
	%r584 = icmp slt i64 %r582, %r583
	br i1 %r584, label %LU64, label %LU62
LU64:
	%r585 = load i64* %result
	%r586 = load i64* %previous
	%r587 = add i64 %r585, %r586
	store i64 %r587, i64* %sum
	%r588 = load i64* %result
	store i64 %r588, i64* %previous
	%r589 = load i64* %sum
	store i64 %r589, i64* %result
	%r590 = load i64* %i
	%r591 = add i64 %r590, 1
	store i64 %r591, i64* %i
	%r592 = load i64* %i
	%r593 = load i64* %number
	%r594 = icmp slt i64 %r592, %r593
	br i1 %r594, label %LU64, label %LU62
LU62:
	%r595 = load i64* %result
	store i64 %r595, i64* %.ret
	br label %LU61
LU61:
	%r580 = load i64* %.ret
	ret i64 %r580
}

define i64 @recursiveFibonacci (i64 %r596) {
LU65:
	%.ret = alloca i64
	%number = alloca i64
	store i64 %r596, i64* %number
	%r598 = load i64* %number
	%r599 = icmp sle i64 %r598, 0
	%r600 = load i64* %number
	%r601 = icmp eq i64 %r600, 1
	%r602 = or i1 %r599, %r601
	br i1 %r602, label %LU68, label %LU69
LU68:
	%r603 = load i64* %number
	store i64 %r603, i64* %.ret
	br label %LU66
LU69:
	%r604 = load i64* %number
	%r605 = sub i64 %r604, 1
	%r606 = call i64 @recursiveFibonacci(i64 %r605)
	%r607 = load i64* %number
	%r608 = sub i64 %r607, 2
	%r609 = call i64 @recursiveFibonacci(i64 %r608)
	%r610 = add i64 %r606, %r609
	store i64 %r610, i64* %.ret
	br label %LU66
LU66:
	%r597 = load i64* %.ret
	ret i64 %r597
}

define i64 @main () {
LU70:
	%input = alloca i64
	%result = alloca i64
	%i = alloca i64
	%.ret = alloca i64
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r612 = load i64* @.read_scratch
	store i64 %r612, i64* %input
	store i64 1, i64* %i
	br label %LU73
LU73:
	%r613 = load i64* %i
	%r614 = load i64* %input
	%r615 = icmp slt i64 %r613, %r614
	br i1 %r615, label %LU74, label %LU72
LU74:
	%r616 = call i64 @constantFolding()
	store i64 %r616, i64* %result
	%r617 = load i64* %result
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r617)
	%r618 = call i64 @constantPropagation()
	store i64 %r618, i64* %result
	%r619 = load i64* %result
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r619)
	%r620 = call i64 @deadCodeElimination()
	store i64 %r620, i64* %result
	%r621 = load i64* %result
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r621)
	%r622 = call i64 @interProceduralOptimization()
	store i64 %r622, i64* %result
	%r623 = load i64* %result
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r623)
	%r624 = call i64 @commonSubexpressionElimination()
	store i64 %r624, i64* %result
	%r625 = load i64* %result
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r625)
	%r626 = call i64 @hoisting()
	store i64 %r626, i64* %result
	%r627 = load i64* %result
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r627)
	%r628 = call i64 @doubleIf()
	store i64 %r628, i64* %result
	%r629 = load i64* %result
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r629)
	%r630 = call i64 @integerDivide()
	store i64 %r630, i64* %result
	%r631 = load i64* %result
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r631)
	%r632 = call i64 @association()
	store i64 %r632, i64* %result
	%r633 = load i64* %result
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r633)
	%r634 = load i64* %input
	%r635 = sdiv i64 %r634, 1000
	%r636 = call i64 @tailRecursion(i64 %r635)
	store i64 %r636, i64* %result
	%r637 = load i64* %result
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r637)
	%r638 = call i64 @unswitching()
	store i64 %r638, i64* %result
	%r639 = load i64* %result
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r639)
	%r640 = load i64* %input
	%r641 = call i64 @randomCalculation(i64 %r640)
	store i64 %r641, i64* %result
	%r642 = load i64* %result
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r642)
	%r643 = load i64* %input
	%r644 = sdiv i64 %r643, 5
	%r645 = call i64 @iterativeFibonacci(i64 %r644)
	store i64 %r645, i64* %result
	%r646 = load i64* %result
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r646)
	%r647 = load i64* %input
	%r648 = sdiv i64 %r647, 1000
	%r649 = call i64 @recursiveFibonacci(i64 %r648)
	store i64 %r649, i64* %result
	%r650 = load i64* %result
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r650)
	%r651 = load i64* %i
	%r652 = add i64 %r651, 1
	store i64 %r652, i64* %i
	%r653 = load i64* %i
	%r654 = load i64* %input
	%r655 = icmp slt i64 %r653, %r654
	br i1 %r655, label %LU74, label %LU72
LU72:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 9999)
	store i64 0, i64* %.ret
	br label %LU71
LU71:
	%r611 = load i64* %.ret
	ret i64 %r611
}

