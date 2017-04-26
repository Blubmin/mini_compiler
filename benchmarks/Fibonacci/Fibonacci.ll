declare i8* @malloc(i64)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i64 0, align 8



define i64 @computeFib (i64 %r0) {
LU0:
	%.ret = alloca i64
	%input = alloca i64
	store i64 %r0, i64* %input
	%r2 = load i64* %input
	%r3 = icmp eq i64 %r2, 0
	br i1 %r3, label %LU3, label %LU4
LU3:
	store i64 0, i64* %.ret
	br label %LU1
LU4:
	%r4 = load i64* %input
	%r5 = icmp sle i64 %r4, 2
	br i1 %r5, label %LU6, label %LU7
LU6:
	store i64 1, i64* %.ret
	br label %LU1
LU7:
	%r6 = load i64* %input
	%r7 = sub i64 %r6, 1
	%r8 = call i64 @computeFib(i64 %r7)
	%r9 = load i64* %input
	%r10 = sub i64 %r9, 2
	%r11 = call i64 @computeFib(i64 %r10)
	%r12 = add i64 %r8, %r11
	store i64 %r12, i64* %.ret
	br label %LU1
LU1:
	%r1 = load i64* %.ret
	ret i64 %r1
}

define i64 @main () {
LU8:
	%input = alloca i64
	%.ret = alloca i64
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r14 = load i64* @.read_scratch
	store i64 %r14, i64* %input
	%r15 = load i64* %input
	%r16 = call i64 @computeFib(i64 %r15)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r16)
	store i64 0, i64* %.ret
	br label %LU9
LU9:
	%r13 = load i64* %.ret
	ret i64 %r13
}

