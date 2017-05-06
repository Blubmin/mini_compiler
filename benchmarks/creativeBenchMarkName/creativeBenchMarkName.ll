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

%struct.node = type {i64, %struct.node*}


define %struct.node* @buildList () {
LU0:
	%input = alloca i64
	%i = alloca i64
	%n0 = alloca %struct.node*
	%n1 = alloca %struct.node*
	%n2 = alloca %struct.node*
	%n3 = alloca %struct.node*
	%n4 = alloca %struct.node*
	%n5 = alloca %struct.node*
	%.ret = alloca %struct.node*
	%r1 = call i8* @malloc(i64 16)
	%r2 = bitcast i8* %r1 to %struct.node*
	store %struct.node* %r2, %struct.node** %n0
	%r3 = call i8* @malloc(i64 16)
	%r4 = bitcast i8* %r3 to %struct.node*
	store %struct.node* %r4, %struct.node** %n1
	%r5 = call i8* @malloc(i64 16)
	%r6 = bitcast i8* %r5 to %struct.node*
	store %struct.node* %r6, %struct.node** %n2
	%r7 = call i8* @malloc(i64 16)
	%r8 = bitcast i8* %r7 to %struct.node*
	store %struct.node* %r8, %struct.node** %n3
	%r9 = call i8* @malloc(i64 16)
	%r10 = bitcast i8* %r9 to %struct.node*
	store %struct.node* %r10, %struct.node** %n4
	%r11 = call i8* @malloc(i64 16)
	%r12 = bitcast i8* %r11 to %struct.node*
	store %struct.node* %r12, %struct.node** %n5
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r13 = load i64* @.read_scratch
	%r14 = load %struct.node** %n0
	%r15 = getelementptr inbounds %struct.node* %r14, i1 0, i32 0
	store i64 %r13, i64* %r15
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r16 = load i64* @.read_scratch
	%r17 = load %struct.node** %n1
	%r18 = getelementptr inbounds %struct.node* %r17, i1 0, i32 0
	store i64 %r16, i64* %r18
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r19 = load i64* @.read_scratch
	%r20 = load %struct.node** %n2
	%r21 = getelementptr inbounds %struct.node* %r20, i1 0, i32 0
	store i64 %r19, i64* %r21
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r22 = load i64* @.read_scratch
	%r23 = load %struct.node** %n3
	%r24 = getelementptr inbounds %struct.node* %r23, i1 0, i32 0
	store i64 %r22, i64* %r24
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r25 = load i64* @.read_scratch
	%r26 = load %struct.node** %n4
	%r27 = getelementptr inbounds %struct.node* %r26, i1 0, i32 0
	store i64 %r25, i64* %r27
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r28 = load i64* @.read_scratch
	%r29 = load %struct.node** %n5
	%r30 = getelementptr inbounds %struct.node* %r29, i1 0, i32 0
	store i64 %r28, i64* %r30
	%r31 = load %struct.node** %n1
	%r32 = load %struct.node** %n0
	%r33 = getelementptr inbounds %struct.node* %r32, i1 0, i32 1
	store %struct.node* %r31, %struct.node** %r33
	%r34 = load %struct.node** %n2
	%r35 = load %struct.node** %n1
	%r36 = getelementptr inbounds %struct.node* %r35, i1 0, i32 1
	store %struct.node* %r34, %struct.node** %r36
	%r37 = load %struct.node** %n3
	%r38 = load %struct.node** %n2
	%r39 = getelementptr inbounds %struct.node* %r38, i1 0, i32 1
	store %struct.node* %r37, %struct.node** %r39
	%r40 = load %struct.node** %n4
	%r41 = load %struct.node** %n3
	%r42 = getelementptr inbounds %struct.node* %r41, i1 0, i32 1
	store %struct.node* %r40, %struct.node** %r42
	%r43 = load %struct.node** %n5
	%r44 = load %struct.node** %n4
	%r45 = getelementptr inbounds %struct.node* %r44, i1 0, i32 1
	store %struct.node* %r43, %struct.node** %r45
	%r46 = load %struct.node** %n5
	%r47 = getelementptr inbounds %struct.node* %r46, i1 0, i32 1
	store %struct.node* null, %struct.node** %r47
	%r48 = load %struct.node** %n0
	store %struct.node* %r48, %struct.node** %.ret
	br label %LU1
LU1:
	%r0 = load %struct.node** %.ret
	ret %struct.node* %r0
}

define i64 @multiple (%struct.node* %r49) {
LU2:
	%i = alloca i64
	%product = alloca i64
	%cur = alloca %struct.node*
	%.ret = alloca i64
	%list = alloca %struct.node*
	store %struct.node* %r49, %struct.node** %list
	store i64 0, i64* %i
	%r51 = load %struct.node** %list
	store %struct.node* %r51, %struct.node** %cur
	%r52 = load %struct.node** %cur
	%r53 = getelementptr inbounds %struct.node* %r52, i1 0, i32 0
	%r54 = load i64* %r53
	store i64 %r54, i64* %product
	%r55 = load %struct.node** %cur
	%r56 = getelementptr inbounds %struct.node* %r55, i1 0, i32 1
	%r57 = load %struct.node** %r56
	store %struct.node* %r57, %struct.node** %cur
	br label %LU5
LU5:
	%r58 = load i64* %i
	%r59 = icmp slt i64 %r58, 5
	br i1 %r59, label %LU6, label %LU4
LU6:
	%r60 = load i64* %product
	%r61 = load %struct.node** %cur
	%r62 = getelementptr inbounds %struct.node* %r61, i1 0, i32 0
	%r63 = load i64* %r62
	%r64 = mul i64 %r60, %r63
	store i64 %r64, i64* %product
	%r65 = load %struct.node** %cur
	%r66 = getelementptr inbounds %struct.node* %r65, i1 0, i32 1
	%r67 = load %struct.node** %r66
	store %struct.node* %r67, %struct.node** %cur
	%r68 = load i64* %product
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r68)
	%r69 = load i64* %i
	%r70 = add i64 %r69, 1
	store i64 %r70, i64* %i
	%r71 = load i64* %i
	%r72 = icmp slt i64 %r71, 5
	br i1 %r72, label %LU6, label %LU4
LU4:
	%r73 = load i64* %product
	store i64 %r73, i64* %.ret
	br label %LU3
LU3:
	%r50 = load i64* %.ret
	ret i64 %r50
}

define i64 @add (%struct.node* %r74) {
LU7:
	%i = alloca i64
	%sum = alloca i64
	%cur = alloca %struct.node*
	%.ret = alloca i64
	%list = alloca %struct.node*
	store %struct.node* %r74, %struct.node** %list
	store i64 0, i64* %i
	%r76 = load %struct.node** %list
	store %struct.node* %r76, %struct.node** %cur
	%r77 = load %struct.node** %cur
	%r78 = getelementptr inbounds %struct.node* %r77, i1 0, i32 0
	%r79 = load i64* %r78
	store i64 %r79, i64* %sum
	%r80 = load %struct.node** %cur
	%r81 = getelementptr inbounds %struct.node* %r80, i1 0, i32 1
	%r82 = load %struct.node** %r81
	store %struct.node* %r82, %struct.node** %cur
	br label %LU10
LU10:
	%r83 = load i64* %i
	%r84 = icmp slt i64 %r83, 5
	br i1 %r84, label %LU11, label %LU9
LU11:
	%r85 = load i64* %sum
	%r86 = load %struct.node** %cur
	%r87 = getelementptr inbounds %struct.node* %r86, i1 0, i32 0
	%r88 = load i64* %r87
	%r89 = add i64 %r85, %r88
	store i64 %r89, i64* %sum
	%r90 = load %struct.node** %cur
	%r91 = getelementptr inbounds %struct.node* %r90, i1 0, i32 1
	%r92 = load %struct.node** %r91
	store %struct.node* %r92, %struct.node** %cur
	%r93 = load i64* %sum
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r93)
	%r94 = load i64* %i
	%r95 = add i64 %r94, 1
	store i64 %r95, i64* %i
	%r96 = load i64* %i
	%r97 = icmp slt i64 %r96, 5
	br i1 %r97, label %LU11, label %LU9
LU9:
	%r98 = load i64* %sum
	store i64 %r98, i64* %.ret
	br label %LU8
LU8:
	%r75 = load i64* %.ret
	ret i64 %r75
}

define i64 @recurseList (%struct.node* %r99) {
LU12:
	%.ret = alloca i64
	%list = alloca %struct.node*
	store %struct.node* %r99, %struct.node** %list
	%r101 = load %struct.node** %list
	%r102 = getelementptr inbounds %struct.node* %r101, i1 0, i32 1
	%r103 = load %struct.node** %r102
	%r104 = icmp eq %struct.node* %r103, null
	br i1 %r104, label %LU15, label %LU16
LU15:
	%r105 = load %struct.node** %list
	%r106 = getelementptr inbounds %struct.node* %r105, i1 0, i32 0
	%r107 = load i64* %r106
	store i64 %r107, i64* %.ret
	br label %LU13
LU16:
	%r108 = load %struct.node** %list
	%r109 = getelementptr inbounds %struct.node* %r108, i1 0, i32 0
	%r110 = load i64* %r109
	%r111 = load %struct.node** %list
	%r112 = getelementptr inbounds %struct.node* %r111, i1 0, i32 1
	%r113 = load %struct.node** %r112
	%r114 = call i64 @recurseList(%struct.node* %r113)
	%r115 = mul i64 %r110, %r114
	store i64 %r115, i64* %.ret
	br label %LU13
LU13:
	%r100 = load i64* %.ret
	ret i64 %r100
}

define i64 @main () {
LU17:
	%list = alloca %struct.node*
	%product = alloca i64
	%sum = alloca i64
	%result = alloca i64
	%bigProduct = alloca i64
	%i = alloca i64
	%.ret = alloca i64
	store i64 0, i64* %i
	store i64 0, i64* %bigProduct
	%r117 = call %struct.node* @buildList()
	store %struct.node* %r117, %struct.node** %list
	%r118 = load %struct.node** %list
	%r119 = call i64 @multiple(%struct.node* %r118)
	store i64 %r119, i64* %product
	%r120 = load %struct.node** %list
	%r121 = call i64 @add(%struct.node* %r120)
	store i64 %r121, i64* %sum
	%r122 = load i64* %product
	%r123 = load i64* %sum
	%r124 = sdiv i64 %r123, 2
	%r125 = sub i64 %r122, %r124
	store i64 %r125, i64* %result
	br label %LU20
LU20:
	%r126 = load i64* %i
	%r127 = icmp slt i64 %r126, 10
	br i1 %r127, label %LU21, label %LU19
LU21:
	%r128 = load i64* %bigProduct
	%r129 = load %struct.node** %list
	%r130 = call i64 @recurseList(%struct.node* %r129)
	%r131 = add i64 %r128, %r130
	store i64 %r131, i64* %bigProduct
	%r132 = load i64* %i
	%r133 = add i64 %r132, 1
	store i64 %r133, i64* %i
	%r134 = load i64* %i
	%r135 = icmp slt i64 %r134, 10
	br i1 %r135, label %LU21, label %LU19
LU19:
	%r136 = load i64* %bigProduct
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r136)
	br label %LU23
LU23:
	%r137 = load i64* %bigProduct
	%r138 = icmp ne i64 %r137, 0
	br i1 %r138, label %LU24, label %LU22
LU24:
	%r139 = load i64* %bigProduct
	%r140 = sub i64 %r139, 1
	store i64 %r140, i64* %bigProduct
	%r141 = load i64* %bigProduct
	%r142 = icmp ne i64 %r141, 0
	br i1 %r142, label %LU24, label %LU22
LU22:
	%r143 = load i64* %result
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r143)
	%r144 = load i64* %bigProduct
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r144)
	store i64 0, i64* %.ret
	br label %LU18
LU18:
	%r116 = load i64* %.ret
	ret i64 %r116
}

