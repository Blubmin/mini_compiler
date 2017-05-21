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
	%total = alloca i64
	%.ret = alloca i64
	%what = alloca %struct.LameStruct*
	store %struct.LameStruct* %r0, %struct.LameStruct** %what
	store i64 0, i64* %total
	%r1 = load %struct.LameStruct** %what
	%r2 = getelementptr inbounds %struct.LameStruct* %r1, i1 0, i32 0
	%r3 = load i64* %r2
	%r4 = load %struct.LameStruct** %what
	%r5 = getelementptr inbounds %struct.LameStruct* %r4, i1 0, i32 1
	%r6 = load i64* %r5
	%r7 = add i64 %r3, %r6
	%r8 = load %struct.LameStruct** %what
	%r9 = getelementptr inbounds %struct.LameStruct* %r8, i1 0, i32 2
	%r10 = load i64* %r9
	%r11 = add i64 %r7, %r10
	%r12 = load %struct.LameStruct** %what
	%r13 = getelementptr inbounds %struct.LameStruct* %r12, i1 0, i32 3
	%r14 = load i64* %r13
	%r15 = add i64 %r11, %r14
	%r16 = load %struct.LameStruct** %what
	%r17 = getelementptr inbounds %struct.LameStruct* %r16, i1 0, i32 4
	%r18 = load i64* %r17
	%r19 = add i64 %r15, %r18
	%r20 = load %struct.LameStruct** %what
	%r21 = getelementptr inbounds %struct.LameStruct* %r20, i1 0, i32 5
	%r22 = load i64* %r21
	%r23 = add i64 %r19, %r22
	%r24 = load %struct.LameStruct** %what
	%r25 = getelementptr inbounds %struct.LameStruct* %r24, i1 0, i32 6
	%r26 = load i64* %r25
	%r27 = add i64 %r23, %r26
	%r28 = load %struct.LameStruct** %what
	%r29 = getelementptr inbounds %struct.LameStruct* %r28, i1 0, i32 7
	%r30 = load i64* %r29
	%r31 = add i64 %r27, %r30
	%r32 = load %struct.LameStruct** %what
	%r33 = getelementptr inbounds %struct.LameStruct* %r32, i1 0, i32 8
	%r34 = load i64* %r33
	%r35 = add i64 %r31, %r34
	store i64 %r35, i64* %total
	%r36 = load i64* %total
	store i64 %r36, i64* %.ret
	br label %LU1
LU1:
	%r37 = load i64* %.ret
	ret i64 %r37
}

define i64 @printRecursive (i64 %r38, i64 %r39) {
LU2:
	%.ret = alloca i64
	%num = alloca i64
	store i64 %r38, i64* %num
	%rec = alloca i64
	store i64 %r39, i64* %rec
	%r40 = load i64* %rec
	%r41 = icmp eq i64 %r40, 0
	br i1 %r41, label %LU5, label %LU6
LU5:
	%r42 = load i64* %num
	store i64 %r42, i64* %.ret
	br label %LU3
LU6:
	%r43 = load i64* %num
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r43)
	%r44 = load i64* %rec
	%r45 = sub i64 %r44, 1
	store i64 %r45, i64* %rec
	%r46 = load i64* %num
	%r47 = load i64* %rec
	%r48 = call i64 @printRecursive(i64 %r46, i64 %r47)
	store i64 %r48, i64* %.ret
	br label %LU3
LU3:
	%r49 = load i64* %.ret
	ret i64 %r49
}

define i64 @convertBinary (i64 %r50) {
LU7:
	%.ret = alloca i64
	%number = alloca i64
	store i64 %r50, i64* %number
	%r51 = load i64* %number
	%r52 = icmp eq i64 %r51, 0
	br i1 %r52, label %LU10, label %LU11
LU10:
	store i64 0, i64* %.ret
	br label %LU8
LU11:
	%r53 = load i64* %number
	%r54 = icmp eq i64 %r53, 1
	br i1 %r54, label %LU13, label %LU14
LU13:
	store i64 1, i64* %.ret
	br label %LU8
LU14:
	%r55 = load i64* %number
	%r56 = icmp eq i64 %r55, 2
	br i1 %r56, label %LU16, label %LU17
LU16:
	store i64 10, i64* %.ret
	br label %LU8
LU17:
	%r57 = load i64* %number
	%r58 = icmp eq i64 %r57, 3
	br i1 %r58, label %LU19, label %LU20
LU19:
	store i64 11, i64* %.ret
	br label %LU8
LU20:
	%r59 = load i64* %number
	%r60 = icmp eq i64 %r59, 4
	br i1 %r60, label %LU22, label %LU23
LU22:
	store i64 100, i64* %.ret
	br label %LU8
LU23:
	%r61 = load i64* %number
	%r62 = icmp eq i64 %r61, 5
	br i1 %r62, label %LU25, label %LU26
LU25:
	store i64 101, i64* %.ret
	br label %LU8
LU26:
	%r63 = load i64* %number
	%r64 = icmp eq i64 %r63, 6
	br i1 %r64, label %LU28, label %LU29
LU28:
	store i64 110, i64* %.ret
	br label %LU8
LU29:
	%r65 = load i64* %number
	%r66 = icmp eq i64 %r65, 7
	br i1 %r66, label %LU31, label %LU32
LU31:
	store i64 111, i64* %.ret
	br label %LU8
LU32:
	%r67 = load i64* %number
	%r68 = icmp eq i64 %r67, 8
	br i1 %r68, label %LU34, label %LU35
LU34:
	store i64 1000, i64* %.ret
	br label %LU8
LU35:
	store i64 1001, i64* %.ret
	br label %LU8
LU8:
	%r69 = load i64* %.ret
	ret i64 %r69
}

define i64 @main () {
LU36:
	%current = alloca i64
	%count = alloca i64
	%total = alloca i64
	%digits = alloca %struct.LameStruct*
	%.ret = alloca i64
	%r70 = call i8* @malloc(i64 72)
	%r71 = bitcast i8* %r70 to %struct.LameStruct*
	store %struct.LameStruct* %r71, %struct.LameStruct** %digits
	store i64 0, i64* %count
	%r72 = load %struct.LameStruct** %digits
	%r73 = getelementptr inbounds %struct.LameStruct* %r72, i1 0, i32 0
	store i64 0, i64* %r73
	%r74 = load %struct.LameStruct** %digits
	%r75 = getelementptr inbounds %struct.LameStruct* %r74, i1 0, i32 1
	store i64 0, i64* %r75
	%r76 = load %struct.LameStruct** %digits
	%r77 = getelementptr inbounds %struct.LameStruct* %r76, i1 0, i32 2
	store i64 0, i64* %r77
	%r78 = load %struct.LameStruct** %digits
	%r79 = getelementptr inbounds %struct.LameStruct* %r78, i1 0, i32 3
	store i64 0, i64* %r79
	%r80 = load %struct.LameStruct** %digits
	%r81 = getelementptr inbounds %struct.LameStruct* %r80, i1 0, i32 4
	store i64 0, i64* %r81
	%r82 = load %struct.LameStruct** %digits
	%r83 = getelementptr inbounds %struct.LameStruct* %r82, i1 0, i32 5
	store i64 0, i64* %r83
	%r84 = load %struct.LameStruct** %digits
	%r85 = getelementptr inbounds %struct.LameStruct* %r84, i1 0, i32 6
	store i64 0, i64* %r85
	%r86 = load %struct.LameStruct** %digits
	%r87 = getelementptr inbounds %struct.LameStruct* %r86, i1 0, i32 7
	store i64 0, i64* %r87
	%r88 = load %struct.LameStruct** %digits
	%r89 = getelementptr inbounds %struct.LameStruct* %r88, i1 0, i32 8
	store i64 0, i64* %r89
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r90 = load i64* @.read_scratch
	store i64 %r90, i64* %current
	br label %LU39
LU39:
	%r91 = load i64* %current
	%r92 = icmp ne i64 %r91, 0
	br i1 %r92, label %LU40, label %LU38
LU40:
	%r93 = load i64* %current
	%r94 = icmp eq i64 %r93, 1
	br i1 %r94, label %LU42, label %LU43
LU42:
	%r95 = load %struct.LameStruct** %digits
	%r96 = getelementptr inbounds %struct.LameStruct* %r95, i1 0, i32 0
	%r97 = load i64* %r96
	%r98 = add i64 %r97, 1
	%r99 = load %struct.LameStruct** %digits
	%r100 = getelementptr inbounds %struct.LameStruct* %r99, i1 0, i32 0
	store i64 %r98, i64* %r100
	br label %LU41
LU43:
	%r101 = load i64* %current
	%r102 = icmp eq i64 %r101, 2
	br i1 %r102, label %LU45, label %LU46
LU45:
	%r103 = load %struct.LameStruct** %digits
	%r104 = getelementptr inbounds %struct.LameStruct* %r103, i1 0, i32 1
	%r105 = load i64* %r104
	%r106 = add i64 %r105, 1
	%r107 = load %struct.LameStruct** %digits
	%r108 = getelementptr inbounds %struct.LameStruct* %r107, i1 0, i32 1
	store i64 %r106, i64* %r108
	br label %LU44
LU46:
	%r109 = load i64* %current
	%r110 = icmp eq i64 %r109, 3
	br i1 %r110, label %LU48, label %LU49
LU48:
	%r111 = load %struct.LameStruct** %digits
	%r112 = getelementptr inbounds %struct.LameStruct* %r111, i1 0, i32 2
	%r113 = load i64* %r112
	%r114 = add i64 %r113, 1
	%r115 = load %struct.LameStruct** %digits
	%r116 = getelementptr inbounds %struct.LameStruct* %r115, i1 0, i32 2
	store i64 %r114, i64* %r116
	br label %LU47
LU49:
	%r117 = load i64* %current
	%r118 = icmp eq i64 %r117, 4
	br i1 %r118, label %LU51, label %LU52
LU51:
	%r119 = load %struct.LameStruct** %digits
	%r120 = getelementptr inbounds %struct.LameStruct* %r119, i1 0, i32 3
	%r121 = load i64* %r120
	%r122 = add i64 %r121, 1
	%r123 = load %struct.LameStruct** %digits
	%r124 = getelementptr inbounds %struct.LameStruct* %r123, i1 0, i32 3
	store i64 %r122, i64* %r124
	br label %LU50
LU52:
	%r125 = load i64* %current
	%r126 = icmp eq i64 %r125, 5
	br i1 %r126, label %LU54, label %LU55
LU54:
	%r127 = load %struct.LameStruct** %digits
	%r128 = getelementptr inbounds %struct.LameStruct* %r127, i1 0, i32 4
	%r129 = load i64* %r128
	%r130 = add i64 %r129, 1
	%r131 = load %struct.LameStruct** %digits
	%r132 = getelementptr inbounds %struct.LameStruct* %r131, i1 0, i32 4
	store i64 %r130, i64* %r132
	br label %LU53
LU55:
	%r133 = load i64* %current
	%r134 = icmp eq i64 %r133, 6
	br i1 %r134, label %LU57, label %LU58
LU57:
	%r135 = load %struct.LameStruct** %digits
	%r136 = getelementptr inbounds %struct.LameStruct* %r135, i1 0, i32 5
	%r137 = load i64* %r136
	%r138 = add i64 %r137, 1
	%r139 = load %struct.LameStruct** %digits
	%r140 = getelementptr inbounds %struct.LameStruct* %r139, i1 0, i32 5
	store i64 %r138, i64* %r140
	br label %LU56
LU58:
	%r141 = load i64* %current
	%r142 = icmp eq i64 %r141, 7
	br i1 %r142, label %LU60, label %LU61
LU60:
	%r143 = load %struct.LameStruct** %digits
	%r144 = getelementptr inbounds %struct.LameStruct* %r143, i1 0, i32 6
	%r145 = load i64* %r144
	%r146 = add i64 %r145, 1
	%r147 = load %struct.LameStruct** %digits
	%r148 = getelementptr inbounds %struct.LameStruct* %r147, i1 0, i32 6
	store i64 %r146, i64* %r148
	br label %LU59
LU61:
	%r149 = load i64* %current
	%r150 = icmp eq i64 %r149, 8
	br i1 %r150, label %LU63, label %LU64
LU63:
	%r151 = load %struct.LameStruct** %digits
	%r152 = getelementptr inbounds %struct.LameStruct* %r151, i1 0, i32 7
	%r153 = load i64* %r152
	%r154 = add i64 %r153, 1
	%r155 = load %struct.LameStruct** %digits
	%r156 = getelementptr inbounds %struct.LameStruct* %r155, i1 0, i32 7
	store i64 %r154, i64* %r156
	br label %LU62
LU64:
	%r157 = load %struct.LameStruct** %digits
	%r158 = getelementptr inbounds %struct.LameStruct* %r157, i1 0, i32 8
	%r159 = load i64* %r158
	%r160 = add i64 %r159, 1
	%r161 = load %struct.LameStruct** %digits
	%r162 = getelementptr inbounds %struct.LameStruct* %r161, i1 0, i32 8
	store i64 %r160, i64* %r162
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
	%r163 = load i64* @.read_scratch
	store i64 %r163, i64* %current
	%r164 = load i64* %current
	%r165 = icmp ne i64 %r164, 0
	br i1 %r165, label %LU40, label %LU38
LU38:
	%r166 = load %struct.LameStruct** %digits
	%r167 = call i64 @countTotal(%struct.LameStruct* %r166)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r167)
	%r168 = call i64 @convertBinary(i64 1)
	%r169 = load %struct.LameStruct** %digits
	%r170 = getelementptr inbounds %struct.LameStruct* %r169, i1 0, i32 0
	%r171 = load i64* %r170
	call i64 @printRecursive(i64 %r168, i64 %r171)
	%r172 = call i64 @convertBinary(i64 2)
	%r173 = load %struct.LameStruct** %digits
	%r174 = getelementptr inbounds %struct.LameStruct* %r173, i1 0, i32 1
	%r175 = load i64* %r174
	call i64 @printRecursive(i64 %r172, i64 %r175)
	%r176 = call i64 @convertBinary(i64 3)
	%r177 = load %struct.LameStruct** %digits
	%r178 = getelementptr inbounds %struct.LameStruct* %r177, i1 0, i32 2
	%r179 = load i64* %r178
	call i64 @printRecursive(i64 %r176, i64 %r179)
	%r180 = call i64 @convertBinary(i64 4)
	%r181 = load %struct.LameStruct** %digits
	%r182 = getelementptr inbounds %struct.LameStruct* %r181, i1 0, i32 3
	%r183 = load i64* %r182
	call i64 @printRecursive(i64 %r180, i64 %r183)
	%r184 = call i64 @convertBinary(i64 5)
	%r185 = load %struct.LameStruct** %digits
	%r186 = getelementptr inbounds %struct.LameStruct* %r185, i1 0, i32 4
	%r187 = load i64* %r186
	call i64 @printRecursive(i64 %r184, i64 %r187)
	%r188 = call i64 @convertBinary(i64 6)
	%r189 = load %struct.LameStruct** %digits
	%r190 = getelementptr inbounds %struct.LameStruct* %r189, i1 0, i32 5
	%r191 = load i64* %r190
	call i64 @printRecursive(i64 %r188, i64 %r191)
	%r192 = call i64 @convertBinary(i64 7)
	%r193 = load %struct.LameStruct** %digits
	%r194 = getelementptr inbounds %struct.LameStruct* %r193, i1 0, i32 6
	%r195 = load i64* %r194
	call i64 @printRecursive(i64 %r192, i64 %r195)
	%r196 = call i64 @convertBinary(i64 8)
	%r197 = load %struct.LameStruct** %digits
	%r198 = getelementptr inbounds %struct.LameStruct* %r197, i1 0, i32 7
	%r199 = load i64* %r198
	call i64 @printRecursive(i64 %r196, i64 %r199)
	%r200 = call i64 @convertBinary(i64 9)
	%r201 = load %struct.LameStruct** %digits
	%r202 = getelementptr inbounds %struct.LameStruct* %r201, i1 0, i32 8
	%r203 = load i64* %r202
	call i64 @printRecursive(i64 %r200, i64 %r203)
	store i64 0, i64* %.ret
	br label %LU37
LU37:
	%r204 = load i64* %.ret
	ret i64 %r204
}

