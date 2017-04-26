declare i8* @malloc(i64)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
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
	%temp = alloca %struct.node*
	%.ret = alloca %struct.node*
	%first = alloca %struct.node*
	store %struct.node* %r0, %struct.node** %first
	%second = alloca %struct.node*
	store %struct.node* %r1, %struct.node** %second
	%r3 = load %struct.node** %first
	store %struct.node* %r3, %struct.node** %temp
	%r4 = load %struct.node** %first
	%r5 = icmp eq %struct.node* %r4, null
	br i1 %r5, label %LU3, label %LU2
LU3:
	%r6 = load %struct.node** %second
	store %struct.node* %r6, %struct.node** %.ret
	br label %LU1
LU2:
	br label %LU5
LU5:
	%r7 = load %struct.node** %temp
	%r8 = getelementptr inbounds %struct.node* %r7, i1 0, i32 1
	%r9 = load %struct.node** %r8
	%r10 = icmp ne %struct.node* %r9, null
	br i1 %r10, label %LU6, label %LU4
LU6:
	%r11 = load %struct.node** %temp
	%r12 = getelementptr inbounds %struct.node* %r11, i1 0, i32 1
	%r13 = load %struct.node** %r12
	store %struct.node* %r13, %struct.node** %temp
	br label %LU5
LU4:
	%r14 = load %struct.node** %second
	%r15 = load %struct.node** %temp
	%r16 = getelementptr inbounds %struct.node* %r15, i1 0, i32 1
	store %struct.node* %r14, %struct.node** %r16
	%r17 = load %struct.node** %first
	store %struct.node* %r17, %struct.node** %.ret
	br label %LU1
LU1:
	%r2 = load %struct.node** %.ret
	ret %struct.node* %r2
}

define %struct.node* @add (%struct.node* %r18, i64 %r19) {
LU7:
	%newNode = alloca %struct.node*
	%.ret = alloca %struct.node*
	%list = alloca %struct.node*
	store %struct.node* %r18, %struct.node** %list
	%toAdd = alloca i64
	store i64 %r19, i64* %toAdd
	%r21 = call i8* @malloc(i64 16)
	%r22 = bitcast i8* %r21 to %struct.node*
	store %struct.node* %r22, %struct.node** %newNode
	%r23 = load i64* %toAdd
	%r24 = load %struct.node** %newNode
	%r25 = getelementptr inbounds %struct.node* %r24, i1 0, i32 0
	store i64 %r23, i64* %r25
	%r26 = load %struct.node** %list
	%r27 = load %struct.node** %newNode
	%r28 = getelementptr inbounds %struct.node* %r27, i1 0, i32 1
	store %struct.node* %r26, %struct.node** %r28
	%r29 = load %struct.node** %newNode
	store %struct.node* %r29, %struct.node** %.ret
	br label %LU8
LU8:
	%r20 = load %struct.node** %.ret
	ret %struct.node* %r20
}

define i64 @size (%struct.node* %r30) {
LU9:
	%.ret = alloca i64
	%list = alloca %struct.node*
	store %struct.node* %r30, %struct.node** %list
	%r32 = load %struct.node** %list
	%r33 = icmp eq %struct.node* %r32, null
	br i1 %r33, label %LU12, label %LU11
LU12:
	store i64 0, i64* %.ret
	br label %LU10
LU11:
	%r34 = load %struct.node** %list
	%r35 = getelementptr inbounds %struct.node* %r34, i1 0, i32 1
	%r36 = load %struct.node** %r35
	%r37 = call i64 @size(%struct.node* %r36)
	%r38 = add i64 1, %r37
	store i64 %r38, i64* %.ret
	br label %LU10
LU10:
	%r31 = load i64* %.ret
	ret i64 %r31
}

define i64 @get (%struct.node* %r39, i64 %r40) {
LU13:
	%.ret = alloca i64
	%list = alloca %struct.node*
	store %struct.node* %r39, %struct.node** %list
	%index = alloca i64
	store i64 %r40, i64* %index
	%r42 = load i64* %index
	%r43 = icmp eq i64 %r42, 0
	br i1 %r43, label %LU16, label %LU15
LU16:
	%r44 = load %struct.node** %list
	%r45 = getelementptr inbounds %struct.node* %r44, i1 0, i32 0
	%r46 = load i64* %r45
	store i64 %r46, i64* %.ret
	br label %LU14
LU15:
	%r47 = load %struct.node** %list
	%r48 = getelementptr inbounds %struct.node* %r47, i1 0, i32 1
	%r49 = load %struct.node** %r48
	%r50 = load i64* %index
	%r51 = sub i64 %r50, 1
	%r52 = call i64 @get(%struct.node* %r49, i64 %r51)
	store i64 %r52, i64* %.ret
	br label %LU14
LU14:
	%r41 = load i64* %.ret
	ret i64 %r41
}

define %struct.node* @pop (%struct.node* %r53) {
LU17:
	%.ret = alloca %struct.node*
	%list = alloca %struct.node*
	store %struct.node* %r53, %struct.node** %list
	%r55 = load %struct.node** %list
	%r56 = getelementptr inbounds %struct.node* %r55, i1 0, i32 1
	%r57 = load %struct.node** %r56
	store %struct.node* %r57, %struct.node** %list
	%r58 = load %struct.node** %list
	store %struct.node* %r58, %struct.node** %.ret
	br label %LU18
LU18:
	%r54 = load %struct.node** %.ret
	ret %struct.node* %r54
}

define void @printList (%struct.node* %r59) {
LU19:
	%list = alloca %struct.node*
	store %struct.node* %r59, %struct.node** %list
	%r61 = load %struct.node** %list
	%r62 = icmp ne %struct.node* %r61, null
	br i1 %r62, label %LU22, label %LU21
LU22:
	%r63 = load %struct.node** %list
	%r64 = getelementptr inbounds %struct.node* %r63, i1 0, i32 0
	%r65 = load i64* %r64
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r65)
	%r66 = load %struct.node** %list
	%r67 = getelementptr inbounds %struct.node* %r66, i1 0, i32 1
	%r68 = load %struct.node** %r67
	call void @printList(%struct.node* %r68)
	br label %LU21
LU21:
	br label %LU20
LU20:
	ret void
}

define void @treeprint (%struct.tnode* %r69) {
LU23:
	%root = alloca %struct.tnode*
	store %struct.tnode* %r69, %struct.tnode** %root
	%r71 = load %struct.tnode** %root
	%r72 = icmp ne %struct.tnode* %r71, null
	br i1 %r72, label %LU26, label %LU25
LU26:
	%r73 = load %struct.tnode** %root
	%r74 = getelementptr inbounds %struct.tnode* %r73, i1 0, i32 1
	%r75 = load %struct.tnode** %r74
	call void @treeprint(%struct.tnode* %r75)
	%r76 = load %struct.tnode** %root
	%r77 = getelementptr inbounds %struct.tnode* %r76, i1 0, i32 0
	%r78 = load i64* %r77
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r78)
	%r79 = load %struct.tnode** %root
	%r80 = getelementptr inbounds %struct.tnode* %r79, i1 0, i32 2
	%r81 = load %struct.tnode** %r80
	call void @treeprint(%struct.tnode* %r81)
	br label %LU25
LU25:
	br label %LU24
LU24:
	ret void
}

define void @freeList (%struct.node* %r82) {
LU27:
	%list = alloca %struct.node*
	store %struct.node* %r82, %struct.node** %list
	%r84 = load %struct.node** %list
	%r85 = icmp ne %struct.node* %r84, null
	br i1 %r85, label %LU30, label %LU29
LU30:
	%r86 = load %struct.node** %list
	%r87 = getelementptr inbounds %struct.node* %r86, i1 0, i32 1
	%r88 = load %struct.node** %r87
	call void @freeList(%struct.node* %r88)
	%r89 = load %struct.node** %list
	%r90 = bitcast %struct.node* %r89 to i8*
	call void @free(i8* %r90)
	br label %LU29
LU29:
	br label %LU28
LU28:
	ret void
}

define void @freeTree (%struct.tnode* %r91) {
LU31:
	%root = alloca %struct.tnode*
	store %struct.tnode* %r91, %struct.tnode** %root
	%r93 = load %struct.tnode** %root
	%r94 = icmp eq %struct.tnode* %r93, null
	%r95 = xor i1 1, %r94
	br i1 %r95, label %LU34, label %LU33
LU34:
	%r96 = load %struct.tnode** %root
	%r97 = getelementptr inbounds %struct.tnode* %r96, i1 0, i32 1
	%r98 = load %struct.tnode** %r97
	call void @freeTree(%struct.tnode* %r98)
	%r99 = load %struct.tnode** %root
	%r100 = getelementptr inbounds %struct.tnode* %r99, i1 0, i32 2
	%r101 = load %struct.tnode** %r100
	call void @freeTree(%struct.tnode* %r101)
	%r102 = load %struct.tnode** %root
	%r103 = bitcast %struct.tnode* %r102 to i8*
	call void @free(i8* %r103)
	br label %LU33
LU33:
	br label %LU32
LU32:
	ret void
}

define %struct.node* @postOrder (%struct.tnode* %r104) {
LU35:
	%temp = alloca %struct.node*
	%.ret = alloca %struct.node*
	%root = alloca %struct.tnode*
	store %struct.tnode* %r104, %struct.tnode** %root
	%r106 = load %struct.tnode** %root
	%r107 = icmp ne %struct.tnode* %r106, null
	br i1 %r107, label %LU38, label %LU37
LU38:
	%r108 = call i8* @malloc(i64 16)
	%r109 = bitcast i8* %r108 to %struct.node*
	store %struct.node* %r109, %struct.node** %temp
	%r110 = load %struct.tnode** %root
	%r111 = getelementptr inbounds %struct.tnode* %r110, i1 0, i32 0
	%r112 = load i64* %r111
	%r113 = load %struct.node** %temp
	%r114 = getelementptr inbounds %struct.node* %r113, i1 0, i32 0
	store i64 %r112, i64* %r114
	%r115 = load %struct.node** %temp
	%r116 = getelementptr inbounds %struct.node* %r115, i1 0, i32 1
	store %struct.node* null, %struct.node** %r116
	%r117 = load %struct.tnode** %root
	%r118 = getelementptr inbounds %struct.tnode* %r117, i1 0, i32 1
	%r119 = load %struct.tnode** %r118
	%r120 = call %struct.node* @postOrder(%struct.tnode* %r119)
	%r121 = load %struct.tnode** %root
	%r122 = getelementptr inbounds %struct.tnode* %r121, i1 0, i32 2
	%r123 = load %struct.tnode** %r122
	%r124 = call %struct.node* @postOrder(%struct.tnode* %r123)
	%r125 = call %struct.node* @concatLists(%struct.node* %r120, %struct.node* %r124)
	%r126 = load %struct.node** %temp
	%r127 = call %struct.node* @concatLists(%struct.node* %r125, %struct.node* %r126)
	store %struct.node* %r127, %struct.node** %.ret
	br label %LU36
LU37:
	store %struct.node* null, %struct.node** %.ret
	br label %LU36
LU36:
	%r105 = load %struct.node** %.ret
	ret %struct.node* %r105
}

define %struct.tnode* @treeadd (%struct.tnode* %r128, i64 %r129) {
LU39:
	%temp = alloca %struct.tnode*
	%.ret = alloca %struct.tnode*
	%root = alloca %struct.tnode*
	store %struct.tnode* %r128, %struct.tnode** %root
	%toAdd = alloca i64
	store i64 %r129, i64* %toAdd
	%r131 = load %struct.tnode** %root
	%r132 = icmp eq %struct.tnode* %r131, null
	br i1 %r132, label %LU42, label %LU41
LU42:
	%r133 = call i8* @malloc(i64 24)
	%r134 = bitcast i8* %r133 to %struct.tnode*
	store %struct.tnode* %r134, %struct.tnode** %temp
	%r135 = load i64* %toAdd
	%r136 = load %struct.tnode** %temp
	%r137 = getelementptr inbounds %struct.tnode* %r136, i1 0, i32 0
	store i64 %r135, i64* %r137
	%r138 = load %struct.tnode** %temp
	%r139 = getelementptr inbounds %struct.tnode* %r138, i1 0, i32 1
	store %struct.tnode* null, %struct.tnode** %r139
	%r140 = load %struct.tnode** %temp
	%r141 = getelementptr inbounds %struct.tnode* %r140, i1 0, i32 2
	store %struct.tnode* null, %struct.tnode** %r141
	%r142 = load %struct.tnode** %temp
	store %struct.tnode* %r142, %struct.tnode** %.ret
	br label %LU40
LU41:
	%r143 = load i64* %toAdd
	%r144 = load %struct.tnode** %root
	%r145 = getelementptr inbounds %struct.tnode* %r144, i1 0, i32 0
	%r146 = load i64* %r145
	%r147 = icmp slt i64 %r143, %r146
	br i1 %r147, label %LU44, label %LU45
LU44:
	%r148 = load %struct.tnode** %root
	%r149 = getelementptr inbounds %struct.tnode* %r148, i1 0, i32 1
	%r150 = load %struct.tnode** %r149
	%r151 = load i64* %toAdd
	%r152 = call %struct.tnode* @treeadd(%struct.tnode* %r150, i64 %r151)
	%r153 = load %struct.tnode** %root
	%r154 = getelementptr inbounds %struct.tnode* %r153, i1 0, i32 1
	store %struct.tnode* %r152, %struct.tnode** %r154
	br label %LU43
LU45:
	%r155 = load %struct.tnode** %root
	%r156 = getelementptr inbounds %struct.tnode* %r155, i1 0, i32 2
	%r157 = load %struct.tnode** %r156
	%r158 = load i64* %toAdd
	%r159 = call %struct.tnode* @treeadd(%struct.tnode* %r157, i64 %r158)
	%r160 = load %struct.tnode** %root
	%r161 = getelementptr inbounds %struct.tnode* %r160, i1 0, i32 2
	store %struct.tnode* %r159, %struct.tnode** %r161
	br label %LU43
LU43:
	%r162 = load %struct.tnode** %root
	store %struct.tnode* %r162, %struct.tnode** %.ret
	br label %LU40
LU40:
	%r130 = load %struct.tnode** %.ret
	ret %struct.tnode* %r130
}

define %struct.node* @quickSort (%struct.node* %r163) {
LU46:
	%pivot = alloca i64
	%i = alloca i64
	%less = alloca %struct.node*
	%greater = alloca %struct.node*
	%temp = alloca %struct.node*
	%.ret = alloca %struct.node*
	%list = alloca %struct.node*
	store %struct.node* %r163, %struct.node** %list
	store %struct.node* null, %struct.node** %less
	store %struct.node* null, %struct.node** %greater
	%r165 = load %struct.node** %list
	%r166 = call i64 @size(%struct.node* %r165)
	%r167 = icmp sle i64 %r166, 1
	br i1 %r167, label %LU49, label %LU48
LU49:
	%r168 = load %struct.node** %list
	store %struct.node* %r168, %struct.node** %.ret
	br label %LU47
LU48:
	%r169 = load %struct.node** %list
	%r170 = call i64 @get(%struct.node* %r169, i64 0)
	%r171 = load %struct.node** %list
	%r172 = load %struct.node** %list
	%r173 = call i64 @size(%struct.node* %r172)
	%r174 = sub i64 %r173, 1
	%r175 = call i64 @get(%struct.node* %r171, i64 %r174)
	%r176 = add i64 %r170, %r175
	%r177 = sdiv i64 %r176, 2
	store i64 %r177, i64* %pivot
	%r178 = load %struct.node** %list
	store %struct.node* %r178, %struct.node** %temp
	store i64 0, i64* %i
	br label %LU51
LU51:
	%r179 = load %struct.node** %temp
	%r180 = icmp ne %struct.node* %r179, null
	br i1 %r180, label %LU52, label %LU50
LU52:
	%r181 = load %struct.node** %list
	%r182 = load i64* %i
	%r183 = call i64 @get(%struct.node* %r181, i64 %r182)
	%r184 = load i64* %pivot
	%r185 = icmp sgt i64 %r183, %r184
	br i1 %r185, label %LU54, label %LU55
LU54:
	%r186 = load %struct.node** %greater
	%r187 = load %struct.node** %list
	%r188 = load i64* %i
	%r189 = call i64 @get(%struct.node* %r187, i64 %r188)
	%r190 = call %struct.node* @add(%struct.node* %r186, i64 %r189)
	store %struct.node* %r190, %struct.node** %greater
	br label %LU53
LU55:
	%r191 = load %struct.node** %less
	%r192 = load %struct.node** %list
	%r193 = load i64* %i
	%r194 = call i64 @get(%struct.node* %r192, i64 %r193)
	%r195 = call %struct.node* @add(%struct.node* %r191, i64 %r194)
	store %struct.node* %r195, %struct.node** %less
	br label %LU53
LU53:
	%r196 = load %struct.node** %temp
	%r197 = getelementptr inbounds %struct.node* %r196, i1 0, i32 1
	%r198 = load %struct.node** %r197
	store %struct.node* %r198, %struct.node** %temp
	%r199 = load i64* %i
	%r200 = add i64 %r199, 1
	store i64 %r200, i64* %i
	br label %LU51
LU50:
	%r201 = load %struct.node** %list
	call void @freeList(%struct.node* %r201)
	%r202 = load %struct.node** %less
	%r203 = call %struct.node* @quickSort(%struct.node* %r202)
	%r204 = load %struct.node** %greater
	%r205 = call %struct.node* @quickSort(%struct.node* %r204)
	%r206 = call %struct.node* @concatLists(%struct.node* %r203, %struct.node* %r205)
	store %struct.node* %r206, %struct.node** %.ret
	br label %LU47
LU47:
	%r164 = load %struct.node** %.ret
	ret %struct.node* %r164
}

define %struct.node* @quickSortMain (%struct.node* %r207) {
LU56:
	%.ret = alloca %struct.node*
	%list = alloca %struct.node*
	store %struct.node* %r207, %struct.node** %list
	%r209 = load %struct.node** %list
	call void @printList(%struct.node* %r209)
	%r210 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r210)
	%r211 = load %struct.node** %list
	call void @printList(%struct.node* %r211)
	%r212 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r212)
	%r213 = load %struct.node** %list
	call void @printList(%struct.node* %r213)
	%r214 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r214)
	store %struct.node* null, %struct.node** %.ret
	br label %LU57
LU57:
	%r208 = load %struct.node** %.ret
	ret %struct.node* %r208
}

define i64 @treesearch (%struct.tnode* %r215, i64 %r216) {
LU58:
	%.ret = alloca i64
	%root = alloca %struct.tnode*
	store %struct.tnode* %r215, %struct.tnode** %root
	%target = alloca i64
	store i64 %r216, i64* %target
	%r218 = sub i64 0, 1
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r218)
	%r219 = load %struct.tnode** %root
	%r220 = icmp ne %struct.tnode* %r219, null
	br i1 %r220, label %LU61, label %LU60
LU61:
	%r221 = load %struct.tnode** %root
	%r222 = getelementptr inbounds %struct.tnode* %r221, i1 0, i32 0
	%r223 = load i64* %r222
	%r224 = load i64* %target
	%r225 = icmp eq i64 %r223, %r224
	br i1 %r225, label %LU63, label %LU62
LU63:
	store i64 1, i64* %.ret
	br label %LU59
LU62:
	%r226 = load %struct.tnode** %root
	%r227 = getelementptr inbounds %struct.tnode* %r226, i1 0, i32 1
	%r228 = load %struct.tnode** %r227
	%r229 = load i64* %target
	%r230 = call i64 @treesearch(%struct.tnode* %r228, i64 %r229)
	%r231 = icmp eq i64 %r230, 1
	br i1 %r231, label %LU65, label %LU64
LU65:
	store i64 1, i64* %.ret
	br label %LU59
LU64:
	%r232 = load %struct.tnode** %root
	%r233 = getelementptr inbounds %struct.tnode* %r232, i1 0, i32 2
	%r234 = load %struct.tnode** %r233
	%r235 = load i64* %target
	%r236 = call i64 @treesearch(%struct.tnode* %r234, i64 %r235)
	%r237 = icmp eq i64 %r236, 1
	br i1 %r237, label %LU67, label %LU68
LU67:
	store i64 1, i64* %.ret
	br label %LU59
LU68:
	store i64 0, i64* %.ret
	br label %LU59
LU60:
	store i64 0, i64* %.ret
	br label %LU59
LU59:
	%r217 = load i64* %.ret
	ret i64 %r217
}

define %struct.node* @inOrder (%struct.tnode* %r238) {
LU69:
	%temp = alloca %struct.node*
	%.ret = alloca %struct.node*
	%root = alloca %struct.tnode*
	store %struct.tnode* %r238, %struct.tnode** %root
	%r240 = load %struct.tnode** %root
	%r241 = icmp ne %struct.tnode* %r240, null
	br i1 %r241, label %LU72, label %LU73
LU72:
	%r242 = call i8* @malloc(i64 16)
	%r243 = bitcast i8* %r242 to %struct.node*
	store %struct.node* %r243, %struct.node** %temp
	%r244 = load %struct.tnode** %root
	%r245 = getelementptr inbounds %struct.tnode* %r244, i1 0, i32 0
	%r246 = load i64* %r245
	%r247 = load %struct.node** %temp
	%r248 = getelementptr inbounds %struct.node* %r247, i1 0, i32 0
	store i64 %r246, i64* %r248
	%r249 = load %struct.node** %temp
	%r250 = getelementptr inbounds %struct.node* %r249, i1 0, i32 1
	store %struct.node* null, %struct.node** %r250
	%r251 = load %struct.tnode** %root
	%r252 = getelementptr inbounds %struct.tnode* %r251, i1 0, i32 1
	%r253 = load %struct.tnode** %r252
	%r254 = call %struct.node* @inOrder(%struct.tnode* %r253)
	%r255 = load %struct.node** %temp
	%r256 = load %struct.tnode** %root
	%r257 = getelementptr inbounds %struct.tnode* %r256, i1 0, i32 2
	%r258 = load %struct.tnode** %r257
	%r259 = call %struct.node* @inOrder(%struct.tnode* %r258)
	%r260 = call %struct.node* @concatLists(%struct.node* %r255, %struct.node* %r259)
	%r261 = call %struct.node* @concatLists(%struct.node* %r254, %struct.node* %r260)
	store %struct.node* %r261, %struct.node** %.ret
	br label %LU70
LU73:
	store %struct.node* null, %struct.node** %.ret
	br label %LU70
LU70:
	%r239 = load %struct.node** %.ret
	ret %struct.node* %r239
}

define i64 @bintreesearch (%struct.tnode* %r262, i64 %r263) {
LU74:
	%.ret = alloca i64
	%root = alloca %struct.tnode*
	store %struct.tnode* %r262, %struct.tnode** %root
	%target = alloca i64
	store i64 %r263, i64* %target
	%r265 = sub i64 0, 1
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r265)
	%r266 = load %struct.tnode** %root
	%r267 = icmp ne %struct.tnode* %r266, null
	br i1 %r267, label %LU77, label %LU76
LU77:
	%r268 = load %struct.tnode** %root
	%r269 = getelementptr inbounds %struct.tnode* %r268, i1 0, i32 0
	%r270 = load i64* %r269
	%r271 = load i64* %target
	%r272 = icmp eq i64 %r270, %r271
	br i1 %r272, label %LU79, label %LU78
LU79:
	store i64 1, i64* %.ret
	br label %LU75
LU78:
	%r273 = load i64* %target
	%r274 = load %struct.tnode** %root
	%r275 = getelementptr inbounds %struct.tnode* %r274, i1 0, i32 0
	%r276 = load i64* %r275
	%r277 = icmp slt i64 %r273, %r276
	br i1 %r277, label %LU81, label %LU82
LU81:
	%r278 = load %struct.tnode** %root
	%r279 = getelementptr inbounds %struct.tnode* %r278, i1 0, i32 1
	%r280 = load %struct.tnode** %r279
	%r281 = load i64* %target
	%r282 = call i64 @bintreesearch(%struct.tnode* %r280, i64 %r281)
	store i64 %r282, i64* %.ret
	br label %LU75
LU82:
	%r283 = load %struct.tnode** %root
	%r284 = getelementptr inbounds %struct.tnode* %r283, i1 0, i32 2
	%r285 = load %struct.tnode** %r284
	%r286 = load i64* %target
	%r287 = call i64 @bintreesearch(%struct.tnode* %r285, i64 %r286)
	store i64 %r287, i64* %.ret
	br label %LU75
LU76:
	store i64 0, i64* %.ret
	br label %LU75
LU75:
	%r264 = load i64* %.ret
	ret i64 %r264
}

define %struct.tnode* @buildTree (%struct.node* %r288) {
LU83:
	%i = alloca i64
	%root = alloca %struct.tnode*
	%.ret = alloca %struct.tnode*
	%list = alloca %struct.node*
	store %struct.node* %r288, %struct.node** %list
	store %struct.tnode* null, %struct.tnode** %root
	store i64 0, i64* %i
	br label %LU86
LU86:
	%r290 = load i64* %i
	%r291 = load %struct.node** %list
	%r292 = call i64 @size(%struct.node* %r291)
	%r293 = icmp slt i64 %r290, %r292
	br i1 %r293, label %LU87, label %LU85
LU87:
	%r294 = load %struct.tnode** %root
	%r295 = load %struct.node** %list
	%r296 = load i64* %i
	%r297 = call i64 @get(%struct.node* %r295, i64 %r296)
	%r298 = call %struct.tnode* @treeadd(%struct.tnode* %r294, i64 %r297)
	store %struct.tnode* %r298, %struct.tnode** %root
	%r299 = load i64* %i
	%r300 = add i64 %r299, 1
	store i64 %r300, i64* %i
	br label %LU86
LU85:
	%r301 = load %struct.tnode** %root
	store %struct.tnode* %r301, %struct.tnode** %.ret
	br label %LU84
LU84:
	%r289 = load %struct.tnode** %.ret
	ret %struct.tnode* %r289
}

define void @treeMain (%struct.node* %r302) {
LU88:
	%root = alloca %struct.tnode*
	%inList = alloca %struct.node*
	%postList = alloca %struct.node*
	%list = alloca %struct.node*
	store %struct.node* %r302, %struct.node** %list
	%r304 = load %struct.node** %list
	%r305 = call %struct.tnode* @buildTree(%struct.node* %r304)
	store %struct.tnode* %r305, %struct.tnode** %root
	%r306 = load %struct.tnode** %root
	call void @treeprint(%struct.tnode* %r306)
	%r307 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r307)
	%r308 = load %struct.tnode** %root
	%r309 = call %struct.node* @inOrder(%struct.tnode* %r308)
	store %struct.node* %r309, %struct.node** %inList
	%r310 = load %struct.node** %inList
	call void @printList(%struct.node* %r310)
	%r311 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r311)
	%r312 = load %struct.node** %inList
	call void @freeList(%struct.node* %r312)
	%r313 = load %struct.tnode** %root
	%r314 = call %struct.node* @postOrder(%struct.tnode* %r313)
	store %struct.node* %r314, %struct.node** %postList
	%r315 = load %struct.node** %postList
	call void @printList(%struct.node* %r315)
	%r316 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r316)
	%r317 = load %struct.node** %postList
	call void @freeList(%struct.node* %r317)
	%r318 = load %struct.tnode** %root
	%r319 = call i64 @treesearch(%struct.tnode* %r318, i64 0)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r319)
	%r320 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r320)
	%r321 = load %struct.tnode** %root
	%r322 = call i64 @treesearch(%struct.tnode* %r321, i64 10)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r322)
	%r323 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r323)
	%r324 = load %struct.tnode** %root
	%r325 = sub i64 0, 2
	%r326 = call i64 @treesearch(%struct.tnode* %r324, i64 %r325)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r326)
	%r327 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r327)
	%r328 = load %struct.tnode** %root
	%r329 = call i64 @treesearch(%struct.tnode* %r328, i64 2)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r329)
	%r330 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r330)
	%r331 = load %struct.tnode** %root
	%r332 = call i64 @treesearch(%struct.tnode* %r331, i64 3)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r332)
	%r333 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r333)
	%r334 = load %struct.tnode** %root
	%r335 = call i64 @treesearch(%struct.tnode* %r334, i64 9)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r335)
	%r336 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r336)
	%r337 = load %struct.tnode** %root
	%r338 = call i64 @treesearch(%struct.tnode* %r337, i64 1)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r338)
	%r339 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r339)
	%r340 = load %struct.tnode** %root
	%r341 = call i64 @bintreesearch(%struct.tnode* %r340, i64 0)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r341)
	%r342 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r342)
	%r343 = load %struct.tnode** %root
	%r344 = call i64 @bintreesearch(%struct.tnode* %r343, i64 10)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r344)
	%r345 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r345)
	%r346 = load %struct.tnode** %root
	%r347 = sub i64 0, 2
	%r348 = call i64 @bintreesearch(%struct.tnode* %r346, i64 %r347)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r348)
	%r349 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r349)
	%r350 = load %struct.tnode** %root
	%r351 = call i64 @bintreesearch(%struct.tnode* %r350, i64 2)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r351)
	%r352 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r352)
	%r353 = load %struct.tnode** %root
	%r354 = call i64 @bintreesearch(%struct.tnode* %r353, i64 3)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r354)
	%r355 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r355)
	%r356 = load %struct.tnode** %root
	%r357 = call i64 @bintreesearch(%struct.tnode* %r356, i64 9)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r357)
	%r358 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r358)
	%r359 = load %struct.tnode** %root
	%r360 = call i64 @bintreesearch(%struct.tnode* %r359, i64 1)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r360)
	%r361 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r361)
	%r362 = load %struct.tnode** %root
	call void @freeTree(%struct.tnode* %r362)
	br label %LU89
LU89:
	ret void
}

define %struct.node* @myCopy (%struct.node* %r363) {
LU90:
	%.ret = alloca %struct.node*
	%src = alloca %struct.node*
	store %struct.node* %r363, %struct.node** %src
	%r365 = load %struct.node** %src
	%r366 = icmp eq %struct.node* %r365, null
	br i1 %r366, label %LU93, label %LU92
LU93:
	store %struct.node* null, %struct.node** %.ret
	br label %LU91
LU92:
	%r367 = load %struct.node** %src
	%r368 = getelementptr inbounds %struct.node* %r367, i1 0, i32 0
	%r369 = load i64* %r368
	%r370 = call %struct.node* @add(%struct.node* null, i64 %r369)
	%r371 = load %struct.node** %src
	%r372 = getelementptr inbounds %struct.node* %r371, i1 0, i32 1
	%r373 = load %struct.node** %r372
	%r374 = call %struct.node* @myCopy(%struct.node* %r373)
	%r375 = call %struct.node* @concatLists(%struct.node* %r370, %struct.node* %r374)
	store %struct.node* %r375, %struct.node** %.ret
	br label %LU91
LU91:
	%r364 = load %struct.node** %.ret
	ret %struct.node* %r364
}

define i64 @main () {
LU94:
	%i = alloca i64
	%element = alloca i64
	%myList = alloca %struct.node*
	%copyList1 = alloca %struct.node*
	%copyList2 = alloca %struct.node*
	%sortedList = alloca %struct.node*
	%.ret = alloca i64
	store %struct.node* null, %struct.node** %myList
	store i64 0, i64* %i
	br label %LU97
LU97:
	%r377 = load i64* %i
	%r378 = icmp slt i64 %r377, 10
	br i1 %r378, label %LU98, label %LU96
LU98:
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r379 = load i64* @.read_scratch
	store i64 %r379, i64* %element
	%r380 = load %struct.node** %myList
	%r381 = load i64* %element
	%r382 = call %struct.node* @add(%struct.node* %r380, i64 %r381)
	store %struct.node* %r382, %struct.node** %myList
	%r383 = load %struct.node** %myList
	%r384 = call %struct.node* @myCopy(%struct.node* %r383)
	store %struct.node* %r384, %struct.node** %copyList1
	%r385 = load %struct.node** %myList
	%r386 = call %struct.node* @myCopy(%struct.node* %r385)
	store %struct.node* %r386, %struct.node** %copyList2
	%r387 = load %struct.node** %copyList1
	%r388 = call %struct.node* @quickSortMain(%struct.node* %r387)
	store %struct.node* %r388, %struct.node** %sortedList
	%r389 = load %struct.node** %sortedList
	call void @freeList(%struct.node* %r389)
	%r390 = load %struct.node** %copyList2
	call void @treeMain(%struct.node* %r390)
	%r391 = load i64* %i
	%r392 = add i64 %r391, 1
	store i64 %r392, i64* %i
	br label %LU97
LU96:
	%r393 = load %struct.node** %myList
	call void @freeList(%struct.node* %r393)
	%r394 = load %struct.node** %copyList1
	call void @freeList(%struct.node* %r394)
	%r395 = load %struct.node** %copyList2
	call void @freeList(%struct.node* %r395)
	store i64 0, i64* %.ret
	br label %LU95
LU95:
	%r376 = load i64* %.ret
	ret i64 %r376
}

