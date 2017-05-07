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
	br i1 %r9, label %LU6, label %LU4
LU6:
	%r23 = phi i64 [ 0, %LU5 ], [ %r23, %LU7 ]
	%r12 = phi %struct.Node* [ null, %LU5 ], [ %r43, %LU7 ]
	%r11 = phi %struct.Node* [ %r8, %LU5 ], [ %r11, %LU7 ]
	%r10 = phi i64 [ 1, %LU5 ], [ 0, %LU7 ]
	br label %LU8
LU8:
	%r13 = getelementptr inbounds %struct.Node* %r11, i1 0, i32 2
	%r14 = load %struct.Node** %r13
	%r15 = icmp ne %struct.Node* %r14, %r11
	br i1 %r15, label %LU9, label %LU7
LU9:
	%r16 = phi %struct.Node* [ %r11, %LU8 ], [ %r35, %LU10 ]
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
	%r34 = getelementptr inbounds %struct.Node* %r16, i1 0, i32 2
	%r35 = load %struct.Node** %r34
	%r36 = getelementptr inbounds %struct.Node* %r35, i1 0, i32 2
	%r37 = load %struct.Node** %r36
	%r39 = icmp ne %struct.Node* %r37, %r11
	br i1 %r39, label %LU9, label %LU7
LU7:
	%r43 = phi %struct.Node* [ %r11, %LU8 ], [ %r35, %LU10 ]
	%r41 = icmp eq i64 0, 1
	br i1 %r41, label %LU6, label %LU4
LU4:
	br label %LU3
LU3:
	ret void
}

define void @printEVILList (%struct.Node* %r46) {
LU12:
	%r47 = getelementptr inbounds %struct.Node* %r46, i1 0, i32 2
	%r48 = load %struct.Node** %r47
	%r49 = getelementptr inbounds %struct.Node* %r46, i1 0, i32 0
	%r50 = load i64* %r49
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r50)
	%r51 = bitcast %struct.Node* %r46 to i8*
	call void @free(i8* %r51)
	br label %LU15
LU15:
	%r52 = icmp ne %struct.Node* %r48, %r46
	br i1 %r52, label %LU16, label %LU14
LU16:
	%r54 = phi %struct.Node* [ null, %LU15 ], [ %r53, %LU16 ]
	%r53 = phi %struct.Node* [ %r48, %LU15 ], [ %r58, %LU16 ]
	%r55 = getelementptr inbounds %struct.Node* %r53, i1 0, i32 0
	%r56 = load i64* %r55
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r56)
	%r57 = getelementptr inbounds %struct.Node* %r53, i1 0, i32 2
	%r58 = load %struct.Node** %r57
	%r59 = bitcast %struct.Node* %r53 to i8*
	call void @free(i8* %r59)
	%r61 = icmp ne %struct.Node* %r58, %r46
	br i1 %r61, label %LU16, label %LU14
LU14:
	br label %LU13
LU13:
	ret void
}

define i64 @main () {
LU17:
	store i64 666, i64* @swapped
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r63 = load i64* @.read_scratch
	%r64 = icmp sle i64 %r63, 0
	br i1 %r64, label %LU20, label %LU19
LU20:
	%r65 = sub i64 0, 1
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r65)
	%r66 = sub i64 0, 1
	br label %LU18
LU19:
	%r67 = mul i64 %r63, 1000
	%r68 = call i8* @malloc(i64 24)
	%r69 = bitcast i8* %r68 to %struct.Node*
	%r70 = getelementptr inbounds %struct.Node* %r69, i1 0, i32 0
	store i64 %r67, i64* %r70
	%r71 = getelementptr inbounds %struct.Node* %r69, i1 0, i32 1
	store %struct.Node* %r69, %struct.Node** %r71
	%r72 = getelementptr inbounds %struct.Node* %r69, i1 0, i32 2
	store %struct.Node* %r69, %struct.Node** %r72
	%r73 = sub i64 %r67, 1
	br label %LU22
LU22:
	%r74 = icmp sgt i64 %r73, 0
	br i1 %r74, label %LU23, label %LU21
LU23:
	%r80 = phi %struct.Node* [ %r69, %LU22 ], [ %r76, %LU23 ]
	%r78 = phi i64 [ %r73, %LU22 ], [ %r85, %LU23 ]
	%r77 = phi %struct.Node* [ null, %LU22 ], [ %r76, %LU23 ]
	%r75 = call i8* @malloc(i64 24)
	%r76 = bitcast i8* %r75 to %struct.Node*
	%r79 = getelementptr inbounds %struct.Node* %r76, i1 0, i32 0
	store i64 %r78, i64* %r79
	%r81 = getelementptr inbounds %struct.Node* %r76, i1 0, i32 1
	store %struct.Node* %r80, %struct.Node** %r81
	%r83 = getelementptr inbounds %struct.Node* %r76, i1 0, i32 2
	store %struct.Node* %r69, %struct.Node** %r83
	%r84 = getelementptr inbounds %struct.Node* %r80, i1 0, i32 2
	store %struct.Node* %r76, %struct.Node** %r84
	%r85 = sub i64 %r78, 1
	%r86 = icmp sgt i64 %r85, 0
	br i1 %r86, label %LU23, label %LU21
LU21:
	call void @deathSort(%struct.Node* %r69)
	call void @printEVILList(%struct.Node* %r69)
	br label %LU18
LU18:
	%r89 = phi i64 [ %r66, %LU20 ], [ 0, %LU21 ]
	ret i64 %r89
}

