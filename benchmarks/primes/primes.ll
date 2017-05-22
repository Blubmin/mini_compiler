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



define i64 @isqrt (i64 %r0) {
LU3:
	%r1 = icmp sle i64 1, %r0
	br i1 %r1, label %LU4, label %LU2
LU4:
	%r3 = phi i64 [ 3, %LU3 ], [ %r5, %LU4 ]
	%r2 = phi i64 [ 1, %LU3 ], [ %r4, %LU4 ]
	%r4 = add i64 %r2, %r3
	%r5 = add i64 %r3, 2
	%r7 = icmp sle i64 %r4, %r0
	br i1 %r7, label %LU4, label %LU2
LU2:
	%r8 = phi i64 [ 3, %LU3 ], [ %r5, %LU4 ]
	%r9 = sdiv i64 %r8, 2
	%r10 = sub i64 %r9, 1
	ret i64 %r10
}

define i64 @prime (i64 %r12) {
LU5:
	%r13 = icmp slt i64 %r12, 2
	br i1 %r13, label %LU8, label %LU9
LU8:
	br label %LU6
LU9:
	%r14 = call i64 @isqrt(i64 %r12)
	%r15 = icmp sle i64 2, %r14
	br i1 %r15, label %LU12, label %LU10
LU12:
	%r17 = phi i64 [ 2, %LU9 ], [ %r23, %LU13 ]
	%r18 = sdiv i64 %r12, %r17
	%r19 = mul i64 %r18, %r17
	%r20 = sub i64 %r12, %r19
	%r22 = icmp eq i64 %r20, 0
	br i1 %r22, label %LU14, label %LU13
LU14:
	br label %LU6
LU13:
	%r23 = add i64 %r17, 1
	%r25 = icmp sle i64 %r23, %r14
	br i1 %r25, label %LU12, label %LU10
LU10:
	br label %LU6
LU6:
	%r27 = phi i64 [ 0, %LU8 ], [ 0, %LU14 ], [ 1, %LU10 ]
	ret i64 %r27
}

define i64 @main () {
LU15:
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r28 = load i64* @.read_scratch
	%r29 = icmp sle i64 0, %r28
	br i1 %r29, label %LU19, label %LU16
LU19:
	%r35 = phi i64 [ %r28, %LU15 ], [ %r35, %LU20 ]
	%r30 = phi i64 [ 0, %LU15 ], [ %r34, %LU20 ]
	%r31 = call i64 @prime(i64 %r30)
	%r32 = trunc i64 %r31 to i1
	br i1 %r32, label %LU21, label %LU20
LU21:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r30)
	br label %LU20
LU20:
	%r34 = add i64 %r30, 1
	%r37 = icmp sle i64 %r34, %r35
	br i1 %r37, label %LU19, label %LU16
LU16:
	ret i64 0
}

