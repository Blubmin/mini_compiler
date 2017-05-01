declare i8* @malloc(i64)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.printhex = private unnamed_addr constant [6 x i8] c"0x%X\0A\00", align 1
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
	br label %LU3
LU2:
	%r10 = load i64* %result
	store i64 %r10, i64* %.ret
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
	%r12 = call i8* @malloc(i64 16)
	%r13 = bitcast i8* %r12 to %struct.Power*
	store %struct.Power* %r13, %struct.Power** %power
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r14 = load i64* @.read_scratch
	store i64 %r14, i64* %input
	%r15 = load i64* %input
	%r16 = load %struct.Power** %power
	%r17 = getelementptr inbounds %struct.Power* %r16, i1 0, i32 0
	store i64 %r15, i64* %r17
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r18 = load i64* @.read_scratch
	store i64 %r18, i64* %input
	%r19 = load i64* %input
	%r20 = icmp slt i64 %r19, 0
	br i1 %r20, label %LU8, label %LU7
LU8:
	%r21 = sub i64 0, 1
	store i64 %r21, i64* %.ret
	br label %LU6
LU7:
	%r22 = load i64* %input
	%r23 = load %struct.Power** %power
	%r24 = getelementptr inbounds %struct.Power* %r23, i1 0, i32 1
	store i64 %r22, i64* %r24
	store i64 0, i64* %i
	br label %LU10
LU10:
	%r25 = load i64* %i
	%r26 = icmp slt i64 %r25, 1000000
	br i1 %r26, label %LU11, label %LU9
LU11:
	%r27 = load i64* %i
	%r28 = add i64 %r27, 1
	store i64 %r28, i64* %i
	%r29 = load %struct.Power** %power
	%r30 = getelementptr inbounds %struct.Power* %r29, i1 0, i32 0
	%r31 = load i64* %r30
	%r32 = load %struct.Power** %power
	%r33 = getelementptr inbounds %struct.Power* %r32, i1 0, i32 1
	%r34 = load i64* %r33
	%r35 = call i64 @calcPower(i64 %r31, i64 %r34)
	store i64 %r35, i64* %result
	br label %LU10
LU9:
	%r36 = load i64* %result
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r36)
	store i64 1, i64* %.ret
	br label %LU6
LU6:
	%r11 = load i64* %.ret
	ret i64 %r11
}

