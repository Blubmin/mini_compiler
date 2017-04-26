declare i8* @malloc(i64)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i64 0, align 8

%struct.plate = type {i64, %struct.plate*}

@peg1 = common global %struct.plate* null, align 8
@peg2 = common global %struct.plate* null, align 8
@peg3 = common global %struct.plate* null, align 8
@numMoves = common global i64 0, align 8

define void @move (i64 %r0, i64 %r1) {
LU0:
	%plateToMove = alloca %struct.plate*
	%from = alloca i64
	store i64 %r0, i64* %from
	%to = alloca i64
	store i64 %r1, i64* %to
	%r3 = load i64* %from
	%r4 = icmp eq i64 %r3, 1
	br i1 %r4, label %LU3, label %LU4
LU3:
	%r5 = load %struct.plate** @peg1
	store %struct.plate* %r5, %struct.plate** %plateToMove
	%r6 = load %struct.plate** @peg1
	%r7 = getelementptr inbounds %struct.plate* %r6, i1 0, i32 1
	%r8 = load %struct.plate** %r7
	store %struct.plate* %r8, %struct.plate** @peg1
	br label %LU2
LU4:
	%r9 = load i64* %from
	%r10 = icmp eq i64 %r9, 2
	br i1 %r10, label %LU6, label %LU7
LU6:
	%r11 = load %struct.plate** @peg2
	store %struct.plate* %r11, %struct.plate** %plateToMove
	%r12 = load %struct.plate** @peg2
	%r13 = getelementptr inbounds %struct.plate* %r12, i1 0, i32 1
	%r14 = load %struct.plate** %r13
	store %struct.plate* %r14, %struct.plate** @peg2
	br label %LU5
LU7:
	%r15 = load %struct.plate** @peg3
	store %struct.plate* %r15, %struct.plate** %plateToMove
	%r16 = load %struct.plate** @peg3
	%r17 = getelementptr inbounds %struct.plate* %r16, i1 0, i32 1
	%r18 = load %struct.plate** %r17
	store %struct.plate* %r18, %struct.plate** @peg3
	br label %LU5
LU5:
	br label %LU2
LU2:
	%r19 = load i64* %to
	%r20 = icmp eq i64 %r19, 1
	br i1 %r20, label %LU9, label %LU10
LU9:
	%r21 = load %struct.plate** @peg1
	%r22 = load %struct.plate** %plateToMove
	%r23 = getelementptr inbounds %struct.plate* %r22, i1 0, i32 1
	store %struct.plate* %r21, %struct.plate** %r23
	%r24 = load %struct.plate** %plateToMove
	store %struct.plate* %r24, %struct.plate** @peg1
	br label %LU8
LU10:
	%r25 = load i64* %to
	%r26 = icmp eq i64 %r25, 2
	br i1 %r26, label %LU12, label %LU13
LU12:
	%r27 = load %struct.plate** @peg2
	%r28 = load %struct.plate** %plateToMove
	%r29 = getelementptr inbounds %struct.plate* %r28, i1 0, i32 1
	store %struct.plate* %r27, %struct.plate** %r29
	%r30 = load %struct.plate** %plateToMove
	store %struct.plate* %r30, %struct.plate** @peg2
	br label %LU11
LU13:
	%r31 = load %struct.plate** @peg3
	%r32 = load %struct.plate** %plateToMove
	%r33 = getelementptr inbounds %struct.plate* %r32, i1 0, i32 1
	store %struct.plate* %r31, %struct.plate** %r33
	%r34 = load %struct.plate** %plateToMove
	store %struct.plate* %r34, %struct.plate** @peg3
	br label %LU11
LU11:
	br label %LU8
LU8:
	%r35 = load i64* @numMoves
	%r36 = add i64 %r35, 1
	store i64 %r36, i64* @numMoves
	br label %LU1
LU1:
	ret void
}

define void @hanoi (i64 %r37, i64 %r38, i64 %r39, i64 %r40) {
LU14:
	%n = alloca i64
	store i64 %r37, i64* %n
	%from = alloca i64
	store i64 %r38, i64* %from
	%to = alloca i64
	store i64 %r39, i64* %to
	%other = alloca i64
	store i64 %r40, i64* %other
	%r42 = load i64* %n
	%r43 = icmp eq i64 %r42, 1
	br i1 %r43, label %LU17, label %LU18
LU17:
	%r44 = load i64* %from
	%r45 = load i64* %to
	call void @move(i64 %r44, i64 %r45)
	br label %LU16
LU18:
	%r46 = load i64* %n
	%r47 = sub i64 %r46, 1
	%r48 = load i64* %from
	%r49 = load i64* %other
	%r50 = load i64* %to
	call void @hanoi(i64 %r47, i64 %r48, i64 %r49, i64 %r50)
	%r51 = load i64* %from
	%r52 = load i64* %to
	call void @move(i64 %r51, i64 %r52)
	%r53 = load i64* %n
	%r54 = sub i64 %r53, 1
	%r55 = load i64* %other
	%r56 = load i64* %to
	%r57 = load i64* %from
	call void @hanoi(i64 %r54, i64 %r55, i64 %r56, i64 %r57)
	br label %LU16
LU16:
	br label %LU15
LU15:
	ret void
}

define void @printPeg (%struct.plate* %r58) {
LU19:
	%aPlate = alloca %struct.plate*
	%peg = alloca %struct.plate*
	store %struct.plate* %r58, %struct.plate** %peg
	%r60 = load %struct.plate** %peg
	store %struct.plate* %r60, %struct.plate** %aPlate
	br label %LU22
LU22:
	%r61 = load %struct.plate** %aPlate
	%r62 = icmp ne %struct.plate* %r61, null
	br i1 %r62, label %LU23, label %LU21
LU23:
	%r63 = load %struct.plate** %aPlate
	%r64 = getelementptr inbounds %struct.plate* %r63, i1 0, i32 0
	%r65 = load i64* %r64
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r65)
	%r66 = load %struct.plate** %aPlate
	%r67 = getelementptr inbounds %struct.plate* %r66, i1 0, i32 1
	%r68 = load %struct.plate** %r67
	store %struct.plate* %r68, %struct.plate** %aPlate
	br label %LU22
LU21:
	br label %LU20
LU20:
	ret void
}

define i64 @main () {
LU24:
	%count = alloca i64
	%numPlates = alloca i64
	%aPlate = alloca %struct.plate*
	%.ret = alloca i64
	store %struct.plate* null, %struct.plate** @peg1
	store %struct.plate* null, %struct.plate** @peg2
	store %struct.plate* null, %struct.plate** @peg3
	store i64 0, i64* @numMoves
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r70 = load i64* @.read_scratch
	store i64 %r70, i64* %numPlates
	%r71 = load i64* %numPlates
	%r72 = icmp sge i64 %r71, 1
	br i1 %r72, label %LU27, label %LU26
LU27:
	%r73 = load i64* %numPlates
	store i64 %r73, i64* %count
	br label %LU29
LU29:
	%r74 = load i64* %count
	%r75 = icmp ne i64 %r74, 0
	br i1 %r75, label %LU30, label %LU28
LU30:
	%r76 = call i8* @malloc(i64 16)
	%r77 = bitcast i8* %r76 to %struct.plate*
	store %struct.plate* %r77, %struct.plate** %aPlate
	%r78 = load i64* %count
	%r79 = load %struct.plate** %aPlate
	%r80 = getelementptr inbounds %struct.plate* %r79, i1 0, i32 0
	store i64 %r78, i64* %r80
	%r81 = load %struct.plate** @peg1
	%r82 = load %struct.plate** %aPlate
	%r83 = getelementptr inbounds %struct.plate* %r82, i1 0, i32 1
	store %struct.plate* %r81, %struct.plate** %r83
	%r84 = load %struct.plate** %aPlate
	store %struct.plate* %r84, %struct.plate** @peg1
	%r85 = load i64* %count
	%r86 = sub i64 %r85, 1
	store i64 %r86, i64* %count
	br label %LU29
LU28:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 1)
	%r87 = load %struct.plate** @peg1
	call void @printPeg(%struct.plate* %r87)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 2)
	%r88 = load %struct.plate** @peg2
	call void @printPeg(%struct.plate* %r88)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 3)
	%r89 = load %struct.plate** @peg3
	call void @printPeg(%struct.plate* %r89)
	%r90 = load i64* %numPlates
	call void @hanoi(i64 %r90, i64 1, i64 3, i64 2)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 1)
	%r91 = load %struct.plate** @peg1
	call void @printPeg(%struct.plate* %r91)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 2)
	%r92 = load %struct.plate** @peg2
	call void @printPeg(%struct.plate* %r92)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 3)
	%r93 = load %struct.plate** @peg3
	call void @printPeg(%struct.plate* %r93)
	%r94 = load i64* @numMoves
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r94)
	br label %LU32
LU32:
	%r95 = load %struct.plate** @peg3
	%r96 = icmp ne %struct.plate* %r95, null
	br i1 %r96, label %LU33, label %LU31
LU33:
	%r97 = load %struct.plate** @peg3
	store %struct.plate* %r97, %struct.plate** %aPlate
	%r98 = load %struct.plate** @peg3
	%r99 = getelementptr inbounds %struct.plate* %r98, i1 0, i32 1
	%r100 = load %struct.plate** %r99
	store %struct.plate* %r100, %struct.plate** @peg3
	%r101 = load %struct.plate** %aPlate
	%r102 = bitcast %struct.plate* %r101 to i8*
	call void @free(i8* %r102)
	br label %LU32
LU31:
	br label %LU26
LU26:
	store i64 0, i64* %.ret
	br label %LU25
LU25:
	%r69 = load i64* %.ret
	ret i64 %r69
}

