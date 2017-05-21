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

%struct.Node = type {i64, %struct.Node*, %struct.Node*}

@swapped = common global i64 0, align 8

define i64 @compare (%struct.Node* %r0, %struct.Node* %r1) {
LU0:
	%r2 = getelementptr inbounds %struct.Node* %r0, i1 0, i32 0
	%r3 = load i64* %r2
	%r4 = getelementptr inbounds %struct.Node* %r1, i1 0, i32 0
	%r5 = load i64* %r4
	%r6 = sub i64 %r3, %r5
	br label %LU1
LU1:
	ret i64 %r6
}

define void @deathSort (%struct.Node* %r8) {
LU2:
	br label %LU5
LU5:
	%r9 = icmp eq i64 1, 1
	br label %LU6
LU6:
	%r23 = phi i64 [ 0, %LU5 ], [ %r48, %LU7 ]
	%r12 = phi %struct.Node* [ null, %LU5 ], [ %r47, %LU7 ]
	%r11 = phi %struct.Node* [ %r8, %LU5 ], [ %r46, %LU7 ]
	%r10 = phi i64 [ 1, %LU5 ], [ %r44, %LU7 ]
	br label %LU8
LU8:
	%r13 = getelementptr inbounds %struct.Node* %r11, i1 0, i32 2
	%r14 = load %struct.Node** %r13
	%r15 = icmp ne %struct.Node* %r14, %r11
	br i1 %r15, label %LU9, label %LU7
LU9:
	%r39 = phi %struct.Node* [ %r11, %LU8 ], [ %r39, %LU10 ]
	%r33 = phi i64 [ 0, %LU8 ], [ %r43, %LU10 ]
	%r24 = phi i64 [ %r23, %LU8 ], [ %r42, %LU10 ]
	%r16 = phi %struct.Node* [ %r11, %LU8 ], [ %r36, %LU10 ]
	%r17 = getelementptr inbounds %struct.Node* %r16, i1 0, i32 2
	%r18 = load %struct.Node** %r17
	%r19 = call i64 @compare(%struct.Node* %r16, %struct.Node* %r18)
	%r20 = icmp sgt i64 %r19, 0
	br i1 %r20, label %LU11, label %LU10
LU11:
	%r21 = getelementptr inbounds %struct.Node* %r16, i1 0, i32 0
	%r22 = load i64* %r21
	%r25 = getelementptr inbounds %struct.Node* %r16, i1 0, i32 2
	%r26 = load %struct.Node** %r25
	%r27 = getelementptr inbounds %struct.Node* %r26, i1 0, i32 0
	%r28 = load i64* %r27
	%r29 = getelementptr inbounds %struct.Node* %r16, i1 0, i32 0
	store i64 %r28, i64* %r29
	%r30 = getelementptr inbounds %struct.Node* %r16, i1 0, i32 2
	%r31 = load %struct.Node** %r30
	%r32 = getelementptr inbounds %struct.Node* %r31, i1 0, i32 0
	store i64 %r22, i64* %r32
	br label %LU10
LU10:
	%r43 = phi i64 [ 1, %LU11 ], [ %r33, %LU9 ]
	%r42 = phi i64 [ %r22, %LU11 ], [ %r24, %LU9 ]
	%r35 = getelementptr inbounds %struct.Node* %r16, i1 0, i32 2
	%r36 = load %struct.Node** %r35
	%r37 = getelementptr inbounds %struct.Node* %r36, i1 0, i32 2
	%r38 = load %struct.Node** %r37
	%r41 = icmp ne %struct.Node* %r38, %r39
	br i1 %r41, label %LU9, label %LU7
LU7:
	%r48 = phi i64 [ %r23, %LU8 ], [ %r42, %LU10 ]
	%r47 = phi %struct.Node* [ %r11, %LU8 ], [ %r36, %LU10 ]
	%r46 = phi %struct.Node* [ %r11, %LU8 ], [ %r39, %LU10 ]
	%r44 = phi i64 [ 0, %LU8 ], [ %r43, %LU10 ]
	%r45 = icmp eq i64 %r44, 1
	br i1 %r45, label %LU6, label %LU4
LU4:
	br label %LU3
LU3:
	ret void
}

define void @printEVILList (%struct.Node* %r50) {
LU12:
	%r51 = getelementptr inbounds %struct.Node* %r50, i1 0, i32 2
	%r52 = load %struct.Node** %r51
	%r53 = getelementptr inbounds %struct.Node* %r50, i1 0, i32 0
	%r54 = load i64* %r53
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r54)
	%r55 = bitcast %struct.Node* %r50 to i8*
	call void @free(i8* %r55)
	br label %LU15
LU15:
	%r56 = icmp ne %struct.Node* %r52, %r50
	br i1 %r56, label %LU16, label %LU14
LU16:
	%r58 = phi %struct.Node* [ null, %LU15 ], [ %r57, %LU16 ]
	%r57 = phi %struct.Node* [ %r52, %LU15 ], [ %r62, %LU16 ]
	%r59 = getelementptr inbounds %struct.Node* %r57, i1 0, i32 0
	%r60 = load i64* %r59
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r60)
	%r61 = getelementptr inbounds %struct.Node* %r57, i1 0, i32 2
	%r62 = load %struct.Node** %r61
	%r63 = bitcast %struct.Node* %r57 to i8*
	call void @free(i8* %r63)
	%r65 = icmp ne %struct.Node* %r62, %r50
	br i1 %r65, label %LU16, label %LU14
LU14:
	br label %LU13
LU13:
	ret void
}

define i64 @main () {
LU17:
	store i64 666, i64* @swapped
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r67 = load i64* @.read_scratch
	%r68 = icmp sle i64 %r67, 0
	br i1 %r68, label %LU20, label %LU19
LU20:
	%r69 = sub i64 0, 1
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 -1)
	%r70 = sub i64 0, 1
	br label %LU18
LU19:
	%r71 = mul i64 %r67, 1000
	%r72 = call i8* @malloc(i64 24)
	%r73 = bitcast i8* %r72 to %struct.Node*
	%r74 = getelementptr inbounds %struct.Node* %r73, i1 0, i32 0
	store i64 %r71, i64* %r74
	%r75 = getelementptr inbounds %struct.Node* %r73, i1 0, i32 1
	store %struct.Node* %r73, %struct.Node** %r75
	%r76 = getelementptr inbounds %struct.Node* %r73, i1 0, i32 2
	store %struct.Node* %r73, %struct.Node** %r76
	%r77 = sub i64 %r71, 1
	br label %LU22
LU22:
	%r78 = icmp sgt i64 %r77, 0
	br i1 %r78, label %LU23, label %LU21
LU23:
	%r84 = phi %struct.Node* [ %r73, %LU22 ], [ %r80, %LU23 ]
	%r82 = phi i64 [ %r77, %LU22 ], [ %r89, %LU23 ]
	%r81 = phi %struct.Node* [ null, %LU22 ], [ %r80, %LU23 ]
	%r79 = call i8* @malloc(i64 24)
	%r80 = bitcast i8* %r79 to %struct.Node*
	%r83 = getelementptr inbounds %struct.Node* %r80, i1 0, i32 0
	store i64 %r82, i64* %r83
	%r85 = getelementptr inbounds %struct.Node* %r80, i1 0, i32 1
	store %struct.Node* %r84, %struct.Node** %r85
	%r87 = getelementptr inbounds %struct.Node* %r80, i1 0, i32 2
	store %struct.Node* %r73, %struct.Node** %r87
	%r88 = getelementptr inbounds %struct.Node* %r84, i1 0, i32 2
	store %struct.Node* %r80, %struct.Node** %r88
	%r89 = sub i64 %r82, 1
	%r90 = icmp sgt i64 %r89, 0
	br i1 %r90, label %LU23, label %LU21
LU21:
	call void @deathSort(%struct.Node* %r73)
	call void @printEVILList(%struct.Node* %r73)
	br label %LU18
LU18:
	%r93 = phi i64 [ -1, %LU20 ], [ 0, %LU21 ]
	ret i64 %r93
}

