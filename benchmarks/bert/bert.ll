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
	%r14 = load %struct.node** %temp
	%r15 = getelementptr inbounds %struct.node* %r14, i1 0, i32 1
	%r16 = load %struct.node** %r15
	%r17 = icmp ne %struct.node* %r16, null
	br i1 %r17, label %LU6, label %LU4
LU4:
	%r18 = load %struct.node** %second
	%r19 = load %struct.node** %temp
	%r20 = getelementptr inbounds %struct.node* %r19, i1 0, i32 1
	store %struct.node* %r18, %struct.node** %r20
	%r21 = load %struct.node** %first
	store %struct.node* %r21, %struct.node** %.ret
	br label %LU1
LU1:
	%r2 = load %struct.node** %.ret
	ret %struct.node* %r2
}

define %struct.node* @add (%struct.node* %r22, i64 %r23) {
LU7:
	%newNode = alloca %struct.node*
	%.ret = alloca %struct.node*
	%list = alloca %struct.node*
	store %struct.node* %r22, %struct.node** %list
	%toAdd = alloca i64
	store i64 %r23, i64* %toAdd
	%r25 = call i8* @malloc(i64 16)
	%r26 = bitcast i8* %r25 to %struct.node*
	store %struct.node* %r26, %struct.node** %newNode
	%r27 = load i64* %toAdd
	%r28 = load %struct.node** %newNode
	%r29 = getelementptr inbounds %struct.node* %r28, i1 0, i32 0
	store i64 %r27, i64* %r29
	%r30 = load %struct.node** %list
	%r31 = load %struct.node** %newNode
	%r32 = getelementptr inbounds %struct.node* %r31, i1 0, i32 1
	store %struct.node* %r30, %struct.node** %r32
	%r33 = load %struct.node** %newNode
	store %struct.node* %r33, %struct.node** %.ret
	br label %LU8
LU8:
	%r24 = load %struct.node** %.ret
	ret %struct.node* %r24
}

define i64 @size (%struct.node* %r34) {
LU9:
	%.ret = alloca i64
	%list = alloca %struct.node*
	store %struct.node* %r34, %struct.node** %list
	%r36 = load %struct.node** %list
	%r37 = icmp eq %struct.node* %r36, null
	br i1 %r37, label %LU12, label %LU11
LU12:
	store i64 0, i64* %.ret
	br label %LU10
LU11:
	%r38 = load %struct.node** %list
	%r39 = getelementptr inbounds %struct.node* %r38, i1 0, i32 1
	%r40 = load %struct.node** %r39
	%r41 = call i64 @size(%struct.node* %r40)
	%r42 = add i64 1, %r41
	store i64 %r42, i64* %.ret
	br label %LU10
LU10:
	%r35 = load i64* %.ret
	ret i64 %r35
}

define i64 @get (%struct.node* %r43, i64 %r44) {
LU13:
	%.ret = alloca i64
	%list = alloca %struct.node*
	store %struct.node* %r43, %struct.node** %list
	%index = alloca i64
	store i64 %r44, i64* %index
	%r46 = load i64* %index
	%r47 = icmp eq i64 %r46, 0
	br i1 %r47, label %LU16, label %LU15
LU16:
	%r48 = load %struct.node** %list
	%r49 = getelementptr inbounds %struct.node* %r48, i1 0, i32 0
	%r50 = load i64* %r49
	store i64 %r50, i64* %.ret
	br label %LU14
LU15:
	%r51 = load %struct.node** %list
	%r52 = getelementptr inbounds %struct.node* %r51, i1 0, i32 1
	%r53 = load %struct.node** %r52
	%r54 = load i64* %index
	%r55 = sub i64 %r54, 1
	%r56 = call i64 @get(%struct.node* %r53, i64 %r55)
	store i64 %r56, i64* %.ret
	br label %LU14
LU14:
	%r45 = load i64* %.ret
	ret i64 %r45
}

define %struct.node* @pop (%struct.node* %r57) {
LU17:
	%.ret = alloca %struct.node*
	%list = alloca %struct.node*
	store %struct.node* %r57, %struct.node** %list
	%r59 = load %struct.node** %list
	%r60 = getelementptr inbounds %struct.node* %r59, i1 0, i32 1
	%r61 = load %struct.node** %r60
	store %struct.node* %r61, %struct.node** %list
	%r62 = load %struct.node** %list
	store %struct.node* %r62, %struct.node** %.ret
	br label %LU18
LU18:
	%r58 = load %struct.node** %.ret
	ret %struct.node* %r58
}

define void @printList (%struct.node* %r63) {
LU19:
	%list = alloca %struct.node*
	store %struct.node* %r63, %struct.node** %list
	%r65 = load %struct.node** %list
	%r66 = icmp ne %struct.node* %r65, null
	br i1 %r66, label %LU22, label %LU21
LU22:
	%r67 = load %struct.node** %list
	%r68 = getelementptr inbounds %struct.node* %r67, i1 0, i32 0
	%r69 = load i64* %r68
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r69)
	%r70 = load %struct.node** %list
	%r71 = getelementptr inbounds %struct.node* %r70, i1 0, i32 1
	%r72 = load %struct.node** %r71
	call void @printList(%struct.node* %r72)
	br label %LU21
LU21:
	br label %LU20
LU20:
	ret void
}

define void @treeprint (%struct.tnode* %r73) {
LU23:
	%root = alloca %struct.tnode*
	store %struct.tnode* %r73, %struct.tnode** %root
	%r75 = load %struct.tnode** %root
	%r76 = icmp ne %struct.tnode* %r75, null
	br i1 %r76, label %LU26, label %LU25
LU26:
	%r77 = load %struct.tnode** %root
	%r78 = getelementptr inbounds %struct.tnode* %r77, i1 0, i32 1
	%r79 = load %struct.tnode** %r78
	call void @treeprint(%struct.tnode* %r79)
	%r80 = load %struct.tnode** %root
	%r81 = getelementptr inbounds %struct.tnode* %r80, i1 0, i32 0
	%r82 = load i64* %r81
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r82)
	%r83 = load %struct.tnode** %root
	%r84 = getelementptr inbounds %struct.tnode* %r83, i1 0, i32 2
	%r85 = load %struct.tnode** %r84
	call void @treeprint(%struct.tnode* %r85)
	br label %LU25
LU25:
	br label %LU24
LU24:
	ret void
}

define void @freeList (%struct.node* %r86) {
LU27:
	%list = alloca %struct.node*
	store %struct.node* %r86, %struct.node** %list
	%r88 = load %struct.node** %list
	%r89 = icmp ne %struct.node* %r88, null
	br i1 %r89, label %LU30, label %LU29
LU30:
	%r90 = load %struct.node** %list
	%r91 = getelementptr inbounds %struct.node* %r90, i1 0, i32 1
	%r92 = load %struct.node** %r91
	call void @freeList(%struct.node* %r92)
	%r93 = load %struct.node** %list
	%r94 = bitcast %struct.node* %r93 to i8*
	call void @free(i8* %r94)
	br label %LU29
LU29:
	br label %LU28
LU28:
	ret void
}

define void @freeTree (%struct.tnode* %r95) {
LU31:
	%root = alloca %struct.tnode*
	store %struct.tnode* %r95, %struct.tnode** %root
	%r97 = load %struct.tnode** %root
	%r98 = icmp eq %struct.tnode* %r97, null
	%r99 = xor i1 1, %r98
	br i1 %r99, label %LU34, label %LU33
LU34:
	%r100 = load %struct.tnode** %root
	%r101 = getelementptr inbounds %struct.tnode* %r100, i1 0, i32 1
	%r102 = load %struct.tnode** %r101
	call void @freeTree(%struct.tnode* %r102)
	%r103 = load %struct.tnode** %root
	%r104 = getelementptr inbounds %struct.tnode* %r103, i1 0, i32 2
	%r105 = load %struct.tnode** %r104
	call void @freeTree(%struct.tnode* %r105)
	%r106 = load %struct.tnode** %root
	%r107 = bitcast %struct.tnode* %r106 to i8*
	call void @free(i8* %r107)
	br label %LU33
LU33:
	br label %LU32
LU32:
	ret void
}

define %struct.node* @postOrder (%struct.tnode* %r108) {
LU35:
	%temp = alloca %struct.node*
	%.ret = alloca %struct.node*
	%root = alloca %struct.tnode*
	store %struct.tnode* %r108, %struct.tnode** %root
	%r110 = load %struct.tnode** %root
	%r111 = icmp ne %struct.tnode* %r110, null
	br i1 %r111, label %LU38, label %LU37
LU38:
	%r112 = call i8* @malloc(i64 16)
	%r113 = bitcast i8* %r112 to %struct.node*
	store %struct.node* %r113, %struct.node** %temp
	%r114 = load %struct.tnode** %root
	%r115 = getelementptr inbounds %struct.tnode* %r114, i1 0, i32 0
	%r116 = load i64* %r115
	%r117 = load %struct.node** %temp
	%r118 = getelementptr inbounds %struct.node* %r117, i1 0, i32 0
	store i64 %r116, i64* %r118
	%r119 = load %struct.node** %temp
	%r120 = getelementptr inbounds %struct.node* %r119, i1 0, i32 1
	store %struct.node* null, %struct.node** %r120
	%r121 = load %struct.tnode** %root
	%r122 = getelementptr inbounds %struct.tnode* %r121, i1 0, i32 1
	%r123 = load %struct.tnode** %r122
	%r124 = call %struct.node* @postOrder(%struct.tnode* %r123)
	%r125 = load %struct.tnode** %root
	%r126 = getelementptr inbounds %struct.tnode* %r125, i1 0, i32 2
	%r127 = load %struct.tnode** %r126
	%r128 = call %struct.node* @postOrder(%struct.tnode* %r127)
	%r129 = call %struct.node* @concatLists(%struct.node* %r124, %struct.node* %r128)
	%r130 = load %struct.node** %temp
	%r131 = call %struct.node* @concatLists(%struct.node* %r129, %struct.node* %r130)
	store %struct.node* %r131, %struct.node** %.ret
	br label %LU36
LU37:
	store %struct.node* null, %struct.node** %.ret
	br label %LU36
LU36:
	%r109 = load %struct.node** %.ret
	ret %struct.node* %r109
}

define %struct.tnode* @treeadd (%struct.tnode* %r132, i64 %r133) {
LU39:
	%temp = alloca %struct.tnode*
	%.ret = alloca %struct.tnode*
	%root = alloca %struct.tnode*
	store %struct.tnode* %r132, %struct.tnode** %root
	%toAdd = alloca i64
	store i64 %r133, i64* %toAdd
	%r135 = load %struct.tnode** %root
	%r136 = icmp eq %struct.tnode* %r135, null
	br i1 %r136, label %LU42, label %LU41
LU42:
	%r137 = call i8* @malloc(i64 24)
	%r138 = bitcast i8* %r137 to %struct.tnode*
	store %struct.tnode* %r138, %struct.tnode** %temp
	%r139 = load i64* %toAdd
	%r140 = load %struct.tnode** %temp
	%r141 = getelementptr inbounds %struct.tnode* %r140, i1 0, i32 0
	store i64 %r139, i64* %r141
	%r142 = load %struct.tnode** %temp
	%r143 = getelementptr inbounds %struct.tnode* %r142, i1 0, i32 1
	store %struct.tnode* null, %struct.tnode** %r143
	%r144 = load %struct.tnode** %temp
	%r145 = getelementptr inbounds %struct.tnode* %r144, i1 0, i32 2
	store %struct.tnode* null, %struct.tnode** %r145
	%r146 = load %struct.tnode** %temp
	store %struct.tnode* %r146, %struct.tnode** %.ret
	br label %LU40
LU41:
	%r147 = load i64* %toAdd
	%r148 = load %struct.tnode** %root
	%r149 = getelementptr inbounds %struct.tnode* %r148, i1 0, i32 0
	%r150 = load i64* %r149
	%r151 = icmp slt i64 %r147, %r150
	br i1 %r151, label %LU44, label %LU45
LU44:
	%r152 = load %struct.tnode** %root
	%r153 = getelementptr inbounds %struct.tnode* %r152, i1 0, i32 1
	%r154 = load %struct.tnode** %r153
	%r155 = load i64* %toAdd
	%r156 = call %struct.tnode* @treeadd(%struct.tnode* %r154, i64 %r155)
	%r157 = load %struct.tnode** %root
	%r158 = getelementptr inbounds %struct.tnode* %r157, i1 0, i32 1
	store %struct.tnode* %r156, %struct.tnode** %r158
	br label %LU43
LU45:
	%r159 = load %struct.tnode** %root
	%r160 = getelementptr inbounds %struct.tnode* %r159, i1 0, i32 2
	%r161 = load %struct.tnode** %r160
	%r162 = load i64* %toAdd
	%r163 = call %struct.tnode* @treeadd(%struct.tnode* %r161, i64 %r162)
	%r164 = load %struct.tnode** %root
	%r165 = getelementptr inbounds %struct.tnode* %r164, i1 0, i32 2
	store %struct.tnode* %r163, %struct.tnode** %r165
	br label %LU43
LU43:
	%r166 = load %struct.tnode** %root
	store %struct.tnode* %r166, %struct.tnode** %.ret
	br label %LU40
LU40:
	%r134 = load %struct.tnode** %.ret
	ret %struct.tnode* %r134
}

define %struct.node* @quickSort (%struct.node* %r167) {
LU46:
	%pivot = alloca i64
	%i = alloca i64
	%less = alloca %struct.node*
	%greater = alloca %struct.node*
	%temp = alloca %struct.node*
	%.ret = alloca %struct.node*
	%list = alloca %struct.node*
	store %struct.node* %r167, %struct.node** %list
	store %struct.node* null, %struct.node** %less
	store %struct.node* null, %struct.node** %greater
	%r169 = load %struct.node** %list
	%r170 = call i64 @size(%struct.node* %r169)
	%r171 = icmp sle i64 %r170, 1
	br i1 %r171, label %LU49, label %LU48
LU49:
	%r172 = load %struct.node** %list
	store %struct.node* %r172, %struct.node** %.ret
	br label %LU47
LU48:
	%r173 = load %struct.node** %list
	%r174 = call i64 @get(%struct.node* %r173, i64 0)
	%r175 = load %struct.node** %list
	%r176 = load %struct.node** %list
	%r177 = call i64 @size(%struct.node* %r176)
	%r178 = sub i64 %r177, 1
	%r179 = call i64 @get(%struct.node* %r175, i64 %r178)
	%r180 = add i64 %r174, %r179
	%r181 = sdiv i64 %r180, 2
	store i64 %r181, i64* %pivot
	%r182 = load %struct.node** %list
	store %struct.node* %r182, %struct.node** %temp
	store i64 0, i64* %i
	br label %LU51
LU51:
	%r183 = load %struct.node** %temp
	%r184 = icmp ne %struct.node* %r183, null
	br i1 %r184, label %LU52, label %LU50
LU52:
	%r185 = load %struct.node** %list
	%r186 = load i64* %i
	%r187 = call i64 @get(%struct.node* %r185, i64 %r186)
	%r188 = load i64* %pivot
	%r189 = icmp sgt i64 %r187, %r188
	br i1 %r189, label %LU54, label %LU55
LU54:
	%r190 = load %struct.node** %greater
	%r191 = load %struct.node** %list
	%r192 = load i64* %i
	%r193 = call i64 @get(%struct.node* %r191, i64 %r192)
	%r194 = call %struct.node* @add(%struct.node* %r190, i64 %r193)
	store %struct.node* %r194, %struct.node** %greater
	br label %LU53
LU55:
	%r195 = load %struct.node** %less
	%r196 = load %struct.node** %list
	%r197 = load i64* %i
	%r198 = call i64 @get(%struct.node* %r196, i64 %r197)
	%r199 = call %struct.node* @add(%struct.node* %r195, i64 %r198)
	store %struct.node* %r199, %struct.node** %less
	br label %LU53
LU53:
	%r200 = load %struct.node** %temp
	%r201 = getelementptr inbounds %struct.node* %r200, i1 0, i32 1
	%r202 = load %struct.node** %r201
	store %struct.node* %r202, %struct.node** %temp
	%r203 = load i64* %i
	%r204 = add i64 %r203, 1
	store i64 %r204, i64* %i
	%r205 = load %struct.node** %temp
	%r206 = icmp ne %struct.node* %r205, null
	br i1 %r206, label %LU52, label %LU50
LU50:
	%r207 = load %struct.node** %list
	call void @freeList(%struct.node* %r207)
	%r208 = load %struct.node** %less
	%r209 = call %struct.node* @quickSort(%struct.node* %r208)
	%r210 = load %struct.node** %greater
	%r211 = call %struct.node* @quickSort(%struct.node* %r210)
	%r212 = call %struct.node* @concatLists(%struct.node* %r209, %struct.node* %r211)
	store %struct.node* %r212, %struct.node** %.ret
	br label %LU47
LU47:
	%r168 = load %struct.node** %.ret
	ret %struct.node* %r168
}

define %struct.node* @quickSortMain (%struct.node* %r213) {
LU56:
	%.ret = alloca %struct.node*
	%list = alloca %struct.node*
	store %struct.node* %r213, %struct.node** %list
	%r215 = load %struct.node** %list
	call void @printList(%struct.node* %r215)
	%r216 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r216)
	%r217 = load %struct.node** %list
	call void @printList(%struct.node* %r217)
	%r218 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r218)
	%r219 = load %struct.node** %list
	call void @printList(%struct.node* %r219)
	%r220 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r220)
	store %struct.node* null, %struct.node** %.ret
	br label %LU57
LU57:
	%r214 = load %struct.node** %.ret
	ret %struct.node* %r214
}

define i64 @treesearch (%struct.tnode* %r221, i64 %r222) {
LU58:
	%.ret = alloca i64
	%root = alloca %struct.tnode*
	store %struct.tnode* %r221, %struct.tnode** %root
	%target = alloca i64
	store i64 %r222, i64* %target
	%r224 = sub i64 0, 1
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r224)
	%r225 = load %struct.tnode** %root
	%r226 = icmp ne %struct.tnode* %r225, null
	br i1 %r226, label %LU61, label %LU60
LU61:
	%r227 = load %struct.tnode** %root
	%r228 = getelementptr inbounds %struct.tnode* %r227, i1 0, i32 0
	%r229 = load i64* %r228
	%r230 = load i64* %target
	%r231 = icmp eq i64 %r229, %r230
	br i1 %r231, label %LU63, label %LU62
LU63:
	store i64 1, i64* %.ret
	br label %LU59
LU62:
	%r232 = load %struct.tnode** %root
	%r233 = getelementptr inbounds %struct.tnode* %r232, i1 0, i32 1
	%r234 = load %struct.tnode** %r233
	%r235 = load i64* %target
	%r236 = call i64 @treesearch(%struct.tnode* %r234, i64 %r235)
	%r237 = icmp eq i64 %r236, 1
	br i1 %r237, label %LU65, label %LU64
LU65:
	store i64 1, i64* %.ret
	br label %LU59
LU64:
	%r238 = load %struct.tnode** %root
	%r239 = getelementptr inbounds %struct.tnode* %r238, i1 0, i32 2
	%r240 = load %struct.tnode** %r239
	%r241 = load i64* %target
	%r242 = call i64 @treesearch(%struct.tnode* %r240, i64 %r241)
	%r243 = icmp eq i64 %r242, 1
	br i1 %r243, label %LU67, label %LU68
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
	%r223 = load i64* %.ret
	ret i64 %r223
}

define %struct.node* @inOrder (%struct.tnode* %r244) {
LU69:
	%temp = alloca %struct.node*
	%.ret = alloca %struct.node*
	%root = alloca %struct.tnode*
	store %struct.tnode* %r244, %struct.tnode** %root
	%r246 = load %struct.tnode** %root
	%r247 = icmp ne %struct.tnode* %r246, null
	br i1 %r247, label %LU72, label %LU73
LU72:
	%r248 = call i8* @malloc(i64 16)
	%r249 = bitcast i8* %r248 to %struct.node*
	store %struct.node* %r249, %struct.node** %temp
	%r250 = load %struct.tnode** %root
	%r251 = getelementptr inbounds %struct.tnode* %r250, i1 0, i32 0
	%r252 = load i64* %r251
	%r253 = load %struct.node** %temp
	%r254 = getelementptr inbounds %struct.node* %r253, i1 0, i32 0
	store i64 %r252, i64* %r254
	%r255 = load %struct.node** %temp
	%r256 = getelementptr inbounds %struct.node* %r255, i1 0, i32 1
	store %struct.node* null, %struct.node** %r256
	%r257 = load %struct.tnode** %root
	%r258 = getelementptr inbounds %struct.tnode* %r257, i1 0, i32 1
	%r259 = load %struct.tnode** %r258
	%r260 = call %struct.node* @inOrder(%struct.tnode* %r259)
	%r261 = load %struct.node** %temp
	%r262 = load %struct.tnode** %root
	%r263 = getelementptr inbounds %struct.tnode* %r262, i1 0, i32 2
	%r264 = load %struct.tnode** %r263
	%r265 = call %struct.node* @inOrder(%struct.tnode* %r264)
	%r266 = call %struct.node* @concatLists(%struct.node* %r261, %struct.node* %r265)
	%r267 = call %struct.node* @concatLists(%struct.node* %r260, %struct.node* %r266)
	store %struct.node* %r267, %struct.node** %.ret
	br label %LU70
LU73:
	store %struct.node* null, %struct.node** %.ret
	br label %LU70
LU70:
	%r245 = load %struct.node** %.ret
	ret %struct.node* %r245
}

define i64 @bintreesearch (%struct.tnode* %r268, i64 %r269) {
LU74:
	%.ret = alloca i64
	%root = alloca %struct.tnode*
	store %struct.tnode* %r268, %struct.tnode** %root
	%target = alloca i64
	store i64 %r269, i64* %target
	%r271 = sub i64 0, 1
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r271)
	%r272 = load %struct.tnode** %root
	%r273 = icmp ne %struct.tnode* %r272, null
	br i1 %r273, label %LU77, label %LU76
LU77:
	%r274 = load %struct.tnode** %root
	%r275 = getelementptr inbounds %struct.tnode* %r274, i1 0, i32 0
	%r276 = load i64* %r275
	%r277 = load i64* %target
	%r278 = icmp eq i64 %r276, %r277
	br i1 %r278, label %LU79, label %LU78
LU79:
	store i64 1, i64* %.ret
	br label %LU75
LU78:
	%r279 = load i64* %target
	%r280 = load %struct.tnode** %root
	%r281 = getelementptr inbounds %struct.tnode* %r280, i1 0, i32 0
	%r282 = load i64* %r281
	%r283 = icmp slt i64 %r279, %r282
	br i1 %r283, label %LU81, label %LU82
LU81:
	%r284 = load %struct.tnode** %root
	%r285 = getelementptr inbounds %struct.tnode* %r284, i1 0, i32 1
	%r286 = load %struct.tnode** %r285
	%r287 = load i64* %target
	%r288 = call i64 @bintreesearch(%struct.tnode* %r286, i64 %r287)
	store i64 %r288, i64* %.ret
	br label %LU75
LU82:
	%r289 = load %struct.tnode** %root
	%r290 = getelementptr inbounds %struct.tnode* %r289, i1 0, i32 2
	%r291 = load %struct.tnode** %r290
	%r292 = load i64* %target
	%r293 = call i64 @bintreesearch(%struct.tnode* %r291, i64 %r292)
	store i64 %r293, i64* %.ret
	br label %LU75
LU76:
	store i64 0, i64* %.ret
	br label %LU75
LU75:
	%r270 = load i64* %.ret
	ret i64 %r270
}

define %struct.tnode* @buildTree (%struct.node* %r294) {
LU83:
	%i = alloca i64
	%root = alloca %struct.tnode*
	%.ret = alloca %struct.tnode*
	%list = alloca %struct.node*
	store %struct.node* %r294, %struct.node** %list
	store %struct.tnode* null, %struct.tnode** %root
	store i64 0, i64* %i
	br label %LU86
LU86:
	%r296 = load i64* %i
	%r297 = load %struct.node** %list
	%r298 = call i64 @size(%struct.node* %r297)
	%r299 = icmp slt i64 %r296, %r298
	br i1 %r299, label %LU87, label %LU85
LU87:
	%r300 = load %struct.tnode** %root
	%r301 = load %struct.node** %list
	%r302 = load i64* %i
	%r303 = call i64 @get(%struct.node* %r301, i64 %r302)
	%r304 = call %struct.tnode* @treeadd(%struct.tnode* %r300, i64 %r303)
	store %struct.tnode* %r304, %struct.tnode** %root
	%r305 = load i64* %i
	%r306 = add i64 %r305, 1
	store i64 %r306, i64* %i
	%r307 = load i64* %i
	%r308 = load %struct.node** %list
	%r309 = call i64 @size(%struct.node* %r308)
	%r310 = icmp slt i64 %r307, %r309
	br i1 %r310, label %LU87, label %LU85
LU85:
	%r311 = load %struct.tnode** %root
	store %struct.tnode* %r311, %struct.tnode** %.ret
	br label %LU84
LU84:
	%r295 = load %struct.tnode** %.ret
	ret %struct.tnode* %r295
}

define void @treeMain (%struct.node* %r312) {
LU88:
	%root = alloca %struct.tnode*
	%inList = alloca %struct.node*
	%postList = alloca %struct.node*
	%list = alloca %struct.node*
	store %struct.node* %r312, %struct.node** %list
	%r314 = load %struct.node** %list
	%r315 = call %struct.tnode* @buildTree(%struct.node* %r314)
	store %struct.tnode* %r315, %struct.tnode** %root
	%r316 = load %struct.tnode** %root
	call void @treeprint(%struct.tnode* %r316)
	%r317 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r317)
	%r318 = load %struct.tnode** %root
	%r319 = call %struct.node* @inOrder(%struct.tnode* %r318)
	store %struct.node* %r319, %struct.node** %inList
	%r320 = load %struct.node** %inList
	call void @printList(%struct.node* %r320)
	%r321 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r321)
	%r322 = load %struct.node** %inList
	call void @freeList(%struct.node* %r322)
	%r323 = load %struct.tnode** %root
	%r324 = call %struct.node* @postOrder(%struct.tnode* %r323)
	store %struct.node* %r324, %struct.node** %postList
	%r325 = load %struct.node** %postList
	call void @printList(%struct.node* %r325)
	%r326 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r326)
	%r327 = load %struct.node** %postList
	call void @freeList(%struct.node* %r327)
	%r328 = load %struct.tnode** %root
	%r329 = call i64 @treesearch(%struct.tnode* %r328, i64 0)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r329)
	%r330 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r330)
	%r331 = load %struct.tnode** %root
	%r332 = call i64 @treesearch(%struct.tnode* %r331, i64 10)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r332)
	%r333 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r333)
	%r334 = load %struct.tnode** %root
	%r335 = sub i64 0, 2
	%r336 = call i64 @treesearch(%struct.tnode* %r334, i64 %r335)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r336)
	%r337 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r337)
	%r338 = load %struct.tnode** %root
	%r339 = call i64 @treesearch(%struct.tnode* %r338, i64 2)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r339)
	%r340 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r340)
	%r341 = load %struct.tnode** %root
	%r342 = call i64 @treesearch(%struct.tnode* %r341, i64 3)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r342)
	%r343 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r343)
	%r344 = load %struct.tnode** %root
	%r345 = call i64 @treesearch(%struct.tnode* %r344, i64 9)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r345)
	%r346 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r346)
	%r347 = load %struct.tnode** %root
	%r348 = call i64 @treesearch(%struct.tnode* %r347, i64 1)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r348)
	%r349 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r349)
	%r350 = load %struct.tnode** %root
	%r351 = call i64 @bintreesearch(%struct.tnode* %r350, i64 0)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r351)
	%r352 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r352)
	%r353 = load %struct.tnode** %root
	%r354 = call i64 @bintreesearch(%struct.tnode* %r353, i64 10)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r354)
	%r355 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r355)
	%r356 = load %struct.tnode** %root
	%r357 = sub i64 0, 2
	%r358 = call i64 @bintreesearch(%struct.tnode* %r356, i64 %r357)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r358)
	%r359 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r359)
	%r360 = load %struct.tnode** %root
	%r361 = call i64 @bintreesearch(%struct.tnode* %r360, i64 2)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r361)
	%r362 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r362)
	%r363 = load %struct.tnode** %root
	%r364 = call i64 @bintreesearch(%struct.tnode* %r363, i64 3)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r364)
	%r365 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r365)
	%r366 = load %struct.tnode** %root
	%r367 = call i64 @bintreesearch(%struct.tnode* %r366, i64 9)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r367)
	%r368 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r368)
	%r369 = load %struct.tnode** %root
	%r370 = call i64 @bintreesearch(%struct.tnode* %r369, i64 1)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r370)
	%r371 = sub i64 0, 999
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r371)
	%r372 = load %struct.tnode** %root
	call void @freeTree(%struct.tnode* %r372)
	br label %LU89
LU89:
	ret void
}

define %struct.node* @myCopy (%struct.node* %r373) {
LU90:
	%.ret = alloca %struct.node*
	%src = alloca %struct.node*
	store %struct.node* %r373, %struct.node** %src
	%r375 = load %struct.node** %src
	%r376 = icmp eq %struct.node* %r375, null
	br i1 %r376, label %LU93, label %LU92
LU93:
	store %struct.node* null, %struct.node** %.ret
	br label %LU91
LU92:
	%r377 = load %struct.node** %src
	%r378 = getelementptr inbounds %struct.node* %r377, i1 0, i32 0
	%r379 = load i64* %r378
	%r380 = call %struct.node* @add(%struct.node* null, i64 %r379)
	%r381 = load %struct.node** %src
	%r382 = getelementptr inbounds %struct.node* %r381, i1 0, i32 1
	%r383 = load %struct.node** %r382
	%r384 = call %struct.node* @myCopy(%struct.node* %r383)
	%r385 = call %struct.node* @concatLists(%struct.node* %r380, %struct.node* %r384)
	store %struct.node* %r385, %struct.node** %.ret
	br label %LU91
LU91:
	%r374 = load %struct.node** %.ret
	ret %struct.node* %r374
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
	%r387 = load i64* %i
	%r388 = icmp slt i64 %r387, 10
	br i1 %r388, label %LU98, label %LU96
LU98:
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r389 = load i64* @.read_scratch
	store i64 %r389, i64* %element
	%r390 = load %struct.node** %myList
	%r391 = load i64* %element
	%r392 = call %struct.node* @add(%struct.node* %r390, i64 %r391)
	store %struct.node* %r392, %struct.node** %myList
	%r393 = load %struct.node** %myList
	%r394 = call %struct.node* @myCopy(%struct.node* %r393)
	store %struct.node* %r394, %struct.node** %copyList1
	%r395 = load %struct.node** %myList
	%r396 = call %struct.node* @myCopy(%struct.node* %r395)
	store %struct.node* %r396, %struct.node** %copyList2
	%r397 = load %struct.node** %copyList1
	%r398 = call %struct.node* @quickSortMain(%struct.node* %r397)
	store %struct.node* %r398, %struct.node** %sortedList
	%r399 = load %struct.node** %sortedList
	call void @freeList(%struct.node* %r399)
	%r400 = load %struct.node** %copyList2
	call void @treeMain(%struct.node* %r400)
	%r401 = load i64* %i
	%r402 = add i64 %r401, 1
	store i64 %r402, i64* %i
	%r403 = load i64* %i
	%r404 = icmp slt i64 %r403, 10
	br i1 %r404, label %LU98, label %LU96
LU96:
	%r405 = load %struct.node** %myList
	call void @freeList(%struct.node* %r405)
	%r406 = load %struct.node** %copyList1
	call void @freeList(%struct.node* %r406)
	%r407 = load %struct.node** %copyList2
	call void @freeList(%struct.node* %r407)
	store i64 0, i64* %.ret
	br label %LU95
LU95:
	%r386 = load i64* %.ret
	ret i64 %r386
}

