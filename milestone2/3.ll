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



define i64 @main () {
LU0:
	%i = alloca i64
	%j = alloca i64
	%.ret = alloca i64
	store i64 1, i64* %j
	store i64 0, i64* %i
	br label %LU3
LU3:
	%r1 = load i64* %i
	%r2 = icmp slt i64 %r1, 64
	br i1 %r2, label %LU4, label %LU2
LU4:
	%r3 = load i64* %j
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r3)
	%r4 = load i64* %j
	%r5 = mul i64 %r4, 2
	store i64 %r5, i64* %j
	%r6 = load i64* %i
	%r7 = add i64 %r6, 1
	store i64 %r7, i64* %i
	br label %LU4
	%r8 = load i64* %i
	%r9 = icmp slt i64 %r8, 64
LU2:
	store i64 0, i64* %.ret
	br label %LU1
LU1:
	%r0 = load i64* %.ret
	ret i64 %r0
}

