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



define i64 @function (i64 %r0) {
LU0:
	%r1 = icmp sle i64 %r0, 0
	br i1 %r1, label %LU3, label %LU2
LU3:
	br label %LU1
LU2:
	br label %LU5
LU5:
	%r2 = mul i64 %r0, %r0
	%r3 = icmp slt i64 0, %r2
	br i1 %r3, label %LU6, label %LU4
LU6:
	%r7 = phi i64 [ 0, %LU5 ], [ %r6, %LU6 ]
	%r4 = phi i64 [ 0, %LU5 ], [ %r8, %LU6 ]
	%r6 = add i64 %r4, %r0
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.print, i32 0, i32 0), i64 %r6)
	%r8 = add i64 %r4, 1
	%r9 = mul i64 %r0, %r0
	%r10 = icmp slt i64 %r8, %r9
	br i1 %r10, label %LU6, label %LU4
LU4:
	%r12 = sub i64 %r0, 1
	%r13 = call i64 @function(i64 %r12)
	br label %LU1
LU1:
	%r15 = phi i64 [ 0, %LU3 ], [ %r13, %LU4 ]
	ret i64 %r15
}

define i64 @main () {
LU7:
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r16 = load i64* @.read_scratch
	call i64 @function(i64 %r16)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 0)
	br label %LU8
LU8:
	ret i64 0
}

