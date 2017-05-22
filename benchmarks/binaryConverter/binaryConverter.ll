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



define i64 @wait (i64 %r0) {
LU3:
	%r1 = icmp sgt i64 %r0, 0
	br i1 %r1, label %LU4, label %LU1
LU4:
	%r2 = phi i64 [ %r0, %LU3 ], [ %r3, %LU4 ]
	%r3 = sub i64 %r2, 1
	%r4 = icmp sgt i64 %r3, 0
	br i1 %r4, label %LU4, label %LU1
LU1:
	ret i64 0
}

define i64 @power (i64 %r6, i64 %r7) {
LU8:
	%r8 = icmp sgt i64 %r7, 0
	br i1 %r8, label %LU9, label %LU7
LU9:
	%r12 = phi i64 [ %r7, %LU8 ], [ %r13, %LU9 ]
	%r9 = phi i64 [ 1, %LU8 ], [ %r11, %LU9 ]
	%r11 = mul i64 %r9, %r6
	%r13 = sub i64 %r12, 1
	%r14 = icmp sgt i64 %r13, 0
	br i1 %r14, label %LU9, label %LU7
LU7:
	%r15 = phi i64 [ 1, %LU8 ], [ %r11, %LU9 ]
	ret i64 %r15
}

define i64 @recursiveDecimalSum (i64 %r17, i64 %r18, i64 %r19) {
LU10:
	%r20 = icmp sgt i64 %r17, 0
	br i1 %r20, label %LU13, label %LU12
LU13:
	%r21 = sdiv i64 %r17, 10
	%r22 = mul i64 %r21, 10
	%r23 = sub i64 %r17, %r22
	%r24 = icmp eq i64 %r23, 1
	br i1 %r24, label %LU15, label %LU14
LU15:
	%r25 = call i64 @power(i64 2, i64 %r19)
	%r26 = add i64 %r18, %r25
	br label %LU14
LU14:
	%r29 = phi i64 [ %r26, %LU15 ], [ %r18, %LU13 ]
	%r28 = sdiv i64 %r17, 10
	%r31 = add i64 %r19, 1
	%r32 = call i64 @recursiveDecimalSum(i64 %r28, i64 %r29, i64 %r31)
	br label %LU11
LU12:
	br label %LU11
LU11:
	%r34 = phi i64 [ %r32, %LU14 ], [ %r18, %LU12 ]
	ret i64 %r34
}

define i64 @convertToDecimal (i64 %r35) {
LU16:
	%r36 = call i64 @recursiveDecimalSum(i64 %r35, i64 0, i64 0)
	ret i64 %r36
}

define i64 @main () {
LU18:
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r38 = load i64* @.read_scratch
	%r39 = call i64 @convertToDecimal(i64 %r38)
	%r40 = mul i64 %r39, %r39
	%r41 = icmp sgt i64 %r40, 0
	br i1 %r41, label %LU22, label %LU20
LU22:
	%r42 = phi i64 [ %r40, %LU18 ], [ %r43, %LU22 ]
	call i64 @wait(i64 %r42)
	%r43 = sub i64 %r42, 1
	%r44 = icmp sgt i64 %r43, 0
	br i1 %r44, label %LU22, label %LU20
LU20:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r39)
	ret i64 0
}

