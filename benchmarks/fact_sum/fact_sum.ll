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
	%r2 = add i64 %r0, %r1
	br label %LU1
LU1:
	ret i64 %r2
}

define i64 @fact (i64 %r4) {
LU2:
	%r5 = icmp eq i64 %r4, 1
	%r6 = icmp eq i64 %r4, 0
	%r7 = or i1 %r5, %r6
	br i1 %r7, label %LU5, label %LU4
LU5:
	br label %LU3
LU4:
	%r8 = icmp sle i64 %r4, 1
	br i1 %r8, label %LU7, label %LU6
LU7:
	%r9 = sub i64 0, 1
	%r10 = mul i64 %r9, %r4
	%r11 = call i64 @fact(i64 %r10)
	br label %LU3
LU6:
	%r12 = sub i64 %r4, 1
	%r13 = call i64 @fact(i64 %r12)
	%r14 = mul i64 %r4, %r13
	br label %LU3
LU3:
	%r16 = phi i64 [ 1, %LU5 ], [ %r11, %LU7 ], [ %r14, %LU6 ]
	ret i64 %r16
}

define i64 @main () {
LU8:
	br label %LU11
LU11:
	%r17 = sub i64 0, 1
	%r18 = icmp ne i64 0, %r17
	br i1 %r18, label %LU12, label %LU10
LU12:
	%r27 = phi i64 [ 0, %LU11 ], [ %r26, %LU12 ]
	%r22 = phi i64 [ 0, %LU11 ], [ %r24, %LU12 ]
	%r20 = phi i64 [ 0, %LU11 ], [ %r23, %LU12 ]
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r19 = load i64* @.read_scratch
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r21 = load i64* @.read_scratch
	%r23 = call i64 @fact(i64 %r19)
	%r24 = call i64 @fact(i64 %r21)
	%r25 = call i64 @sum(i64 %r23, i64 %r24)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r25)
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r26 = load i64* @.read_scratch
	%r28 = sub i64 0, 1
	%r29 = icmp ne i64 %r26, %r28
	br i1 %r29, label %LU12, label %LU10
LU10:
	br label %LU9
LU9:
	ret i64 0
}

