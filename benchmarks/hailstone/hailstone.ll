declare i8* @malloc(i64)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.printhex = private unnamed_addr constant [6 x i8] c"0x%X\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i64 0, align 8



define i64 @mod (i64 %r0, i64 %r1) {
LU0:
	%.ret = alloca i64
	%a = alloca i64
	store i64 %r0, i64* %a
	%b = alloca i64
	store i64 %r1, i64* %b
	%r3 = load i64* %a
	%r4 = load i64* %a
	%r5 = load i64* %b
	%r6 = sdiv i64 %r4, %r5
	%r7 = load i64* %b
	%r8 = mul i64 %r6, %r7
	%r9 = sub i64 %r3, %r8
	store i64 %r9, i64* %.ret
	br label %LU1
LU1:
	%r2 = load i64* %.ret
	ret i64 %r2
}

define void @hailstone (i64 %r10) {
LU2:
	%n = alloca i64
	store i64 %r10, i64* %n
	br label %LU5
LU5:
	%r12 = trunc i64 1 to i1
	br i1 %r12, label %LU6, label %LU4
LU6:
	%r13 = load i64* %n
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.print, i32 0, i32 0), i64 %r13)
	%r14 = load i64* %n
	%r15 = call i64 @mod(i64 %r14, i64 2)
	%r16 = icmp eq i64 %r15, 1
	br i1 %r16, label %LU8, label %LU9
LU8:
	%r17 = load i64* %n
	%r18 = mul i64 3, %r17
	%r19 = add i64 %r18, 1
	store i64 %r19, i64* %n
	br label %LU7
LU9:
	%r20 = load i64* %n
	%r21 = sdiv i64 %r20, 2
	store i64 %r21, i64* %n
	br label %LU7
LU7:
	%r22 = load i64* %n
	%r23 = icmp sle i64 %r22, 1
	br i1 %r23, label %LU11, label %LU10
LU11:
	%r24 = load i64* %n
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r24)
	br label %LU3
LU10:
	br label %LU5
LU4:
	br label %LU3
LU3:
	ret void
}

define i64 @main () {
LU12:
	%num = alloca i64
	%.ret = alloca i64
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r26 = load i64* @.read_scratch
	store i64 %r26, i64* %num
	%r27 = load i64* %num
	call void @hailstone(i64 %r27)
	store i64 0, i64* %.ret
	br label %LU13
LU13:
	%r25 = load i64* %.ret
	ret i64 %r25
}

