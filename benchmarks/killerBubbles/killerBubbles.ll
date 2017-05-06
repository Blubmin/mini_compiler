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
	%r44 = load %struct.Node** %currNode
	%r45 = getelementptr inbounds %struct.Node* %r44, i1 0, i32 2
	%r46 = load %struct.Node** %r45
	%r47 = load %struct.Node** %head
	%r48 = icmp ne %struct.Node* %r46, %r47
	br i1 %r48, label %LU9, label %LU7
LU7:
	%r49 = load i64* %swapped
	%r50 = icmp eq i64 %r49, 1
	br i1 %r50, label %LU6, label %LU4
LU4:
	br label %LU3
LU3:
	ret void
}

define void @printEVILList (%struct.Node* %r51) {
LU12:
	%currNode = alloca %struct.Node*
	%toFree = alloca %struct.Node*
	%head = alloca %struct.Node*
	store %struct.Node* %r51, %struct.Node** %head
	%r53 = load %struct.Node** %head
	%r54 = getelementptr inbounds %struct.Node* %r53, i1 0, i32 2
	%r55 = load %struct.Node** %r54
	store %struct.Node* %r55, %struct.Node** %currNode
	%r56 = load %struct.Node** %head
	%r57 = getelementptr inbounds %struct.Node* %r56, i1 0, i32 0
	%r58 = load i64* %r57
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r58)
	%r59 = load %struct.Node** %head
	%r60 = bitcast %struct.Node* %r59 to i8*
	call void @free(i8* %r60)
	br label %LU15
LU15:
	%r61 = load %struct.Node** %currNode
	%r62 = load %struct.Node** %head
	%r63 = icmp ne %struct.Node* %r61, %r62
	br i1 %r63, label %LU16, label %LU14
LU16:
	%r64 = load %struct.Node** %currNode
	store %struct.Node* %r64, %struct.Node** %toFree
	%r65 = load %struct.Node** %currNode
	%r66 = getelementptr inbounds %struct.Node* %r65, i1 0, i32 0
	%r67 = load i64* %r66
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r67)
	%r68 = load %struct.Node** %currNode
	%r69 = getelementptr inbounds %struct.Node* %r68, i1 0, i32 2
	%r70 = load %struct.Node** %r69
	store %struct.Node* %r70, %struct.Node** %currNode
	%r71 = load %struct.Node** %toFree
	%r72 = bitcast %struct.Node* %r71 to i8*
	call void @free(i8* %r72)
	%r73 = load %struct.Node** %currNode
	%r74 = load %struct.Node** %head
	%r75 = icmp ne %struct.Node* %r73, %r74
	br i1 %r75, label %LU16, label %LU14
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
	%r77 = load i64* @.read_scratch
	store i64 %r77, i64* %numNodes
	%r78 = load i64* %numNodes
	%r79 = icmp sle i64 %r78, 0
	br i1 %r79, label %LU20, label %LU19
LU20:
	%r80 = sub i64 0, 1
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r80)
	%r81 = sub i64 0, 1
	store i64 %r81, i64* %.ret
	br label %LU18
LU19:
	%r82 = load i64* %numNodes
	%r83 = mul i64 %r82, 1000
	store i64 %r83, i64* %numNodes
	%r84 = load i64* %numNodes
	store i64 %r84, i64* %counter
	%r85 = call i8* @malloc(i64 24)
	%r86 = bitcast i8* %r85 to %struct.Node*
	store %struct.Node* %r86, %struct.Node** %head
	%r87 = load i64* %counter
	%r88 = load %struct.Node** %head
	%r89 = getelementptr inbounds %struct.Node* %r88, i1 0, i32 0
	store i64 %r87, i64* %r89
	%r90 = load %struct.Node** %head
	%r91 = load %struct.Node** %head
	%r92 = getelementptr inbounds %struct.Node* %r91, i1 0, i32 1
	store %struct.Node* %r90, %struct.Node** %r92
	%r93 = load %struct.Node** %head
	%r94 = load %struct.Node** %head
	%r95 = getelementptr inbounds %struct.Node* %r94, i1 0, i32 2
	store %struct.Node* %r93, %struct.Node** %r95
	%r96 = load i64* %counter
	%r97 = sub i64 %r96, 1
	store i64 %r97, i64* %counter
	%r98 = load %struct.Node** %head
	store %struct.Node* %r98, %struct.Node** %previous
	br label %LU22
LU22:
	%r99 = load i64* %counter
	%r100 = icmp sgt i64 %r99, 0
	br i1 %r100, label %LU23, label %LU21
LU23:
	%r101 = call i8* @malloc(i64 24)
	%r102 = bitcast i8* %r101 to %struct.Node*
	store %struct.Node* %r102, %struct.Node** %currNode
	%r103 = load i64* %counter
	%r104 = load %struct.Node** %currNode
	%r105 = getelementptr inbounds %struct.Node* %r104, i1 0, i32 0
	store i64 %r103, i64* %r105
	%r106 = load %struct.Node** %previous
	%r107 = load %struct.Node** %currNode
	%r108 = getelementptr inbounds %struct.Node* %r107, i1 0, i32 1
	store %struct.Node* %r106, %struct.Node** %r108
	%r109 = load %struct.Node** %head
	%r110 = load %struct.Node** %currNode
	%r111 = getelementptr inbounds %struct.Node* %r110, i1 0, i32 2
	store %struct.Node* %r109, %struct.Node** %r111
	%r112 = load %struct.Node** %currNode
	%r113 = load %struct.Node** %previous
	%r114 = getelementptr inbounds %struct.Node* %r113, i1 0, i32 2
	store %struct.Node* %r112, %struct.Node** %r114
	%r115 = load %struct.Node** %currNode
	store %struct.Node* %r115, %struct.Node** %previous
	%r116 = load i64* %counter
	%r117 = sub i64 %r116, 1
	store i64 %r117, i64* %counter
	%r118 = load i64* %counter
	%r119 = icmp sgt i64 %r118, 0
	br i1 %r119, label %LU23, label %LU21
LU21:
	%r120 = load %struct.Node** %head
	call void @deathSort(%struct.Node* %r120)
	%r121 = load %struct.Node** %head
	call void @printEVILList(%struct.Node* %r121)
	store i64 0, i64* %.ret
	br label %LU18
LU18:
	%r76 = load i64* %.ret
	ret i64 %r76
}

