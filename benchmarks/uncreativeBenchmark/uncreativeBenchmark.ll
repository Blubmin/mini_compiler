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

%struct.LameStruct = type {i64, i64, i64, i64, i64, i64, i64, i64, i64}


define i64 @countTotal (%struct.LameStruct* %r0) {
LU0:
	%r1 = getelementptr inbounds %struct.LameStruct* %r0, i1 0, i32 0
	%r2 = load i64* %r1
	%r3 = getelementptr inbounds %struct.LameStruct* %r0, i1 0, i32 1
	%r4 = load i64* %r3
	%r5 = add i64 %r2, %r4
	%r6 = getelementptr inbounds %struct.LameStruct* %r0, i1 0, i32 2
	%r7 = load i64* %r6
	%r8 = add i64 %r5, %r7
	%r9 = getelementptr inbounds %struct.LameStruct* %r0, i1 0, i32 3
	%r10 = load i64* %r9
	%r11 = add i64 %r8, %r10
	%r12 = getelementptr inbounds %struct.LameStruct* %r0, i1 0, i32 4
	%r13 = load i64* %r12
	%r14 = add i64 %r11, %r13
	%r15 = getelementptr inbounds %struct.LameStruct* %r0, i1 0, i32 5
	%r16 = load i64* %r15
	%r17 = add i64 %r14, %r16
	%r18 = getelementptr inbounds %struct.LameStruct* %r0, i1 0, i32 6
	%r19 = load i64* %r18
	%r20 = add i64 %r17, %r19
	%r21 = getelementptr inbounds %struct.LameStruct* %r0, i1 0, i32 7
	%r22 = load i64* %r21
	%r23 = add i64 %r20, %r22
	%r24 = getelementptr inbounds %struct.LameStruct* %r0, i1 0, i32 8
	%r25 = load i64* %r24
	%r26 = add i64 %r23, %r25
	ret i64 %r26
}

define i64 @printRecursive (i64 %r28, i64 %r29) {
LU2:
	%r30 = icmp eq i64 %r29, 0
	br i1 %r30, label %LU5, label %LU6
LU5:
	br label %LU3
LU6:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r28)
	%r31 = sub i64 %r29, 1
	%r32 = call i64 @printRecursive(i64 %r28, i64 %r31)
	br label %LU3
LU3:
	%r34 = phi i64 [ %r28, %LU5 ], [ %r32, %LU6 ]
	ret i64 %r34
}

define i64 @convertBinary (i64 %r35) {
LU7:
	%r36 = icmp eq i64 %r35, 0
	br i1 %r36, label %LU10, label %LU11
LU10:
	br label %LU8
LU11:
	%r37 = icmp eq i64 %r35, 1
	br i1 %r37, label %LU13, label %LU14
LU13:
	br label %LU8
LU14:
	%r38 = icmp eq i64 %r35, 2
	br i1 %r38, label %LU16, label %LU17
LU16:
	br label %LU8
LU17:
	%r39 = icmp eq i64 %r35, 3
	br i1 %r39, label %LU19, label %LU20
LU19:
	br label %LU8
LU20:
	%r40 = icmp eq i64 %r35, 4
	br i1 %r40, label %LU22, label %LU23
LU22:
	br label %LU8
LU23:
	%r41 = icmp eq i64 %r35, 5
	br i1 %r41, label %LU25, label %LU26
LU25:
	br label %LU8
LU26:
	%r42 = icmp eq i64 %r35, 6
	br i1 %r42, label %LU28, label %LU29
LU28:
	br label %LU8
LU29:
	%r43 = icmp eq i64 %r35, 7
	br i1 %r43, label %LU31, label %LU32
LU31:
	br label %LU8
LU32:
	%r44 = icmp eq i64 %r35, 8
	br i1 %r44, label %LU34, label %LU35
LU34:
	br label %LU8
LU35:
	br label %LU8
LU8:
	%r46 = phi i64 [ 0, %LU10 ], [ 1, %LU13 ], [ 10, %LU16 ], [ 11, %LU19 ], [ 100, %LU22 ], [ 101, %LU25 ], [ 110, %LU28 ], [ 111, %LU31 ], [ 1000, %LU34 ], [ 1001, %LU35 ]
	ret i64 %r46
}

define i64 @main () {
LU36:
	%r47 = call i8* @malloc(i64 72)
	%r48 = bitcast i8* %r47 to %struct.LameStruct*
	%r49 = getelementptr inbounds %struct.LameStruct* %r48, i1 0, i32 0
	store i64 0, i64* %r49
	%r50 = getelementptr inbounds %struct.LameStruct* %r48, i1 0, i32 1
	store i64 0, i64* %r50
	%r51 = getelementptr inbounds %struct.LameStruct* %r48, i1 0, i32 2
	store i64 0, i64* %r51
	%r52 = getelementptr inbounds %struct.LameStruct* %r48, i1 0, i32 3
	store i64 0, i64* %r52
	%r53 = getelementptr inbounds %struct.LameStruct* %r48, i1 0, i32 4
	store i64 0, i64* %r53
	%r54 = getelementptr inbounds %struct.LameStruct* %r48, i1 0, i32 5
	store i64 0, i64* %r54
	%r55 = getelementptr inbounds %struct.LameStruct* %r48, i1 0, i32 6
	store i64 0, i64* %r55
	%r56 = getelementptr inbounds %struct.LameStruct* %r48, i1 0, i32 7
	store i64 0, i64* %r56
	%r57 = getelementptr inbounds %struct.LameStruct* %r48, i1 0, i32 8
	store i64 0, i64* %r57
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r58 = load i64* @.read_scratch
	%r59 = icmp ne i64 %r58, 0
	br i1 %r59, label %LU40, label %LU38
LU40:
	%r62 = phi %struct.LameStruct* [ %r48, %LU36 ], [ %r62, %LU41 ]
	%r60 = phi i64 [ %r58, %LU36 ], [ %r106, %LU41 ]
	%r61 = icmp eq i64 %r60, 1
	br i1 %r61, label %LU42, label %LU43
LU42:
	%r63 = getelementptr inbounds %struct.LameStruct* %r62, i1 0, i32 0
	%r64 = load i64* %r63
	%r65 = add i64 %r64, 1
	%r66 = getelementptr inbounds %struct.LameStruct* %r62, i1 0, i32 0
	store i64 %r65, i64* %r66
	br label %LU41
LU43:
	%r67 = icmp eq i64 %r60, 2
	br i1 %r67, label %LU45, label %LU46
LU45:
	%r68 = getelementptr inbounds %struct.LameStruct* %r62, i1 0, i32 1
	%r69 = load i64* %r68
	%r70 = add i64 %r69, 1
	%r71 = getelementptr inbounds %struct.LameStruct* %r62, i1 0, i32 1
	store i64 %r70, i64* %r71
	br label %LU44
LU46:
	%r72 = icmp eq i64 %r60, 3
	br i1 %r72, label %LU48, label %LU49
LU48:
	%r73 = getelementptr inbounds %struct.LameStruct* %r62, i1 0, i32 2
	%r74 = load i64* %r73
	%r75 = add i64 %r74, 1
	%r76 = getelementptr inbounds %struct.LameStruct* %r62, i1 0, i32 2
	store i64 %r75, i64* %r76
	br label %LU47
LU49:
	%r77 = icmp eq i64 %r60, 4
	br i1 %r77, label %LU51, label %LU52
LU51:
	%r78 = getelementptr inbounds %struct.LameStruct* %r62, i1 0, i32 3
	%r79 = load i64* %r78
	%r80 = add i64 %r79, 1
	%r81 = getelementptr inbounds %struct.LameStruct* %r62, i1 0, i32 3
	store i64 %r80, i64* %r81
	br label %LU50
LU52:
	%r82 = icmp eq i64 %r60, 5
	br i1 %r82, label %LU54, label %LU55
LU54:
	%r83 = getelementptr inbounds %struct.LameStruct* %r62, i1 0, i32 4
	%r84 = load i64* %r83
	%r85 = add i64 %r84, 1
	%r86 = getelementptr inbounds %struct.LameStruct* %r62, i1 0, i32 4
	store i64 %r85, i64* %r86
	br label %LU53
LU55:
	%r87 = icmp eq i64 %r60, 6
	br i1 %r87, label %LU57, label %LU58
LU57:
	%r88 = getelementptr inbounds %struct.LameStruct* %r62, i1 0, i32 5
	%r89 = load i64* %r88
	%r90 = add i64 %r89, 1
	%r91 = getelementptr inbounds %struct.LameStruct* %r62, i1 0, i32 5
	store i64 %r90, i64* %r91
	br label %LU56
LU58:
	%r92 = icmp eq i64 %r60, 7
	br i1 %r92, label %LU60, label %LU61
LU60:
	%r93 = getelementptr inbounds %struct.LameStruct* %r62, i1 0, i32 6
	%r94 = load i64* %r93
	%r95 = add i64 %r94, 1
	%r96 = getelementptr inbounds %struct.LameStruct* %r62, i1 0, i32 6
	store i64 %r95, i64* %r96
	br label %LU59
LU61:
	%r97 = icmp eq i64 %r60, 8
	br i1 %r97, label %LU63, label %LU64
LU63:
	%r98 = getelementptr inbounds %struct.LameStruct* %r62, i1 0, i32 7
	%r99 = load i64* %r98
	%r100 = add i64 %r99, 1
	%r101 = getelementptr inbounds %struct.LameStruct* %r62, i1 0, i32 7
	store i64 %r100, i64* %r101
	br label %LU62
LU64:
	%r102 = getelementptr inbounds %struct.LameStruct* %r62, i1 0, i32 8
	%r103 = load i64* %r102
	%r104 = add i64 %r103, 1
	%r105 = getelementptr inbounds %struct.LameStruct* %r62, i1 0, i32 8
	store i64 %r104, i64* %r105
	br label %LU62
LU62:
	br label %LU59
LU59:
	br label %LU56
LU56:
	br label %LU53
LU53:
	br label %LU50
LU50:
	br label %LU47
LU47:
	br label %LU44
LU44:
	br label %LU41
LU41:
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r106 = load i64* @.read_scratch
	%r115 = icmp ne i64 %r106, 0
	br i1 %r115, label %LU40, label %LU38
LU38:
	%r124 = phi %struct.LameStruct* [ %r48, %LU36 ], [ %r62, %LU41 ]
	%r125 = call i64 @countTotal(%struct.LameStruct* %r124)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r125)
	%r126 = call i64 @convertBinary(i64 1)
	%r127 = getelementptr inbounds %struct.LameStruct* %r124, i1 0, i32 0
	%r128 = load i64* %r127
	call i64 @printRecursive(i64 %r126, i64 %r128)
	%r129 = call i64 @convertBinary(i64 2)
	%r130 = getelementptr inbounds %struct.LameStruct* %r124, i1 0, i32 1
	%r131 = load i64* %r130
	call i64 @printRecursive(i64 %r129, i64 %r131)
	%r132 = call i64 @convertBinary(i64 3)
	%r133 = getelementptr inbounds %struct.LameStruct* %r124, i1 0, i32 2
	%r134 = load i64* %r133
	call i64 @printRecursive(i64 %r132, i64 %r134)
	%r135 = call i64 @convertBinary(i64 4)
	%r136 = getelementptr inbounds %struct.LameStruct* %r124, i1 0, i32 3
	%r137 = load i64* %r136
	call i64 @printRecursive(i64 %r135, i64 %r137)
	%r138 = call i64 @convertBinary(i64 5)
	%r139 = getelementptr inbounds %struct.LameStruct* %r124, i1 0, i32 4
	%r140 = load i64* %r139
	call i64 @printRecursive(i64 %r138, i64 %r140)
	%r141 = call i64 @convertBinary(i64 6)
	%r142 = getelementptr inbounds %struct.LameStruct* %r124, i1 0, i32 5
	%r143 = load i64* %r142
	call i64 @printRecursive(i64 %r141, i64 %r143)
	%r144 = call i64 @convertBinary(i64 7)
	%r145 = getelementptr inbounds %struct.LameStruct* %r124, i1 0, i32 6
	%r146 = load i64* %r145
	call i64 @printRecursive(i64 %r144, i64 %r146)
	%r147 = call i64 @convertBinary(i64 8)
	%r148 = getelementptr inbounds %struct.LameStruct* %r124, i1 0, i32 7
	%r149 = load i64* %r148
	call i64 @printRecursive(i64 %r147, i64 %r149)
	%r150 = call i64 @convertBinary(i64 9)
	%r151 = getelementptr inbounds %struct.LameStruct* %r124, i1 0, i32 8
	%r152 = load i64* %r151
	call i64 @printRecursive(i64 %r150, i64 %r152)
	ret i64 0
}

