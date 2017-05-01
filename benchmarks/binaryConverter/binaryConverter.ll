declare i8* @malloc(i64)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.printhex = private unnamed_addr constant [6 x i8] c"0x%X\0A\00", align 1
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
	br label %LU3
LU2:
	store i64 0, i64* %.ret
	br label %LU1
LU1:
	%r1 = load i64* %.ret
	ret i64 %r1
}

define i64 @power (i64 %r6, i64 %r7) {
LU5:
	%product = alloca i64
	%.ret = alloca i64
	%base = alloca i64
	store i64 %r6, i64* %base
	%exponent = alloca i64
	store i64 %r7, i64* %exponent
	store i64 1, i64* %product
	br label %LU8
LU8:
	%r9 = load i64* %exponent
	%r10 = icmp sgt i64 %r9, 0
	br i1 %r10, label %LU9, label %LU7
LU9:
	%r11 = load i64* %product
	%r12 = load i64* %base
	%r13 = mul i64 %r11, %r12
	store i64 %r13, i64* %product
	%r14 = load i64* %exponent
	%r15 = sub i64 %r14, 1
	store i64 %r15, i64* %exponent
	br label %LU8
LU7:
	%r16 = load i64* %product
	store i64 %r16, i64* %.ret
	br label %LU6
LU6:
	%r8 = load i64* %.ret
	ret i64 %r8
}

define i64 @recursiveDecimalSum (i64 %r17, i64 %r18, i64 %r19) {
LU10:
	%tempNum = alloca i64
	%base = alloca i64
	%remainder = alloca i64
	%.ret = alloca i64
	%binaryNum = alloca i64
	store i64 %r17, i64* %binaryNum
	%decimalSum = alloca i64
	store i64 %r18, i64* %decimalSum
	%recursiveDepth = alloca i64
	store i64 %r19, i64* %recursiveDepth
	%r21 = load i64* %binaryNum
	%r22 = icmp sgt i64 %r21, 0
	br i1 %r22, label %LU13, label %LU12
LU13:
	store i64 2, i64* %base
	%r23 = load i64* %binaryNum
	%r24 = sdiv i64 %r23, 10
	store i64 %r24, i64* %tempNum
	%r25 = load i64* %tempNum
	%r26 = mul i64 %r25, 10
	store i64 %r26, i64* %tempNum
	%r27 = load i64* %binaryNum
	%r28 = load i64* %tempNum
	%r29 = sub i64 %r27, %r28
	store i64 %r29, i64* %tempNum
	%r30 = load i64* %tempNum
	%r31 = icmp eq i64 %r30, 1
	br i1 %r31, label %LU15, label %LU14
LU15:
	%r32 = load i64* %decimalSum
	%r33 = load i64* %base
	%r34 = load i64* %recursiveDepth
	%r35 = call i64 @power(i64 %r33, i64 %r34)
	%r36 = add i64 %r32, %r35
	store i64 %r36, i64* %decimalSum
	br label %LU14
LU14:
	%r37 = load i64* %binaryNum
	%r38 = sdiv i64 %r37, 10
	%r39 = load i64* %decimalSum
	%r40 = load i64* %recursiveDepth
	%r41 = add i64 %r40, 1
	%r42 = call i64 @recursiveDecimalSum(i64 %r38, i64 %r39, i64 %r41)
	store i64 %r42, i64* %.ret
	br label %LU11
LU12:
	%r43 = load i64* %decimalSum
	store i64 %r43, i64* %.ret
	br label %LU11
LU11:
	%r20 = load i64* %.ret
	ret i64 %r20
}

define i64 @convertToDecimal (i64 %r44) {
LU16:
	%recursiveDepth = alloca i64
	%decimalSum = alloca i64
	%.ret = alloca i64
	%binaryNum = alloca i64
	store i64 %r44, i64* %binaryNum
	store i64 0, i64* %recursiveDepth
	store i64 0, i64* %decimalSum
	%r46 = load i64* %binaryNum
	%r47 = load i64* %decimalSum
	%r48 = load i64* %recursiveDepth
	%r49 = call i64 @recursiveDecimalSum(i64 %r46, i64 %r47, i64 %r48)
	store i64 %r49, i64* %.ret
	br label %LU17
LU17:
	%r45 = load i64* %.ret
	ret i64 %r45
}

define i64 @main () {
LU18:
	%number = alloca i64
	%waitTime = alloca i64
	%.ret = alloca i64
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r51 = load i64* @.read_scratch
	store i64 %r51, i64* %number
	%r52 = load i64* %number
	%r53 = call i64 @convertToDecimal(i64 %r52)
	store i64 %r53, i64* %number
	%r54 = load i64* %number
	%r55 = load i64* %number
	%r56 = mul i64 %r54, %r55
	store i64 %r56, i64* %waitTime
	br label %LU21
LU21:
	%r57 = load i64* %waitTime
	%r58 = icmp sgt i64 %r57, 0
	br i1 %r58, label %LU22, label %LU20
LU22:
	%r59 = load i64* %waitTime
	call i64 @wait(i64 %r59)
	%r60 = load i64* %waitTime
	%r61 = sub i64 %r60, 1
	store i64 %r61, i64* %waitTime
	br label %LU21
LU20:
	%r62 = load i64* %number
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r62)
	store i64 0, i64* %.ret
	br label %LU19
LU19:
	%r50 = load i64* %.ret
	ret i64 %r50
}

