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



define i64 @wait (i64 %r0) {
LU0:
	%.ret = alloca i64
	%waitTime = alloca i64
	store i64 %r0, i64* %waitTime
	br label %LU3
LU3:
	%r2 = load i64* %waitTime
	%r3 = icmp sgt i64 %r2, 0
	br i1 %r3, label %LU4, label %LU2
LU4:
	%r4 = load i64* %waitTime
	%r5 = sub i64 %r4, 1
	store i64 %r5, i64* %waitTime
	%r6 = load i64* %waitTime
	%r7 = icmp sgt i64 %r6, 0
	br i1 %r7, label %LU4, label %LU2
LU2:
	store i64 0, i64* %.ret
	br label %LU1
LU1:
	%r1 = load i64* %.ret
	ret i64 %r1
}

define i64 @power (i64 %r8, i64 %r9) {
LU5:
	%product = alloca i64
	%.ret = alloca i64
	%base = alloca i64
	store i64 %r8, i64* %base
	%exponent = alloca i64
	store i64 %r9, i64* %exponent
	store i64 1, i64* %product
	br label %LU8
LU8:
	%r11 = load i64* %exponent
	%r12 = icmp sgt i64 %r11, 0
	br i1 %r12, label %LU9, label %LU7
LU9:
	%r13 = load i64* %product
	%r14 = load i64* %base
	%r15 = mul i64 %r13, %r14
	store i64 %r15, i64* %product
	%r16 = load i64* %exponent
	%r17 = sub i64 %r16, 1
	store i64 %r17, i64* %exponent
	%r18 = load i64* %exponent
	%r19 = icmp sgt i64 %r18, 0
	br i1 %r19, label %LU9, label %LU7
LU7:
	%r20 = load i64* %product
	store i64 %r20, i64* %.ret
	br label %LU6
LU6:
	%r10 = load i64* %.ret
	ret i64 %r10
}

define i64 @recursiveDecimalSum (i64 %r21, i64 %r22, i64 %r23) {
LU10:
	%tempNum = alloca i64
	%base = alloca i64
	%remainder = alloca i64
	%.ret = alloca i64
	%binaryNum = alloca i64
	store i64 %r21, i64* %binaryNum
	%decimalSum = alloca i64
	store i64 %r22, i64* %decimalSum
	%recursiveDepth = alloca i64
	store i64 %r23, i64* %recursiveDepth
	%r25 = load i64* %binaryNum
	%r26 = icmp sgt i64 %r25, 0
	br i1 %r26, label %LU13, label %LU12
LU13:
	store i64 2, i64* %base
	%r27 = load i64* %binaryNum
	%r28 = sdiv i64 %r27, 10
	store i64 %r28, i64* %tempNum
	%r29 = load i64* %tempNum
	%r30 = mul i64 %r29, 10
	store i64 %r30, i64* %tempNum
	%r31 = load i64* %binaryNum
	%r32 = load i64* %tempNum
	%r33 = sub i64 %r31, %r32
	store i64 %r33, i64* %tempNum
	%r34 = load i64* %tempNum
	%r35 = icmp eq i64 %r34, 1
	br i1 %r35, label %LU15, label %LU14
LU15:
	%r36 = load i64* %decimalSum
	%r37 = load i64* %base
	%r38 = load i64* %recursiveDepth
	%r39 = call i64 @power(i64 %r37, i64 %r38)
	%r40 = add i64 %r36, %r39
	store i64 %r40, i64* %decimalSum
	br label %LU14
LU14:
	%r41 = load i64* %binaryNum
	%r42 = sdiv i64 %r41, 10
	%r43 = load i64* %decimalSum
	%r44 = load i64* %recursiveDepth
	%r45 = add i64 %r44, 1
	%r46 = call i64 @recursiveDecimalSum(i64 %r42, i64 %r43, i64 %r45)
	store i64 %r46, i64* %.ret
	br label %LU11
LU12:
	%r47 = load i64* %decimalSum
	store i64 %r47, i64* %.ret
	br label %LU11
LU11:
	%r24 = load i64* %.ret
	ret i64 %r24
}

define i64 @convertToDecimal (i64 %r48) {
LU16:
	%recursiveDepth = alloca i64
	%decimalSum = alloca i64
	%.ret = alloca i64
	%binaryNum = alloca i64
	store i64 %r48, i64* %binaryNum
	store i64 0, i64* %recursiveDepth
	store i64 0, i64* %decimalSum
	%r50 = load i64* %binaryNum
	%r51 = load i64* %decimalSum
	%r52 = load i64* %recursiveDepth
	%r53 = call i64 @recursiveDecimalSum(i64 %r50, i64 %r51, i64 %r52)
	store i64 %r53, i64* %.ret
	br label %LU17
LU17:
	%r49 = load i64* %.ret
	ret i64 %r49
}

define i64 @main () {
LU18:
	%number = alloca i64
	%waitTime = alloca i64
	%.ret = alloca i64
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r55 = load i64* @.read_scratch
	store i64 %r55, i64* %number
	%r56 = load i64* %number
	%r57 = call i64 @convertToDecimal(i64 %r56)
	store i64 %r57, i64* %number
	%r58 = load i64* %number
	%r59 = load i64* %number
	%r60 = mul i64 %r58, %r59
	store i64 %r60, i64* %waitTime
	br label %LU21
LU21:
	%r61 = load i64* %waitTime
	%r62 = icmp sgt i64 %r61, 0
	br i1 %r62, label %LU22, label %LU20
LU22:
	%r63 = load i64* %waitTime
	call i64 @wait(i64 %r63)
	%r64 = load i64* %waitTime
	%r65 = sub i64 %r64, 1
	store i64 %r65, i64* %waitTime
	%r66 = load i64* %waitTime
	%r67 = icmp sgt i64 %r66, 0
	br i1 %r67, label %LU22, label %LU20
LU20:
	%r68 = load i64* %number
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r68)
	store i64 0, i64* %.ret
	br label %LU19
LU19:
	%r54 = load i64* %.ret
	ret i64 %r54
}

