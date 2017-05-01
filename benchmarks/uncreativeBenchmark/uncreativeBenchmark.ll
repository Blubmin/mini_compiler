declare i8* @malloc(i64)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.printhex = private unnamed_addr constant [6 x i8] c"0x%X\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i64 0, align 8

%struct.LameStruct = type {i64, i64, i64, i64, i64, i64, i64, i64, i64}


define i64 @countTotal (%struct.LameStruct* %r0) {
LU0:
	%total = alloca i64
	%.ret = alloca i64
	%what = alloca %struct.LameStruct*
	store %struct.LameStruct* %r0, %struct.LameStruct** %what
	store i64 0, i64* %total
	%r2 = load %struct.LameStruct** %what
	%r3 = getelementptr inbounds %struct.LameStruct* %r2, i1 0, i32 0
	%r4 = load i64* %r3
	%r5 = load %struct.LameStruct** %what
	%r6 = getelementptr inbounds %struct.LameStruct* %r5, i1 0, i32 1
	%r7 = load i64* %r6
	%r8 = add i64 %r4, %r7
	%r9 = load %struct.LameStruct** %what
	%r10 = getelementptr inbounds %struct.LameStruct* %r9, i1 0, i32 2
	%r11 = load i64* %r10
	%r12 = add i64 %r8, %r11
	%r13 = load %struct.LameStruct** %what
	%r14 = getelementptr inbounds %struct.LameStruct* %r13, i1 0, i32 3
	%r15 = load i64* %r14
	%r16 = add i64 %r12, %r15
	%r17 = load %struct.LameStruct** %what
	%r18 = getelementptr inbounds %struct.LameStruct* %r17, i1 0, i32 4
	%r19 = load i64* %r18
	%r20 = add i64 %r16, %r19
	%r21 = load %struct.LameStruct** %what
	%r22 = getelementptr inbounds %struct.LameStruct* %r21, i1 0, i32 5
	%r23 = load i64* %r22
	%r24 = add i64 %r20, %r23
	%r25 = load %struct.LameStruct** %what
	%r26 = getelementptr inbounds %struct.LameStruct* %r25, i1 0, i32 6
	%r27 = load i64* %r26
	%r28 = add i64 %r24, %r27
	%r29 = load %struct.LameStruct** %what
	%r30 = getelementptr inbounds %struct.LameStruct* %r29, i1 0, i32 7
	%r31 = load i64* %r30
	%r32 = add i64 %r28, %r31
	%r33 = load %struct.LameStruct** %what
	%r34 = getelementptr inbounds %struct.LameStruct* %r33, i1 0, i32 8
	%r35 = load i64* %r34
	%r36 = add i64 %r32, %r35
	store i64 %r36, i64* %total
	%r37 = load i64* %total
	store i64 %r37, i64* %.ret
	br label %LU1
LU1:
	%r1 = load i64* %.ret
	ret i64 %r1
}

define i64 @printRecursive (i64 %r38, i64 %r39) {
LU2:
	%.ret = alloca i64
	%num = alloca i64
	store i64 %r38, i64* %num
	%rec = alloca i64
	store i64 %r39, i64* %rec
	%r41 = load i64* %rec
	%r42 = icmp eq i64 %r41, 0
	br i1 %r42, label %LU5, label %LU6
LU5:
	%r43 = load i64* %num
	store i64 %r43, i64* %.ret
	br label %LU3
LU6:
	%r44 = load i64* %num
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r44)
	%r45 = load i64* %rec
	%r46 = sub i64 %r45, 1
	store i64 %r46, i64* %rec
	%r47 = load i64* %num
	%r48 = load i64* %rec
	%r49 = call i64 @printRecursive(i64 %r47, i64 %r48)
	store i64 %r49, i64* %.ret
	br label %LU3
LU3:
	%r40 = load i64* %.ret
	ret i64 %r40
}

define i64 @convertBinary (i64 %r50) {
LU7:
	%.ret = alloca i64
	%number = alloca i64
	store i64 %r50, i64* %number
	%r52 = load i64* %number
	%r53 = icmp eq i64 %r52, 0
	br i1 %r53, label %LU10, label %LU11
LU10:
	store i64 0, i64* %.ret
	br label %LU8
LU11:
	%r54 = load i64* %number
	%r55 = icmp eq i64 %r54, 1
	br i1 %r55, label %LU13, label %LU14
LU13:
	store i64 1, i64* %.ret
	br label %LU8
LU14:
	%r56 = load i64* %number
	%r57 = icmp eq i64 %r56, 2
	br i1 %r57, label %LU16, label %LU17
LU16:
	store i64 10, i64* %.ret
	br label %LU8
LU17:
	%r58 = load i64* %number
	%r59 = icmp eq i64 %r58, 3
	br i1 %r59, label %LU19, label %LU20
LU19:
	store i64 11, i64* %.ret
	br label %LU8
LU20:
	%r60 = load i64* %number
	%r61 = icmp eq i64 %r60, 4
	br i1 %r61, label %LU22, label %LU23
LU22:
	store i64 100, i64* %.ret
	br label %LU8
LU23:
	%r62 = load i64* %number
	%r63 = icmp eq i64 %r62, 5
	br i1 %r63, label %LU25, label %LU26
LU25:
	store i64 101, i64* %.ret
	br label %LU8
LU26:
	%r64 = load i64* %number
	%r65 = icmp eq i64 %r64, 6
	br i1 %r65, label %LU28, label %LU29
LU28:
	store i64 110, i64* %.ret
	br label %LU8
LU29:
	%r66 = load i64* %number
	%r67 = icmp eq i64 %r66, 7
	br i1 %r67, label %LU31, label %LU32
LU31:
	store i64 111, i64* %.ret
	br label %LU8
LU32:
	%r68 = load i64* %number
	%r69 = icmp eq i64 %r68, 8
	br i1 %r69, label %LU34, label %LU35
LU34:
	store i64 1000, i64* %.ret
	br label %LU8
LU35:
	store i64 1001, i64* %.ret
	br label %LU8
LU8:
	%r51 = load i64* %.ret
	ret i64 %r51
}

define i64 @main () {
LU36:
	%current = alloca i64
	%count = alloca i64
	%total = alloca i64
	%digits = alloca %struct.LameStruct*
	%.ret = alloca i64
	%r71 = call i8* @malloc(i64 72)
	%r72 = bitcast i8* %r71 to %struct.LameStruct*
	store %struct.LameStruct* %r72, %struct.LameStruct** %digits
	store i64 0, i64* %count
	%r73 = load %struct.LameStruct** %digits
	%r74 = getelementptr inbounds %struct.LameStruct* %r73, i1 0, i32 0
	store i64 0, i64* %r74
	%r75 = load %struct.LameStruct** %digits
	%r76 = getelementptr inbounds %struct.LameStruct* %r75, i1 0, i32 1
	store i64 0, i64* %r76
	%r77 = load %struct.LameStruct** %digits
	%r78 = getelementptr inbounds %struct.LameStruct* %r77, i1 0, i32 2
	store i64 0, i64* %r78
	%r79 = load %struct.LameStruct** %digits
	%r80 = getelementptr inbounds %struct.LameStruct* %r79, i1 0, i32 3
	store i64 0, i64* %r80
	%r81 = load %struct.LameStruct** %digits
	%r82 = getelementptr inbounds %struct.LameStruct* %r81, i1 0, i32 4
	store i64 0, i64* %r82
	%r83 = load %struct.LameStruct** %digits
	%r84 = getelementptr inbounds %struct.LameStruct* %r83, i1 0, i32 5
	store i64 0, i64* %r84
	%r85 = load %struct.LameStruct** %digits
	%r86 = getelementptr inbounds %struct.LameStruct* %r85, i1 0, i32 6
	store i64 0, i64* %r86
	%r87 = load %struct.LameStruct** %digits
	%r88 = getelementptr inbounds %struct.LameStruct* %r87, i1 0, i32 7
	store i64 0, i64* %r88
	%r89 = load %struct.LameStruct** %digits
	%r90 = getelementptr inbounds %struct.LameStruct* %r89, i1 0, i32 8
	store i64 0, i64* %r90
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r91 = load i64* @.read_scratch
	store i64 %r91, i64* %current
	br label %LU39
LU39:
	%r92 = load i64* %current
	%r93 = icmp ne i64 %r92, 0
	br i1 %r93, label %LU40, label %LU38
LU40:
	%r94 = load i64* %current
	%r95 = icmp eq i64 %r94, 1
	br i1 %r95, label %LU42, label %LU43
LU42:
	%r96 = load %struct.LameStruct** %digits
	%r97 = getelementptr inbounds %struct.LameStruct* %r96, i1 0, i32 0
	%r98 = load i64* %r97
	%r99 = add i64 %r98, 1
	%r100 = load %struct.LameStruct** %digits
	%r101 = getelementptr inbounds %struct.LameStruct* %r100, i1 0, i32 0
	store i64 %r99, i64* %r101
	br label %LU41
LU43:
	%r102 = load i64* %current
	%r103 = icmp eq i64 %r102, 2
	br i1 %r103, label %LU45, label %LU46
LU45:
	%r104 = load %struct.LameStruct** %digits
	%r105 = getelementptr inbounds %struct.LameStruct* %r104, i1 0, i32 1
	%r106 = load i64* %r105
	%r107 = add i64 %r106, 1
	%r108 = load %struct.LameStruct** %digits
	%r109 = getelementptr inbounds %struct.LameStruct* %r108, i1 0, i32 1
	store i64 %r107, i64* %r109
	br label %LU44
LU46:
	%r110 = load i64* %current
	%r111 = icmp eq i64 %r110, 3
	br i1 %r111, label %LU48, label %LU49
LU48:
	%r112 = load %struct.LameStruct** %digits
	%r113 = getelementptr inbounds %struct.LameStruct* %r112, i1 0, i32 2
	%r114 = load i64* %r113
	%r115 = add i64 %r114, 1
	%r116 = load %struct.LameStruct** %digits
	%r117 = getelementptr inbounds %struct.LameStruct* %r116, i1 0, i32 2
	store i64 %r115, i64* %r117
	br label %LU47
LU49:
	%r118 = load i64* %current
	%r119 = icmp eq i64 %r118, 4
	br i1 %r119, label %LU51, label %LU52
LU51:
	%r120 = load %struct.LameStruct** %digits
	%r121 = getelementptr inbounds %struct.LameStruct* %r120, i1 0, i32 3
	%r122 = load i64* %r121
	%r123 = add i64 %r122, 1
	%r124 = load %struct.LameStruct** %digits
	%r125 = getelementptr inbounds %struct.LameStruct* %r124, i1 0, i32 3
	store i64 %r123, i64* %r125
	br label %LU50
LU52:
	%r126 = load i64* %current
	%r127 = icmp eq i64 %r126, 5
	br i1 %r127, label %LU54, label %LU55
LU54:
	%r128 = load %struct.LameStruct** %digits
	%r129 = getelementptr inbounds %struct.LameStruct* %r128, i1 0, i32 4
	%r130 = load i64* %r129
	%r131 = add i64 %r130, 1
	%r132 = load %struct.LameStruct** %digits
	%r133 = getelementptr inbounds %struct.LameStruct* %r132, i1 0, i32 4
	store i64 %r131, i64* %r133
	br label %LU53
LU55:
	%r134 = load i64* %current
	%r135 = icmp eq i64 %r134, 6
	br i1 %r135, label %LU57, label %LU58
LU57:
	%r136 = load %struct.LameStruct** %digits
	%r137 = getelementptr inbounds %struct.LameStruct* %r136, i1 0, i32 5
	%r138 = load i64* %r137
	%r139 = add i64 %r138, 1
	%r140 = load %struct.LameStruct** %digits
	%r141 = getelementptr inbounds %struct.LameStruct* %r140, i1 0, i32 5
	store i64 %r139, i64* %r141
	br label %LU56
LU58:
	%r142 = load i64* %current
	%r143 = icmp eq i64 %r142, 7
	br i1 %r143, label %LU60, label %LU61
LU60:
	%r144 = load %struct.LameStruct** %digits
	%r145 = getelementptr inbounds %struct.LameStruct* %r144, i1 0, i32 6
	%r146 = load i64* %r145
	%r147 = add i64 %r146, 1
	%r148 = load %struct.LameStruct** %digits
	%r149 = getelementptr inbounds %struct.LameStruct* %r148, i1 0, i32 6
	store i64 %r147, i64* %r149
	br label %LU59
LU61:
	%r150 = load i64* %current
	%r151 = icmp eq i64 %r150, 8
	br i1 %r151, label %LU63, label %LU64
LU63:
	%r152 = load %struct.LameStruct** %digits
	%r153 = getelementptr inbounds %struct.LameStruct* %r152, i1 0, i32 7
	%r154 = load i64* %r153
	%r155 = add i64 %r154, 1
	%r156 = load %struct.LameStruct** %digits
	%r157 = getelementptr inbounds %struct.LameStruct* %r156, i1 0, i32 7
	store i64 %r155, i64* %r157
	br label %LU62
LU64:
	%r158 = load %struct.LameStruct** %digits
	%r159 = getelementptr inbounds %struct.LameStruct* %r158, i1 0, i32 8
	%r160 = load i64* %r159
	%r161 = add i64 %r160, 1
	%r162 = load %struct.LameStruct** %digits
	%r163 = getelementptr inbounds %struct.LameStruct* %r162, i1 0, i32 8
	store i64 %r161, i64* %r163
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
	%r164 = load i64* @.read_scratch
	store i64 %r164, i64* %current
	br label %LU39
LU38:
	%r165 = load %struct.LameStruct** %digits
	%r166 = call i64 @countTotal(%struct.LameStruct* %r165)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r166)
	%r167 = call i64 @convertBinary(i64 1)
	%r168 = load %struct.LameStruct** %digits
	%r169 = getelementptr inbounds %struct.LameStruct* %r168, i1 0, i32 0
	%r170 = load i64* %r169
	call i64 @printRecursive(i64 %r167, i64 %r170)
	%r171 = call i64 @convertBinary(i64 2)
	%r172 = load %struct.LameStruct** %digits
	%r173 = getelementptr inbounds %struct.LameStruct* %r172, i1 0, i32 1
	%r174 = load i64* %r173
	call i64 @printRecursive(i64 %r171, i64 %r174)
	%r175 = call i64 @convertBinary(i64 3)
	%r176 = load %struct.LameStruct** %digits
	%r177 = getelementptr inbounds %struct.LameStruct* %r176, i1 0, i32 2
	%r178 = load i64* %r177
	call i64 @printRecursive(i64 %r175, i64 %r178)
	%r179 = call i64 @convertBinary(i64 4)
	%r180 = load %struct.LameStruct** %digits
	%r181 = getelementptr inbounds %struct.LameStruct* %r180, i1 0, i32 3
	%r182 = load i64* %r181
	call i64 @printRecursive(i64 %r179, i64 %r182)
	%r183 = call i64 @convertBinary(i64 5)
	%r184 = load %struct.LameStruct** %digits
	%r185 = getelementptr inbounds %struct.LameStruct* %r184, i1 0, i32 4
	%r186 = load i64* %r185
	call i64 @printRecursive(i64 %r183, i64 %r186)
	%r187 = call i64 @convertBinary(i64 6)
	%r188 = load %struct.LameStruct** %digits
	%r189 = getelementptr inbounds %struct.LameStruct* %r188, i1 0, i32 5
	%r190 = load i64* %r189
	call i64 @printRecursive(i64 %r187, i64 %r190)
	%r191 = call i64 @convertBinary(i64 7)
	%r192 = load %struct.LameStruct** %digits
	%r193 = getelementptr inbounds %struct.LameStruct* %r192, i1 0, i32 6
	%r194 = load i64* %r193
	call i64 @printRecursive(i64 %r191, i64 %r194)
	%r195 = call i64 @convertBinary(i64 8)
	%r196 = load %struct.LameStruct** %digits
	%r197 = getelementptr inbounds %struct.LameStruct* %r196, i1 0, i32 7
	%r198 = load i64* %r197
	call i64 @printRecursive(i64 %r195, i64 %r198)
	%r199 = call i64 @convertBinary(i64 9)
	%r200 = load %struct.LameStruct** %digits
	%r201 = getelementptr inbounds %struct.LameStruct* %r200, i1 0, i32 8
	%r202 = load i64* %r201
	call i64 @printRecursive(i64 %r199, i64 %r202)
	store i64 0, i64* %.ret
	br label %LU37
LU37:
	%r70 = load i64* %.ret
	ret i64 %r70
}

