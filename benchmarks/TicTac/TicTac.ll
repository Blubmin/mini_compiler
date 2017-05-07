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

%struct.gameBoard = type {i64, i64, i64, i64, i64, i64, i64, i64, i64}


define void @cleanBoard (%struct.gameBoard* %r0) {
LU0:
	%r1 = getelementptr inbounds %struct.gameBoard* %r0, i1 0, i32 0
	store i64 0, i64* %r1
	%r2 = getelementptr inbounds %struct.gameBoard* %r0, i1 0, i32 1
	store i64 0, i64* %r2
	%r3 = getelementptr inbounds %struct.gameBoard* %r0, i1 0, i32 2
	store i64 0, i64* %r3
	%r4 = getelementptr inbounds %struct.gameBoard* %r0, i1 0, i32 3
	store i64 0, i64* %r4
	%r5 = getelementptr inbounds %struct.gameBoard* %r0, i1 0, i32 4
	store i64 0, i64* %r5
	%r6 = getelementptr inbounds %struct.gameBoard* %r0, i1 0, i32 5
	store i64 0, i64* %r6
	%r7 = getelementptr inbounds %struct.gameBoard* %r0, i1 0, i32 6
	store i64 0, i64* %r7
	%r8 = getelementptr inbounds %struct.gameBoard* %r0, i1 0, i32 7
	store i64 0, i64* %r8
	%r9 = getelementptr inbounds %struct.gameBoard* %r0, i1 0, i32 8
	store i64 0, i64* %r9
	br label %LU1
LU1:
	ret void
}

define void @printBoard (%struct.gameBoard* %r11) {
LU2:
	%r12 = getelementptr inbounds %struct.gameBoard* %r11, i1 0, i32 0
	%r13 = load i64* %r12
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.print, i32 0, i32 0), i64 %r13)
	%r14 = getelementptr inbounds %struct.gameBoard* %r11, i1 0, i32 1
	%r15 = load i64* %r14
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.print, i32 0, i32 0), i64 %r15)
	%r16 = getelementptr inbounds %struct.gameBoard* %r11, i1 0, i32 2
	%r17 = load i64* %r16
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r17)
	%r18 = getelementptr inbounds %struct.gameBoard* %r11, i1 0, i32 3
	%r19 = load i64* %r18
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.print, i32 0, i32 0), i64 %r19)
	%r20 = getelementptr inbounds %struct.gameBoard* %r11, i1 0, i32 4
	%r21 = load i64* %r20
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.print, i32 0, i32 0), i64 %r21)
	%r22 = getelementptr inbounds %struct.gameBoard* %r11, i1 0, i32 5
	%r23 = load i64* %r22
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r23)
	%r24 = getelementptr inbounds %struct.gameBoard* %r11, i1 0, i32 6
	%r25 = load i64* %r24
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.print, i32 0, i32 0), i64 %r25)
	%r26 = getelementptr inbounds %struct.gameBoard* %r11, i1 0, i32 7
	%r27 = load i64* %r26
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.print, i32 0, i32 0), i64 %r27)
	%r28 = getelementptr inbounds %struct.gameBoard* %r11, i1 0, i32 8
	%r29 = load i64* %r28
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r29)
	br label %LU3
LU3:
	ret void
}

define void @printMoveBoard () {
LU4:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 123)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 456)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 789)
	br label %LU5
LU5:
	ret void
}

define void @placePiece (%struct.gameBoard* %r32, i64 %r33, i64 %r34) {
LU6:
	%r35 = icmp eq i64 %r34, 1
	br i1 %r35, label %LU9, label %LU10
LU9:
	%r36 = getelementptr inbounds %struct.gameBoard* %r32, i1 0, i32 0
	store i64 %r33, i64* %r36
	br label %LU8
LU10:
	%r37 = icmp eq i64 %r34, 2
	br i1 %r37, label %LU12, label %LU13
LU12:
	%r38 = getelementptr inbounds %struct.gameBoard* %r32, i1 0, i32 1
	store i64 %r33, i64* %r38
	br label %LU11
LU13:
	%r39 = icmp eq i64 %r34, 3
	br i1 %r39, label %LU15, label %LU16
LU15:
	%r40 = getelementptr inbounds %struct.gameBoard* %r32, i1 0, i32 2
	store i64 %r33, i64* %r40
	br label %LU14
LU16:
	%r41 = icmp eq i64 %r34, 4
	br i1 %r41, label %LU18, label %LU19
LU18:
	%r42 = getelementptr inbounds %struct.gameBoard* %r32, i1 0, i32 3
	store i64 %r33, i64* %r42
	br label %LU17
LU19:
	%r43 = icmp eq i64 %r34, 5
	br i1 %r43, label %LU21, label %LU22
LU21:
	%r44 = getelementptr inbounds %struct.gameBoard* %r32, i1 0, i32 4
	store i64 %r33, i64* %r44
	br label %LU20
LU22:
	%r45 = icmp eq i64 %r34, 6
	br i1 %r45, label %LU24, label %LU25
LU24:
	%r46 = getelementptr inbounds %struct.gameBoard* %r32, i1 0, i32 5
	store i64 %r33, i64* %r46
	br label %LU23
LU25:
	%r47 = icmp eq i64 %r34, 7
	br i1 %r47, label %LU27, label %LU28
LU27:
	%r48 = getelementptr inbounds %struct.gameBoard* %r32, i1 0, i32 6
	store i64 %r33, i64* %r48
	br label %LU26
LU28:
	%r49 = icmp eq i64 %r34, 8
	br i1 %r49, label %LU30, label %LU31
LU30:
	%r50 = getelementptr inbounds %struct.gameBoard* %r32, i1 0, i32 7
	store i64 %r33, i64* %r50
	br label %LU29
LU31:
	%r51 = icmp eq i64 %r34, 9
	br i1 %r51, label %LU33, label %LU32
LU33:
	%r52 = getelementptr inbounds %struct.gameBoard* %r32, i1 0, i32 8
	store i64 %r33, i64* %r52
	br label %LU32
LU32:
	br label %LU29
LU29:
	br label %LU26
LU26:
	br label %LU23
LU23:
	br label %LU20
LU20:
	br label %LU17
LU17:
	br label %LU14
LU14:
	br label %LU11
LU11:
	br label %LU8
LU8:
	br label %LU7
LU7:
	ret void
}

define i64 @checkWinner (%struct.gameBoard* %r54) {
LU34:
	%r55 = getelementptr inbounds %struct.gameBoard* %r54, i1 0, i32 0
	%r56 = load i64* %r55
	%r57 = icmp eq i64 %r56, 1
	br i1 %r57, label %LU37, label %LU36
LU37:
	%r58 = getelementptr inbounds %struct.gameBoard* %r54, i1 0, i32 1
	%r59 = load i64* %r58
	%r60 = icmp eq i64 %r59, 1
	br i1 %r60, label %LU39, label %LU38
LU39:
	%r61 = getelementptr inbounds %struct.gameBoard* %r54, i1 0, i32 2
	%r62 = load i64* %r61
	%r63 = icmp eq i64 %r62, 1
	br i1 %r63, label %LU41, label %LU40
LU41:
	br label %LU35
LU40:
	br label %LU38
LU38:
	br label %LU36
LU36:
	%r64 = getelementptr inbounds %struct.gameBoard* %r54, i1 0, i32 0
	%r65 = load i64* %r64
	%r66 = icmp eq i64 %r65, 2
	br i1 %r66, label %LU43, label %LU42
LU43:
	%r67 = getelementptr inbounds %struct.gameBoard* %r54, i1 0, i32 1
	%r68 = load i64* %r67
	%r69 = icmp eq i64 %r68, 2
	br i1 %r69, label %LU45, label %LU44
LU45:
	%r70 = getelementptr inbounds %struct.gameBoard* %r54, i1 0, i32 2
	%r71 = load i64* %r70
	%r72 = icmp eq i64 %r71, 2
	br i1 %r72, label %LU47, label %LU46
LU47:
	br label %LU35
LU46:
	br label %LU44
LU44:
	br label %LU42
LU42:
	%r73 = getelementptr inbounds %struct.gameBoard* %r54, i1 0, i32 3
	%r74 = load i64* %r73
	%r75 = icmp eq i64 %r74, 1
	br i1 %r75, label %LU49, label %LU48
LU49:
	%r76 = getelementptr inbounds %struct.gameBoard* %r54, i1 0, i32 4
	%r77 = load i64* %r76
	%r78 = icmp eq i64 %r77, 1
	br i1 %r78, label %LU51, label %LU50
LU51:
	%r79 = getelementptr inbounds %struct.gameBoard* %r54, i1 0, i32 5
	%r80 = load i64* %r79
	%r81 = icmp eq i64 %r80, 1
	br i1 %r81, label %LU53, label %LU52
LU53:
	br label %LU35
LU52:
	br label %LU50
LU50:
	br label %LU48
LU48:
	%r82 = getelementptr inbounds %struct.gameBoard* %r54, i1 0, i32 3
	%r83 = load i64* %r82
	%r84 = icmp eq i64 %r83, 2
	br i1 %r84, label %LU55, label %LU54
LU55:
	%r85 = getelementptr inbounds %struct.gameBoard* %r54, i1 0, i32 4
	%r86 = load i64* %r85
	%r87 = icmp eq i64 %r86, 2
	br i1 %r87, label %LU57, label %LU56
LU57:
	%r88 = getelementptr inbounds %struct.gameBoard* %r54, i1 0, i32 5
	%r89 = load i64* %r88
	%r90 = icmp eq i64 %r89, 2
	br i1 %r90, label %LU59, label %LU58
LU59:
	br label %LU35
LU58:
	br label %LU56
LU56:
	br label %LU54
LU54:
	%r91 = getelementptr inbounds %struct.gameBoard* %r54, i1 0, i32 6
	%r92 = load i64* %r91
	%r93 = icmp eq i64 %r92, 1
	br i1 %r93, label %LU61, label %LU60
LU61:
	%r94 = getelementptr inbounds %struct.gameBoard* %r54, i1 0, i32 7
	%r95 = load i64* %r94
	%r96 = icmp eq i64 %r95, 1
	br i1 %r96, label %LU63, label %LU62
LU63:
	%r97 = getelementptr inbounds %struct.gameBoard* %r54, i1 0, i32 8
	%r98 = load i64* %r97
	%r99 = icmp eq i64 %r98, 1
	br i1 %r99, label %LU65, label %LU64
LU65:
	br label %LU35
LU64:
	br label %LU62
LU62:
	br label %LU60
LU60:
	%r100 = getelementptr inbounds %struct.gameBoard* %r54, i1 0, i32 6
	%r101 = load i64* %r100
	%r102 = icmp eq i64 %r101, 2
	br i1 %r102, label %LU67, label %LU66
LU67:
	%r103 = getelementptr inbounds %struct.gameBoard* %r54, i1 0, i32 7
	%r104 = load i64* %r103
	%r105 = icmp eq i64 %r104, 2
	br i1 %r105, label %LU69, label %LU68
LU69:
	%r106 = getelementptr inbounds %struct.gameBoard* %r54, i1 0, i32 8
	%r107 = load i64* %r106
	%r108 = icmp eq i64 %r107, 2
	br i1 %r108, label %LU71, label %LU70
LU71:
	br label %LU35
LU70:
	br label %LU68
LU68:
	br label %LU66
LU66:
	%r109 = getelementptr inbounds %struct.gameBoard* %r54, i1 0, i32 0
	%r110 = load i64* %r109
	%r111 = icmp eq i64 %r110, 1
	br i1 %r111, label %LU73, label %LU72
LU73:
	%r112 = getelementptr inbounds %struct.gameBoard* %r54, i1 0, i32 3
	%r113 = load i64* %r112
	%r114 = icmp eq i64 %r113, 1
	br i1 %r114, label %LU75, label %LU74
LU75:
	%r115 = getelementptr inbounds %struct.gameBoard* %r54, i1 0, i32 6
	%r116 = load i64* %r115
	%r117 = icmp eq i64 %r116, 1
	br i1 %r117, label %LU77, label %LU76
LU77:
	br label %LU35
LU76:
	br label %LU74
LU74:
	br label %LU72
LU72:
	%r118 = getelementptr inbounds %struct.gameBoard* %r54, i1 0, i32 0
	%r119 = load i64* %r118
	%r120 = icmp eq i64 %r119, 2
	br i1 %r120, label %LU79, label %LU78
LU79:
	%r121 = getelementptr inbounds %struct.gameBoard* %r54, i1 0, i32 3
	%r122 = load i64* %r121
	%r123 = icmp eq i64 %r122, 2
	br i1 %r123, label %LU81, label %LU80
LU81:
	%r124 = getelementptr inbounds %struct.gameBoard* %r54, i1 0, i32 6
	%r125 = load i64* %r124
	%r126 = icmp eq i64 %r125, 2
	br i1 %r126, label %LU83, label %LU82
LU83:
	br label %LU35
LU82:
	br label %LU80
LU80:
	br label %LU78
LU78:
	%r127 = getelementptr inbounds %struct.gameBoard* %r54, i1 0, i32 1
	%r128 = load i64* %r127
	%r129 = icmp eq i64 %r128, 1
	br i1 %r129, label %LU85, label %LU84
LU85:
	%r130 = getelementptr inbounds %struct.gameBoard* %r54, i1 0, i32 4
	%r131 = load i64* %r130
	%r132 = icmp eq i64 %r131, 1
	br i1 %r132, label %LU87, label %LU86
LU87:
	%r133 = getelementptr inbounds %struct.gameBoard* %r54, i1 0, i32 7
	%r134 = load i64* %r133
	%r135 = icmp eq i64 %r134, 1
	br i1 %r135, label %LU89, label %LU88
LU89:
	br label %LU35
LU88:
	br label %LU86
LU86:
	br label %LU84
LU84:
	%r136 = getelementptr inbounds %struct.gameBoard* %r54, i1 0, i32 1
	%r137 = load i64* %r136
	%r138 = icmp eq i64 %r137, 2
	br i1 %r138, label %LU91, label %LU90
LU91:
	%r139 = getelementptr inbounds %struct.gameBoard* %r54, i1 0, i32 4
	%r140 = load i64* %r139
	%r141 = icmp eq i64 %r140, 2
	br i1 %r141, label %LU93, label %LU92
LU93:
	%r142 = getelementptr inbounds %struct.gameBoard* %r54, i1 0, i32 7
	%r143 = load i64* %r142
	%r144 = icmp eq i64 %r143, 2
	br i1 %r144, label %LU95, label %LU94
LU95:
	br label %LU35
LU94:
	br label %LU92
LU92:
	br label %LU90
LU90:
	%r145 = getelementptr inbounds %struct.gameBoard* %r54, i1 0, i32 2
	%r146 = load i64* %r145
	%r147 = icmp eq i64 %r146, 1
	br i1 %r147, label %LU97, label %LU96
LU97:
	%r148 = getelementptr inbounds %struct.gameBoard* %r54, i1 0, i32 5
	%r149 = load i64* %r148
	%r150 = icmp eq i64 %r149, 1
	br i1 %r150, label %LU99, label %LU98
LU99:
	%r151 = getelementptr inbounds %struct.gameBoard* %r54, i1 0, i32 8
	%r152 = load i64* %r151
	%r153 = icmp eq i64 %r152, 1
	br i1 %r153, label %LU101, label %LU100
LU101:
	br label %LU35
LU100:
	br label %LU98
LU98:
	br label %LU96
LU96:
	%r154 = getelementptr inbounds %struct.gameBoard* %r54, i1 0, i32 2
	%r155 = load i64* %r154
	%r156 = icmp eq i64 %r155, 2
	br i1 %r156, label %LU103, label %LU102
LU103:
	%r157 = getelementptr inbounds %struct.gameBoard* %r54, i1 0, i32 5
	%r158 = load i64* %r157
	%r159 = icmp eq i64 %r158, 2
	br i1 %r159, label %LU105, label %LU104
LU105:
	%r160 = getelementptr inbounds %struct.gameBoard* %r54, i1 0, i32 8
	%r161 = load i64* %r160
	%r162 = icmp eq i64 %r161, 2
	br i1 %r162, label %LU107, label %LU106
LU107:
	br label %LU35
LU106:
	br label %LU104
LU104:
	br label %LU102
LU102:
	%r163 = sub i64 0, 1
	br label %LU35
LU35:
	%r165 = phi i64 [ 0, %LU41 ], [ 1, %LU47 ], [ 0, %LU53 ], [ 1, %LU59 ], [ 0, %LU65 ], [ 1, %LU71 ], [ 0, %LU77 ], [ 1, %LU83 ], [ 0, %LU89 ], [ 1, %LU95 ], [ 0, %LU101 ], [ 1, %LU107 ], [ %r163, %LU102 ]
	ret i64 %r165
}

define i64 @main () {
LU108:
	%r166 = sub i64 0, 1
	%r167 = call i8* @malloc(i64 72)
	%r168 = bitcast i8* %r167 to %struct.gameBoard*
	call void @cleanBoard(%struct.gameBoard* %r168)
	br label %LU111
LU111:
	%r169 = icmp slt i64 %r166, 0
	%r170 = icmp ne i64 0, 8
	%r171 = and i1 %r169, %r170
	br i1 %r171, label %LU112, label %LU110
LU112:
	%r185 = phi i64 [ 0, %LU111 ], [ %r187, %LU113 ]
	%r183 = phi i64 [ %r166, %LU111 ], [ %r182, %LU113 ]
	%r180 = phi i64 [ 0, %LU111 ], [ %r193, %LU113 ]
	%r177 = phi i64 [ 0, %LU111 ], [ %r192, %LU113 ]
	%r173 = phi i64 [ 0, %LU111 ], [ %r191, %LU113 ]
	%r172 = phi %struct.gameBoard* [ %r168, %LU111 ], [ %r172, %LU113 ]
	call void @printBoard(%struct.gameBoard* %r172)
	%r174 = icmp eq i64 %r173, 0
	br i1 %r174, label %LU114, label %LU115
LU114:
	%r175 = add i64 %r173, 1
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r176 = load i64* @.read_scratch
	call void @placePiece(%struct.gameBoard* %r172, i64 1, i64 %r176)
	br label %LU113
LU115:
	%r178 = sub i64 %r173, 1
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r179 = load i64* @.read_scratch
	call void @placePiece(%struct.gameBoard* %r172, i64 2, i64 %r179)
	br label %LU113
LU113:
	%r193 = phi i64 [ %r180, %LU114 ], [ %r179, %LU115 ]
	%r192 = phi i64 [ %r176, %LU114 ], [ %r177, %LU115 ]
	%r191 = phi i64 [ %r175, %LU114 ], [ %r178, %LU115 ]
	%r182 = call i64 @checkWinner(%struct.gameBoard* %r172)
	%r187 = add i64 %r185, 1
	%r188 = icmp slt i64 %r182, 0
	%r189 = icmp ne i64 %r187, 8
	%r190 = and i1 %r188, %r189
	br i1 %r190, label %LU112, label %LU110
LU110:
	%r194 = phi i64 [ %r166, %LU111 ], [ %r182, %LU113 ]
	%r195 = add i64 %r194, 1
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r195)
	br label %LU109
LU109:
	ret i64 0
}

