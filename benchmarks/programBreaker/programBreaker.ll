declare i8* @malloc(i64)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i64 0, align 8


@GLOBAL = common global i64 0, align 8
@count = common global i64 0, align 8

define i64 @fun2 (i64 %r0, i64 %r1) {
LU0:
	%.ret = alloca i64
	%x = alloca i64
	store i64 %r0, i64* %x
	%y = alloca i64
	store i64 %r1, i64* %y
	%r3 = load i64* %x
	%r4 = icmp eq i64 %r3, 0
	br i1 %r4, label %LU3, label %LU4
LU3:
	%r5 = load i64* %y
	store i64 %r5, i64* %.ret
	br label %LU1
LU4:
	%r6 = load i64* %x
	%r7 = sub i64 %r6, 1
	%r8 = load i64* %y
	%r9 = call i64 @fun2(i64 %r7, i64 %r8)
	store i64 %r9, i64* %.ret
	br label %LU1
LU1:
	%r2 = load i64* %.ret
	ret i64 %r2
}

define i64 @fun1 (i64 %r10, i64 %r11, i64 %r12) {
LU5:
	%retVal = alloca i64
	%.ret = alloca i64
	%x = alloca i64
	store i64 %r10, i64* %x
	%y = alloca i64
	store i64 %r11, i64* %y
	%z = alloca i64
	store i64 %r12, i64* %z
	%r14 = add i64 5, 6
	%r15 = load i64* %x
	%r16 = mul i64 %r15, 2
	%r17 = sub i64 %r14, %r16
	%r18 = load i64* %y
	%r19 = sdiv i64 4, %r18
	%r20 = add i64 %r17, %r19
	%r21 = load i64* %z
	%r22 = add i64 %r20, %r21
	store i64 %r22, i64* %retVal
	%r23 = load i64* %retVal
	%r24 = load i64* %y
	%r25 = icmp sgt i64 %r23, %r24
	br i1 %r25, label %LU8, label %LU9
LU8:
	%r26 = load i64* %retVal
	%r27 = load i64* %x
	%r28 = call i64 @fun2(i64 %r26, i64 %r27)
	store i64 %r28, i64* %.ret
	br label %LU6
LU9:
	%r29 = icmp slt i64 5, 6
	%r30 = load i64* %retVal
	%r31 = load i64* %y
	%r32 = icmp sle i64 %r30, %r31
	%r33 = and i1 %r29, %r32
	br i1 %r33, label %LU11, label %LU10
LU11:
	%r34 = load i64* %retVal
	%r35 = load i64* %y
	%r36 = call i64 @fun2(i64 %r34, i64 %r35)
	store i64 %r36, i64* %.ret
	br label %LU6
LU10:
	br label %LU7
LU7:
	%r37 = load i64* %retVal
	store i64 %r37, i64* %.ret
	br label %LU6
LU6:
	%r13 = load i64* %.ret
	ret i64 %r13
}

define i64 @main () {
LU12:
	%i = alloca i64
	%.ret = alloca i64
	store i64 0, i64* %i
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r39 = load i64* @.read_scratch
	store i64 %r39, i64* %i
	br label %LU15
LU15:
	%r40 = load i64* %i
	%r41 = icmp slt i64 %r40, 10000
	br i1 %r41, label %LU16, label %LU14
LU16:
	%r42 = load i64* %i
	%r43 = call i64 @fun1(i64 3, i64 %r42, i64 5)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r43)
	%r44 = load i64* %i
	%r45 = add i64 %r44, 1
	store i64 %r45, i64* %i
	br label %LU15
LU14:
	store i64 0, i64* %.ret
	br label %LU13
LU13:
	%r38 = load i64* %.ret
	ret i64 %r38
}

