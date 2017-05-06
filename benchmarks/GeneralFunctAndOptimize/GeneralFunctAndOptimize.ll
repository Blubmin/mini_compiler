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

%struct.IntHolder = type {i64}

@interval = common global i64 0, align 8
@end = common global i64 0, align 8

define i64 @multBy4xTimes (%struct.IntHolder* %r0, i64 %r1) {
LU0:
	%.ret = alloca i64
	%num = alloca %struct.IntHolder*
	store %struct.IntHolder* %r0, %struct.IntHolder** %num
	%timesLeft = alloca i64
	store i64 %r1, i64* %timesLeft
	%r3 = load i64* %timesLeft
	%r4 = icmp sle i64 %r3, 0
	br i1 %r4, label %LU3, label %LU2
LU3:
	%r5 = load %struct.IntHolder** %num
	%r6 = getelementptr inbounds %struct.IntHolder* %r5, i1 0, i32 0
	%r7 = load i64* %r6
	store i64 %r7, i64* %.ret
	br label %LU1
LU2:
	%r8 = load %struct.IntHolder** %num
	%r9 = getelementptr inbounds %struct.IntHolder* %r8, i1 0, i32 0
	%r10 = load i64* %r9
	%r11 = mul i64 4, %r10
	%r12 = load %struct.IntHolder** %num
	%r13 = getelementptr inbounds %struct.IntHolder* %r12, i1 0, i32 0
	store i64 %r11, i64* %r13
	%r14 = load %struct.IntHolder** %num
	%r15 = load i64* %timesLeft
	%r16 = sub i64 %r15, 1
	call i64 @multBy4xTimes(%struct.IntHolder* %r14, i64 %r16)
	%r17 = load %struct.IntHolder** %num
	%r18 = getelementptr inbounds %struct.IntHolder* %r17, i1 0, i32 0
	%r19 = load i64* %r18
	store i64 %r19, i64* %.ret
	br label %LU1
LU1:
	%r2 = load i64* %.ret
	ret i64 %r2
}

define void @divideBy8 (%struct.IntHolder* %r20) {
LU4:
	%num = alloca %struct.IntHolder*
	store %struct.IntHolder* %r20, %struct.IntHolder** %num
	%r22 = load %struct.IntHolder** %num
	%r23 = getelementptr inbounds %struct.IntHolder* %r22, i1 0, i32 0
	%r24 = load i64* %r23
	%r25 = sdiv i64 %r24, 2
	%r26 = load %struct.IntHolder** %num
	%r27 = getelementptr inbounds %struct.IntHolder* %r26, i1 0, i32 0
	store i64 %r25, i64* %r27
	%r28 = load %struct.IntHolder** %num
	%r29 = getelementptr inbounds %struct.IntHolder* %r28, i1 0, i32 0
	%r30 = load i64* %r29
	%r31 = sdiv i64 %r30, 2
	%r32 = load %struct.IntHolder** %num
	%r33 = getelementptr inbounds %struct.IntHolder* %r32, i1 0, i32 0
	store i64 %r31, i64* %r33
	%r34 = load %struct.IntHolder** %num
	%r35 = getelementptr inbounds %struct.IntHolder* %r34, i1 0, i32 0
	%r36 = load i64* %r35
	%r37 = sdiv i64 %r36, 2
	%r38 = load %struct.IntHolder** %num
	%r39 = getelementptr inbounds %struct.IntHolder* %r38, i1 0, i32 0
	store i64 %r37, i64* %r39
	br label %LU5
LU5:
	ret void
}

define i64 @main () {
LU6:
	%start = alloca i64
	%countOuter = alloca i64
	%countInner = alloca i64
	%calc = alloca i64
	%tempAnswer = alloca i64
	%tempInterval = alloca i64
	%x = alloca %struct.IntHolder*
	%uselessVar = alloca i64
	%uselessVar2 = alloca i64
	%.ret = alloca i64
	%r41 = call i8* @malloc(i64 8)
	%r42 = bitcast i8* %r41 to %struct.IntHolder*
	store %struct.IntHolder* %r42, %struct.IntHolder** %x
	store i64 1000000, i64* @end
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r43 = load i64* @.read_scratch
	store i64 %r43, i64* %start
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r44 = load i64* @.read_scratch
	store i64 %r44, i64* @interval
	%r45 = load i64* %start
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r45)
	%r46 = load i64* @interval
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r46)
	store i64 0, i64* %countOuter
	br label %LU9
LU9:
	%r47 = load i64* %countOuter
	%r48 = icmp slt i64 %r47, 50
	br i1 %r48, label %LU10, label %LU8
LU10:
	store i64 0, i64* %countInner
	br label %LU12
LU12:
	%r49 = load i64* %countInner
	%r50 = load i64* @end
	%r51 = icmp sle i64 %r49, %r50
	br i1 %r51, label %LU13, label %LU11
LU13:
	%r52 = mul i64 1, 2
	%r53 = mul i64 %r52, 3
	%r54 = mul i64 %r53, 4
	%r55 = mul i64 %r54, 5
	%r56 = mul i64 %r55, 6
	%r57 = mul i64 %r56, 7
	%r58 = mul i64 %r57, 8
	%r59 = mul i64 %r58, 9
	%r60 = mul i64 %r59, 10
	%r61 = mul i64 %r60, 11
	store i64 %r61, i64* %calc
	%r62 = load i64* %countInner
	%r63 = add i64 %r62, 1
	store i64 %r63, i64* %countInner
	%r64 = load i64* %countInner
	%r65 = load %struct.IntHolder** %x
	%r66 = getelementptr inbounds %struct.IntHolder* %r65, i1 0, i32 0
	store i64 %r64, i64* %r66
	%r67 = load %struct.IntHolder** %x
	%r68 = getelementptr inbounds %struct.IntHolder* %r67, i1 0, i32 0
	%r69 = load i64* %r68
	store i64 %r69, i64* %tempAnswer
	%r70 = load %struct.IntHolder** %x
	call i64 @multBy4xTimes(%struct.IntHolder* %r70, i64 2)
	%r71 = load %struct.IntHolder** %x
	call void @divideBy8(%struct.IntHolder* %r71)
	%r72 = load i64* @interval
	%r73 = sub i64 %r72, 1
	store i64 %r73, i64* %tempInterval
	%r74 = load i64* %tempInterval
	%r75 = icmp sle i64 %r74, 0
	%r76 = zext i1 %r75 to i64
	store i64 %r76, i64* %uselessVar
	%r77 = load i64* %tempInterval
	%r78 = icmp sle i64 %r77, 0
	br i1 %r78, label %LU15, label %LU14
LU15:
	store i64 1, i64* %tempInterval
	br label %LU14
LU14:
	%r79 = load i64* %countInner
	%r80 = load i64* %tempInterval
	%r81 = add i64 %r79, %r80
	store i64 %r81, i64* %countInner
	%r82 = load i64* %countInner
	%r83 = load i64* @end
	%r84 = icmp sle i64 %r82, %r83
	br i1 %r84, label %LU13, label %LU11
LU11:
	%r85 = load i64* %countOuter
	%r86 = add i64 %r85, 1
	store i64 %r86, i64* %countOuter
	%r87 = load i64* %countOuter
	%r88 = icmp slt i64 %r87, 50
	br i1 %r88, label %LU10, label %LU8
LU8:
	%r89 = load i64* %countInner
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r89)
	%r90 = load i64* %calc
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r90)
	store i64 0, i64* %.ret
	br label %LU7
LU7:
	%r40 = load i64* %.ret
	ret i64 %r40
}

