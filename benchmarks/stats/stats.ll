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
	%r39 = load i64* %num
	%r40 = icmp sgt i64 %r39, 0
	br i1 %r40, label %LU4, label %LU2
LU2:
	%r41 = load %struct.linkedNums** %curNode
	store %struct.linkedNums* %r41, %struct.linkedNums** %.ret
	br label %LU1
LU1:
	%r2 = load %struct.linkedNums** %.ret
	ret %struct.linkedNums* %r2
}

define i64 @calcMean (%struct.linkedNums* %r42) {
LU5:
	%sum = alloca i64
	%num = alloca i64
	%mean = alloca i64
	%.ret = alloca i64
	%nums = alloca %struct.linkedNums*
	store %struct.linkedNums* %r42, %struct.linkedNums** %nums
	store i64 0, i64* %sum
	store i64 0, i64* %num
	store i64 0, i64* %mean
	br label %LU8
LU8:
	%r44 = load %struct.linkedNums** %nums
	%r45 = icmp ne %struct.linkedNums* %r44, null
	br i1 %r45, label %LU9, label %LU7
LU9:
	%r46 = load i64* %num
	%r47 = add i64 %r46, 1
	store i64 %r47, i64* %num
	%r48 = load i64* %sum
	%r49 = load %struct.linkedNums** %nums
	%r50 = getelementptr inbounds %struct.linkedNums* %r49, i1 0, i32 0
	%r51 = load i64* %r50
	%r52 = add i64 %r48, %r51
	store i64 %r52, i64* %sum
	%r53 = load %struct.linkedNums** %nums
	%r54 = getelementptr inbounds %struct.linkedNums* %r53, i1 0, i32 1
	%r55 = load %struct.linkedNums** %r54
	store %struct.linkedNums* %r55, %struct.linkedNums** %nums
	%r56 = load %struct.linkedNums** %nums
	%r57 = icmp ne %struct.linkedNums* %r56, null
	br i1 %r57, label %LU9, label %LU7
LU7:
	%r58 = load i64* %num
	%r59 = icmp ne i64 %r58, 0
	br i1 %r59, label %LU11, label %LU10
LU11:
	%r60 = load i64* %sum
	%r61 = load i64* %num
	%r62 = sdiv i64 %r60, %r61
	store i64 %r62, i64* %mean
	br label %LU10
LU10:
	%r63 = load i64* %mean
	store i64 %r63, i64* %.ret
	br label %LU6
LU6:
	%r43 = load i64* %.ret
	ret i64 %r43
}

define i64 @approxSqrt (i64 %r64) {
LU12:
	%guess = alloca i64
	%result = alloca i64
	%prev = alloca i64
	%.ret = alloca i64
	%num = alloca i64
	store i64 %r64, i64* %num
	store i64 1, i64* %guess
	%r66 = load i64* %guess
	store i64 %r66, i64* %prev
	store i64 0, i64* %result
	br label %LU15
LU15:
	%r67 = load i64* %result
	%r68 = load i64* %num
	%r69 = icmp slt i64 %r67, %r68
	br i1 %r69, label %LU16, label %LU14
LU16:
	%r70 = load i64* %guess
	%r71 = load i64* %guess
	%r72 = mul i64 %r70, %r71
	store i64 %r72, i64* %result
	%r73 = load i64* %guess
	store i64 %r73, i64* %prev
	%r74 = load i64* %guess
	%r75 = add i64 %r74, 1
	store i64 %r75, i64* %guess
	%r76 = load i64* %result
	%r77 = load i64* %num
	%r78 = icmp slt i64 %r76, %r77
	br i1 %r78, label %LU16, label %LU14
LU14:
	%r79 = load i64* %prev
	store i64 %r79, i64* %.ret
	br label %LU13
LU13:
	%r65 = load i64* %.ret
	ret i64 %r65
}

define void @approxSqrtAll (%struct.linkedNums* %r80) {
LU17:
	%nums = alloca %struct.linkedNums*
	store %struct.linkedNums* %r80, %struct.linkedNums** %nums
	br label %LU20
LU20:
	%r82 = load %struct.linkedNums** %nums
	%r83 = icmp ne %struct.linkedNums* %r82, null
	br i1 %r83, label %LU21, label %LU19
LU21:
	%r84 = load %struct.linkedNums** %nums
	%r85 = getelementptr inbounds %struct.linkedNums* %r84, i1 0, i32 0
	%r86 = load i64* %r85
	%r87 = call i64 @approxSqrt(i64 %r86)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r87)
	%r88 = load %struct.linkedNums** %nums
	%r89 = getelementptr inbounds %struct.linkedNums* %r88, i1 0, i32 1
	%r90 = load %struct.linkedNums** %r89
	store %struct.linkedNums* %r90, %struct.linkedNums** %nums
	%r91 = load %struct.linkedNums** %nums
	%r92 = icmp ne %struct.linkedNums* %r91, null
	br i1 %r92, label %LU21, label %LU19
LU19:
	br label %LU18
LU18:
	ret void
}

define void @range (%struct.linkedNums* %r93) {
LU22:
	%min = alloca i64
	%max = alloca i64
	%first = alloca i64
	%nums = alloca %struct.linkedNums*
	store %struct.linkedNums* %r93, %struct.linkedNums** %nums
	store i64 0, i64* %min
	store i64 0, i64* %max
	store i64 1, i64* %first
	br label %LU25
LU25:
	%r95 = load %struct.linkedNums** %nums
	%r96 = icmp ne %struct.linkedNums* %r95, null
	br i1 %r96, label %LU26, label %LU24
LU26:
	%r97 = load i64* %first
	%r120 = trunc i64 %r97 to i1
	br i1 %r120, label %LU28, label %LU29
LU28:
	%r98 = load %struct.linkedNums** %nums
	%r99 = getelementptr inbounds %struct.linkedNums* %r98, i1 0, i32 0
	%r100 = load i64* %r99
	store i64 %r100, i64* %min
	%r101 = load %struct.linkedNums** %nums
	%r102 = getelementptr inbounds %struct.linkedNums* %r101, i1 0, i32 0
	%r103 = load i64* %r102
	store i64 %r103, i64* %max
	store i64 0, i64* %first
	br label %LU27
LU29:
	%r104 = load %struct.linkedNums** %nums
	%r105 = getelementptr inbounds %struct.linkedNums* %r104, i1 0, i32 0
	%r106 = load i64* %r105
	%r107 = load i64* %min
	%r108 = icmp slt i64 %r106, %r107
	br i1 %r108, label %LU31, label %LU32
LU31:
	%r109 = load %struct.linkedNums** %nums
	%r110 = getelementptr inbounds %struct.linkedNums* %r109, i1 0, i32 0
	%r111 = load i64* %r110
	store i64 %r111, i64* %min
	br label %LU30
LU32:
	%r112 = load %struct.linkedNums** %nums
	%r113 = getelementptr inbounds %struct.linkedNums* %r112, i1 0, i32 0
	%r114 = load i64* %r113
	%r115 = load i64* %max
	%r116 = icmp sgt i64 %r114, %r115
	br i1 %r116, label %LU34, label %LU33
LU34:
	%r117 = load %struct.linkedNums** %nums
	%r118 = getelementptr inbounds %struct.linkedNums* %r117, i1 0, i32 0
	%r119 = load i64* %r118
	store i64 %r119, i64* %max
	br label %LU33
LU33:
	br label %LU30
LU30:
	br label %LU27
LU27:
	%r121 = load %struct.linkedNums** %nums
	%r122 = getelementptr inbounds %struct.linkedNums* %r121, i1 0, i32 1
	%r123 = load %struct.linkedNums** %r122
	store %struct.linkedNums* %r123, %struct.linkedNums** %nums
	%r124 = load %struct.linkedNums** %nums
	%r125 = icmp ne %struct.linkedNums* %r124, null
	br i1 %r125, label %LU26, label %LU24
LU24:
	%r126 = load i64* %min
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r126)
	%r127 = load i64* %max
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r127)
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
	%r129 = load i64* @.read_scratch
	store i64 %r129, i64* %seed
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r130 = load i64* @.read_scratch
	store i64 %r130, i64* %num
	%r131 = load i64* %seed
	%r132 = load i64* %num
	%r133 = call %struct.linkedNums* @getRands(i64 %r131, i64 %r132)
	store %struct.linkedNums* %r133, %struct.linkedNums** %nums
	%r134 = load %struct.linkedNums** %nums
	%r135 = call i64 @calcMean(%struct.linkedNums* %r134)
	store i64 %r135, i64* %mean
	%r136 = load i64* %mean
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r136)
	%r137 = load %struct.linkedNums** %nums
	call void @range(%struct.linkedNums* %r137)
	%r138 = load %struct.linkedNums** %nums
	call void @approxSqrtAll(%struct.linkedNums* %r138)
	store i64 0, i64* %.ret
	br label %LU36
LU36:
	%r128 = load i64* %.ret
	ret i64 %r128
}

