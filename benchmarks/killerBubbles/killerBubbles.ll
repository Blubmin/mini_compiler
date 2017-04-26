declare i8* @malloc(i64)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i64 0, align 8

%struct.Node = type {i64, %struct.Node*, %struct.Node*}

@swapped = common global i64 0, align 8

define i64 @compare (%struct.Node* %r0, %struct.Node* %r1) {
LU0:
	%.ret = alloca i64
	%a = alloca %struct.Node*
	store %struct.Node* %r0, %struct.Node** %a
	%b = alloca %struct.Node*
	store %struct.Node* %r1, %struct.Node** %b
	%r3 = load %struct.Node** %a
	%r4 = getelementptr inbounds %struct.Node* %r3, i1 0, i32 0
	%r5 = load i64* %r4
	%r6 = load %struct.Node** %b
	%r7 = getelementptr inbounds %struct.Node* %r6, i1 0, i32 0
	%r8 = load i64* %r7
	%r9 = sub i64 %r5, %r8
	store i64 %r9, i64* %.ret
	br label %LU1
LU1:
	%r2 = load i64* %.ret
	ret i64 %r2
}

define void @deathSort (%struct.Node* %r10) {
LU2:
	%swapped = alloca i64
	%swap = alloca i64
	%currNode = alloca %struct.Node*
	%head = alloca %struct.Node*
	store %struct.Node* %r10, %struct.Node** %head
	store i64 1, i64* %swapped
	br label %LU5
LU5:
	%r12 = load i64* %swapped
	%r13 = icmp eq i64 %r12, 1
	br i1 %r13, label %LU6, label %LU4
LU6:
	store i64 0, i64* %swapped
	%r14 = load %struct.Node** %head
	store %struct.Node* %r14, %struct.Node** %currNode
	br label %LU8
LU8:
	%r15 = load %struct.Node** %currNode
	%r16 = getelementptr inbounds %struct.Node* %r15, i1 0, i32 2
	%r17 = load %struct.Node** %r16
	%r18 = load %struct.Node** %head
	%r19 = icmp ne %struct.Node* %r17, %r18
	br i1 %r19, label %LU9, label %LU7
LU9:
	%r20 = load %struct.Node** %currNode
	%r21 = load %struct.Node** %currNode
	%r22 = getelementptr inbounds %struct.Node* %r21, i1 0, i32 2
	%r23 = load %struct.Node** %r22
	%r24 = call i64 @compare(%struct.Node* %r20, %struct.Node* %r23)
	%r25 = icmp sgt i64 %r24, 0
	br i1 %r25, label %LU11, label %LU10
LU11:
	%r26 = load %struct.Node** %currNode
	%r27 = getelementptr inbounds %struct.Node* %r26, i1 0, i32 0
	%r28 = load i64* %r27
	store i64 %r28, i64* %swap
	%r29 = load %struct.Node** %currNode
	%r30 = getelementptr inbounds %struct.Node* %r29, i1 0, i32 2
	%r31 = load %struct.Node** %r30
	%r32 = getelementptr inbounds %struct.Node* %r31, i1 0, i32 0
	%r33 = load i64* %r32
	%r34 = load %struct.Node** %currNode
	%r35 = getelementptr inbounds %struct.Node* %r34, i1 0, i32 0
	store i64 %r33, i64* %r35
	%r36 = load i64* %swap
	%r37 = load %struct.Node** %currNode
	%r38 = getelementptr inbounds %struct.Node* %r37, i1 0, i32 2
	%r39 = load %struct.Node** %r38
	%r40 = getelementptr inbounds %struct.Node* %r39, i1 0, i32 0
	store i64 %r36, i64* %r40
	store i64 1, i64* %swapped
	br label %LU10
LU10:
	%r41 = load %struct.Node** %currNode
	%r42 = getelementptr inbounds %struct.Node* %r41, i1 0, i32 2
	%r43 = load %struct.Node** %r42
	store %struct.Node* %r43, %struct.Node** %currNode
	br label %LU8
LU7:
	br label %LU5
LU4:
	br label %LU3
LU3:
	ret void
}

define void @printEVILList (%struct.Node* %r44) {
LU12:
	%currNode = alloca %struct.Node*
	%toFree = alloca %struct.Node*
	%head = alloca %struct.Node*
	store %struct.Node* %r44, %struct.Node** %head
	%r46 = load %struct.Node** %head
	%r47 = getelementptr inbounds %struct.Node* %r46, i1 0, i32 2
	%r48 = load %struct.Node** %r47
	store %struct.Node* %r48, %struct.Node** %currNode
	%r49 = load %struct.Node** %head
	%r50 = getelementptr inbounds %struct.Node* %r49, i1 0, i32 0
	%r51 = load i64* %r50
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r51)
	%r52 = load %struct.Node** %head
	%r53 = bitcast %struct.Node* %r52 to i8*
	call void @free(i8* %r53)
	br label %LU15
LU15:
	%r54 = load %struct.Node** %currNode
	%r55 = load %struct.Node** %head
	%r56 = icmp ne %struct.Node* %r54, %r55
	br i1 %r56, label %LU16, label %LU14
LU16:
	%r57 = load %struct.Node** %currNode
	store %struct.Node* %r57, %struct.Node** %toFree
	%r58 = load %struct.Node** %currNode
	%r59 = getelementptr inbounds %struct.Node* %r58, i1 0, i32 0
	%r60 = load i64* %r59
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r60)
	%r61 = load %struct.Node** %currNode
	%r62 = getelementptr inbounds %struct.Node* %r61, i1 0, i32 2
	%r63 = load %struct.Node** %r62
	store %struct.Node* %r63, %struct.Node** %currNode
	%r64 = load %struct.Node** %toFree
	%r65 = bitcast %struct.Node* %r64 to i8*
	call void @free(i8* %r65)
	br label %LU15
LU14:
	br label %LU13
LU13:
	ret void
}

define i64 @main () {
LU17:
	%numNodes = alloca i64
	%counter = alloca i64
	%currNode = alloca %struct.Node*
	%head = alloca %struct.Node*
	%previous = alloca %struct.Node*
	%.ret = alloca i64
	store i64 666, i64* @swapped
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r67 = load i64* @.read_scratch
	store i64 %r67, i64* %numNodes
	%r68 = load i64* %numNodes
	%r69 = icmp sle i64 %r68, 0
	br i1 %r69, label %LU20, label %LU19
LU20:
	%r70 = sub i64 0, 1
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r70)
	%r71 = sub i64 0, 1
	store i64 %r71, i64* %.ret
	br label %LU18
LU19:
	%r72 = load i64* %numNodes
	%r73 = mul i64 %r72, 1000
	store i64 %r73, i64* %numNodes
	%r74 = load i64* %numNodes
	store i64 %r74, i64* %counter
	%r75 = call i8* @malloc(i64 24)
	%r76 = bitcast i8* %r75 to %struct.Node*
	store %struct.Node* %r76, %struct.Node** %head
	%r77 = load i64* %counter
	%r78 = load %struct.Node** %head
	%r79 = getelementptr inbounds %struct.Node* %r78, i1 0, i32 0
	store i64 %r77, i64* %r79
	%r80 = load %struct.Node** %head
	%r81 = load %struct.Node** %head
	%r82 = getelementptr inbounds %struct.Node* %r81, i1 0, i32 1
	store %struct.Node* %r80, %struct.Node** %r82
	%r83 = load %struct.Node** %head
	%r84 = load %struct.Node** %head
	%r85 = getelementptr inbounds %struct.Node* %r84, i1 0, i32 2
	store %struct.Node* %r83, %struct.Node** %r85
	%r86 = load i64* %counter
	%r87 = sub i64 %r86, 1
	store i64 %r87, i64* %counter
	%r88 = load %struct.Node** %head
	store %struct.Node* %r88, %struct.Node** %previous
	br label %LU22
LU22:
	%r89 = load i64* %counter
	%r90 = icmp sgt i64 %r89, 0
	br i1 %r90, label %LU23, label %LU21
LU23:
	%r91 = call i8* @malloc(i64 24)
	%r92 = bitcast i8* %r91 to %struct.Node*
	store %struct.Node* %r92, %struct.Node** %currNode
	%r93 = load i64* %counter
	%r94 = load %struct.Node** %currNode
	%r95 = getelementptr inbounds %struct.Node* %r94, i1 0, i32 0
	store i64 %r93, i64* %r95
	%r96 = load %struct.Node** %previous
	%r97 = load %struct.Node** %currNode
	%r98 = getelementptr inbounds %struct.Node* %r97, i1 0, i32 1
	store %struct.Node* %r96, %struct.Node** %r98
	%r99 = load %struct.Node** %head
	%r100 = load %struct.Node** %currNode
	%r101 = getelementptr inbounds %struct.Node* %r100, i1 0, i32 2
	store %struct.Node* %r99, %struct.Node** %r101
	%r102 = load %struct.Node** %currNode
	%r103 = load %struct.Node** %previous
	%r104 = getelementptr inbounds %struct.Node* %r103, i1 0, i32 2
	store %struct.Node* %r102, %struct.Node** %r104
	%r105 = load %struct.Node** %currNode
	store %struct.Node* %r105, %struct.Node** %previous
	%r106 = load i64* %counter
	%r107 = sub i64 %r106, 1
	store i64 %r107, i64* %counter
	br label %LU22
LU21:
	%r108 = load %struct.Node** %head
	call void @deathSort(%struct.Node* %r108)
	%r109 = load %struct.Node** %head
	call void @printEVILList(%struct.Node* %r109)
	store i64 0, i64* %.ret
	br label %LU18
LU18:
	%r66 = load i64* %.ret
	ret i64 %r66
}

