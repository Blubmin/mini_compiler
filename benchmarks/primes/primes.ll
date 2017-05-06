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



define i64 @isqrt (i64 %r0) {
LU0:
	%square = alloca i64
	%delta = alloca i64
	%.ret = alloca i64
	%a = alloca i64
	store i64 %r0, i64* %a
	store i64 1, i64* %square
	store i64 3, i64* %delta
	br label %LU3
LU3:
	%r2 = load i64* %square
	%r3 = load i64* %a
	%r4 = icmp sle i64 %r2, %r3
	br i1 %r4, label %LU4, label %LU2
LU4:
	%r5 = load i64* %square
	%r6 = load i64* %delta
	%r7 = add i64 %r5, %r6
	store i64 %r7, i64* %square
	%r8 = load i64* %delta
	%r9 = add i64 %r8, 2
	store i64 %r9, i64* %delta
	%r10 = load i64* %square
	%r11 = load i64* %a
	%r12 = icmp sle i64 %r10, %r11
	br i1 %r12, label %LU4, label %LU2
LU2:
	%r13 = load i64* %delta
	%r14 = sdiv i64 %r13, 2
	%r15 = sub i64 %r14, 1
	store i64 %r15, i64* %.ret
	br label %LU1
LU1:
	%r1 = load i64* %.ret
	ret i64 %r1
}

define i64 @prime (i64 %r16) {
LU5:
	%max = alloca i64
	%divisor = alloca i64
	%remainder = alloca i64
	%.ret = alloca i64
	%a = alloca i64
	store i64 %r16, i64* %a
	%r18 = load i64* %a
	%r19 = icmp slt i64 %r18, 2
	br i1 %r19, label %LU8, label %LU9
LU8:
	store i64 0, i64* %.ret
	br label %LU6
LU9:
	%r20 = load i64* %a
	%r21 = call i64 @isqrt(i64 %r20)
	store i64 %r21, i64* %max
	store i64 2, i64* %divisor
	br label %LU11
LU11:
	%r22 = load i64* %divisor
	%r23 = load i64* %max
	%r24 = icmp sle i64 %r22, %r23
	br i1 %r24, label %LU12, label %LU10
LU12:
	%r25 = load i64* %a
	%r26 = load i64* %a
	%r27 = load i64* %divisor
	%r28 = sdiv i64 %r26, %r27
	%r29 = load i64* %divisor
	%r30 = mul i64 %r28, %r29
	%r31 = sub i64 %r25, %r30
	store i64 %r31, i64* %remainder
	%r32 = load i64* %remainder
	%r33 = icmp eq i64 %r32, 0
	br i1 %r33, label %LU14, label %LU13
LU14:
	store i64 0, i64* %.ret
	br label %LU6
LU13:
	%r34 = load i64* %divisor
	%r35 = add i64 %r34, 1
	store i64 %r35, i64* %divisor
	%r36 = load i64* %divisor
	%r37 = load i64* %max
	%r38 = icmp sle i64 %r36, %r37
	br i1 %r38, label %LU12, label %LU10
LU10:
	store i64 1, i64* %.ret
	br label %LU6
LU6:
	%r17 = load i64* %.ret
	ret i64 %r17
}

define i64 @main () {
LU15:
	%limit = alloca i64
	%a = alloca i64
	%.ret = alloca i64
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r40 = load i64* @.read_scratch
	store i64 %r40, i64* %limit
	store i64 0, i64* %a
	br label %LU18
LU18:
	%r41 = load i64* %a
	%r42 = load i64* %limit
	%r43 = icmp sle i64 %r41, %r42
	br i1 %r43, label %LU19, label %LU17
LU19:
	%r44 = load i64* %a
	%r45 = call i64 @prime(i64 %r44)
	%r47 = trunc i64 %r45 to i1
	br i1 %r47, label %LU21, label %LU20
LU21:
	%r46 = load i64* %a
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r46)
	br label %LU20
LU20:
	%r48 = load i64* %a
	%r49 = add i64 %r48, 1
	store i64 %r49, i64* %a
	%r50 = load i64* %a
	%r51 = load i64* %limit
	%r52 = icmp sle i64 %r50, %r51
	br i1 %r52, label %LU19, label %LU17
LU17:
	store i64 0, i64* %.ret
	br label %LU16
LU16:
	%r39 = load i64* %.ret
	ret i64 %r39
}

