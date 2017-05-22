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



define i64 @computeFib (i64 %r0) {
LU0:
	%r1 = icmp eq i64 %r0, 0
	br i1 %r1, label %LU3, label %LU4
LU3:
	br label %LU1
LU4:
	%r2 = icmp sle i64 %r0, 2
	br i1 %r2, label %LU6, label %LU7
LU6:
	br label %LU1
LU7:
	%r3 = sub i64 %r0, 1
	%r4 = call i64 @computeFib(i64 %r3)
	%r5 = sub i64 %r0, 2
	%r6 = call i64 @computeFib(i64 %r5)
	%r7 = add i64 %r4, %r6
	br label %LU1
LU1:
	%r9 = phi i64 [ 0, %LU3 ], [ 1, %LU6 ], [ %r7, %LU7 ]
	ret i64 %r9
}

define i64 @main () {
LU8:
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r10 = load i64* @.read_scratch
	%r11 = call i64 @computeFib(i64 %r10)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r11)
	ret i64 0
}

