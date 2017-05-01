declare i8* @malloc(i64)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.printhex = private unnamed_addr constant [6 x i8] c"0x%X\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i64 0, align 8

%struct.simple = type {i64}
%struct.foo = type {i64, i64, %struct.simple*}

@globalfoo = common global %struct.foo* null, align 8

define void @tailrecursive (i64 %r0) {
LU0:
	%unused = alloca %struct.foo*
	%num = alloca i64
	store i64 %r0, i64* %num
	%r2 = load i64* %num
	%r3 = icmp sle i64 %r2, 0
	br i1 %r3, label %LU3, label %LU2
LU3:
	br label %LU1
LU2:
	%r4 = call i8* @malloc(i64 24)
	%r5 = bitcast i8* %r4 to %struct.foo*
	store %struct.foo* %r5, %struct.foo** %unused
	%r6 = load i64* %num
	%r7 = sub i64 %r6, 1
	call void @tailrecursive(i64 %r7)
	br label %LU1
LU1:
	ret void
}

define i64 @add (i64 %r8, i64 %r9) {
LU4:
	%.ret = alloca i64
	%x = alloca i64
	store i64 %r8, i64* %x
	%y = alloca i64
	store i64 %r9, i64* %y
	%r11 = load i64* %x
	%r12 = load i64* %y
	%r13 = add i64 %r11, %r12
	store i64 %r13, i64* %.ret
	br label %LU5
LU5:
	%r10 = load i64* %.ret
	ret i64 %r10
}

define void @domath (i64 %r14) {
LU6:
	%math1 = alloca %struct.foo*
	%math2 = alloca %struct.foo*
	%tmp = alloca i64
	%num = alloca i64
	store i64 %r14, i64* %num
	%r16 = call i8* @malloc(i64 24)
	%r17 = bitcast i8* %r16 to %struct.foo*
	store %struct.foo* %r17, %struct.foo** %math1
	%r18 = call i8* @malloc(i64 8)
	%r19 = bitcast i8* %r18 to %struct.simple*
	%r20 = load %struct.foo** %math1
	%r21 = getelementptr inbounds %struct.foo* %r20, i1 0, i32 2
	store %struct.simple* %r19, %struct.simple** %r21
	%r22 = call i8* @malloc(i64 24)
	%r23 = bitcast i8* %r22 to %struct.foo*
	store %struct.foo* %r23, %struct.foo** %math2
	%r24 = call i8* @malloc(i64 8)
	%r25 = bitcast i8* %r24 to %struct.simple*
	%r26 = load %struct.foo** %math2
	%r27 = getelementptr inbounds %struct.foo* %r26, i1 0, i32 2
	store %struct.simple* %r25, %struct.simple** %r27
	%r28 = load i64* %num
	%r29 = load %struct.foo** %math1
	%r30 = getelementptr inbounds %struct.foo* %r29, i1 0, i32 0
	store i64 %r28, i64* %r30
	%r31 = load %struct.foo** %math2
	%r32 = getelementptr inbounds %struct.foo* %r31, i1 0, i32 0
	store i64 3, i64* %r32
	%r33 = load %struct.foo** %math1
	%r34 = getelementptr inbounds %struct.foo* %r33, i1 0, i32 0
	%r35 = load i64* %r34
	%r36 = load %struct.foo** %math1
	%r37 = getelementptr inbounds %struct.foo* %r36, i1 0, i32 2
	%r38 = load %struct.simple** %r37
	%r39 = getelementptr inbounds %struct.simple* %r38, i1 0, i32 0
	store i64 %r35, i64* %r39
	%r40 = load %struct.foo** %math2
	%r41 = getelementptr inbounds %struct.foo* %r40, i1 0, i32 0
	%r42 = load i64* %r41
	%r43 = load %struct.foo** %math2
	%r44 = getelementptr inbounds %struct.foo* %r43, i1 0, i32 2
	%r45 = load %struct.simple** %r44
	%r46 = getelementptr inbounds %struct.simple* %r45, i1 0, i32 0
	store i64 %r42, i64* %r46
	br label %LU9
LU9:
	%r47 = load i64* %num
	%r48 = icmp sgt i64 %r47, 0
	br i1 %r48, label %LU10, label %LU8
LU10:
	%r49 = load %struct.foo** %math1
	%r50 = getelementptr inbounds %struct.foo* %r49, i1 0, i32 0
	%r51 = load i64* %r50
	%r52 = load %struct.foo** %math2
	%r53 = getelementptr inbounds %struct.foo* %r52, i1 0, i32 0
	%r54 = load i64* %r53
	%r55 = mul i64 %r51, %r54
	store i64 %r55, i64* %tmp
	%r56 = load i64* %tmp
	%r57 = load %struct.foo** %math1
	%r58 = getelementptr inbounds %struct.foo* %r57, i1 0, i32 2
	%r59 = load %struct.simple** %r58
	%r60 = getelementptr inbounds %struct.simple* %r59, i1 0, i32 0
	%r61 = load i64* %r60
	%r62 = mul i64 %r56, %r61
	%r63 = load %struct.foo** %math2
	%r64 = getelementptr inbounds %struct.foo* %r63, i1 0, i32 0
	%r65 = load i64* %r64
	%r66 = sdiv i64 %r62, %r65
	store i64 %r66, i64* %tmp
	%r67 = load %struct.foo** %math2
	%r68 = getelementptr inbounds %struct.foo* %r67, i1 0, i32 2
	%r69 = load %struct.simple** %r68
	%r70 = getelementptr inbounds %struct.simple* %r69, i1 0, i32 0
	%r71 = load i64* %r70
	%r72 = load %struct.foo** %math1
	%r73 = getelementptr inbounds %struct.foo* %r72, i1 0, i32 0
	%r74 = load i64* %r73
	%r75 = call i64 @add(i64 %r71, i64 %r74)
	store i64 %r75, i64* %tmp
	%r76 = load %struct.foo** %math2
	%r77 = getelementptr inbounds %struct.foo* %r76, i1 0, i32 0
	%r78 = load i64* %r77
	%r79 = load %struct.foo** %math1
	%r80 = getelementptr inbounds %struct.foo* %r79, i1 0, i32 0
	%r81 = load i64* %r80
	%r82 = sub i64 %r78, %r81
	store i64 %r82, i64* %tmp
	%r83 = load i64* %num
	%r84 = sub i64 %r83, 1
	store i64 %r84, i64* %num
	br label %LU9
LU8:
	%r85 = load %struct.foo** %math1
	%r86 = bitcast %struct.foo* %r85 to i8*
	call void @free(i8* %r86)
	%r87 = load %struct.foo** %math2
	%r88 = bitcast %struct.foo* %r87 to i8*
	call void @free(i8* %r88)
	br label %LU7
LU7:
	ret void
}

define void @objinstantiation (i64 %r89) {
LU11:
	%tmp = alloca %struct.foo*
	%num = alloca i64
	store i64 %r89, i64* %num
	br label %LU14
LU14:
	%r91 = load i64* %num
	%r92 = icmp sgt i64 %r91, 0
	br i1 %r92, label %LU15, label %LU13
LU15:
	%r93 = call i8* @malloc(i64 24)
	%r94 = bitcast i8* %r93 to %struct.foo*
	store %struct.foo* %r94, %struct.foo** %tmp
	%r95 = load %struct.foo** %tmp
	%r96 = bitcast %struct.foo* %r95 to i8*
	call void @free(i8* %r96)
	%r97 = load i64* %num
	%r98 = sub i64 %r97, 1
	store i64 %r98, i64* %num
	br label %LU14
LU13:
	br label %LU12
LU12:
	ret void
}

define i64 @ackermann (i64 %r99, i64 %r100) {
LU16:
	%.ret = alloca i64
	%m = alloca i64
	store i64 %r99, i64* %m
	%n = alloca i64
	store i64 %r100, i64* %n
	%r102 = load i64* %m
	%r103 = icmp eq i64 %r102, 0
	br i1 %r103, label %LU19, label %LU18
LU19:
	%r104 = load i64* %n
	%r105 = add i64 %r104, 1
	store i64 %r105, i64* %.ret
	br label %LU17
LU18:
	%r106 = load i64* %n
	%r107 = icmp eq i64 %r106, 0
	br i1 %r107, label %LU21, label %LU22
LU21:
	%r108 = load i64* %m
	%r109 = sub i64 %r108, 1
	%r110 = call i64 @ackermann(i64 %r109, i64 1)
	store i64 %r110, i64* %.ret
	br label %LU17
LU22:
	%r111 = load i64* %m
	%r112 = sub i64 %r111, 1
	%r113 = load i64* %m
	%r114 = load i64* %n
	%r115 = sub i64 %r114, 1
	%r116 = call i64 @ackermann(i64 %r113, i64 %r115)
	%r117 = call i64 @ackermann(i64 %r112, i64 %r116)
	store i64 %r117, i64* %.ret
	br label %LU17
LU17:
	%r101 = load i64* %.ret
	ret i64 %r101
}

define i64 @main () {
LU23:
	%a = alloca i64
	%b = alloca i64
	%c = alloca i64
	%d = alloca i64
	%e = alloca i64
	%.ret = alloca i64
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r119 = load i64* @.read_scratch
	store i64 %r119, i64* %a
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r120 = load i64* @.read_scratch
	store i64 %r120, i64* %b
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r121 = load i64* @.read_scratch
	store i64 %r121, i64* %c
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r122 = load i64* @.read_scratch
	store i64 %r122, i64* %d
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r123 = load i64* @.read_scratch
	store i64 %r123, i64* %e
	%r124 = load i64* %a
	call void @tailrecursive(i64 %r124)
	%r125 = load i64* %a
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r125)
	%r126 = load i64* %b
	call void @domath(i64 %r126)
	%r127 = load i64* %b
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r127)
	%r128 = load i64* %c
	call void @objinstantiation(i64 %r128)
	%r129 = load i64* %c
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r129)
	%r130 = load i64* %d
	%r131 = load i64* %e
	%r132 = call i64 @ackermann(i64 %r130, i64 %r131)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r132)
	store i64 0, i64* %.ret
	br label %LU24
LU24:
	%r118 = load i64* %.ret
	ret i64 %r118
}

