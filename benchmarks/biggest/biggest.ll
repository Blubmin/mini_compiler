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

%struct.IntList = type {i64, %struct.IntList*}


define %struct.IntList* @getIntList () {
LU0:
	%list = alloca %struct.IntList*
	%next = alloca i64
	%.ret = alloca %struct.IntList*
	%r0 = call i8* @malloc(i64 16)
	%r1 = bitcast i8* %r0 to %struct.IntList*
	store %struct.IntList* %r1, %struct.IntList** %list
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r2 = load i64* @.read_scratch
	store i64 %r2, i64* %next
	%r3 = load i64* %next
	%r4 = sub i64 0, 1
	%r5 = icmp eq i64 %r3, %r4
	br i1 %r5, label %LU3, label %LU4
LU3:
	%r6 = load i64* %next
	%r7 = load %struct.IntList** %list
	%r8 = getelementptr inbounds %struct.IntList* %r7, i1 0, i32 0
	store i64 %r6, i64* %r8
	%r9 = load %struct.IntList** %list
	%r10 = getelementptr inbounds %struct.IntList* %r9, i1 0, i32 1
	store %struct.IntList* null, %struct.IntList** %r10
	%r11 = load %struct.IntList** %list
	store %struct.IntList* %r11, %struct.IntList** %.ret
	br label %LU1
LU4:
	%r12 = load i64* %next
	%r13 = load %struct.IntList** %list
	%r14 = getelementptr inbounds %struct.IntList* %r13, i1 0, i32 0
	store i64 %r12, i64* %r14
	%r15 = call %struct.IntList* @getIntList()
	%r16 = load %struct.IntList** %list
	%r17 = getelementptr inbounds %struct.IntList* %r16, i1 0, i32 1
	store %struct.IntList* %r15, %struct.IntList** %r17
	%r18 = load %struct.IntList** %list
	store %struct.IntList* %r18, %struct.IntList** %.ret
	br label %LU1
LU1:
	%r19 = load %struct.IntList** %.ret
	ret %struct.IntList* %r19
}

define i64 @biggest (i64 %r20, i64 %r21) {
LU5:
	%.ret = alloca i64
	%num1 = alloca i64
	store i64 %r20, i64* %num1
	%num2 = alloca i64
	store i64 %r21, i64* %num2
	%r22 = load i64* %num1
	%r23 = load i64* %num2
	%r24 = icmp sgt i64 %r22, %r23
	br i1 %r24, label %LU8, label %LU9
LU8:
	%r25 = load i64* %num1
	store i64 %r25, i64* %.ret
	br label %LU6
LU9:
	%r26 = load i64* %num2
	store i64 %r26, i64* %.ret
	br label %LU6
LU6:
	%r27 = load i64* %.ret
	ret i64 %r27
}

define i64 @biggestInList (%struct.IntList* %r28) {
LU10:
	%big = alloca i64
	%.ret = alloca i64
	%list = alloca %struct.IntList*
	store %struct.IntList* %r28, %struct.IntList** %list
	%r29 = load %struct.IntList** %list
	%r30 = getelementptr inbounds %struct.IntList* %r29, i1 0, i32 0
	%r31 = load i64* %r30
	store i64 %r31, i64* %big
	br label %LU13
LU13:
	%r32 = load %struct.IntList** %list
	%r33 = getelementptr inbounds %struct.IntList* %r32, i1 0, i32 1
	%r34 = load %struct.IntList** %r33
	%r35 = icmp ne %struct.IntList* %r34, null
	br i1 %r35, label %LU14, label %LU12
LU14:
	%r36 = load i64* %big
	%r37 = load %struct.IntList** %list
	%r38 = getelementptr inbounds %struct.IntList* %r37, i1 0, i32 0
	%r39 = load i64* %r38
	%r40 = call i64 @biggest(i64 %r36, i64 %r39)
	store i64 %r40, i64* %big
	%r41 = load %struct.IntList** %list
	%r42 = getelementptr inbounds %struct.IntList* %r41, i1 0, i32 1
	%r43 = load %struct.IntList** %r42
	store %struct.IntList* %r43, %struct.IntList** %list
	%r44 = load %struct.IntList** %list
	%r45 = getelementptr inbounds %struct.IntList* %r44, i1 0, i32 1
	%r46 = load %struct.IntList** %r45
	%r47 = icmp ne %struct.IntList* %r46, null
	br i1 %r47, label %LU14, label %LU12
LU12:
	%r48 = load i64* %big
	store i64 %r48, i64* %.ret
	br label %LU11
LU11:
	%r49 = load i64* %.ret
	ret i64 %r49
}

define i64 @main () {
LU15:
	%list = alloca %struct.IntList*
	%.ret = alloca i64
	%r50 = call %struct.IntList* @getIntList()
	store %struct.IntList* %r50, %struct.IntList** %list
	%r51 = load %struct.IntList** %list
	%r52 = call i64 @biggestInList(%struct.IntList* %r51)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r52)
	store i64 0, i64* %.ret
	br label %LU16
LU16:
	%r53 = load i64* %.ret
	ret i64 %r53
}

