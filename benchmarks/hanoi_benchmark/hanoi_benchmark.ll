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
	%r20 = phi %struct.plate* [ %r8, %LU6 ], [ %r12, %LU7 ]
	br label %LU2
LU2:
	%r21 = phi %struct.plate* [ %r3, %LU3 ], [ %r20, %LU5 ]
	%r18 = icmp eq i64 %r1, 1
	br i1 %r18, label %LU9, label %LU10
LU9:
	%r19 = load %struct.plate** @peg1
	%r22 = getelementptr inbounds %struct.plate* %r21, i1 0, i32 1
	store %struct.plate* %r19, %struct.plate** %r22
	store %struct.plate* %r21, %struct.plate** @peg1
	br label %LU8
LU10:
	%r23 = icmp eq i64 %r1, 2
	br i1 %r23, label %LU12, label %LU13
LU12:
	%r24 = load %struct.plate** @peg2
	%r25 = getelementptr inbounds %struct.plate* %r21, i1 0, i32 1
	store %struct.plate* %r24, %struct.plate** %r25
	store %struct.plate* %r21, %struct.plate** @peg2
	br label %LU11
LU13:
	%r26 = load %struct.plate** @peg3
	%r27 = getelementptr inbounds %struct.plate* %r21, i1 0, i32 1
	store %struct.plate* %r26, %struct.plate** %r27
	store %struct.plate* %r21, %struct.plate** @peg3
	br label %LU11
LU11:
	br label %LU8
LU8:
	%r28 = load i64* @numMoves
	%r29 = add i64 %r28, 1
	store i64 %r29, i64* @numMoves
	br label %LU1
LU1:
	ret void
}

define void @hanoi (i64 %r31, i64 %r32, i64 %r33, i64 %r34) {
LU14:
	%r35 = icmp eq i64 %r31, 1
	br i1 %r35, label %LU17, label %LU18
LU17:
	call void @move(i64 %r32, i64 %r33)
	br label %LU16
LU18:
	%r36 = sub i64 %r31, 1
	call void @hanoi(i64 %r36, i64 %r32, i64 %r34, i64 %r33)
	call void @move(i64 %r32, i64 %r33)
	%r37 = sub i64 %r31, 1
	call void @hanoi(i64 %r37, i64 %r34, i64 %r33, i64 %r32)
	br label %LU16
LU16:
	br label %LU15
LU15:
	ret void
}

define void @printPeg (%struct.plate* %r39) {
LU19:
	br label %LU22
LU22:
	%r40 = icmp ne %struct.plate* %r39, null
	br i1 %r40, label %LU23, label %LU21
LU23:
	%r41 = phi %struct.plate* [ %r39, %LU22 ], [ %r45, %LU23 ]
	%r42 = getelementptr inbounds %struct.plate* %r41, i1 0, i32 0
	%r43 = load i64* %r42
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r43)
	%r44 = getelementptr inbounds %struct.plate* %r41, i1 0, i32 1
	%r45 = load %struct.plate** %r44
	%r46 = icmp ne %struct.plate* %r45, null
	br i1 %r46, label %LU23, label %LU21
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
	%r48 = load i64* @.read_scratch
	%r49 = icmp sge i64 %r48, 1
	br i1 %r49, label %LU27, label %LU26
LU27:
	br label %LU29
LU29:
	%r50 = icmp ne i64 %r48, 0
	br i1 %r50, label %LU30, label %LU28
LU30:
	%r54 = phi i64 [ %r48, %LU29 ], [ %r58, %LU30 ]
	%r51 = call i8* @malloc(i64 16)
	%r52 = bitcast i8* %r51 to %struct.plate*
	%r55 = getelementptr inbounds %struct.plate* %r52, i1 0, i32 0
	store i64 %r54, i64* %r55
	%r56 = load %struct.plate** @peg1
	%r57 = getelementptr inbounds %struct.plate* %r52, i1 0, i32 1
	store %struct.plate* %r56, %struct.plate** %r57
	store %struct.plate* %r52, %struct.plate** @peg1
	%r58 = sub i64 %r54, 1
	%r59 = icmp ne i64 %r58, 0
	br i1 %r59, label %LU30, label %LU28
LU28:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 1)
	%r60 = load %struct.plate** @peg1
	call void @printPeg(%struct.plate* %r60)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 2)
	%r61 = load %struct.plate** @peg2
	call void @printPeg(%struct.plate* %r61)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 3)
	%r62 = load %struct.plate** @peg3
	call void @printPeg(%struct.plate* %r62)
	call void @hanoi(i64 %r48, i64 1, i64 3, i64 2)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 1)
	%r65 = load %struct.plate** @peg1
	call void @printPeg(%struct.plate* %r65)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 2)
	%r66 = load %struct.plate** @peg2
	call void @printPeg(%struct.plate* %r66)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 3)
	%r67 = load %struct.plate** @peg3
	call void @printPeg(%struct.plate* %r67)
	%r68 = load i64* @numMoves
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r68)
	br label %LU32
LU32:
	%r69 = load %struct.plate** @peg3
	%r70 = icmp ne %struct.plate* %r69, null
	br i1 %r70, label %LU33, label %LU31
LU33:
	%r74 = load %struct.plate** @peg3
	%r75 = getelementptr inbounds %struct.plate* %r74, i1 0, i32 1
	%r76 = load %struct.plate** %r75
	store %struct.plate* %r76, %struct.plate** @peg3
	%r78 = load %struct.plate** @peg3
	%r79 = icmp ne %struct.plate* %r78, null
	br i1 %r79, label %LU33, label %LU31
LU31:
	br label %LU26
LU26:
	br label %LU25
LU25:
	ret i64 0
}

