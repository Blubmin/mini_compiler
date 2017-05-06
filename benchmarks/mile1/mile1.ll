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

%struct.Power = type {i64, i64}


define i64 @calcPower (i64 %r0, i64 %r1) {
LU0:
	%result = alloca i64
	%.ret = alloca i64
	%base = alloca i64
	store i64 %r0, i64* %base
	%exp = alloca i64
	store i64 %r1, i64* %exp
	store i64 1, i64* %result
	br label %LU3
LU3:
	%r3 = load i64* %exp
	%r4 = icmp sgt i64 %r3, 0
	br i1 %r4, label %LU4, label %LU2
LU4:
	%r5 = load i64* %result
	%r6 = load i64* %base
	%r7 = mul i64 %r5, %r6
	store i64 %r7, i64* %result
	%r8 = load i64* %exp
	%r9 = sub i64 %r8, 1
	store i64 %r9, i64* %exp
	%r10 = load i64* %exp
	%r11 = icmp sgt i64 %r10, 0
	br i1 %r11, label %LU4, label %LU2
LU2:
	%r12 = load i64* %result
	store i64 %r12, i64* %.ret
	br label %LU1
LU1:
	%r2 = load i64* %.ret
	ret i64 %r2
}

define i64 @main () {
LU5:
	%power = alloca %struct.Power*
	%input = alloca i64
	%result = alloca i64
	%exp = alloca i64
	%i = alloca i64
	%.ret = alloca i64
	%r14 = call i8* @malloc(i64 16)
	%r15 = bitcast i8* %r14 to %struct.Power*
	store %struct.Power* %r15, %struct.Power** %power
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r16 = load i64* @.read_scratch
	store i64 %r16, i64* %input
	%r17 = load i64* %input
	%r18 = load %struct.Power** %power
	%r19 = getelementptr inbounds %struct.Power* %r18, i1 0, i32 0
	store i64 %r17, i64* %r19
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r20 = load i64* @.read_scratch
	store i64 %r20, i64* %input
	%r21 = load i64* %input
	%r22 = icmp slt i64 %r21, 0
	br i1 %r22, label %LU8, label %LU7
LU8:
	%r23 = sub i64 0, 1
	store i64 %r23, i64* %.ret
	br label %LU6
LU7:
	%r24 = load i64* %input
	%r25 = load %struct.Power** %power
	%r26 = getelementptr inbounds %struct.Power* %r25, i1 0, i32 1
	store i64 %r24, i64* %r26
	store i64 0, i64* %i
	br label %LU10
LU10:
	%r27 = load i64* %i
	%r28 = icmp slt i64 %r27, 1000000
	br i1 %r28, label %LU11, label %LU9
LU11:
	%r29 = load i64* %i
	%r30 = add i64 %r29, 1
	store i64 %r30, i64* %i
	%r31 = load %struct.Power** %power
	%r32 = getelementptr inbounds %struct.Power* %r31, i1 0, i32 0
	%r33 = load i64* %r32
	%r34 = load %struct.Power** %power
	%r35 = getelementptr inbounds %struct.Power* %r34, i1 0, i32 1
	%r36 = load i64* %r35
	%r37 = call i64 @calcPower(i64 %r33, i64 %r36)
	store i64 %r37, i64* %result
	%r38 = load i64* %i
	%r39 = icmp slt i64 %r38, 1000000
	br i1 %r39, label %LU11, label %LU9
LU9:
	%r40 = load i64* %result
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r40)
	store i64 1, i64* %.ret
	br label %LU6
LU6:
	%r13 = load i64* %.ret
	ret i64 %r13
}

