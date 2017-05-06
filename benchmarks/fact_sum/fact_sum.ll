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



define i64 @sum (i64 %r0, i64 %r1) {
LU0:
	%.ret = alloca i64
	%a = alloca i64
	store i64 %r0, i64* %a
	%b = alloca i64
	store i64 %r1, i64* %b
	%r3 = load i64* %a
	%r4 = load i64* %b
	%r5 = add i64 %r3, %r4
	store i64 %r5, i64* %.ret
	br label %LU1
LU1:
	%r2 = load i64* %.ret
	ret i64 %r2
}

define i64 @fact (i64 %r6) {
LU2:
	%t = alloca i64
	%.ret = alloca i64
	%n = alloca i64
	store i64 %r6, i64* %n
	%r8 = load i64* %n
	%r9 = icmp eq i64 %r8, 1
	%r10 = load i64* %n
	%r11 = icmp eq i64 %r10, 0
	%r12 = or i1 %r9, %r11
	br i1 %r12, label %LU5, label %LU4
LU5:
	store i64 1, i64* %.ret
	br label %LU3
LU4:
	%r13 = load i64* %n
	%r14 = icmp sle i64 %r13, 1
	br i1 %r14, label %LU7, label %LU6
LU7:
	%r15 = sub i64 0, 1
	%r16 = load i64* %n
	%r17 = mul i64 %r15, %r16
	%r18 = call i64 @fact(i64 %r17)
	store i64 %r18, i64* %.ret
	br label %LU3
LU6:
	%r19 = load i64* %n
	%r20 = load i64* %n
	%r21 = sub i64 %r20, 1
	%r22 = call i64 @fact(i64 %r21)
	%r23 = mul i64 %r19, %r22
	store i64 %r23, i64* %t
	%r24 = load i64* %t
	store i64 %r24, i64* %.ret
	br label %LU3
LU3:
	%r7 = load i64* %.ret
	ret i64 %r7
}

define i64 @main () {
LU8:
	%num1 = alloca i64
	%num2 = alloca i64
	%flag = alloca i64
	%.ret = alloca i64
	store i64 0, i64* %flag
	br label %LU11
LU11:
	%r26 = load i64* %flag
	%r27 = sub i64 0, 1
	%r28 = icmp ne i64 %r26, %r27
	br i1 %r28, label %LU12, label %LU10
LU12:
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r29 = load i64* @.read_scratch
	store i64 %r29, i64* %num1
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r30 = load i64* @.read_scratch
	store i64 %r30, i64* %num2
	%r31 = load i64* %num1
	%r32 = call i64 @fact(i64 %r31)
	store i64 %r32, i64* %num1
	%r33 = load i64* %num2
	%r34 = call i64 @fact(i64 %r33)
	store i64 %r34, i64* %num2
	%r35 = load i64* %num1
	%r36 = load i64* %num2
	%r37 = call i64 @sum(i64 %r35, i64 %r36)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r37)
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r38 = load i64* @.read_scratch
	store i64 %r38, i64* %flag
	%r39 = load i64* %flag
	%r40 = sub i64 0, 1
	%r41 = icmp ne i64 %r39, %r40
	br i1 %r41, label %LU12, label %LU10
LU10:
	store i64 0, i64* %.ret
	br label %LU9
LU9:
	%r25 = load i64* %.ret
	ret i64 %r25
}

