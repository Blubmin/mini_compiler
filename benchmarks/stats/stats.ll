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
	br label %LU3
LU3:
	%r8 = icmp sgt i64 %r7, 0
	br i1 %r8, label %LU4, label %LU2
LU4:
	%r23 = phi i64 [ %r7, %LU3 ], [ %r24, %LU4 ]
	%r21 = phi %struct.linkedNums* [ %r4, %LU3 ], [ %r18, %LU4 ]
	%r19 = phi %struct.linkedNums* [ null, %LU3 ], [ %r18, %LU4 ]
	%r16 = phi i64 [ %r2, %LU3 ], [ %r15, %LU4 ]
	%r9 = phi i64 [ %r2, %LU3 ], [ %r15, %LU4 ]
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
	%r26 = phi %struct.linkedNums* [ null, %LU3 ], [ %r18, %LU4 ]
	br label %LU1
LU1:
	ret %struct.linkedNums* %r26
}

define i64 @calcMean (%struct.linkedNums* %r28) {
LU5:
	br label %LU8
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
	br label %LU6
LU6:
	ret i64 0
}

define i64 @approxSqrt (i64 %r47) {
LU12:
	br label %LU15
LU15:
	%r48 = icmp slt i64 0, %r47
	br i1 %r48, label %LU16, label %LU14
LU16:
	%r52 = phi i64 [ 1, %LU15 ], [ %r49, %LU16 ]
	%r51 = phi i64 [ 0, %LU15 ], [ %r50, %LU16 ]
	%r49 = phi i64 [ 1, %LU15 ], [ %r53, %LU16 ]
	%r50 = mul i64 %r49, %r49
	%r53 = add i64 %r49, 1
	%r55 = icmp slt i64 %r50, %r47
	br i1 %r55, label %LU16, label %LU14
LU14:
	%r56 = phi i64 [ 1, %LU15 ], [ %r49, %LU16 ]
	br label %LU13
LU13:
	ret i64 %r56
}

define void @approxSqrtAll (%struct.linkedNums* %r58) {
LU17:
	br label %LU20
LU20:
	%r59 = icmp ne %struct.linkedNums* %r58, null
	br i1 %r59, label %LU21, label %LU19
LU21:
	%r60 = phi %struct.linkedNums* [ %r58, %LU20 ], [ %r65, %LU21 ]
	%r61 = getelementptr inbounds %struct.linkedNums* %r60, i1 0, i32 0
	%r62 = load i64* %r61
	%r63 = call i64 @approxSqrt(i64 %r62)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r63)
	%r64 = getelementptr inbounds %struct.linkedNums* %r60, i1 0, i32 1
	%r65 = load %struct.linkedNums** %r64
	%r66 = icmp ne %struct.linkedNums* %r65, null
	br i1 %r66, label %LU21, label %LU19
LU19:
	br label %LU18
LU18:
	ret void
}

define void @range (%struct.linkedNums* %r68) {
LU22:
	br label %LU25
LU25:
	%r69 = icmp ne %struct.linkedNums* %r68, null
	br i1 %r69, label %LU26, label %LU24
LU26:
	%r77 = phi i64 [ 0, %LU25 ], [ %r95, %LU27 ]
	%r74 = phi i64 [ 0, %LU25 ], [ %r94, %LU27 ]
	%r71 = phi %struct.linkedNums* [ %r68, %LU25 ], [ %r91, %LU27 ]
	%r70 = phi i64 [ 1, %LU25 ], [ %r93, %LU27 ]
	%r88 = trunc i64 %r70 to i1
	br i1 %r88, label %LU28, label %LU29
LU28:
	%r72 = getelementptr inbounds %struct.linkedNums* %r71, i1 0, i32 0
	%r73 = load i64* %r72
	%r75 = getelementptr inbounds %struct.linkedNums* %r71, i1 0, i32 0
	%r76 = load i64* %r75
	br label %LU27
LU29:
	%r78 = getelementptr inbounds %struct.linkedNums* %r71, i1 0, i32 0
	%r79 = load i64* %r78
	%r80 = icmp slt i64 %r79, %r74
	br i1 %r80, label %LU31, label %LU32
LU31:
	%r81 = getelementptr inbounds %struct.linkedNums* %r71, i1 0, i32 0
	%r82 = load i64* %r81
	br label %LU30
LU32:
	%r83 = getelementptr inbounds %struct.linkedNums* %r71, i1 0, i32 0
	%r84 = load i64* %r83
	%r85 = icmp sgt i64 %r84, %r77
	br i1 %r85, label %LU34, label %LU33
LU34:
	%r86 = getelementptr inbounds %struct.linkedNums* %r71, i1 0, i32 0
	%r87 = load i64* %r86
	br label %LU33
LU33:
	br label %LU30
LU30:
	br label %LU27
LU27:
	%r95 = phi i64 [ %r76, %LU28 ], [ %r77, %LU29 ]
	%r94 = phi i64 [ %r73, %LU28 ], [ %r74, %LU29 ]
	%r93 = phi i64 [ 0, %LU28 ], [ %r70, %LU29 ]
	%r90 = getelementptr inbounds %struct.linkedNums* %r71, i1 0, i32 1
	%r91 = load %struct.linkedNums** %r90
	%r92 = icmp ne %struct.linkedNums* %r91, null
	br i1 %r92, label %LU26, label %LU24
LU24:
	%r97 = phi i64 [ 0, %LU25 ], [ %r95, %LU27 ]
	%r96 = phi i64 [ 0, %LU25 ], [ %r94, %LU27 ]
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r96)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r97)
	br label %LU23
LU23:
	ret void
}

define i64 @main () {
LU35:
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r99 = load i64* @.read_scratch
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r100 = load i64* @.read_scratch
	%r101 = call %struct.linkedNums* @getRands(i64 %r99, i64 %r100)
	%r102 = call i64 @calcMean(%struct.linkedNums* %r101)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r102)
	call void @range(%struct.linkedNums* %r101)
	call void @approxSqrtAll(%struct.linkedNums* %r101)
	br label %LU36
LU36:
	ret i64 0
}

