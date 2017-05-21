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
	%r1 = load %struct.intList** %list
	%r2 = icmp eq %struct.intList* %r1, null
	br i1 %r2, label %LU3, label %LU2
LU3:
	store i64 0, i64* %.ret
	br label %LU1
LU2:
	%r3 = load %struct.intList** %list
	%r4 = getelementptr inbounds %struct.intList* %r3, i1 0, i32 1
	%r5 = load %struct.intList** %r4
	%r6 = call i64 @length(%struct.intList* %r5)
	%r7 = add i64 1, %r6
	store i64 %r7, i64* %.ret
	br label %LU1
LU1:
	%r8 = load i64* %.ret
	ret i64 %r8
}

define %struct.intList* @addToFront (%struct.intList* %r9, i64 %r10) {
LU4:
	%front = alloca %struct.intList*
	%.ret = alloca %struct.intList*
	%list = alloca %struct.intList*
	store %struct.intList* %r9, %struct.intList** %list
	%element = alloca i64
	store i64 %r10, i64* %element
	%r11 = load %struct.intList** %list
	%r12 = icmp eq %struct.intList* %r11, null
	br i1 %r12, label %LU7, label %LU6
LU7:
	%r13 = call i8* @malloc(i64 16)
	%r14 = bitcast i8* %r13 to %struct.intList*
	store %struct.intList* %r14, %struct.intList** %list
	%r15 = load i64* %element
	%r16 = load %struct.intList** %list
	%r17 = getelementptr inbounds %struct.intList* %r16, i1 0, i32 0
	store i64 %r15, i64* %r17
	%r18 = load %struct.intList** %list
	%r19 = getelementptr inbounds %struct.intList* %r18, i1 0, i32 1
	store %struct.intList* null, %struct.intList** %r19
	%r20 = load %struct.intList** %list
	store %struct.intList* %r20, %struct.intList** %.ret
	br label %LU5
LU6:
	%r21 = call i8* @malloc(i64 16)
	%r22 = bitcast i8* %r21 to %struct.intList*
	store %struct.intList* %r22, %struct.intList** %front
	%r23 = load i64* %element
	%r24 = load %struct.intList** %front
	%r25 = getelementptr inbounds %struct.intList* %r24, i1 0, i32 0
	store i64 %r23, i64* %r25
	%r26 = load %struct.intList** %list
	%r27 = load %struct.intList** %front
	%r28 = getelementptr inbounds %struct.intList* %r27, i1 0, i32 1
	store %struct.intList* %r26, %struct.intList** %r28
	%r29 = load %struct.intList** %front
	store %struct.intList* %r29, %struct.intList** %.ret
	br label %LU5
LU5:
	%r30 = load %struct.intList** %.ret
	ret %struct.intList* %r30
}

define %struct.intList* @deleteFirst (%struct.intList* %r31) {
LU8:
	%first = alloca %struct.intList*
	%.ret = alloca %struct.intList*
	%list = alloca %struct.intList*
	store %struct.intList* %r31, %struct.intList** %list
	%r32 = load %struct.intList** %list
	%r33 = icmp eq %struct.intList* %r32, null
	br i1 %r33, label %LU11, label %LU10
LU11:
	store %struct.intList* null, %struct.intList** %.ret
	br label %LU9
LU10:
	%r34 = load %struct.intList** %list
	store %struct.intList* %r34, %struct.intList** %first
	%r35 = load %struct.intList** %list
	%r36 = getelementptr inbounds %struct.intList* %r35, i1 0, i32 1
	%r37 = load %struct.intList** %r36
	store %struct.intList* %r37, %struct.intList** %list
	%r38 = load %struct.intList** %first
	%r39 = bitcast %struct.intList* %r38 to i8*
	call void @free(i8* %r39)
	%r40 = load %struct.intList** %list
	store %struct.intList* %r40, %struct.intList** %.ret
	br label %LU9
LU9:
	%r41 = load %struct.intList** %.ret
	ret %struct.intList* %r41
}

define i64 @main () {
LU12:
	%list = alloca %struct.intList*
	%sum = alloca i64
	%.ret = alloca i64
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r42 = load i64* @.read_scratch
	store i64 %r42, i64* @intList
	store i64 0, i64* %sum
	store %struct.intList* null, %struct.intList** %list
	br label %LU15
LU15:
	%r43 = load i64* @intList
	%r44 = icmp sgt i64 %r43, 0
	br i1 %r44, label %LU16, label %LU14
LU16:
	%r45 = load %struct.intList** %list
	%r46 = load i64* @intList
	%r47 = call %struct.intList* @addToFront(%struct.intList* %r45, i64 %r46)
	store %struct.intList* %r47, %struct.intList** %list
	%r48 = load %struct.intList** %list
	%r49 = getelementptr inbounds %struct.intList* %r48, i1 0, i32 0
	%r50 = load i64* %r49
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.print, i32 0, i32 0), i64 %r50)
	%r51 = load i64* @intList
	%r52 = sub i64 %r51, 1
	store i64 %r52, i64* @intList
	%r53 = load i64* @intList
	%r54 = icmp sgt i64 %r53, 0
	br i1 %r54, label %LU16, label %LU14
LU14:
	%r55 = load %struct.intList** %list
	%r56 = call i64 @length(%struct.intList* %r55)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.print, i32 0, i32 0), i64 %r56)
	br label %LU18
LU18:
	%r57 = load %struct.intList** %list
	%r58 = call i64 @length(%struct.intList* %r57)
	%r59 = icmp sgt i64 %r58, 0
	br i1 %r59, label %LU19, label %LU17
LU19:
	%r60 = load i64* %sum
	%r61 = load %struct.intList** %list
	%r62 = getelementptr inbounds %struct.intList* %r61, i1 0, i32 0
	%r63 = load i64* %r62
	%r64 = add i64 %r60, %r63
	store i64 %r64, i64* %sum
	%r65 = load %struct.intList** %list
	%r66 = call i64 @length(%struct.intList* %r65)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.print, i32 0, i32 0), i64 %r66)
	%r67 = load %struct.intList** %list
	%r68 = call %struct.intList* @deleteFirst(%struct.intList* %r67)
	store %struct.intList* %r68, %struct.intList** %list
	%r69 = load %struct.intList** %list
	%r70 = call i64 @length(%struct.intList* %r69)
	%r71 = icmp sgt i64 %r70, 0
	br i1 %r71, label %LU19, label %LU17
LU17:
	%r72 = load i64* %sum
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r72)
	store i64 0, i64* %.ret
	br label %LU13
LU13:
	%r73 = load i64* %.ret
	ret i64 %r73
}

