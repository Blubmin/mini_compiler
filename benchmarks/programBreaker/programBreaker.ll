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


@GLOBAL = common global i64 0, align 8
@count = common global i64 0, align 8

define i64 @fun2 (i64 %r0, i64 %r1) {
LU0:
	%r2 = icmp eq i64 %r0, 0
	br i1 %r2, label %LU3, label %LU4
LU3:
	br label %LU1
LU4:
	%r3 = sub i64 %r0, 1
	%r4 = call i64 @fun2(i64 %r3, i64 %r1)
	br label %LU1
LU1:
	%r6 = phi i64 [ %r1, %LU3 ], [ %r4, %LU4 ]
	ret i64 %r6
}

define i64 @fun1 (i64 %r7, i64 %r8, i64 %r9) {
LU5:
	%r11 = mul i64 %r7, 2
	%r12 = sub i64 11, %r11
	%r13 = sdiv i64 4, %r8
	%r14 = add i64 %r12, %r13
	%r15 = add i64 %r14, %r9
	%r16 = icmp sgt i64 %r15, %r8
	br i1 %r16, label %LU8, label %LU9
LU8:
	%r17 = call i64 @fun2(i64 %r15, i64 %r7)
	br label %LU6
LU9:
	%r19 = icmp sle i64 %r15, %r8
	%r20 = and i1 1, %r19
	br i1 %r20, label %LU11, label %LU10
LU11:
	%r21 = call i64 @fun2(i64 %r15, i64 %r8)
	br label %LU6
LU10:
	br label %LU6
LU6:
	%r23 = phi i64 [ %r17, %LU8 ], [ %r21, %LU11 ], [ %r15, %LU10 ]
	ret i64 %r23
}

define i64 @main () {
LU12:
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r24 = load i64* @.read_scratch
	%r25 = icmp slt i64 %r24, 10000
	br i1 %r25, label %LU16, label %LU14
LU16:
	%r26 = phi i64 [ %r24, %LU12 ], [ %r28, %LU16 ]
	%r27 = call i64 @fun1(i64 3, i64 %r26, i64 5)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r27)
	%r28 = add i64 %r26, 1
	%r29 = icmp slt i64 %r28, 10000
	br i1 %r29, label %LU16, label %LU14
LU14:
	ret i64 0
}

