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
	%r0 = call i8* @malloc(i64 16)
	%r1 = bitcast i8* %r0 to %struct.node*
	store %struct.node* %r1, %struct.node** %n0
	%r2 = call i8* @malloc(i64 16)
	%r3 = bitcast i8* %r2 to %struct.node*
	store %struct.node* %r3, %struct.node** %n1
	%r4 = call i8* @malloc(i64 16)
	%r5 = bitcast i8* %r4 to %struct.node*
	store %struct.node* %r5, %struct.node** %n2
	%r6 = call i8* @malloc(i64 16)
	%r7 = bitcast i8* %r6 to %struct.node*
	store %struct.node* %r7, %struct.node** %n3
	%r8 = call i8* @malloc(i64 16)
	%r9 = bitcast i8* %r8 to %struct.node*
	store %struct.node* %r9, %struct.node** %n4
	%r10 = call i8* @malloc(i64 16)
	%r11 = bitcast i8* %r10 to %struct.node*
	store %struct.node* %r11, %struct.node** %n5
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r12 = load i64* @.read_scratch
	%r13 = load %struct.node** %n0
	%r14 = getelementptr inbounds %struct.node* %r13, i1 0, i32 0
	store i64 %r12, i64* %r14
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r15 = load i64* @.read_scratch
	%r16 = load %struct.node** %n1
	%r17 = getelementptr inbounds %struct.node* %r16, i1 0, i32 0
	store i64 %r15, i64* %r17
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r18 = load i64* @.read_scratch
	%r19 = load %struct.node** %n2
	%r20 = getelementptr inbounds %struct.node* %r19, i1 0, i32 0
	store i64 %r18, i64* %r20
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r21 = load i64* @.read_scratch
	%r22 = load %struct.node** %n3
	%r23 = getelementptr inbounds %struct.node* %r22, i1 0, i32 0
	store i64 %r21, i64* %r23
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r24 = load i64* @.read_scratch
	%r25 = load %struct.node** %n4
	%r26 = getelementptr inbounds %struct.node* %r25, i1 0, i32 0
	store i64 %r24, i64* %r26
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r27 = load i64* @.read_scratch
	%r28 = load %struct.node** %n5
	%r29 = getelementptr inbounds %struct.node* %r28, i1 0, i32 0
	store i64 %r27, i64* %r29
	%r30 = load %struct.node** %n1
	%r31 = load %struct.node** %n0
	%r32 = getelementptr inbounds %struct.node* %r31, i1 0, i32 1
	store %struct.node* %r30, %struct.node** %r32
	%r33 = load %struct.node** %n2
	%r34 = load %struct.node** %n1
	%r35 = getelementptr inbounds %struct.node* %r34, i1 0, i32 1
	store %struct.node* %r33, %struct.node** %r35
	%r36 = load %struct.node** %n3
	%r37 = load %struct.node** %n2
	%r38 = getelementptr inbounds %struct.node* %r37, i1 0, i32 1
	store %struct.node* %r36, %struct.node** %r38
	%r39 = load %struct.node** %n4
	%r40 = load %struct.node** %n3
	%r41 = getelementptr inbounds %struct.node* %r40, i1 0, i32 1
	store %struct.node* %r39, %struct.node** %r41
	%r42 = load %struct.node** %n5
	%r43 = load %struct.node** %n4
	%r44 = getelementptr inbounds %struct.node* %r43, i1 0, i32 1
	store %struct.node* %r42, %struct.node** %r44
	%r45 = load %struct.node** %n5
	%r46 = getelementptr inbounds %struct.node* %r45, i1 0, i32 1
	store %struct.node* null, %struct.node** %r46
	%r47 = load %struct.node** %n0
	store %struct.node* %r47, %struct.node** %.ret
	br label %LU1
LU1:
	%r48 = load %struct.node** %.ret
	ret %struct.node* %r48
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
	%r50 = load %struct.node** %list
	store %struct.node* %r50, %struct.node** %cur
	%r51 = load %struct.node** %cur
	%r52 = getelementptr inbounds %struct.node* %r51, i1 0, i32 0
	%r53 = load i64* %r52
	store i64 %r53, i64* %product
	%r54 = load %struct.node** %cur
	%r55 = getelementptr inbounds %struct.node* %r54, i1 0, i32 1
	%r56 = load %struct.node** %r55
	store %struct.node* %r56, %struct.node** %cur
	br label %LU5
LU5:
	%r57 = load i64* %i
	%r58 = icmp slt i64 %r57, 5
	br i1 %r58, label %LU6, label %LU4
LU6:
	%r59 = load i64* %product
	%r60 = load %struct.node** %cur
	%r61 = getelementptr inbounds %struct.node* %r60, i1 0, i32 0
	%r62 = load i64* %r61
	%r63 = mul i64 %r59, %r62
	store i64 %r63, i64* %product
	%r64 = load %struct.node** %cur
	%r65 = getelementptr inbounds %struct.node* %r64, i1 0, i32 1
	%r66 = load %struct.node** %r65
	store %struct.node* %r66, %struct.node** %cur
	%r67 = load i64* %product
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r67)
	%r68 = load i64* %i
	%r69 = add i64 %r68, 1
	store i64 %r69, i64* %i
	%r70 = load i64* %i
	%r71 = icmp slt i64 %r70, 5
	br i1 %r71, label %LU6, label %LU4
LU4:
	%r72 = load i64* %product
	store i64 %r72, i64* %.ret
	br label %LU3
LU3:
	%r73 = load i64* %.ret
	ret i64 %r73
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
	%r75 = load %struct.node** %list
	store %struct.node* %r75, %struct.node** %cur
	%r76 = load %struct.node** %cur
	%r77 = getelementptr inbounds %struct.node* %r76, i1 0, i32 0
	%r78 = load i64* %r77
	store i64 %r78, i64* %sum
	%r79 = load %struct.node** %cur
	%r80 = getelementptr inbounds %struct.node* %r79, i1 0, i32 1
	%r81 = load %struct.node** %r80
	store %struct.node* %r81, %struct.node** %cur
	br label %LU10
LU10:
	%r82 = load i64* %i
	%r83 = icmp slt i64 %r82, 5
	br i1 %r83, label %LU11, label %LU9
LU11:
	%r84 = load i64* %sum
	%r85 = load %struct.node** %cur
	%r86 = getelementptr inbounds %struct.node* %r85, i1 0, i32 0
	%r87 = load i64* %r86
	%r88 = add i64 %r84, %r87
	store i64 %r88, i64* %sum
	%r89 = load %struct.node** %cur
	%r90 = getelementptr inbounds %struct.node* %r89, i1 0, i32 1
	%r91 = load %struct.node** %r90
	store %struct.node* %r91, %struct.node** %cur
	%r92 = load i64* %sum
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r92)
	%r93 = load i64* %i
	%r94 = add i64 %r93, 1
	store i64 %r94, i64* %i
	%r95 = load i64* %i
	%r96 = icmp slt i64 %r95, 5
	br i1 %r96, label %LU11, label %LU9
LU9:
	%r97 = load i64* %sum
	store i64 %r97, i64* %.ret
	br label %LU8
LU8:
	%r98 = load i64* %.ret
	ret i64 %r98
}

define i64 @recurseList (%struct.node* %r99) {
LU12:
	%.ret = alloca i64
	%list = alloca %struct.node*
	store %struct.node* %r99, %struct.node** %list
	%r100 = load %struct.node** %list
	%r101 = getelementptr inbounds %struct.node* %r100, i1 0, i32 1
	%r102 = load %struct.node** %r101
	%r103 = icmp eq %struct.node* %r102, null
	br i1 %r103, label %LU15, label %LU16
LU15:
	%r104 = load %struct.node** %list
	%r105 = getelementptr inbounds %struct.node* %r104, i1 0, i32 0
	%r106 = load i64* %r105
	store i64 %r106, i64* %.ret
	br label %LU13
LU16:
	%r107 = load %struct.node** %list
	%r108 = getelementptr inbounds %struct.node* %r107, i1 0, i32 0
	%r109 = load i64* %r108
	%r110 = load %struct.node** %list
	%r111 = getelementptr inbounds %struct.node* %r110, i1 0, i32 1
	%r112 = load %struct.node** %r111
	%r113 = call i64 @recurseList(%struct.node* %r112)
	%r114 = mul i64 %r109, %r113
	store i64 %r114, i64* %.ret
	br label %LU13
LU13:
	%r115 = load i64* %.ret
	ret i64 %r115
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
	%r116 = call %struct.node* @buildList()
	store %struct.node* %r116, %struct.node** %list
	%r117 = load %struct.node** %list
	%r118 = call i64 @multiple(%struct.node* %r117)
	store i64 %r118, i64* %product
	%r119 = load %struct.node** %list
	%r120 = call i64 @add(%struct.node* %r119)
	store i64 %r120, i64* %sum
	%r121 = load i64* %product
	%r122 = load i64* %sum
	%r123 = sdiv i64 %r122, 2
	%r124 = sub i64 %r121, %r123
	store i64 %r124, i64* %result
	br label %LU20
LU20:
	%r125 = load i64* %i
	%r126 = icmp slt i64 %r125, 10
	br i1 %r126, label %LU21, label %LU19
LU21:
	%r127 = load i64* %bigProduct
	%r128 = load %struct.node** %list
	%r129 = call i64 @recurseList(%struct.node* %r128)
	%r130 = add i64 %r127, %r129
	store i64 %r130, i64* %bigProduct
	%r131 = load i64* %i
	%r132 = add i64 %r131, 1
	store i64 %r132, i64* %i
	%r133 = load i64* %i
	%r134 = icmp slt i64 %r133, 10
	br i1 %r134, label %LU21, label %LU19
LU19:
	%r135 = load i64* %bigProduct
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r135)
	br label %LU23
LU23:
	%r136 = load i64* %bigProduct
	%r137 = icmp ne i64 %r136, 0
	br i1 %r137, label %LU24, label %LU22
LU24:
	%r138 = load i64* %bigProduct
	%r139 = sub i64 %r138, 1
	store i64 %r139, i64* %bigProduct
	%r140 = load i64* %bigProduct
	%r141 = icmp ne i64 %r140, 0
	br i1 %r141, label %LU24, label %LU22
LU22:
	%r142 = load i64* %result
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r142)
	%r143 = load i64* %bigProduct
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r143)
	store i64 0, i64* %.ret
	br label %LU18
LU18:
	%r144 = load i64* %.ret
	ret i64 %r144
}

