declare i8* @malloc(i64)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.printhex = private unnamed_addr constant [6 x i8] c"0x%X\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i64 0, align 8

%struct.linkedNums = type {i64, %struct.linkedNums*}


define %struct.linkedNums* @getRands (i64 %r0, i64 %r1) {
LU0:
	%cur = alloca i64
	%prev = alloca i64
	%curNode = alloca %struct.linkedNums*
	%prevNode = alloca %struct.linkedNums*
	%.ret = alloca %struct.linkedNums*
	%seed = alloca i64
	store i64 %r0, i64* %seed
	%num = alloca i64
	store i64 %r1, i64* %num
	%r3 = load i64* %seed
	%r4 = load i64* %seed
	%r5 = mul i64 %r3, %r4
	store i64 %r5, i64* %cur
	%r6 = call i8* @malloc(i64 16)
	%r7 = bitcast i8* %r6 to %struct.linkedNums*
	store %struct.linkedNums* %r7, %struct.linkedNums** %prevNode
	%r8 = load i64* %cur
	%r9 = load %struct.linkedNums** %prevNode
	%r10 = getelementptr inbounds %struct.linkedNums* %r9, i1 0, i32 0
	store i64 %r8, i64* %r10
	%r11 = load %struct.linkedNums** %prevNode
	%r12 = getelementptr inbounds %struct.linkedNums* %r11, i1 0, i32 1
	store %struct.linkedNums* null, %struct.linkedNums** %r12
	%r13 = load i64* %num
	%r14 = sub i64 %r13, 1
	store i64 %r14, i64* %num
	%r15 = load i64* %cur
	store i64 %r15, i64* %prev
	br label %LU3
LU3:
	%r16 = load i64* %num
	%r17 = icmp sgt i64 %r16, 0
	br i1 %r17, label %LU4, label %LU2
LU4:
	%r18 = load i64* %prev
	%r19 = load i64* %prev
	%r20 = mul i64 %r18, %r19
	%r21 = load i64* %seed
	%r22 = sdiv i64 %r20, %r21
	%r23 = load i64* %seed
	%r24 = sdiv i64 %r23, 2
	%r25 = mul i64 %r22, %r24
	%r26 = add i64 %r25, 1
	store i64 %r26, i64* %cur
	%r27 = call i8* @malloc(i64 16)
	%r28 = bitcast i8* %r27 to %struct.linkedNums*
	store %struct.linkedNums* %r28, %struct.linkedNums** %curNode
	%r29 = load i64* %cur
	%r30 = load %struct.linkedNums** %curNode
	%r31 = getelementptr inbounds %struct.linkedNums* %r30, i1 0, i32 0
	store i64 %r29, i64* %r31
	%r32 = load %struct.linkedNums** %prevNode
	%r33 = load %struct.linkedNums** %curNode
	%r34 = getelementptr inbounds %struct.linkedNums* %r33, i1 0, i32 1
	store %struct.linkedNums* %r32, %struct.linkedNums** %r34
	%r35 = load %struct.linkedNums** %curNode
	store %struct.linkedNums* %r35, %struct.linkedNums** %prevNode
	%r36 = load i64* %num
	%r37 = sub i64 %r36, 1
	store i64 %r37, i64* %num
	%r38 = load i64* %cur
	store i64 %r38, i64* %prev
	br label %LU3
LU2:
	%r39 = load %struct.linkedNums** %curNode
	store %struct.linkedNums* %r39, %struct.linkedNums** %.ret
	br label %LU1
LU1:
	%r2 = load %struct.linkedNums** %.ret
	ret %struct.linkedNums* %r2
}

define i64 @calcMean (%struct.linkedNums* %r40) {
LU5:
	%sum = alloca i64
	%num = alloca i64
	%mean = alloca i64
	%.ret = alloca i64
	%nums = alloca %struct.linkedNums*
	store %struct.linkedNums* %r40, %struct.linkedNums** %nums
	store i64 0, i64* %sum
	store i64 0, i64* %num
	store i64 0, i64* %mean
	br label %LU8
LU8:
	%r42 = load %struct.linkedNums** %nums
	%r43 = icmp ne %struct.linkedNums* %r42, null
	br i1 %r43, label %LU9, label %LU7
LU9:
	%r44 = load i64* %num
	%r45 = add i64 %r44, 1
	store i64 %r45, i64* %num
	%r46 = load i64* %sum
	%r47 = load %struct.linkedNums** %nums
	%r48 = getelementptr inbounds %struct.linkedNums* %r47, i1 0, i32 0
	%r49 = load i64* %r48
	%r50 = add i64 %r46, %r49
	store i64 %r50, i64* %sum
	%r51 = load %struct.linkedNums** %nums
	%r52 = getelementptr inbounds %struct.linkedNums* %r51, i1 0, i32 1
	%r53 = load %struct.linkedNums** %r52
	store %struct.linkedNums* %r53, %struct.linkedNums** %nums
	br label %LU8
LU7:
	%r54 = load i64* %num
	%r55 = icmp ne i64 %r54, 0
	br i1 %r55, label %LU11, label %LU10
LU11:
	%r56 = load i64* %sum
	%r57 = load i64* %num
	%r58 = sdiv i64 %r56, %r57
	store i64 %r58, i64* %mean
	br label %LU10
LU10:
	%r59 = load i64* %mean
	store i64 %r59, i64* %.ret
	br label %LU6
LU6:
	%r41 = load i64* %.ret
	ret i64 %r41
}

define i64 @approxSqrt (i64 %r60) {
LU12:
	%guess = alloca i64
	%result = alloca i64
	%prev = alloca i64
	%.ret = alloca i64
	%num = alloca i64
	store i64 %r60, i64* %num
	store i64 1, i64* %guess
	%r62 = load i64* %guess
	store i64 %r62, i64* %prev
	store i64 0, i64* %result
	br label %LU15
LU15:
	%r63 = load i64* %result
	%r64 = load i64* %num
	%r65 = icmp slt i64 %r63, %r64
	br i1 %r65, label %LU16, label %LU14
LU16:
	%r66 = load i64* %guess
	%r67 = load i64* %guess
	%r68 = mul i64 %r66, %r67
	store i64 %r68, i64* %result
	%r69 = load i64* %guess
	store i64 %r69, i64* %prev
	%r70 = load i64* %guess
	%r71 = add i64 %r70, 1
	store i64 %r71, i64* %guess
	br label %LU15
LU14:
	%r72 = load i64* %prev
	store i64 %r72, i64* %.ret
	br label %LU13
LU13:
	%r61 = load i64* %.ret
	ret i64 %r61
}

define void @approxSqrtAll (%struct.linkedNums* %r73) {
LU17:
	%nums = alloca %struct.linkedNums*
	store %struct.linkedNums* %r73, %struct.linkedNums** %nums
	br label %LU20
LU20:
	%r75 = load %struct.linkedNums** %nums
	%r76 = icmp ne %struct.linkedNums* %r75, null
	br i1 %r76, label %LU21, label %LU19
LU21:
	%r77 = load %struct.linkedNums** %nums
	%r78 = getelementptr inbounds %struct.linkedNums* %r77, i1 0, i32 0
	%r79 = load i64* %r78
	%r80 = call i64 @approxSqrt(i64 %r79)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r80)
	%r81 = load %struct.linkedNums** %nums
	%r82 = getelementptr inbounds %struct.linkedNums* %r81, i1 0, i32 1
	%r83 = load %struct.linkedNums** %r82
	store %struct.linkedNums* %r83, %struct.linkedNums** %nums
	br label %LU20
LU19:
	br label %LU18
LU18:
	ret void
}

define void @range (%struct.linkedNums* %r84) {
LU22:
	%min = alloca i64
	%max = alloca i64
	%first = alloca i64
	%nums = alloca %struct.linkedNums*
	store %struct.linkedNums* %r84, %struct.linkedNums** %nums
	store i64 0, i64* %min
	store i64 0, i64* %max
	store i64 1, i64* %first
	br label %LU25
LU25:
	%r86 = load %struct.linkedNums** %nums
	%r87 = icmp ne %struct.linkedNums* %r86, null
	br i1 %r87, label %LU26, label %LU24
LU26:
	%r88 = load i64* %first
	%r111 = trunc i64 %r88 to i1
	br i1 %r111, label %LU28, label %LU29
LU28:
	%r89 = load %struct.linkedNums** %nums
	%r90 = getelementptr inbounds %struct.linkedNums* %r89, i1 0, i32 0
	%r91 = load i64* %r90
	store i64 %r91, i64* %min
	%r92 = load %struct.linkedNums** %nums
	%r93 = getelementptr inbounds %struct.linkedNums* %r92, i1 0, i32 0
	%r94 = load i64* %r93
	store i64 %r94, i64* %max
	store i64 0, i64* %first
	br label %LU27
LU29:
	%r95 = load %struct.linkedNums** %nums
	%r96 = getelementptr inbounds %struct.linkedNums* %r95, i1 0, i32 0
	%r97 = load i64* %r96
	%r98 = load i64* %min
	%r99 = icmp slt i64 %r97, %r98
	br i1 %r99, label %LU31, label %LU32
LU31:
	%r100 = load %struct.linkedNums** %nums
	%r101 = getelementptr inbounds %struct.linkedNums* %r100, i1 0, i32 0
	%r102 = load i64* %r101
	store i64 %r102, i64* %min
	br label %LU30
LU32:
	%r103 = load %struct.linkedNums** %nums
	%r104 = getelementptr inbounds %struct.linkedNums* %r103, i1 0, i32 0
	%r105 = load i64* %r104
	%r106 = load i64* %max
	%r107 = icmp sgt i64 %r105, %r106
	br i1 %r107, label %LU34, label %LU33
LU34:
	%r108 = load %struct.linkedNums** %nums
	%r109 = getelementptr inbounds %struct.linkedNums* %r108, i1 0, i32 0
	%r110 = load i64* %r109
	store i64 %r110, i64* %max
	br label %LU33
LU33:
	br label %LU30
LU30:
	br label %LU27
LU27:
	%r112 = load %struct.linkedNums** %nums
	%r113 = getelementptr inbounds %struct.linkedNums* %r112, i1 0, i32 1
	%r114 = load %struct.linkedNums** %r113
	store %struct.linkedNums* %r114, %struct.linkedNums** %nums
	br label %LU25
LU24:
	%r115 = load i64* %min
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r115)
	%r116 = load i64* %max
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r116)
	br label %LU23
LU23:
	ret void
}

define i64 @main () {
LU35:
	%seed = alloca i64
	%num = alloca i64
	%mean = alloca i64
	%nums = alloca %struct.linkedNums*
	%.ret = alloca i64
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r118 = load i64* @.read_scratch
	store i64 %r118, i64* %seed
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r119 = load i64* @.read_scratch
	store i64 %r119, i64* %num
	%r120 = load i64* %seed
	%r121 = load i64* %num
	%r122 = call %struct.linkedNums* @getRands(i64 %r120, i64 %r121)
	store %struct.linkedNums* %r122, %struct.linkedNums** %nums
	%r123 = load %struct.linkedNums** %nums
	%r124 = call i64 @calcMean(%struct.linkedNums* %r123)
	store i64 %r124, i64* %mean
	%r125 = load i64* %mean
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r125)
	%r126 = load %struct.linkedNums** %nums
	call void @range(%struct.linkedNums* %r126)
	%r127 = load %struct.linkedNums** %nums
	call void @approxSqrtAll(%struct.linkedNums* %r127)
	store i64 0, i64* %.ret
	br label %LU36
LU36:
	%r117 = load i64* %.ret
	ret i64 %r117
}

