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
	%r2 = load %struct.Node** %a
	%r3 = getelementptr inbounds %struct.Node* %r2, i1 0, i32 0
	%r4 = load i64* %r3
	%r5 = load %struct.Node** %b
	%r6 = getelementptr inbounds %struct.Node* %r5, i1 0, i32 0
	%r7 = load i64* %r6
	%r8 = sub i64 %r4, %r7
	store i64 %r8, i64* %.ret
	br label %LU1
LU1:
	%r9 = load i64* %.ret
	ret i64 %r9
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
	%r11 = load i64* %swapped
	%r12 = icmp eq i64 %r11, 1
	br i1 %r12, label %LU6, label %LU4
LU6:
	store i64 0, i64* %swapped
	%r13 = load %struct.Node** %head
	store %struct.Node* %r13, %struct.Node** %currNode
	br label %LU8
LU8:
	%r14 = load %struct.Node** %currNode
	%r15 = getelementptr inbounds %struct.Node* %r14, i1 0, i32 2
	%r16 = load %struct.Node** %r15
	%r17 = load %struct.Node** %head
	%r18 = icmp ne %struct.Node* %r16, %r17
	br i1 %r18, label %LU9, label %LU7
LU9:
	%r19 = load %struct.Node** %currNode
	%r20 = load %struct.Node** %currNode
	%r21 = getelementptr inbounds %struct.Node* %r20, i1 0, i32 2
	%r22 = load %struct.Node** %r21
	%r23 = call i64 @compare(%struct.Node* %r19, %struct.Node* %r22)
	%r24 = icmp sgt i64 %r23, 0
	br i1 %r24, label %LU11, label %LU10
LU11:
	%r25 = load %struct.Node** %currNode
	%r26 = getelementptr inbounds %struct.Node* %r25, i1 0, i32 0
	%r27 = load i64* %r26
	store i64 %r27, i64* %swap
	%r28 = load %struct.Node** %currNode
	%r29 = getelementptr inbounds %struct.Node* %r28, i1 0, i32 2
	%r30 = load %struct.Node** %r29
	%r31 = getelementptr inbounds %struct.Node* %r30, i1 0, i32 0
	%r32 = load i64* %r31
	%r33 = load %struct.Node** %currNode
	%r34 = getelementptr inbounds %struct.Node* %r33, i1 0, i32 0
	store i64 %r32, i64* %r34
	%r35 = load i64* %swap
	%r36 = load %struct.Node** %currNode
	%r37 = getelementptr inbounds %struct.Node* %r36, i1 0, i32 2
	%r38 = load %struct.Node** %r37
	%r39 = getelementptr inbounds %struct.Node* %r38, i1 0, i32 0
	store i64 %r35, i64* %r39
	store i64 1, i64* %swapped
	br label %LU10
LU10:
	%r40 = load %struct.Node** %currNode
	%r41 = getelementptr inbounds %struct.Node* %r40, i1 0, i32 2
	%r42 = load %struct.Node** %r41
	store %struct.Node* %r42, %struct.Node** %currNode
	%r43 = load %struct.Node** %currNode
	%r44 = getelementptr inbounds %struct.Node* %r43, i1 0, i32 2
	%r45 = load %struct.Node** %r44
	%r46 = load %struct.Node** %head
	%r47 = icmp ne %struct.Node* %r45, %r46
	br i1 %r47, label %LU9, label %LU7
LU7:
	%r48 = load i64* %swapped
	%r49 = icmp eq i64 %r48, 1
	br i1 %r49, label %LU6, label %LU4
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
	%r52 = load %struct.Node** %head
	%r53 = getelementptr inbounds %struct.Node* %r52, i1 0, i32 2
	%r54 = load %struct.Node** %r53
	store %struct.Node* %r54, %struct.Node** %currNode
	%r55 = load %struct.Node** %head
	%r56 = getelementptr inbounds %struct.Node* %r55, i1 0, i32 0
	%r57 = load i64* %r56
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r57)
	%r58 = load %struct.Node** %head
	%r59 = bitcast %struct.Node* %r58 to i8*
	call void @free(i8* %r59)
	br label %LU15
LU15:
	%r60 = load %struct.Node** %currNode
	%r61 = load %struct.Node** %head
	%r62 = icmp ne %struct.Node* %r60, %r61
	br i1 %r62, label %LU16, label %LU14
LU16:
	%r63 = load %struct.Node** %currNode
	store %struct.Node* %r63, %struct.Node** %toFree
	%r64 = load %struct.Node** %currNode
	%r65 = getelementptr inbounds %struct.Node* %r64, i1 0, i32 0
	%r66 = load i64* %r65
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r66)
	%r67 = load %struct.Node** %currNode
	%r68 = getelementptr inbounds %struct.Node* %r67, i1 0, i32 2
	%r69 = load %struct.Node** %r68
	store %struct.Node* %r69, %struct.Node** %currNode
	%r70 = load %struct.Node** %toFree
	%r71 = bitcast %struct.Node* %r70 to i8*
	call void @free(i8* %r71)
	%r72 = load %struct.Node** %currNode
	%r73 = load %struct.Node** %head
	%r74 = icmp ne %struct.Node* %r72, %r73
	br i1 %r74, label %LU16, label %LU14
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
	%r76 = load i64* @.read_scratch
	store i64 %r76, i64* %numNodes
	%r77 = load i64* %numNodes
	%r78 = icmp sle i64 %r77, 0
	br i1 %r78, label %LU20, label %LU19
LU20:
	%r79 = sub i64 0, 1
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r79)
	%r80 = sub i64 0, 1
	store i64 %r80, i64* %.ret
	br label %LU18
LU19:
	%r81 = load i64* %numNodes
	%r82 = mul i64 %r81, 1000
	store i64 %r82, i64* %numNodes
	%r83 = load i64* %numNodes
	store i64 %r83, i64* %counter
	%r84 = call i8* @malloc(i64 24)
	%r85 = bitcast i8* %r84 to %struct.Node*
	store %struct.Node* %r85, %struct.Node** %head
	%r86 = load i64* %counter
	%r87 = load %struct.Node** %head
	%r88 = getelementptr inbounds %struct.Node* %r87, i1 0, i32 0
	store i64 %r86, i64* %r88
	%r89 = load %struct.Node** %head
	%r90 = load %struct.Node** %head
	%r91 = getelementptr inbounds %struct.Node* %r90, i1 0, i32 1
	store %struct.Node* %r89, %struct.Node** %r91
	%r92 = load %struct.Node** %head
	%r93 = load %struct.Node** %head
	%r94 = getelementptr inbounds %struct.Node* %r93, i1 0, i32 2
	store %struct.Node* %r92, %struct.Node** %r94
	%r95 = load i64* %counter
	%r96 = sub i64 %r95, 1
	store i64 %r96, i64* %counter
	%r97 = load %struct.Node** %head
	store %struct.Node* %r97, %struct.Node** %previous
	br label %LU22
LU22:
	%r98 = load i64* %counter
	%r99 = icmp sgt i64 %r98, 0
	br i1 %r99, label %LU23, label %LU21
LU23:
	%r100 = call i8* @malloc(i64 24)
	%r101 = bitcast i8* %r100 to %struct.Node*
	store %struct.Node* %r101, %struct.Node** %currNode
	%r102 = load i64* %counter
	%r103 = load %struct.Node** %currNode
	%r104 = getelementptr inbounds %struct.Node* %r103, i1 0, i32 0
	store i64 %r102, i64* %r104
	%r105 = load %struct.Node** %previous
	%r106 = load %struct.Node** %currNode
	%r107 = getelementptr inbounds %struct.Node* %r106, i1 0, i32 1
	store %struct.Node* %r105, %struct.Node** %r107
	%r108 = load %struct.Node** %head
	%r109 = load %struct.Node** %currNode
	%r110 = getelementptr inbounds %struct.Node* %r109, i1 0, i32 2
	store %struct.Node* %r108, %struct.Node** %r110
	%r111 = load %struct.Node** %currNode
	%r112 = load %struct.Node** %previous
	%r113 = getelementptr inbounds %struct.Node* %r112, i1 0, i32 2
	store %struct.Node* %r111, %struct.Node** %r113
	%r114 = load %struct.Node** %currNode
	store %struct.Node* %r114, %struct.Node** %previous
	%r115 = load i64* %counter
	%r116 = sub i64 %r115, 1
	store i64 %r116, i64* %counter
	%r117 = load i64* %counter
	%r118 = icmp sgt i64 %r117, 0
	br i1 %r118, label %LU23, label %LU21
LU21:
	%r119 = load %struct.Node** %head
	call void @deathSort(%struct.Node* %r119)
	%r120 = load %struct.Node** %head
	call void @printEVILList(%struct.Node* %r120)
	store i64 0, i64* %.ret
	br label %LU18
LU18:
	%r121 = load i64* %.ret
	ret i64 %r121
}

