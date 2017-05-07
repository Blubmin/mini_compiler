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
	%r0 = call i8* @malloc(i64 16)
	%r1 = bitcast i8* %r0 to %struct.node*
	%r2 = call i8* @malloc(i64 16)
	%r3 = bitcast i8* %r2 to %struct.node*
	%r4 = call i8* @malloc(i64 16)
	%r5 = bitcast i8* %r4 to %struct.node*
	%r6 = call i8* @malloc(i64 16)
	%r7 = bitcast i8* %r6 to %struct.node*
	%r8 = call i8* @malloc(i64 16)
	%r9 = bitcast i8* %r8 to %struct.node*
	%r10 = call i8* @malloc(i64 16)
	%r11 = bitcast i8* %r10 to %struct.node*
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r12 = load i64* @.read_scratch
	%r13 = getelementptr inbounds %struct.node* %r1, i1 0, i32 0
	store i64 %r12, i64* %r13
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r14 = load i64* @.read_scratch
	%r15 = getelementptr inbounds %struct.node* %r3, i1 0, i32 0
	store i64 %r14, i64* %r15
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r16 = load i64* @.read_scratch
	%r17 = getelementptr inbounds %struct.node* %r5, i1 0, i32 0
	store i64 %r16, i64* %r17
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r18 = load i64* @.read_scratch
	%r19 = getelementptr inbounds %struct.node* %r7, i1 0, i32 0
	store i64 %r18, i64* %r19
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r20 = load i64* @.read_scratch
	%r21 = getelementptr inbounds %struct.node* %r9, i1 0, i32 0
	store i64 %r20, i64* %r21
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r22 = load i64* @.read_scratch
	%r23 = getelementptr inbounds %struct.node* %r11, i1 0, i32 0
	store i64 %r22, i64* %r23
	%r24 = getelementptr inbounds %struct.node* %r1, i1 0, i32 1
	store %struct.node* %r3, %struct.node** %r24
	%r25 = getelementptr inbounds %struct.node* %r3, i1 0, i32 1
	store %struct.node* %r5, %struct.node** %r25
	%r26 = getelementptr inbounds %struct.node* %r5, i1 0, i32 1
	store %struct.node* %r7, %struct.node** %r26
	%r27 = getelementptr inbounds %struct.node* %r7, i1 0, i32 1
	store %struct.node* %r9, %struct.node** %r27
	%r28 = getelementptr inbounds %struct.node* %r9, i1 0, i32 1
	store %struct.node* %r11, %struct.node** %r28
	%r29 = getelementptr inbounds %struct.node* %r11, i1 0, i32 1
	store %struct.node* null, %struct.node** %r29
	br label %LU1
LU1:
	ret %struct.node* %r1
}

define i64 @multiple (%struct.node* %r31) {
LU2:
	%r32 = getelementptr inbounds %struct.node* %r31, i1 0, i32 0
	%r33 = load i64* %r32
	%r34 = getelementptr inbounds %struct.node* %r31, i1 0, i32 1
	%r35 = load %struct.node** %r34
	br label %LU5
LU5:
	%r36 = icmp slt i64 0, 5
	br i1 %r36, label %LU6, label %LU4
LU6:
	%r44 = phi i64 [ 0, %LU5 ], [ %r45, %LU6 ]
	%r38 = phi %struct.node* [ %r35, %LU5 ], [ %r43, %LU6 ]
	%r37 = phi i64 [ %r33, %LU5 ], [ %r41, %LU6 ]
	%r39 = getelementptr inbounds %struct.node* %r38, i1 0, i32 0
	%r40 = load i64* %r39
	%r41 = mul i64 %r37, %r40
	%r42 = getelementptr inbounds %struct.node* %r38, i1 0, i32 1
	%r43 = load %struct.node** %r42
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r41)
	%r45 = add i64 %r44, 1
	%r46 = icmp slt i64 %r45, 5
	br i1 %r46, label %LU6, label %LU4
LU4:
	%r47 = phi i64 [ %r33, %LU5 ], [ %r41, %LU6 ]
	br label %LU3
LU3:
	ret i64 %r47
}

define i64 @add (%struct.node* %r49) {
LU7:
	%r50 = getelementptr inbounds %struct.node* %r49, i1 0, i32 0
	%r51 = load i64* %r50
	%r52 = getelementptr inbounds %struct.node* %r49, i1 0, i32 1
	%r53 = load %struct.node** %r52
	br label %LU10
LU10:
	%r54 = icmp slt i64 0, 5
	br i1 %r54, label %LU11, label %LU9
LU11:
	%r62 = phi i64 [ 0, %LU10 ], [ %r63, %LU11 ]
	%r56 = phi %struct.node* [ %r53, %LU10 ], [ %r61, %LU11 ]
	%r55 = phi i64 [ %r51, %LU10 ], [ %r59, %LU11 ]
	%r57 = getelementptr inbounds %struct.node* %r56, i1 0, i32 0
	%r58 = load i64* %r57
	%r59 = add i64 %r55, %r58
	%r60 = getelementptr inbounds %struct.node* %r56, i1 0, i32 1
	%r61 = load %struct.node** %r60
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r59)
	%r63 = add i64 %r62, 1
	%r64 = icmp slt i64 %r63, 5
	br i1 %r64, label %LU11, label %LU9
LU9:
	%r65 = phi i64 [ %r51, %LU10 ], [ %r59, %LU11 ]
	br label %LU8
LU8:
	ret i64 %r65
}

define i64 @recurseList (%struct.node* %r67) {
LU12:
	%r68 = getelementptr inbounds %struct.node* %r67, i1 0, i32 1
	%r69 = load %struct.node** %r68
	%r70 = icmp eq %struct.node* %r69, null
	br i1 %r70, label %LU15, label %LU16
LU15:
	%r71 = getelementptr inbounds %struct.node* %r67, i1 0, i32 0
	%r72 = load i64* %r71
	br label %LU13
LU16:
	%r73 = getelementptr inbounds %struct.node* %r67, i1 0, i32 0
	%r74 = load i64* %r73
	%r75 = getelementptr inbounds %struct.node* %r67, i1 0, i32 1
	%r76 = load %struct.node** %r75
	%r77 = call i64 @recurseList(%struct.node* %r76)
	%r78 = mul i64 %r74, %r77
	br label %LU13
LU13:
	%r80 = phi i64 [ %r72, %LU15 ], [ %r78, %LU16 ]
	ret i64 %r80
}

define i64 @main () {
LU17:
	%r81 = call %struct.node* @buildList()
	%r82 = call i64 @multiple(%struct.node* %r81)
	%r83 = call i64 @add(%struct.node* %r81)
	%r84 = sdiv i64 %r83, 2
	%r85 = sub i64 %r82, %r84
	br label %LU20
LU20:
	%r86 = icmp slt i64 0, 10
	br i1 %r86, label %LU21, label %LU19
LU21:
	%r91 = phi i64 [ 0, %LU20 ], [ %r92, %LU21 ]
	%r87 = phi i64 [ 0, %LU20 ], [ %r90, %LU21 ]
	%r89 = call i64 @recurseList(%struct.node* %r81)
	%r90 = add i64 %r87, %r89
	%r92 = add i64 %r91, 1
	%r93 = icmp slt i64 %r92, 10
	br i1 %r93, label %LU21, label %LU19
LU19:
	%r94 = phi i64 [ 0, %LU20 ], [ %r90, %LU21 ]
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r94)
	br label %LU23
LU23:
	%r95 = icmp ne i64 %r94, 0
	br i1 %r95, label %LU24, label %LU22
LU24:
	%r96 = phi i64 [ %r94, %LU23 ], [ %r97, %LU24 ]
	%r97 = sub i64 %r96, 1
	%r98 = icmp ne i64 %r97, 0
	br i1 %r98, label %LU24, label %LU22
LU22:
	%r103 = phi i64 [ %r94, %LU23 ], [ %r97, %LU24 ]
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r85)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r103)
	br label %LU18
LU18:
	ret i64 0
}

