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
	br label %LU5
LU4:
	%r71 = load i64* %product
	store i64 %r71, i64* %.ret
	br label %LU3
LU3:
	%r50 = load i64* %.ret
	ret i64 %r50
}

define i64 @add (%struct.node* %r72) {
LU7:
	%i = alloca i64
	%sum = alloca i64
	%cur = alloca %struct.node*
	%.ret = alloca i64
	%list = alloca %struct.node*
	store %struct.node* %r72, %struct.node** %list
	store i64 0, i64* %i
	%r74 = load %struct.node** %list
	store %struct.node* %r74, %struct.node** %cur
	%r75 = load %struct.node** %cur
	%r76 = getelementptr inbounds %struct.node* %r75, i1 0, i32 0
	%r77 = load i64* %r76
	store i64 %r77, i64* %sum
	%r78 = load %struct.node** %cur
	%r79 = getelementptr inbounds %struct.node* %r78, i1 0, i32 1
	%r80 = load %struct.node** %r79
	store %struct.node* %r80, %struct.node** %cur
	br label %LU10
LU10:
	%r81 = load i64* %i
	%r82 = icmp slt i64 %r81, 5
	br i1 %r82, label %LU11, label %LU9
LU11:
	%r83 = load i64* %sum
	%r84 = load %struct.node** %cur
	%r85 = getelementptr inbounds %struct.node* %r84, i1 0, i32 0
	%r86 = load i64* %r85
	%r87 = add i64 %r83, %r86
	store i64 %r87, i64* %sum
	%r88 = load %struct.node** %cur
	%r89 = getelementptr inbounds %struct.node* %r88, i1 0, i32 1
	%r90 = load %struct.node** %r89
	store %struct.node* %r90, %struct.node** %cur
	%r91 = load i64* %sum
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r91)
	%r92 = load i64* %i
	%r93 = add i64 %r92, 1
	store i64 %r93, i64* %i
	br label %LU10
LU9:
	%r94 = load i64* %sum
	store i64 %r94, i64* %.ret
	br label %LU8
LU8:
	%r73 = load i64* %.ret
	ret i64 %r73
}

define i64 @recurseList (%struct.node* %r95) {
LU12:
	%.ret = alloca i64
	%list = alloca %struct.node*
	store %struct.node* %r95, %struct.node** %list
	%r97 = load %struct.node** %list
	%r98 = getelementptr inbounds %struct.node* %r97, i1 0, i32 1
	%r99 = load %struct.node** %r98
	%r100 = icmp eq %struct.node* %r99, null
	br i1 %r100, label %LU15, label %LU16
LU15:
	%r101 = load %struct.node** %list
	%r102 = getelementptr inbounds %struct.node* %r101, i1 0, i32 0
	%r103 = load i64* %r102
	store i64 %r103, i64* %.ret
	br label %LU13
LU16:
	%r104 = load %struct.node** %list
	%r105 = getelementptr inbounds %struct.node* %r104, i1 0, i32 0
	%r106 = load i64* %r105
	%r107 = load %struct.node** %list
	%r108 = getelementptr inbounds %struct.node* %r107, i1 0, i32 1
	%r109 = load %struct.node** %r108
	%r110 = call i64 @recurseList(%struct.node* %r109)
	%r111 = mul i64 %r106, %r110
	store i64 %r111, i64* %.ret
	br label %LU13
LU13:
	%r96 = load i64* %.ret
	ret i64 %r96
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
	%r113 = call %struct.node* @buildList()
	store %struct.node* %r113, %struct.node** %list
	%r114 = load %struct.node** %list
	%r115 = call i64 @multiple(%struct.node* %r114)
	store i64 %r115, i64* %product
	%r116 = load %struct.node** %list
	%r117 = call i64 @add(%struct.node* %r116)
	store i64 %r117, i64* %sum
	%r118 = load i64* %product
	%r119 = load i64* %sum
	%r120 = sdiv i64 %r119, 2
	%r121 = sub i64 %r118, %r120
	store i64 %r121, i64* %result
	br label %LU20
LU20:
	%r122 = load i64* %i
	%r123 = icmp slt i64 %r122, 10
	br i1 %r123, label %LU21, label %LU19
LU21:
	%r124 = load i64* %bigProduct
	%r125 = load %struct.node** %list
	%r126 = call i64 @recurseList(%struct.node* %r125)
	%r127 = add i64 %r124, %r126
    call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]*@.printhex, i32 0, i32 0), i64 %r127)
	store i64 %r127, i64* %bigProduct
	%r128 = load i64* %i
	%r129 = add i64 %r128, 1
	store i64 %r129, i64* %i
	br label %LU20
LU19:
	%r130 = load i64* %bigProduct
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r130)
	br label %LU23
LU23:
	%r131 = load i64* %bigProduct
	%r132 = icmp ne i64 %r131, 0
	br i1 %r132, label %LU24, label %LU22
LU24:
	%r133 = load i64* %bigProduct
	%r134 = sub i64 %r133, 1
	store i64 %r134, i64* %bigProduct
	br label %LU23
LU22:
	%r135 = load i64* %result
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r135)
	%r136 = load i64* %bigProduct
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r136)
	store i64 0, i64* %.ret
	br label %LU18
LU18:
	%r112 = load i64* %.ret
	ret i64 %r112
}

