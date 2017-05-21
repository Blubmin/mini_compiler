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



define i64 @mod (i64 %r0, i64 %r1) {
LU0:
	%r2 = sdiv i64 %r0, %r1
	%r3 = mul i64 %r2, %r1
	%r4 = sub i64 %r0, %r3
	ret i64 %r4
}

define void @hailstone (i64 %r6) {
LU2:
	br label %LU6
LU6:
	%r8 = phi i64 [ %r6, %LU2 ], [ %r14, %LU10 ]
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.print, i32 0, i32 0), i64 %r8)
	%r9 = call i64 @mod(i64 %r8, i64 2)
	%r10 = icmp eq i64 %r9, 1
	br i1 %r10, label %LU8, label %LU9
LU8:
	%r11 = mul i64 3, %r8
	%r12 = add i64 %r11, 1
	br label %LU7
LU9:
	%r13 = sdiv i64 %r8, 2
	br label %LU7
LU7:
	%r14 = phi i64 [ %r12, %LU8 ], [ %r13, %LU9 ]
	%r15 = icmp sle i64 %r14, 1
	br i1 %r15, label %LU11, label %LU10
LU11:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r14)
	br label %LU3
LU10:
	br label %LU6
LU3:
	ret void
}

define i64 @main () {
LU12:
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r18 = load i64* @.read_scratch
	call void @hailstone(i64 %r18)
	ret i64 0
}

