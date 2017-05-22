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
LU1:
	ret i64 226
}

define i64 @constantPropagation () {
LU3:
	ret i64 -654525983689197
}

define i64 @deadCodeElimination () {
LU4:
	store i64 11, i64* @global1
	store i64 5, i64* @global1
	store i64 9, i64* @global1
	ret i64 38
}

define i64 @sum (i64 %r76) {
LU6:
	%r77 = icmp sgt i64 %r76, 0
	br i1 %r77, label %LU10, label %LU8
LU10:
	%r79 = phi i64 [ %r76, %LU6 ], [ %r81, %LU10 ]
	%r78 = phi i64 [ 0, %LU6 ], [ %r80, %LU10 ]
	%r80 = add i64 %r78, %r79
	%r81 = sub i64 %r79, 1
	%r82 = icmp sgt i64 %r81, 0
	br i1 %r82, label %LU10, label %LU8
LU8:
	%r83 = phi i64 [ 0, %LU6 ], [ %r80, %LU10 ]
	ret i64 %r83
}

define i64 @doesntModifyGlobals () {
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
	ret i64 %r99
}

define i64 @commonSubexpressionElimination () {
LU23:
	ret i64 -48796
}

define i64 @hoisting () {
LU27:
	br label %LU28
LU28:
	%r238 = phi i64 [ 0, %LU27 ], [ %r239, %LU28 ]
	%r239 = add i64 %r238, 1
	%r240 = icmp slt i64 %r239, 1000000
	br i1 %r240, label %LU28, label %LU25
LU25:
	ret i64 2
}

define i64 @doubleIf () {
LU30:
	ret i64 50
}

define i64 @integerDivide () {
LU37:
	ret i64 736
}

define i64 @association () {
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
	ret i64 %r277
}

define i64 @unswitching () {
LU50:
	br label %LU51
LU51:
	%r282 = phi i64 [ 1, %LU50 ], [ %r283, %LU51 ]
	%r283 = add i64 %r282, 1
	%r286 = icmp slt i64 %r283, 1000000
	br i1 %r286, label %LU51, label %LU48
LU48:
	ret i64 %r283
}

define i64 @randomCalculation (i64 %r290) {
LU55:
	%r291 = icmp slt i64 0, %r290
	br i1 %r291, label %LU59, label %LU57
LU59:
	%r301 = phi i64 [ 0, %LU55 ], [ %r308, %LU59 ]
	%r299 = phi i64 [ 0, %LU55 ], [ %r300, %LU59 ]
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
	%r311 = phi i64 [ 0, %LU55 ], [ %r300, %LU59 ]
	ret i64 %r311
}

define i64 @iterativeFibonacci (i64 %r313) {
LU60:
	%r315 = icmp slt i64 0, %r313
	br i1 %r315, label %LU64, label %LU62
LU64:
	%r320 = phi i64 [ 0, %LU60 ], [ %r321, %LU64 ]
	%r317 = phi i64 [ -1, %LU60 ], [ %r316, %LU64 ]
	%r316 = phi i64 [ 1, %LU60 ], [ %r318, %LU64 ]
	%r318 = add i64 %r316, %r317
	%r321 = add i64 %r320, 1
	%r323 = icmp slt i64 %r321, %r313
	br i1 %r323, label %LU64, label %LU62
LU62:
	%r324 = phi i64 [ 1, %LU60 ], [ %r318, %LU64 ]
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
	%r338 = icmp slt i64 1, %r337
	br i1 %r338, label %LU74, label %LU72
LU74:
	%r358 = phi i64 [ 1, %LU70 ], [ %r359, %LU74 ]
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
	ret i64 0
}

