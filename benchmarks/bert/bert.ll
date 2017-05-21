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
%struct.tnode = type {i64, %struct.tnode*, %struct.tnode*}
%struct.i = type {i64}
%struct.myCopy = type {i64}

@a = common global i64 0, align 8
@b = common global i64 0, align 8
@i = common global %struct.i* null, align 8

define %struct.node* @concatLists (%struct.node* %r0, %struct.node* %r1) {
LU0:
	%r2 = icmp eq %struct.node* %r0, null
	br i1 %r2, label %LU3, label %LU2
LU3:
	br label %LU1
LU2:
	br label %LU5
LU5:
	%r3 = getelementptr inbounds %struct.node* %r0, i1 0, i32 1
	%r4 = load %struct.node** %r3
	%r5 = icmp ne %struct.node* %r4, null
	br i1 %r5, label %LU6, label %LU4
LU6:
	%r6 = phi %struct.node* [ %r0, %LU5 ], [ %r8, %LU6 ]
	%r7 = getelementptr inbounds %struct.node* %r6, i1 0, i32 1
	%r8 = load %struct.node** %r7
	%r9 = getelementptr inbounds %struct.node* %r8, i1 0, i32 1
	%r10 = load %struct.node** %r9
	%r11 = icmp ne %struct.node* %r10, null
	br i1 %r11, label %LU6, label %LU4
LU4:
	%r14 = phi %struct.node* [ %r0, %LU5 ], [ %r8, %LU6 ]
	%r15 = getelementptr inbounds %struct.node* %r14, i1 0, i32 1
	store %struct.node* %r1, %struct.node** %r15
	br label %LU1
LU1:
	%r19 = phi %struct.node* [ %r1, %LU3 ], [ %r0, %LU4 ]
	ret %struct.node* %r19
}

define %struct.node* @add (%struct.node* %r20, i64 %r21) {
LU7:
	%r22 = call i8* @malloc(i64 16)
	%r23 = bitcast i8* %r22 to %struct.node*
	%r24 = getelementptr inbounds %struct.node* %r23, i1 0, i32 0
	store i64 %r21, i64* %r24
	%r25 = getelementptr inbounds %struct.node* %r23, i1 0, i32 1
	store %struct.node* %r20, %struct.node** %r25
	br label %LU8
LU8:
	ret %struct.node* %r23
}

define i64 @size (%struct.node* %r27) {
LU9:
	%r28 = icmp eq %struct.node* %r27, null
	br i1 %r28, label %LU12, label %LU11
LU12:
	br label %LU10
LU11:
	%r29 = getelementptr inbounds %struct.node* %r27, i1 0, i32 1
	%r30 = load %struct.node** %r29
	%r31 = call i64 @size(%struct.node* %r30)
	%r32 = add i64 1, %r31
	br label %LU10
LU10:
	%r34 = phi i64 [ 0, %LU12 ], [ %r32, %LU11 ]
	ret i64 %r34
}

define i64 @get (%struct.node* %r35, i64 %r36) {
LU13:
	%r37 = icmp eq i64 %r36, 0
	br i1 %r37, label %LU16, label %LU15
LU16:
	%r38 = getelementptr inbounds %struct.node* %r35, i1 0, i32 0
	%r39 = load i64* %r38
	br label %LU14
LU15:
	%r40 = getelementptr inbounds %struct.node* %r35, i1 0, i32 1
	%r41 = load %struct.node** %r40
	%r42 = sub i64 %r36, 1
	%r43 = call i64 @get(%struct.node* %r41, i64 %r42)
	br label %LU14
LU14:
	%r45 = phi i64 [ %r39, %LU16 ], [ %r43, %LU15 ]
	ret i64 %r45
}

define %struct.node* @pop (%struct.node* %r46) {
LU17:
	%r47 = getelementptr inbounds %struct.node* %r46, i1 0, i32 1
	%r48 = load %struct.node** %r47
	br label %LU18
LU18:
	ret %struct.node* %r48
}

define void @printList (%struct.node* %r50) {
LU19:
	%r51 = icmp ne %struct.node* %r50, null
	br i1 %r51, label %LU22, label %LU21
LU22:
	%r52 = getelementptr inbounds %struct.node* %r50, i1 0, i32 0
	%r53 = load i64* %r52
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r53)
	%r54 = getelementptr inbounds %struct.node* %r50, i1 0, i32 1
	%r55 = load %struct.node** %r54
	call void @printList(%struct.node* %r55)
	br label %LU21
LU21:
	br label %LU20
LU20:
	ret void
}

define void @treeprint (%struct.tnode* %r57) {
LU23:
	%r58 = icmp ne %struct.tnode* %r57, null
	br i1 %r58, label %LU26, label %LU25
LU26:
	%r59 = getelementptr inbounds %struct.tnode* %r57, i1 0, i32 1
	%r60 = load %struct.tnode** %r59
	call void @treeprint(%struct.tnode* %r60)
	%r61 = getelementptr inbounds %struct.tnode* %r57, i1 0, i32 0
	%r62 = load i64* %r61
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r62)
	%r63 = getelementptr inbounds %struct.tnode* %r57, i1 0, i32 2
	%r64 = load %struct.tnode** %r63
	call void @treeprint(%struct.tnode* %r64)
	br label %LU25
LU25:
	br label %LU24
LU24:
	ret void
}

define void @freeList (%struct.node* %r66) {
LU27:
	%r67 = icmp ne %struct.node* %r66, null
	br i1 %r67, label %LU30, label %LU29
LU30:
	%r68 = getelementptr inbounds %struct.node* %r66, i1 0, i32 1
	%r69 = load %struct.node** %r68
	call void @freeList(%struct.node* %r69)
	%r70 = bitcast %struct.node* %r66 to i8*
	call void @free(i8* %r70)
	br label %LU29
LU29:
	br label %LU28
LU28:
	ret void
}

define void @freeTree (%struct.tnode* %r72) {
LU31:
	%r73 = icmp eq %struct.tnode* %r72, null
	%r74 = xor i1 1, %r73
	br i1 %r74, label %LU34, label %LU33
LU34:
	%r75 = getelementptr inbounds %struct.tnode* %r72, i1 0, i32 1
	%r76 = load %struct.tnode** %r75
	call void @freeTree(%struct.tnode* %r76)
	%r77 = getelementptr inbounds %struct.tnode* %r72, i1 0, i32 2
	%r78 = load %struct.tnode** %r77
	call void @freeTree(%struct.tnode* %r78)
	%r79 = bitcast %struct.tnode* %r72 to i8*
	call void @free(i8* %r79)
	br label %LU33
LU33:
	br label %LU32
LU32:
	ret void
}

define %struct.node* @postOrder (%struct.tnode* %r81) {
LU35:
	%r82 = icmp ne %struct.tnode* %r81, null
	br i1 %r82, label %LU38, label %LU37
LU38:
	%r83 = call i8* @malloc(i64 16)
	%r84 = bitcast i8* %r83 to %struct.node*
	%r85 = getelementptr inbounds %struct.tnode* %r81, i1 0, i32 0
	%r86 = load i64* %r85
	%r87 = getelementptr inbounds %struct.node* %r84, i1 0, i32 0
	store i64 %r86, i64* %r87
	%r88 = getelementptr inbounds %struct.node* %r84, i1 0, i32 1
	store %struct.node* null, %struct.node** %r88
	%r89 = getelementptr inbounds %struct.tnode* %r81, i1 0, i32 1
	%r90 = load %struct.tnode** %r89
	%r91 = call %struct.node* @postOrder(%struct.tnode* %r90)
	%r92 = getelementptr inbounds %struct.tnode* %r81, i1 0, i32 2
	%r93 = load %struct.tnode** %r92
	%r94 = call %struct.node* @postOrder(%struct.tnode* %r93)
	%r95 = call %struct.node* @concatLists(%struct.node* %r91, %struct.node* %r94)
	%r96 = call %struct.node* @concatLists(%struct.node* %r95, %struct.node* %r84)
	br label %LU36
LU37:
	br label %LU36
LU36:
	%r98 = phi %struct.node* [ %r96, %LU38 ], [ null, %LU37 ]
	ret %struct.node* %r98
}

define %struct.tnode* @treeadd (%struct.tnode* %r99, i64 %r100) {
LU39:
	%r101 = icmp eq %struct.tnode* %r99, null
	br i1 %r101, label %LU42, label %LU41
LU42:
	%r102 = call i8* @malloc(i64 24)
	%r103 = bitcast i8* %r102 to %struct.tnode*
	%r104 = getelementptr inbounds %struct.tnode* %r103, i1 0, i32 0
	store i64 %r100, i64* %r104
	%r105 = getelementptr inbounds %struct.tnode* %r103, i1 0, i32 1
	store %struct.tnode* null, %struct.tnode** %r105
	%r106 = getelementptr inbounds %struct.tnode* %r103, i1 0, i32 2
	store %struct.tnode* null, %struct.tnode** %r106
	br label %LU40
LU41:
	%r107 = getelementptr inbounds %struct.tnode* %r99, i1 0, i32 0
	%r108 = load i64* %r107
	%r109 = icmp slt i64 %r100, %r108
	br i1 %r109, label %LU44, label %LU45
LU44:
	%r110 = getelementptr inbounds %struct.tnode* %r99, i1 0, i32 1
	%r111 = load %struct.tnode** %r110
	%r112 = call %struct.tnode* @treeadd(%struct.tnode* %r111, i64 %r100)
	%r113 = getelementptr inbounds %struct.tnode* %r99, i1 0, i32 1
	store %struct.tnode* %r112, %struct.tnode** %r113
	br label %LU43
LU45:
	%r114 = getelementptr inbounds %struct.tnode* %r99, i1 0, i32 2
	%r115 = load %struct.tnode** %r114
	%r116 = call %struct.tnode* @treeadd(%struct.tnode* %r115, i64 %r100)
	%r117 = getelementptr inbounds %struct.tnode* %r99, i1 0, i32 2
	store %struct.tnode* %r116, %struct.tnode** %r117
	br label %LU43
LU43:
	br label %LU40
LU40:
	%r120 = phi %struct.tnode* [ %r103, %LU42 ], [ %r99, %LU43 ]
	ret %struct.tnode* %r120
}

define %struct.node* @quickSort (%struct.node* %r121) {
LU46:
	%r122 = call i64 @size(%struct.node* %r121)
	%r123 = icmp sle i64 %r122, 1
	br i1 %r123, label %LU49, label %LU48
LU49:
	br label %LU47
LU48:
	%r124 = call i64 @get(%struct.node* %r121, i64 0)
	%r125 = call i64 @size(%struct.node* %r121)
	%r126 = sub i64 %r125, 1
	%r127 = call i64 @get(%struct.node* %r121, i64 %r126)
	%r128 = add i64 %r124, %r127
	%r129 = sdiv i64 %r128, 2
	br label %LU51
LU51:
	%r130 = icmp ne %struct.node* %r121, null
	br i1 %r130, label %LU52, label %LU50
LU52:
	%r142 = phi %struct.node* [ %r121, %LU51 ], [ %r145, %LU53 ]
	%r139 = phi %struct.node* [ null, %LU51 ], [ %r152, %LU53 ]
	%r136 = phi %struct.node* [ null, %LU51 ], [ %r151, %LU53 ]
	%r134 = phi i64 [ %r129, %LU51 ], [ %r134, %LU53 ]
	%r132 = phi i64 [ 0, %LU51 ], [ %r147, %LU53 ]
	%r131 = phi %struct.node* [ %r121, %LU51 ], [ %r131, %LU53 ]
	%r133 = call i64 @get(%struct.node* %r131, i64 %r132)
	%r135 = icmp sgt i64 %r133, %r134
	br i1 %r135, label %LU54, label %LU55
LU54:
	%r137 = call i64 @get(%struct.node* %r131, i64 %r132)
	%r138 = call %struct.node* @add(%struct.node* %r136, i64 %r137)
	br label %LU53
LU55:
	%r140 = call i64 @get(%struct.node* %r131, i64 %r132)
	%r141 = call %struct.node* @add(%struct.node* %r139, i64 %r140)
	br label %LU53
LU53:
	%r152 = phi %struct.node* [ %r139, %LU54 ], [ %r141, %LU55 ]
	%r151 = phi %struct.node* [ %r138, %LU54 ], [ %r136, %LU55 ]
	%r144 = getelementptr inbounds %struct.node* %r142, i1 0, i32 1
	%r145 = load %struct.node** %r144
	%r147 = add i64 %r132, 1
	%r148 = icmp ne %struct.node* %r145, null
	br i1 %r148, label %LU52, label %LU50
LU50:
	%r156 = phi %struct.node* [ null, %LU51 ], [ %r151, %LU53 ]
	%r154 = phi %struct.node* [ null, %LU51 ], [ %r152, %LU53 ]
	%r153 = phi %struct.node* [ %r121, %LU51 ], [ %r131, %LU53 ]
	call void @freeList(%struct.node* %r153)
	%r155 = call %struct.node* @quickSort(%struct.node* %r154)
	%r157 = call %struct.node* @quickSort(%struct.node* %r156)
	%r158 = call %struct.node* @concatLists(%struct.node* %r155, %struct.node* %r157)
	br label %LU47
LU47:
	%r160 = phi %struct.node* [ %r121, %LU49 ], [ %r158, %LU50 ]
	ret %struct.node* %r160
}

define %struct.node* @quickSortMain (%struct.node* %r161) {
LU56:
	call void @printList(%struct.node* %r161)
	%r162 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 <bound method Num.__neg__ of <cfg.Literal.Num object at 0x000001A87B62CB00>>)
	call void @printList(%struct.node* %r161)
	%r163 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 <bound method Num.__neg__ of <cfg.Literal.Num object at 0x000001A87B62CC50>>)
	call void @printList(%struct.node* %r161)
	%r164 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 <bound method Num.__neg__ of <cfg.Literal.Num object at 0x000001A87B62CDA0>>)
	br label %LU57
LU57:
	ret %struct.node* null
}

define i64 @treesearch (%struct.tnode* %r166, i64 %r167) {
LU58:
	%r168 = sub i64 0, 1
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 <bound method Num.__neg__ of <cfg.Literal.Num object at 0x000001A87B6323C8>>)
	%r169 = icmp ne %struct.tnode* %r166, null
	br i1 %r169, label %LU61, label %LU60
LU61:
	%r170 = getelementptr inbounds %struct.tnode* %r166, i1 0, i32 0
	%r171 = load i64* %r170
	%r172 = icmp eq i64 %r171, %r167
	br i1 %r172, label %LU63, label %LU62
LU63:
	br label %LU59
LU62:
	%r173 = getelementptr inbounds %struct.tnode* %r166, i1 0, i32 1
	%r174 = load %struct.tnode** %r173
	%r175 = call i64 @treesearch(%struct.tnode* %r174, i64 %r167)
	%r176 = icmp eq i64 %r175, 1
	br i1 %r176, label %LU65, label %LU64
LU65:
	br label %LU59
LU64:
	%r177 = getelementptr inbounds %struct.tnode* %r166, i1 0, i32 2
	%r178 = load %struct.tnode** %r177
	%r179 = call i64 @treesearch(%struct.tnode* %r178, i64 %r167)
	%r180 = icmp eq i64 %r179, 1
	br i1 %r180, label %LU67, label %LU68
LU67:
	br label %LU59
LU68:
	br label %LU59
LU60:
	br label %LU59
LU59:
	%r182 = phi i64 [ 1, %LU63 ], [ 1, %LU65 ], [ 1, %LU67 ], [ 0, %LU68 ], [ 0, %LU60 ]
	ret i64 1
}

define %struct.node* @inOrder (%struct.tnode* %r183) {
LU69:
	%r184 = icmp ne %struct.tnode* %r183, null
	br i1 %r184, label %LU72, label %LU73
LU72:
	%r185 = call i8* @malloc(i64 16)
	%r186 = bitcast i8* %r185 to %struct.node*
	%r187 = getelementptr inbounds %struct.tnode* %r183, i1 0, i32 0
	%r188 = load i64* %r187
	%r189 = getelementptr inbounds %struct.node* %r186, i1 0, i32 0
	store i64 %r188, i64* %r189
	%r190 = getelementptr inbounds %struct.node* %r186, i1 0, i32 1
	store %struct.node* null, %struct.node** %r190
	%r191 = getelementptr inbounds %struct.tnode* %r183, i1 0, i32 1
	%r192 = load %struct.tnode** %r191
	%r193 = call %struct.node* @inOrder(%struct.tnode* %r192)
	%r194 = getelementptr inbounds %struct.tnode* %r183, i1 0, i32 2
	%r195 = load %struct.tnode** %r194
	%r196 = call %struct.node* @inOrder(%struct.tnode* %r195)
	%r197 = call %struct.node* @concatLists(%struct.node* %r186, %struct.node* %r196)
	%r198 = call %struct.node* @concatLists(%struct.node* %r193, %struct.node* %r197)
	br label %LU70
LU73:
	br label %LU70
LU70:
	%r200 = phi %struct.node* [ %r198, %LU72 ], [ null, %LU73 ]
	ret %struct.node* %r200
}

define i64 @bintreesearch (%struct.tnode* %r201, i64 %r202) {
LU74:
	%r203 = sub i64 0, 1
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 <bound method Num.__neg__ of <cfg.Literal.Num object at 0x000001A87B63BCC0>>)
	%r204 = icmp ne %struct.tnode* %r201, null
	br i1 %r204, label %LU77, label %LU76
LU77:
	%r205 = getelementptr inbounds %struct.tnode* %r201, i1 0, i32 0
	%r206 = load i64* %r205
	%r207 = icmp eq i64 %r206, %r202
	br i1 %r207, label %LU79, label %LU78
LU79:
	br label %LU75
LU78:
	%r208 = getelementptr inbounds %struct.tnode* %r201, i1 0, i32 0
	%r209 = load i64* %r208
	%r210 = icmp slt i64 %r202, %r209
	br i1 %r210, label %LU81, label %LU82
LU81:
	%r211 = getelementptr inbounds %struct.tnode* %r201, i1 0, i32 1
	%r212 = load %struct.tnode** %r211
	%r213 = call i64 @bintreesearch(%struct.tnode* %r212, i64 %r202)
	br label %LU75
LU82:
	%r214 = getelementptr inbounds %struct.tnode* %r201, i1 0, i32 2
	%r215 = load %struct.tnode** %r214
	%r216 = call i64 @bintreesearch(%struct.tnode* %r215, i64 %r202)
	br label %LU75
LU76:
	br label %LU75
LU75:
	%r218 = phi i64 [ 1, %LU79 ], [ %r213, %LU81 ], [ %r216, %LU82 ], [ 0, %LU76 ]
	ret i64 %r218
}

define %struct.tnode* @buildTree (%struct.node* %r219) {
LU83:
	br label %LU86
LU86:
	%r220 = call i64 @size(%struct.node* %r219)
	%r221 = icmp slt i64 0, %r220
	br i1 %r221, label %LU87, label %LU85
LU87:
	%r224 = phi i64 [ 0, %LU86 ], [ %r227, %LU87 ]
	%r222 = phi %struct.tnode* [ null, %LU86 ], [ %r226, %LU87 ]
	%r225 = call i64 @get(%struct.node* %r219, i64 %r224)
	%r226 = call %struct.tnode* @treeadd(%struct.tnode* %r222, i64 %r225)
	%r227 = add i64 0, 1
	%r228 = call i64 @size(%struct.node* %r219)
	%r229 = icmp slt i64 1, %r228
	br i1 %r229, label %LU87, label %LU85
LU85:
	%r230 = phi %struct.tnode* [ null, %LU86 ], [ %r226, %LU87 ]
	br label %LU84
LU84:
	ret %struct.tnode* %r230
}

define void @treeMain (%struct.node* %r232) {
LU88:
	%r233 = call %struct.tnode* @buildTree(%struct.node* %r232)
	call void @treeprint(%struct.tnode* %r233)
	%r234 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 <bound method Num.__neg__ of <cfg.Literal.Num object at 0x000001A87B649320>>)
	%r235 = call %struct.node* @inOrder(%struct.tnode* %r233)
	call void @printList(%struct.node* %r235)
	%r236 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 <bound method Num.__neg__ of <cfg.Literal.Num object at 0x000001A87B649550>>)
	call void @freeList(%struct.node* %r235)
	%r237 = call %struct.node* @postOrder(%struct.tnode* %r233)
	call void @printList(%struct.node* %r237)
	%r238 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 <bound method Num.__neg__ of <cfg.Literal.Num object at 0x000001A87B6497B8>>)
	call void @freeList(%struct.node* %r237)
	%r239 = call i64 @treesearch(%struct.tnode* %r233, i64 0)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r239)
	%r240 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 <bound method Num.__neg__ of <cfg.Literal.Num object at 0x000001A87B649A20>>)
	%r241 = call i64 @treesearch(%struct.tnode* %r233, i64 10)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r241)
	%r242 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 <bound method Num.__neg__ of <cfg.Literal.Num object at 0x000001A87B649C50>>)
	%r243 = sub i64 0, 2
	%r244 = call i64 @treesearch(%struct.tnode* %r233, i64 %r243)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r244)
	%r245 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 <bound method Num.__neg__ of <cfg.Literal.Num object at 0x000001A87B649F28>>)
	%r246 = call i64 @treesearch(%struct.tnode* %r233, i64 2)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r246)
	%r247 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 <bound method Num.__neg__ of <cfg.Literal.Num object at 0x000001A87B64D198>>)
	%r248 = call i64 @treesearch(%struct.tnode* %r233, i64 3)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r248)
	%r249 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 <bound method Num.__neg__ of <cfg.Literal.Num object at 0x000001A87B64D3C8>>)
	%r250 = call i64 @treesearch(%struct.tnode* %r233, i64 9)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r250)
	%r251 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 <bound method Num.__neg__ of <cfg.Literal.Num object at 0x000001A87B64D5F8>>)
	%r252 = call i64 @treesearch(%struct.tnode* %r233, i64 1)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r252)
	%r253 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 <bound method Num.__neg__ of <cfg.Literal.Num object at 0x000001A87B64D828>>)
	%r254 = call i64 @bintreesearch(%struct.tnode* %r233, i64 0)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r254)
	%r255 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 <bound method Num.__neg__ of <cfg.Literal.Num object at 0x000001A87B64DA58>>)
	%r256 = call i64 @bintreesearch(%struct.tnode* %r233, i64 10)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r256)
	%r257 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 <bound method Num.__neg__ of <cfg.Literal.Num object at 0x000001A87B64DC88>>)
	%r258 = sub i64 0, 2
	%r259 = call i64 @bintreesearch(%struct.tnode* %r233, i64 %r258)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r259)
	%r260 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 <bound method Num.__neg__ of <cfg.Literal.Num object at 0x000001A87B64DF60>>)
	%r261 = call i64 @bintreesearch(%struct.tnode* %r233, i64 2)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r261)
	%r262 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 <bound method Num.__neg__ of <cfg.Literal.Num object at 0x000001A87B64F1D0>>)
	%r263 = call i64 @bintreesearch(%struct.tnode* %r233, i64 3)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r263)
	%r264 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 <bound method Num.__neg__ of <cfg.Literal.Num object at 0x000001A87B64F400>>)
	%r265 = call i64 @bintreesearch(%struct.tnode* %r233, i64 9)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r265)
	%r266 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 <bound method Num.__neg__ of <cfg.Literal.Num object at 0x000001A87B64F630>>)
	%r267 = call i64 @bintreesearch(%struct.tnode* %r233, i64 1)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r267)
	%r268 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 <bound method Num.__neg__ of <cfg.Literal.Num object at 0x000001A87B64F860>>)
	call void @freeTree(%struct.tnode* %r233)
	br label %LU89
LU89:
	ret void
}

define %struct.node* @myCopy (%struct.node* %r270) {
LU90:
	%r271 = icmp eq %struct.node* %r270, null
	br i1 %r271, label %LU93, label %LU92
LU93:
	br label %LU91
LU92:
	%r272 = getelementptr inbounds %struct.node* %r270, i1 0, i32 0
	%r273 = load i64* %r272
	%r274 = call %struct.node* @add(%struct.node* null, i64 %r273)
	%r275 = getelementptr inbounds %struct.node* %r270, i1 0, i32 1
	%r276 = load %struct.node** %r275
	%r277 = call %struct.node* @myCopy(%struct.node* %r276)
	%r278 = call %struct.node* @concatLists(%struct.node* %r274, %struct.node* %r277)
	br label %LU91
LU91:
	%r280 = phi %struct.node* [ null, %LU93 ], [ %r278, %LU92 ]
	ret %struct.node* %r280
}

define i64 @main () {
LU94:
	br label %LU97
LU97:
	%r281 = icmp slt i64 0, 10
	br i1 %r281, label %LU98, label %LU96
LU98:
	%r292 = phi i64 [ 0, %LU97 ], [ %r293, %LU98 ]
	%r291 = phi %struct.node* [ null, %LU97 ], [ %r290, %LU98 ]
	%r289 = phi %struct.node* [ null, %LU97 ], [ %r288, %LU98 ]
	%r287 = phi %struct.node* [ null, %LU97 ], [ %r286, %LU98 ]
	%r284 = phi %struct.node* [ null, %LU97 ], [ %r285, %LU98 ]
	%r283 = phi i64 [ 0, %LU97 ], [ %r282, %LU98 ]
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r282 = load i64* @.read_scratch
	%r285 = call %struct.node* @add(%struct.node* %r284, i64 %r282)
	%r286 = call %struct.node* @myCopy(%struct.node* %r285)
	%r288 = call %struct.node* @myCopy(%struct.node* %r285)
	%r290 = call %struct.node* @quickSortMain(%struct.node* %r286)
	call void @freeList(%struct.node* %r290)
	call void @treeMain(%struct.node* %r288)
	%r293 = add i64 0, 1
	%r294 = icmp slt i64 1, 10
	br i1 %r294, label %LU98, label %LU96
LU96:
	%r297 = phi %struct.node* [ null, %LU97 ], [ %r288, %LU98 ]
	%r296 = phi %struct.node* [ null, %LU97 ], [ %r286, %LU98 ]
	%r295 = phi %struct.node* [ null, %LU97 ], [ %r285, %LU98 ]
	call void @freeList(%struct.node* %r295)
	call void @freeList(%struct.node* %r296)
	call void @freeList(%struct.node* %r297)
	br label %LU95
LU95:
	ret i64 0
}

