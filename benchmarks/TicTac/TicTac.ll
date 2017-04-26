declare i8* @malloc(i64)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i64 0, align 8

%struct.gameBoard = type {i64, i64, i64, i64, i64, i64, i64, i64, i64}


define void @cleanBoard (%struct.gameBoard* %r0) {
LU0:
	%board = alloca %struct.gameBoard*
	store %struct.gameBoard* %r0, %struct.gameBoard** %board
	%r2 = load %struct.gameBoard** %board
	%r3 = getelementptr inbounds %struct.gameBoard* %r2, i1 0, i32 0
	store i64 0, i64* %r3
	%r4 = load %struct.gameBoard** %board
	%r5 = getelementptr inbounds %struct.gameBoard* %r4, i1 0, i32 1
	store i64 0, i64* %r5
	%r6 = load %struct.gameBoard** %board
	%r7 = getelementptr inbounds %struct.gameBoard* %r6, i1 0, i32 2
	store i64 0, i64* %r7
	%r8 = load %struct.gameBoard** %board
	%r9 = getelementptr inbounds %struct.gameBoard* %r8, i1 0, i32 3
	store i64 0, i64* %r9
	%r10 = load %struct.gameBoard** %board
	%r11 = getelementptr inbounds %struct.gameBoard* %r10, i1 0, i32 4
	store i64 0, i64* %r11
	%r12 = load %struct.gameBoard** %board
	%r13 = getelementptr inbounds %struct.gameBoard* %r12, i1 0, i32 5
	store i64 0, i64* %r13
	%r14 = load %struct.gameBoard** %board
	%r15 = getelementptr inbounds %struct.gameBoard* %r14, i1 0, i32 6
	store i64 0, i64* %r15
	%r16 = load %struct.gameBoard** %board
	%r17 = getelementptr inbounds %struct.gameBoard* %r16, i1 0, i32 7
	store i64 0, i64* %r17
	%r18 = load %struct.gameBoard** %board
	%r19 = getelementptr inbounds %struct.gameBoard* %r18, i1 0, i32 8
	store i64 0, i64* %r19
	br label %LU1
LU1:
	ret void
}

define void @printBoard (%struct.gameBoard* %r20) {
LU2:
	%board = alloca %struct.gameBoard*
	store %struct.gameBoard* %r20, %struct.gameBoard** %board
	%r22 = load %struct.gameBoard** %board
	%r23 = getelementptr inbounds %struct.gameBoard* %r22, i1 0, i32 0
	%r24 = load i64* %r23
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.print, i32 0, i32 0), i64 %r24)
	%r25 = load %struct.gameBoard** %board
	%r26 = getelementptr inbounds %struct.gameBoard* %r25, i1 0, i32 1
	%r27 = load i64* %r26
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.print, i32 0, i32 0), i64 %r27)
	%r28 = load %struct.gameBoard** %board
	%r29 = getelementptr inbounds %struct.gameBoard* %r28, i1 0, i32 2
	%r30 = load i64* %r29
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r30)
	%r31 = load %struct.gameBoard** %board
	%r32 = getelementptr inbounds %struct.gameBoard* %r31, i1 0, i32 3
	%r33 = load i64* %r32
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.print, i32 0, i32 0), i64 %r33)
	%r34 = load %struct.gameBoard** %board
	%r35 = getelementptr inbounds %struct.gameBoard* %r34, i1 0, i32 4
	%r36 = load i64* %r35
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.print, i32 0, i32 0), i64 %r36)
	%r37 = load %struct.gameBoard** %board
	%r38 = getelementptr inbounds %struct.gameBoard* %r37, i1 0, i32 5
	%r39 = load i64* %r38
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r39)
	%r40 = load %struct.gameBoard** %board
	%r41 = getelementptr inbounds %struct.gameBoard* %r40, i1 0, i32 6
	%r42 = load i64* %r41
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.print, i32 0, i32 0), i64 %r42)
	%r43 = load %struct.gameBoard** %board
	%r44 = getelementptr inbounds %struct.gameBoard* %r43, i1 0, i32 7
	%r45 = load i64* %r44
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.print, i32 0, i32 0), i64 %r45)
	%r46 = load %struct.gameBoard** %board
	%r47 = getelementptr inbounds %struct.gameBoard* %r46, i1 0, i32 8
	%r48 = load i64* %r47
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r48)
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

define void @placePiece (%struct.gameBoard* %r50, i64 %r51, i64 %r52) {
LU6:
	%board = alloca %struct.gameBoard*
	store %struct.gameBoard* %r50, %struct.gameBoard** %board
	%turn = alloca i64
	store i64 %r51, i64* %turn
	%placement = alloca i64
	store i64 %r52, i64* %placement
	%r54 = load i64* %placement
	%r55 = icmp eq i64 %r54, 1
	br i1 %r55, label %LU9, label %LU10
LU9:
	%r56 = load i64* %turn
	%r57 = load %struct.gameBoard** %board
	%r58 = getelementptr inbounds %struct.gameBoard* %r57, i1 0, i32 0
	store i64 %r56, i64* %r58
	br label %LU8
LU10:
	%r59 = load i64* %placement
	%r60 = icmp eq i64 %r59, 2
	br i1 %r60, label %LU12, label %LU13
LU12:
	%r61 = load i64* %turn
	%r62 = load %struct.gameBoard** %board
	%r63 = getelementptr inbounds %struct.gameBoard* %r62, i1 0, i32 1
	store i64 %r61, i64* %r63
	br label %LU11
LU13:
	%r64 = load i64* %placement
	%r65 = icmp eq i64 %r64, 3
	br i1 %r65, label %LU15, label %LU16
LU15:
	%r66 = load i64* %turn
	%r67 = load %struct.gameBoard** %board
	%r68 = getelementptr inbounds %struct.gameBoard* %r67, i1 0, i32 2
	store i64 %r66, i64* %r68
	br label %LU14
LU16:
	%r69 = load i64* %placement
	%r70 = icmp eq i64 %r69, 4
	br i1 %r70, label %LU18, label %LU19
LU18:
	%r71 = load i64* %turn
	%r72 = load %struct.gameBoard** %board
	%r73 = getelementptr inbounds %struct.gameBoard* %r72, i1 0, i32 3
	store i64 %r71, i64* %r73
	br label %LU17
LU19:
	%r74 = load i64* %placement
	%r75 = icmp eq i64 %r74, 5
	br i1 %r75, label %LU21, label %LU22
LU21:
	%r76 = load i64* %turn
	%r77 = load %struct.gameBoard** %board
	%r78 = getelementptr inbounds %struct.gameBoard* %r77, i1 0, i32 4
	store i64 %r76, i64* %r78
	br label %LU20
LU22:
	%r79 = load i64* %placement
	%r80 = icmp eq i64 %r79, 6
	br i1 %r80, label %LU24, label %LU25
LU24:
	%r81 = load i64* %turn
	%r82 = load %struct.gameBoard** %board
	%r83 = getelementptr inbounds %struct.gameBoard* %r82, i1 0, i32 5
	store i64 %r81, i64* %r83
	br label %LU23
LU25:
	%r84 = load i64* %placement
	%r85 = icmp eq i64 %r84, 7
	br i1 %r85, label %LU27, label %LU28
LU27:
	%r86 = load i64* %turn
	%r87 = load %struct.gameBoard** %board
	%r88 = getelementptr inbounds %struct.gameBoard* %r87, i1 0, i32 6
	store i64 %r86, i64* %r88
	br label %LU26
LU28:
	%r89 = load i64* %placement
	%r90 = icmp eq i64 %r89, 8
	br i1 %r90, label %LU30, label %LU31
LU30:
	%r91 = load i64* %turn
	%r92 = load %struct.gameBoard** %board
	%r93 = getelementptr inbounds %struct.gameBoard* %r92, i1 0, i32 7
	store i64 %r91, i64* %r93
	br label %LU29
LU31:
	%r94 = load i64* %placement
	%r95 = icmp eq i64 %r94, 9
	br i1 %r95, label %LU33, label %LU32
LU33:
	%r96 = load i64* %turn
	%r97 = load %struct.gameBoard** %board
	%r98 = getelementptr inbounds %struct.gameBoard* %r97, i1 0, i32 8
	store i64 %r96, i64* %r98
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

define i64 @checkWinner (%struct.gameBoard* %r99) {
LU34:
	%.ret = alloca i64
	%board = alloca %struct.gameBoard*
	store %struct.gameBoard* %r99, %struct.gameBoard** %board
	%r101 = load %struct.gameBoard** %board
	%r102 = getelementptr inbounds %struct.gameBoard* %r101, i1 0, i32 0
	%r103 = load i64* %r102
	%r104 = icmp eq i64 %r103, 1
	br i1 %r104, label %LU37, label %LU36
LU37:
	%r105 = load %struct.gameBoard** %board
	%r106 = getelementptr inbounds %struct.gameBoard* %r105, i1 0, i32 1
	%r107 = load i64* %r106
	%r108 = icmp eq i64 %r107, 1
	br i1 %r108, label %LU39, label %LU38
LU39:
	%r109 = load %struct.gameBoard** %board
	%r110 = getelementptr inbounds %struct.gameBoard* %r109, i1 0, i32 2
	%r111 = load i64* %r110
	%r112 = icmp eq i64 %r111, 1
	br i1 %r112, label %LU41, label %LU40
LU41:
	store i64 0, i64* %.ret
	br label %LU35
LU40:
	br label %LU38
LU38:
	br label %LU36
LU36:
	%r113 = load %struct.gameBoard** %board
	%r114 = getelementptr inbounds %struct.gameBoard* %r113, i1 0, i32 0
	%r115 = load i64* %r114
	%r116 = icmp eq i64 %r115, 2
	br i1 %r116, label %LU43, label %LU42
LU43:
	%r117 = load %struct.gameBoard** %board
	%r118 = getelementptr inbounds %struct.gameBoard* %r117, i1 0, i32 1
	%r119 = load i64* %r118
	%r120 = icmp eq i64 %r119, 2
	br i1 %r120, label %LU45, label %LU44
LU45:
	%r121 = load %struct.gameBoard** %board
	%r122 = getelementptr inbounds %struct.gameBoard* %r121, i1 0, i32 2
	%r123 = load i64* %r122
	%r124 = icmp eq i64 %r123, 2
	br i1 %r124, label %LU47, label %LU46
LU47:
	store i64 1, i64* %.ret
	br label %LU35
LU46:
	br label %LU44
LU44:
	br label %LU42
LU42:
	%r125 = load %struct.gameBoard** %board
	%r126 = getelementptr inbounds %struct.gameBoard* %r125, i1 0, i32 3
	%r127 = load i64* %r126
	%r128 = icmp eq i64 %r127, 1
	br i1 %r128, label %LU49, label %LU48
LU49:
	%r129 = load %struct.gameBoard** %board
	%r130 = getelementptr inbounds %struct.gameBoard* %r129, i1 0, i32 4
	%r131 = load i64* %r130
	%r132 = icmp eq i64 %r131, 1
	br i1 %r132, label %LU51, label %LU50
LU51:
	%r133 = load %struct.gameBoard** %board
	%r134 = getelementptr inbounds %struct.gameBoard* %r133, i1 0, i32 5
	%r135 = load i64* %r134
	%r136 = icmp eq i64 %r135, 1
	br i1 %r136, label %LU53, label %LU52
LU53:
	store i64 0, i64* %.ret
	br label %LU35
LU52:
	br label %LU50
LU50:
	br label %LU48
LU48:
	%r137 = load %struct.gameBoard** %board
	%r138 = getelementptr inbounds %struct.gameBoard* %r137, i1 0, i32 3
	%r139 = load i64* %r138
	%r140 = icmp eq i64 %r139, 2
	br i1 %r140, label %LU55, label %LU54
LU55:
	%r141 = load %struct.gameBoard** %board
	%r142 = getelementptr inbounds %struct.gameBoard* %r141, i1 0, i32 4
	%r143 = load i64* %r142
	%r144 = icmp eq i64 %r143, 2
	br i1 %r144, label %LU57, label %LU56
LU57:
	%r145 = load %struct.gameBoard** %board
	%r146 = getelementptr inbounds %struct.gameBoard* %r145, i1 0, i32 5
	%r147 = load i64* %r146
	%r148 = icmp eq i64 %r147, 2
	br i1 %r148, label %LU59, label %LU58
LU59:
	store i64 1, i64* %.ret
	br label %LU35
LU58:
	br label %LU56
LU56:
	br label %LU54
LU54:
	%r149 = load %struct.gameBoard** %board
	%r150 = getelementptr inbounds %struct.gameBoard* %r149, i1 0, i32 6
	%r151 = load i64* %r150
	%r152 = icmp eq i64 %r151, 1
	br i1 %r152, label %LU61, label %LU60
LU61:
	%r153 = load %struct.gameBoard** %board
	%r154 = getelementptr inbounds %struct.gameBoard* %r153, i1 0, i32 7
	%r155 = load i64* %r154
	%r156 = icmp eq i64 %r155, 1
	br i1 %r156, label %LU63, label %LU62
LU63:
	%r157 = load %struct.gameBoard** %board
	%r158 = getelementptr inbounds %struct.gameBoard* %r157, i1 0, i32 8
	%r159 = load i64* %r158
	%r160 = icmp eq i64 %r159, 1
	br i1 %r160, label %LU65, label %LU64
LU65:
	store i64 0, i64* %.ret
	br label %LU35
LU64:
	br label %LU62
LU62:
	br label %LU60
LU60:
	%r161 = load %struct.gameBoard** %board
	%r162 = getelementptr inbounds %struct.gameBoard* %r161, i1 0, i32 6
	%r163 = load i64* %r162
	%r164 = icmp eq i64 %r163, 2
	br i1 %r164, label %LU67, label %LU66
LU67:
	%r165 = load %struct.gameBoard** %board
	%r166 = getelementptr inbounds %struct.gameBoard* %r165, i1 0, i32 7
	%r167 = load i64* %r166
	%r168 = icmp eq i64 %r167, 2
	br i1 %r168, label %LU69, label %LU68
LU69:
	%r169 = load %struct.gameBoard** %board
	%r170 = getelementptr inbounds %struct.gameBoard* %r169, i1 0, i32 8
	%r171 = load i64* %r170
	%r172 = icmp eq i64 %r171, 2
	br i1 %r172, label %LU71, label %LU70
LU71:
	store i64 1, i64* %.ret
	br label %LU35
LU70:
	br label %LU68
LU68:
	br label %LU66
LU66:
	%r173 = load %struct.gameBoard** %board
	%r174 = getelementptr inbounds %struct.gameBoard* %r173, i1 0, i32 0
	%r175 = load i64* %r174
	%r176 = icmp eq i64 %r175, 1
	br i1 %r176, label %LU73, label %LU72
LU73:
	%r177 = load %struct.gameBoard** %board
	%r178 = getelementptr inbounds %struct.gameBoard* %r177, i1 0, i32 3
	%r179 = load i64* %r178
	%r180 = icmp eq i64 %r179, 1
	br i1 %r180, label %LU75, label %LU74
LU75:
	%r181 = load %struct.gameBoard** %board
	%r182 = getelementptr inbounds %struct.gameBoard* %r181, i1 0, i32 6
	%r183 = load i64* %r182
	%r184 = icmp eq i64 %r183, 1
	br i1 %r184, label %LU77, label %LU76
LU77:
	store i64 0, i64* %.ret
	br label %LU35
LU76:
	br label %LU74
LU74:
	br label %LU72
LU72:
	%r185 = load %struct.gameBoard** %board
	%r186 = getelementptr inbounds %struct.gameBoard* %r185, i1 0, i32 0
	%r187 = load i64* %r186
	%r188 = icmp eq i64 %r187, 2
	br i1 %r188, label %LU79, label %LU78
LU79:
	%r189 = load %struct.gameBoard** %board
	%r190 = getelementptr inbounds %struct.gameBoard* %r189, i1 0, i32 3
	%r191 = load i64* %r190
	%r192 = icmp eq i64 %r191, 2
	br i1 %r192, label %LU81, label %LU80
LU81:
	%r193 = load %struct.gameBoard** %board
	%r194 = getelementptr inbounds %struct.gameBoard* %r193, i1 0, i32 6
	%r195 = load i64* %r194
	%r196 = icmp eq i64 %r195, 2
	br i1 %r196, label %LU83, label %LU82
LU83:
	store i64 1, i64* %.ret
	br label %LU35
LU82:
	br label %LU80
LU80:
	br label %LU78
LU78:
	%r197 = load %struct.gameBoard** %board
	%r198 = getelementptr inbounds %struct.gameBoard* %r197, i1 0, i32 1
	%r199 = load i64* %r198
	%r200 = icmp eq i64 %r199, 1
	br i1 %r200, label %LU85, label %LU84
LU85:
	%r201 = load %struct.gameBoard** %board
	%r202 = getelementptr inbounds %struct.gameBoard* %r201, i1 0, i32 4
	%r203 = load i64* %r202
	%r204 = icmp eq i64 %r203, 1
	br i1 %r204, label %LU87, label %LU86
LU87:
	%r205 = load %struct.gameBoard** %board
	%r206 = getelementptr inbounds %struct.gameBoard* %r205, i1 0, i32 7
	%r207 = load i64* %r206
	%r208 = icmp eq i64 %r207, 1
	br i1 %r208, label %LU89, label %LU88
LU89:
	store i64 0, i64* %.ret
	br label %LU35
LU88:
	br label %LU86
LU86:
	br label %LU84
LU84:
	%r209 = load %struct.gameBoard** %board
	%r210 = getelementptr inbounds %struct.gameBoard* %r209, i1 0, i32 1
	%r211 = load i64* %r210
	%r212 = icmp eq i64 %r211, 2
	br i1 %r212, label %LU91, label %LU90
LU91:
	%r213 = load %struct.gameBoard** %board
	%r214 = getelementptr inbounds %struct.gameBoard* %r213, i1 0, i32 4
	%r215 = load i64* %r214
	%r216 = icmp eq i64 %r215, 2
	br i1 %r216, label %LU93, label %LU92
LU93:
	%r217 = load %struct.gameBoard** %board
	%r218 = getelementptr inbounds %struct.gameBoard* %r217, i1 0, i32 7
	%r219 = load i64* %r218
	%r220 = icmp eq i64 %r219, 2
	br i1 %r220, label %LU95, label %LU94
LU95:
	store i64 1, i64* %.ret
	br label %LU35
LU94:
	br label %LU92
LU92:
	br label %LU90
LU90:
	%r221 = load %struct.gameBoard** %board
	%r222 = getelementptr inbounds %struct.gameBoard* %r221, i1 0, i32 2
	%r223 = load i64* %r222
	%r224 = icmp eq i64 %r223, 1
	br i1 %r224, label %LU97, label %LU96
LU97:
	%r225 = load %struct.gameBoard** %board
	%r226 = getelementptr inbounds %struct.gameBoard* %r225, i1 0, i32 5
	%r227 = load i64* %r226
	%r228 = icmp eq i64 %r227, 1
	br i1 %r228, label %LU99, label %LU98
LU99:
	%r229 = load %struct.gameBoard** %board
	%r230 = getelementptr inbounds %struct.gameBoard* %r229, i1 0, i32 8
	%r231 = load i64* %r230
	%r232 = icmp eq i64 %r231, 1
	br i1 %r232, label %LU101, label %LU100
LU101:
	store i64 0, i64* %.ret
	br label %LU35
LU100:
	br label %LU98
LU98:
	br label %LU96
LU96:
	%r233 = load %struct.gameBoard** %board
	%r234 = getelementptr inbounds %struct.gameBoard* %r233, i1 0, i32 2
	%r235 = load i64* %r234
	%r236 = icmp eq i64 %r235, 2
	br i1 %r236, label %LU103, label %LU102
LU103:
	%r237 = load %struct.gameBoard** %board
	%r238 = getelementptr inbounds %struct.gameBoard* %r237, i1 0, i32 5
	%r239 = load i64* %r238
	%r240 = icmp eq i64 %r239, 2
	br i1 %r240, label %LU105, label %LU104
LU105:
	%r241 = load %struct.gameBoard** %board
	%r242 = getelementptr inbounds %struct.gameBoard* %r241, i1 0, i32 8
	%r243 = load i64* %r242
	%r244 = icmp eq i64 %r243, 2
	br i1 %r244, label %LU107, label %LU106
LU107:
	store i64 1, i64* %.ret
	br label %LU35
LU106:
	br label %LU104
LU104:
	br label %LU102
LU102:
	%r245 = sub i64 0, 1
	store i64 %r245, i64* %.ret
	br label %LU35
LU35:
	%r100 = load i64* %.ret
	ret i64 %r100
}

define i64 @main () {
LU108:
	%turn = alloca i64
	%space1 = alloca i64
	%space2 = alloca i64
	%winner = alloca i64
	%i = alloca i64
	%board = alloca %struct.gameBoard*
	%.ret = alloca i64
	store i64 0, i64* %i
	store i64 0, i64* %turn
	store i64 0, i64* %space1
	store i64 0, i64* %space2
	%r247 = sub i64 0, 1
	store i64 %r247, i64* %winner
	%r248 = call i8* @malloc(i64 72)
	%r249 = bitcast i8* %r248 to %struct.gameBoard*
	store %struct.gameBoard* %r249, %struct.gameBoard** %board
	%r250 = load %struct.gameBoard** %board
	call void @cleanBoard(%struct.gameBoard* %r250)
	br label %LU111
LU111:
	%r251 = load i64* %winner
	%r252 = icmp slt i64 %r251, 0
	%r253 = load i64* %i
	%r254 = icmp ne i64 %r253, 8
	%r255 = and i1 %r252, %r254
	br i1 %r255, label %LU112, label %LU110
LU112:
	%r256 = load %struct.gameBoard** %board
	call void @printBoard(%struct.gameBoard* %r256)
	%r257 = load i64* %turn
	%r258 = icmp eq i64 %r257, 0
	br i1 %r258, label %LU114, label %LU115
LU114:
	%r259 = load i64* %turn
	%r260 = add i64 %r259, 1
	store i64 %r260, i64* %turn
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r261 = load i64* @.read_scratch
	store i64 %r261, i64* %space1
	%r262 = load %struct.gameBoard** %board
	%r263 = load i64* %space1
	call void @placePiece(%struct.gameBoard* %r262, i64 1, i64 %r263)
	br label %LU113
LU115:
	%r264 = load i64* %turn
	%r265 = sub i64 %r264, 1
	store i64 %r265, i64* %turn
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r266 = load i64* @.read_scratch
	store i64 %r266, i64* %space2
	%r267 = load %struct.gameBoard** %board
	%r268 = load i64* %space2
	call void @placePiece(%struct.gameBoard* %r267, i64 2, i64 %r268)
	br label %LU113
LU113:
	%r269 = load %struct.gameBoard** %board
	%r270 = call i64 @checkWinner(%struct.gameBoard* %r269)
	store i64 %r270, i64* %winner
	%r271 = load i64* %i
	%r272 = add i64 %r271, 1
	store i64 %r272, i64* %i
	br label %LU111
LU110:
	%r273 = load i64* %winner
	%r274 = add i64 %r273, 1
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r274)
	store i64 0, i64* %.ret
	br label %LU109
LU109:
	%r246 = load i64* %.ret
	ret i64 %r246
}

