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
	%r2 = mul i64 %r0, %r0
	%r3 = call i8* @malloc(i64 16)
	%r4 = bitcast i8* %r3 to %struct.linkedNums*
	%r5 = getelementptr inbounds %struct.linkedNums* %r4, i1 0, i32 0
	store i64 %r2, i64* %r5
	%r6 = getelementptr inbounds %struct.linkedNums* %r4, i1 0, i32 1
	store %struct.linkedNums* null, %struct.linkedNums** %r6
	%r7 = sub i64 %r1, 1
	%r8 = icmp sgt i64 %r7, 0
	br i1 %r8, label %LU4, label %LU2
LU4:
	%r23 = phi i64 [ %r7, %LU0 ], [ %r24, %LU4 ]
	%r21 = phi %struct.linkedNums* [ %r4, %LU0 ], [ %r18, %LU4 ]
	%r9 = phi i64 [ %r2, %LU0 ], [ %r15, %LU4 ]
	%r10 = mul i64 %r9, %r9
	%r12 = sdiv i64 %r10, %r0
	%r13 = sdiv i64 %r0, 2
	%r14 = mul i64 %r12, %r13
	%r15 = add i64 %r14, 1
	%r17 = call i8* @malloc(i64 16)
	%r18 = bitcast i8* %r17 to %struct.linkedNums*
	%r20 = getelementptr inbounds %struct.linkedNums* %r18, i1 0, i32 0
	store i64 %r15, i64* %r20
	%r22 = getelementptr inbounds %struct.linkedNums* %r18, i1 0, i32 1
	store %struct.linkedNums* %r21, %struct.linkedNums** %r22
	%r24 = sub i64 %r23, 1
	%r25 = icmp sgt i64 %r24, 0
	br i1 %r25, label %LU4, label %LU2
LU2:
	%r26 = phi %struct.linkedNums* [ null, %LU0 ], [ %r18, %LU4 ]
	ret %struct.linkedNums* %r26
}

define i64 @calcMean (%struct.linkedNums* %r28) {
LU8:
	%r29 = icmp ne %struct.linkedNums* %r28, null
	br i1 %r29, label %LU9, label %LU7
LU9:
	%r33 = phi %struct.linkedNums* [ %r28, %LU8 ], [ %r38, %LU9 ]
	%r32 = phi i64 [ 0, %LU8 ], [ %r36, %LU9 ]
	%r30 = phi i64 [ 0, %LU8 ], [ %r31, %LU9 ]
	%r31 = add i64 %r30, 1
	%r34 = getelementptr inbounds %struct.linkedNums* %r33, i1 0, i32 0
	%r35 = load i64* %r34
	%r36 = add i64 %r32, %r35
	%r37 = getelementptr inbounds %struct.linkedNums* %r33, i1 0, i32 1
	%r38 = load %struct.linkedNums** %r37
	%r39 = icmp ne %struct.linkedNums* %r38, null
	br i1 %r39, label %LU9, label %LU7
LU7:
	%r42 = phi i64 [ 0, %LU8 ], [ %r36, %LU9 ]
	%r40 = phi i64 [ 0, %LU8 ], [ %r31, %LU9 ]
	%r41 = icmp ne i64 %r40, 0
	br i1 %r41, label %LU11, label %LU10
LU11:
	%r43 = sdiv i64 %r42, %r40
	br label %LU10
LU10:
	%r46 = phi i64 [ %r43, %LU11 ], [ 0, %LU7 ]
	ret i64 %r46
}

define i64 @approxSqrt (i64 %r48) {
LU15:
	%r49 = icmp slt i64 0, %r48
	br i1 %r49, label %LU16, label %LU14
LU16:
	%r50 = phi i64 [ 1, %LU15 ], [ %r54, %LU16 ]
	%r51 = mul i64 %r50, %r50
	%r54 = add i64 %r50, 1
	%r56 = icmp slt i64 %r51, %r48
	br i1 %r56, label %LU16, label %LU14
LU14:
	%r57 = phi i64 [ 1, %LU15 ], [ %r50, %LU16 ]
	ret i64 %r57
}

define void @approxSqrtAll (%struct.linkedNums* %r59) {
LU20:
	%r60 = icmp ne %struct.linkedNums* %r59, null
	br i1 %r60, label %LU21, label %LU18
LU21:
	%r61 = phi %struct.linkedNums* [ %r59, %LU20 ], [ %r66, %LU21 ]
	%r62 = getelementptr inbounds %struct.linkedNums* %r61, i1 0, i32 0
	%r63 = load i64* %r62
	%r64 = call i64 @approxSqrt(i64 %r63)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r64)
	%r65 = getelementptr inbounds %struct.linkedNums* %r61, i1 0, i32 1
	%r66 = load %struct.linkedNums** %r65
	%r67 = icmp ne %struct.linkedNums* %r66, null
	br i1 %r67, label %LU21, label %LU18
LU18:
	ret void
}

define void @range (%struct.linkedNums* %r69) {
LU25:
	%r70 = icmp ne %struct.linkedNums* %r69, null
	br i1 %r70, label %LU26, label %LU24
LU26:
	%r78 = phi i64 [ 0, %LU25 ], [ %r104, %LU27 ]
	%r75 = phi i64 [ 0, %LU25 ], [ %r101, %LU27 ]
	%r72 = phi %struct.linkedNums* [ %r69, %LU25 ], [ %r94, %LU27 ]
	%r71 = phi i64 [ 1, %LU25 ], [ %r98, %LU27 ]
	%r89 = trunc i64 %r71 to i1
	br i1 %r89, label %LU28, label %LU29
LU28:
	%r73 = getelementptr inbounds %struct.linkedNums* %r72, i1 0, i32 0
	%r74 = load i64* %r73
	%r76 = getelementptr inbounds %struct.linkedNums* %r72, i1 0, i32 0
	%r77 = load i64* %r76
	br label %LU27
LU29:
	%r79 = getelementptr inbounds %struct.linkedNums* %r72, i1 0, i32 0
	%r80 = load i64* %r79
	%r81 = icmp slt i64 %r80, %r75
	br i1 %r81, label %LU31, label %LU32
LU31:
	%r82 = getelementptr inbounds %struct.linkedNums* %r72, i1 0, i32 0
	%r83 = load i64* %r82
	br label %LU30
LU32:
	%r84 = getelementptr inbounds %struct.linkedNums* %r72, i1 0, i32 0
	%r85 = load i64* %r84
	%r86 = icmp sgt i64 %r85, %r78
	br i1 %r86, label %LU34, label %LU33
LU34:
	%r87 = getelementptr inbounds %struct.linkedNums* %r72, i1 0, i32 0
	%r88 = load i64* %r87
	br label %LU33
LU33:
	%r102 = phi i64 [ %r88, %LU34 ], [ %r78, %LU32 ]
	br label %LU30
LU30:
	%r103 = phi i64 [ %r78, %LU31 ], [ %r102, %LU33 ]
	%r100 = phi i64 [ %r83, %LU31 ], [ %r75, %LU33 ]
	br label %LU27
LU27:
	%r104 = phi i64 [ %r77, %LU28 ], [ %r103, %LU30 ]
	%r101 = phi i64 [ %r74, %LU28 ], [ %r100, %LU30 ]
	%r98 = phi i64 [ 0, %LU28 ], [ %r71, %LU30 ]
	%r93 = getelementptr inbounds %struct.linkedNums* %r72, i1 0, i32 1
	%r94 = load %struct.linkedNums** %r93
	%r95 = icmp ne %struct.linkedNums* %r94, null
	br i1 %r95, label %LU26, label %LU24
LU24:
	%r106 = phi i64 [ 0, %LU25 ], [ %r104, %LU27 ]
	%r105 = phi i64 [ 0, %LU25 ], [ %r101, %LU27 ]
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r105)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r106)
	ret void
}

define i64 @main () {
LU35:
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r108 = load i64* @.read_scratch
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r109 = load i64* @.read_scratch
	%r110 = call %struct.linkedNums* @getRands(i64 %r108, i64 %r109)
	%r111 = call i64 @calcMean(%struct.linkedNums* %r110)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r111)
	call void @range(%struct.linkedNums* %r110)
	call void @approxSqrtAll(%struct.linkedNums* %r110)
	ret i64 0
}

