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

%struct.intList = type {i64, %struct.intList*}

@intList = common global i64 0, align 8

define i64 @length (%struct.intList* %r0) {
LU0:
	%.ret = alloca i64
	%list = alloca %struct.intList*
	store %struct.intList* %r0, %struct.intList** %list
	%r2 = load %struct.intList** %list
	%r3 = icmp eq %struct.intList* %r2, null
	br i1 %r3, label %LU3, label %LU2
LU3:
	store i64 0, i64* %.ret
	br label %LU1
LU2:
	%r4 = load %struct.intList** %list
	%r5 = getelementptr inbounds %struct.intList* %r4, i1 0, i32 1
	%r6 = load %struct.intList** %r5
	%r7 = call i64 @length(%struct.intList* %r6)
	%r8 = add i64 1, %r7
	store i64 %r8, i64* %.ret
	br label %LU1
LU1:
	%r1 = load i64* %.ret
	ret i64 %r1
}

define %struct.intList* @addToFront (%struct.intList* %r9, i64 %r10) {
LU4:
	%front = alloca %struct.intList*
	%.ret = alloca %struct.intList*
	%list = alloca %struct.intList*
	store %struct.intList* %r9, %struct.intList** %list
	%element = alloca i64
	store i64 %r10, i64* %element
	%r12 = load %struct.intList** %list
	%r13 = icmp eq %struct.intList* %r12, null
	br i1 %r13, label %LU7, label %LU6
LU7:
	%r14 = call i8* @malloc(i64 16)
	%r15 = bitcast i8* %r14 to %struct.intList*
	store %struct.intList* %r15, %struct.intList** %list
	%r16 = load i64* %element
	%r17 = load %struct.intList** %list
	%r18 = getelementptr inbounds %struct.intList* %r17, i1 0, i32 0
	store i64 %r16, i64* %r18
	%r19 = load %struct.intList** %list
	%r20 = getelementptr inbounds %struct.intList* %r19, i1 0, i32 1
	store %struct.intList* null, %struct.intList** %r20
	%r21 = load %struct.intList** %list
	store %struct.intList* %r21, %struct.intList** %.ret
	br label %LU5
LU6:
	%r22 = call i8* @malloc(i64 16)
	%r23 = bitcast i8* %r22 to %struct.intList*
	store %struct.intList* %r23, %struct.intList** %front
	%r24 = load i64* %element
	%r25 = load %struct.intList** %front
	%r26 = getelementptr inbounds %struct.intList* %r25, i1 0, i32 0
	store i64 %r24, i64* %r26
	%r27 = load %struct.intList** %list
	%r28 = load %struct.intList** %front
	%r29 = getelementptr inbounds %struct.intList* %r28, i1 0, i32 1
	store %struct.intList* %r27, %struct.intList** %r29
	%r30 = load %struct.intList** %front
	store %struct.intList* %r30, %struct.intList** %.ret
	br label %LU5
LU5:
	%r11 = load %struct.intList** %.ret
	ret %struct.intList* %r11
}

define %struct.intList* @deleteFirst (%struct.intList* %r31) {
LU8:
	%first = alloca %struct.intList*
	%.ret = alloca %struct.intList*
	%list = alloca %struct.intList*
	store %struct.intList* %r31, %struct.intList** %list
	%r33 = load %struct.intList** %list
	%r34 = icmp eq %struct.intList* %r33, null
	br i1 %r34, label %LU11, label %LU10
LU11:
	store %struct.intList* null, %struct.intList** %.ret
	br label %LU9
LU10:
	%r35 = load %struct.intList** %list
	store %struct.intList* %r35, %struct.intList** %first
	%r36 = load %struct.intList** %list
	%r37 = getelementptr inbounds %struct.intList* %r36, i1 0, i32 1
	%r38 = load %struct.intList** %r37
	store %struct.intList* %r38, %struct.intList** %list
	%r39 = load %struct.intList** %first
	%r40 = bitcast %struct.intList* %r39 to i8*
	call void @free(i8* %r40)
	%r41 = load %struct.intList** %list
	store %struct.intList* %r41, %struct.intList** %.ret
	br label %LU9
LU9:
	%r32 = load %struct.intList** %.ret
	ret %struct.intList* %r32
}

define i64 @main () {
LU12:
	%list = alloca %struct.intList*
	%sum = alloca i64
	%.ret = alloca i64
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r43 = load i64* @.read_scratch
	store i64 %r43, i64* @intList
	store i64 0, i64* %sum
	store %struct.intList* null, %struct.intList** %list
	br label %LU15
LU15:
	%r44 = load i64* @intList
	%r45 = icmp sgt i64 %r44, 0
	br i1 %r45, label %LU16, label %LU14
LU16:
	%r46 = load %struct.intList** %list
	%r47 = load i64* @intList
	%r48 = call %struct.intList* @addToFront(%struct.intList* %r46, i64 %r47)
	store %struct.intList* %r48, %struct.intList** %list
	%r49 = load %struct.intList** %list
	%r50 = getelementptr inbounds %struct.intList* %r49, i1 0, i32 0
	%r51 = load i64* %r50
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.print, i32 0, i32 0), i64 %r51)
	%r52 = load i64* @intList
	%r53 = sub i64 %r52, 1
	store i64 %r53, i64* @intList
	%r54 = load i64* @intList
	%r55 = icmp sgt i64 %r54, 0
	br i1 %r55, label %LU16, label %LU14
LU14:
	%r56 = load %struct.intList** %list
	%r57 = call i64 @length(%struct.intList* %r56)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.print, i32 0, i32 0), i64 %r57)
	br label %LU18
LU18:
	%r58 = load %struct.intList** %list
	%r59 = call i64 @length(%struct.intList* %r58)
	%r60 = icmp sgt i64 %r59, 0
	br i1 %r60, label %LU19, label %LU17
LU19:
	%r61 = load i64* %sum
	%r62 = load %struct.intList** %list
	%r63 = getelementptr inbounds %struct.intList* %r62, i1 0, i32 0
	%r64 = load i64* %r63
	%r65 = add i64 %r61, %r64
	store i64 %r65, i64* %sum
	%r66 = load %struct.intList** %list
	%r67 = call i64 @length(%struct.intList* %r66)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.print, i32 0, i32 0), i64 %r67)
	%r68 = load %struct.intList** %list
	%r69 = call %struct.intList* @deleteFirst(%struct.intList* %r68)
	store %struct.intList* %r69, %struct.intList** %list
	%r70 = load %struct.intList** %list
	%r71 = call i64 @length(%struct.intList* %r70)
	%r72 = icmp sgt i64 %r71, 0
	br i1 %r72, label %LU19, label %LU17
LU17:
	%r73 = load i64* %sum
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r73)
	store i64 0, i64* %.ret
	br label %LU13
LU13:
	%r42 = load i64* %.ret
	ret i64 %r42
}

