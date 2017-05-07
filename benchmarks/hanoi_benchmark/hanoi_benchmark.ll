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

%struct.plate = type {i64, %struct.plate*}

@peg1 = common global %struct.plate* null, align 8
@peg2 = common global %struct.plate* null, align 8
@peg3 = common global %struct.plate* null, align 8
@numMoves = common global i64 0, align 8

define void @move (i64 %r0, i64 %r1) {
LU0:
	%r2 = icmp eq i64 %r0, 1
	br i1 %r2, label %LU3, label %LU4
LU3:
	%r3 = load %struct.plate** @peg1
	%r4 = load %struct.plate** @peg1
	%r5 = getelementptr inbounds %struct.plate* %r4, i1 0, i32 1
	%r6 = load %struct.plate** %r5
	store %struct.plate* %r6, %struct.plate** @peg1
	br label %LU2
LU4:
	%r7 = icmp eq i64 %r0, 2
	br i1 %r7, label %LU6, label %LU7
LU6:
	%r8 = load %struct.plate** @peg2
	%r9 = load %struct.plate** @peg2
	%r10 = getelementptr inbounds %struct.plate* %r9, i1 0, i32 1
	%r11 = load %struct.plate** %r10
	store %struct.plate* %r11, %struct.plate** @peg2
	br label %LU5
LU7:
	%r12 = load %struct.plate** @peg3
	%r13 = load %struct.plate** @peg3
	%r14 = getelementptr inbounds %struct.plate* %r13, i1 0, i32 1
	%r15 = load %struct.plate** %r14
	store %struct.plate* %r15, %struct.plate** @peg3
	br label %LU5
LU5:
	br label %LU2
LU2:
	%r19 = phi %struct.plate* [ %r3, %LU3 ], [ null, %LU4 ]
	%r17 = icmp eq i64 %r1, 1
	br i1 %r17, label %LU9, label %LU10
LU9:
	%r18 = load %struct.plate** @peg1
	%r20 = getelementptr inbounds %struct.plate* %r19, i1 0, i32 1
	store %struct.plate* %r18, %struct.plate** %r20
	store %struct.plate* %r19, %struct.plate** @peg1
	br label %LU8
LU10:
	%r21 = icmp eq i64 %r1, 2
	br i1 %r21, label %LU12, label %LU13
LU12:
	%r22 = load %struct.plate** @peg2
	%r23 = getelementptr inbounds %struct.plate* %r19, i1 0, i32 1
	store %struct.plate* %r22, %struct.plate** %r23
	store %struct.plate* %r19, %struct.plate** @peg2
	br label %LU11
LU13:
	%r24 = load %struct.plate** @peg3
	%r25 = getelementptr inbounds %struct.plate* %r19, i1 0, i32 1
	store %struct.plate* %r24, %struct.plate** %r25
	store %struct.plate* %r19, %struct.plate** @peg3
	br label %LU11
LU11:
	br label %LU8
LU8:
	%r26 = load i64* @numMoves
	%r27 = add i64 %r26, 1
	store i64 %r27, i64* @numMoves
	br label %LU1
LU1:
	ret void
}

define void @hanoi (i64 %r29, i64 %r30, i64 %r31, i64 %r32) {
LU14:
	%r33 = icmp eq i64 %r29, 1
	br i1 %r33, label %LU17, label %LU18
LU17:
	call void @move(i64 %r30, i64 %r31)
	br label %LU16
LU18:
	%r34 = sub i64 %r29, 1
	call void @hanoi(i64 %r34, i64 %r30, i64 %r32, i64 %r31)
	call void @move(i64 %r30, i64 %r31)
	%r35 = sub i64 %r29, 1
	call void @hanoi(i64 %r35, i64 %r32, i64 %r31, i64 %r30)
	br label %LU16
LU16:
	br label %LU15
LU15:
	ret void
}

define void @printPeg (%struct.plate* %r37) {
LU19:
	br label %LU22
LU22:
	%r38 = icmp ne %struct.plate* %r37, null
	br i1 %r38, label %LU23, label %LU21
LU23:
	%r39 = phi %struct.plate* [ %r37, %LU22 ], [ %r43, %LU23 ]
	%r40 = getelementptr inbounds %struct.plate* %r39, i1 0, i32 0
	%r41 = load i64* %r40
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r41)
	%r42 = getelementptr inbounds %struct.plate* %r39, i1 0, i32 1
	%r43 = load %struct.plate** %r42
	%r44 = icmp ne %struct.plate* %r43, null
	br i1 %r44, label %LU23, label %LU21
LU21:
	br label %LU20
LU20:
	ret void
}

define i64 @main () {
LU24:
	store %struct.plate* null, %struct.plate** @peg1
	store %struct.plate* null, %struct.plate** @peg2
	store %struct.plate* null, %struct.plate** @peg3
	store i64 0, i64* @numMoves
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r46 = load i64* @.read_scratch
	%r47 = icmp sge i64 %r46, 1
	br i1 %r47, label %LU27, label %LU26
LU27:
	br label %LU29
LU29:
	%r48 = icmp ne i64 %r46, 0
	br i1 %r48, label %LU30, label %LU28
LU30:
	%r52 = phi i64 [ %r46, %LU29 ], [ %r56, %LU30 ]
	%r51 = phi %struct.plate* [ null, %LU29 ], [ %r50, %LU30 ]
	%r49 = call i8* @malloc(i64 16)
	%r50 = bitcast i8* %r49 to %struct.plate*
	%r53 = getelementptr inbounds %struct.plate* %r50, i1 0, i32 0
	store i64 %r52, i64* %r53
	%r54 = load %struct.plate** @peg1
	%r55 = getelementptr inbounds %struct.plate* %r50, i1 0, i32 1
	store %struct.plate* %r54, %struct.plate** %r55
	store %struct.plate* %r50, %struct.plate** @peg1
	%r56 = sub i64 %r52, 1
	%r57 = icmp ne i64 %r56, 0
	br i1 %r57, label %LU30, label %LU28
LU28:
	%r70 = phi %struct.plate* [ null, %LU29 ], [ %r50, %LU30 ]
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 1)
	%r58 = load %struct.plate** @peg1
	call void @printPeg(%struct.plate* %r58)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 2)
	%r59 = load %struct.plate** @peg2
	call void @printPeg(%struct.plate* %r59)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 3)
	%r60 = load %struct.plate** @peg3
	call void @printPeg(%struct.plate* %r60)
	call void @hanoi(i64 %r46, i64 1, i64 3, i64 2)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 1)
	%r63 = load %struct.plate** @peg1
	call void @printPeg(%struct.plate* %r63)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 2)
	%r64 = load %struct.plate** @peg2
	call void @printPeg(%struct.plate* %r64)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 3)
	%r65 = load %struct.plate** @peg3
	call void @printPeg(%struct.plate* %r65)
	%r66 = load i64* @numMoves
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r66)
	br label %LU32
LU32:
	%r67 = load %struct.plate** @peg3
	%r68 = icmp ne %struct.plate* %r67, null
	br i1 %r68, label %LU33, label %LU31
LU33:
	%r71 = phi %struct.plate* [ %r70, %LU32 ], [ %r69, %LU33 ]
	%r69 = load %struct.plate** @peg3
	%r72 = load %struct.plate** @peg3
	%r73 = getelementptr inbounds %struct.plate* %r72, i1 0, i32 1
	%r74 = load %struct.plate** %r73
	store %struct.plate* %r74, %struct.plate** @peg3
	%r75 = bitcast %struct.plate* %r69 to i8*
	call void @free(i8* %r75)
	%r76 = load %struct.plate** @peg3
	%r77 = icmp ne %struct.plate* %r76, null
	br i1 %r77, label %LU33, label %LU31
LU31:
	br label %LU26
LU26:
	br label %LU25
LU25:
	ret i64 0
}

