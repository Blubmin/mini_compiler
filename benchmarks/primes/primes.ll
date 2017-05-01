declare i8* @malloc(i64)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.printhex = private unnamed_addr constant [6 x i8] c"0x%X\0A\00", align 1
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
	br label %LU3
LU2:
	%r10 = load i64* %delta
	%r11 = sdiv i64 %r10, 2
	%r12 = sub i64 %r11, 1
	store i64 %r12, i64* %.ret
	br label %LU1
LU1:
	%r1 = load i64* %.ret
	ret i64 %r1
}

define i64 @prime (i64 %r13) {
LU5:
	%max = alloca i64
	%divisor = alloca i64
	%remainder = alloca i64
	%.ret = alloca i64
	%a = alloca i64
	store i64 %r13, i64* %a
	%r15 = load i64* %a
	%r16 = icmp slt i64 %r15, 2
	br i1 %r16, label %LU8, label %LU9
LU8:
	store i64 0, i64* %.ret
	br label %LU6
LU9:
	%r17 = load i64* %a
	%r18 = call i64 @isqrt(i64 %r17)
	store i64 %r18, i64* %max
	store i64 2, i64* %divisor
	br label %LU11
LU11:
	%r19 = load i64* %divisor
	%r20 = load i64* %max
	%r21 = icmp sle i64 %r19, %r20
	br i1 %r21, label %LU12, label %LU10
LU12:
	%r22 = load i64* %a
	%r23 = load i64* %a
	%r24 = load i64* %divisor
	%r25 = sdiv i64 %r23, %r24
	%r26 = load i64* %divisor
	%r27 = mul i64 %r25, %r26
	%r28 = sub i64 %r22, %r27
	store i64 %r28, i64* %remainder
	%r29 = load i64* %remainder
	%r30 = icmp eq i64 %r29, 0
	br i1 %r30, label %LU14, label %LU13
LU14:
	store i64 0, i64* %.ret
	br label %LU6
LU13:
	%r31 = load i64* %divisor
	%r32 = add i64 %r31, 1
	store i64 %r32, i64* %divisor
	br label %LU11
LU10:
	store i64 1, i64* %.ret
	br label %LU6
LU6:
	%r14 = load i64* %.ret
	ret i64 %r14
}

define i64 @main () {
LU15:
	%limit = alloca i64
	%a = alloca i64
	%.ret = alloca i64
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r34 = load i64* @.read_scratch
	store i64 %r34, i64* %limit
	store i64 0, i64* %a
	br label %LU18
LU18:
	%r35 = load i64* %a
	%r36 = load i64* %limit
	%r37 = icmp sle i64 %r35, %r36
	br i1 %r37, label %LU19, label %LU17
LU19:
	%r38 = load i64* %a
	%r39 = call i64 @prime(i64 %r38)
	%r41 = trunc i64 %r39 to i1
	br i1 %r41, label %LU21, label %LU20
LU21:
	%r40 = load i64* %a
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r40)
	br label %LU20
LU20:
	%r42 = load i64* %a
	%r43 = add i64 %r42, 1
	store i64 %r43, i64* %a
	br label %LU18
LU17:
	store i64 0, i64* %.ret
	br label %LU16
LU16:
	%r33 = load i64* %.ret
	ret i64 %r33
}

