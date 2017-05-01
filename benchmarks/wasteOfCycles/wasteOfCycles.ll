declare i8* @malloc(i64)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.printhex = private unnamed_addr constant [6 x i8] c"0x%X\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i64 0, align 8



define i64 @function (i64 %r0) {
LU0:
	%i = alloca i64
	%j = alloca i64
	%.ret = alloca i64
	%n = alloca i64
	store i64 %r0, i64* %n
	%r2 = load i64* %n
	%r3 = icmp sle i64 %r2, 0
	br i1 %r3, label %LU3, label %LU2
LU3:
	store i64 0, i64* %.ret
	br label %LU1
LU2:
	store i64 0, i64* %i
	br label %LU5
LU5:
	%r4 = load i64* %i
	%r5 = load i64* %n
	%r6 = load i64* %n
	%r7 = mul i64 %r5, %r6
	%r8 = icmp slt i64 %r4, %r7
	br i1 %r8, label %LU6, label %LU4
LU6:
	%r9 = load i64* %i
	%r10 = load i64* %n
	%r11 = add i64 %r9, %r10
	store i64 %r11, i64* %j
	%r12 = load i64* %j
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.print, i32 0, i32 0), i64 %r12)
	%r13 = load i64* %i
	%r14 = add i64 %r13, 1
	store i64 %r14, i64* %i
	br label %LU5
LU4:
	%r15 = load i64* %n
	%r16 = sub i64 %r15, 1
	%r17 = call i64 @function(i64 %r16)
	store i64 %r17, i64* %.ret
	br label %LU1
LU1:
	%r1 = load i64* %.ret
	ret i64 %r1
}

define i64 @main () {
LU7:
	%num = alloca i64
	%.ret = alloca i64
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r19 = load i64* @.read_scratch
	store i64 %r19, i64* %num
	%r20 = load i64* %num
	call i64 @function(i64 %r20)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 0)
	store i64 0, i64* %.ret
	br label %LU8
LU8:
	%r18 = load i64* %.ret
	ret i64 %r18
}

