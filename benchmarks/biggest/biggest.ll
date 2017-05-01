declare i8* @malloc(i64)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.printhex = private unnamed_addr constant [6 x i8] c"0x%X\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i64 0, align 8

%struct.IntList = type {i64, %struct.IntList*}


define %struct.IntList* @getIntList () {
LU0:
	%list = alloca %struct.IntList*
	%next = alloca i64
	%.ret = alloca %struct.IntList*
	%r1 = call i8* @malloc(i64 16)
	%r2 = bitcast i8* %r1 to %struct.IntList*
	store %struct.IntList* %r2, %struct.IntList** %list
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r3 = load i64* @.read_scratch
	store i64 %r3, i64* %next
	%r4 = load i64* %next
	%r5 = sub i64 0, 1
	%r6 = icmp eq i64 %r4, %r5
	br i1 %r6, label %LU3, label %LU4
LU3:
	%r7 = load i64* %next
	%r8 = load %struct.IntList** %list
	%r9 = getelementptr inbounds %struct.IntList* %r8, i1 0, i32 0
	store i64 %r7, i64* %r9
	%r10 = load %struct.IntList** %list
	%r11 = getelementptr inbounds %struct.IntList* %r10, i1 0, i32 1
	store %struct.IntList* null, %struct.IntList** %r11
	%r12 = load %struct.IntList** %list
	store %struct.IntList* %r12, %struct.IntList** %.ret
	br label %LU1
LU4:
	%r13 = load i64* %next
	%r14 = load %struct.IntList** %list
	%r15 = getelementptr inbounds %struct.IntList* %r14, i1 0, i32 0
	store i64 %r13, i64* %r15
	%r16 = call %struct.IntList* @getIntList()
	%r17 = load %struct.IntList** %list
	%r18 = getelementptr inbounds %struct.IntList* %r17, i1 0, i32 1
	store %struct.IntList* %r16, %struct.IntList** %r18
	%r19 = load %struct.IntList** %list
	store %struct.IntList* %r19, %struct.IntList** %.ret
	br label %LU1
LU1:
	%r0 = load %struct.IntList** %.ret
	ret %struct.IntList* %r0
}

define i64 @biggest (i64 %r20, i64 %r21) {
LU5:
	%.ret = alloca i64
	%num1 = alloca i64
	store i64 %r20, i64* %num1
	%num2 = alloca i64
	store i64 %r21, i64* %num2
	%r23 = load i64* %num1
	%r24 = load i64* %num2
	%r25 = icmp sgt i64 %r23, %r24
	br i1 %r25, label %LU8, label %LU9
LU8:
	%r26 = load i64* %num1
	store i64 %r26, i64* %.ret
	br label %LU6
LU9:
	%r27 = load i64* %num2
	store i64 %r27, i64* %.ret
	br label %LU6
LU6:
	%r22 = load i64* %.ret
	ret i64 %r22
}

define i64 @biggestInList (%struct.IntList* %r28) {
LU10:
	%big = alloca i64
	%.ret = alloca i64
	%list = alloca %struct.IntList*
	store %struct.IntList* %r28, %struct.IntList** %list
	%r30 = load %struct.IntList** %list
	%r31 = getelementptr inbounds %struct.IntList* %r30, i1 0, i32 0
	%r32 = load i64* %r31
	store i64 %r32, i64* %big
	br label %LU13
LU13:
	%r33 = load %struct.IntList** %list
	%r34 = getelementptr inbounds %struct.IntList* %r33, i1 0, i32 1
	%r35 = load %struct.IntList** %r34
	%r36 = icmp ne %struct.IntList* %r35, null
	br i1 %r36, label %LU14, label %LU12
LU14:
	%r37 = load i64* %big
	%r38 = load %struct.IntList** %list
	%r39 = getelementptr inbounds %struct.IntList* %r38, i1 0, i32 0
	%r40 = load i64* %r39
	%r41 = call i64 @biggest(i64 %r37, i64 %r40)
	store i64 %r41, i64* %big
	%r42 = load %struct.IntList** %list
	%r43 = getelementptr inbounds %struct.IntList* %r42, i1 0, i32 1
	%r44 = load %struct.IntList** %r43
	store %struct.IntList* %r44, %struct.IntList** %list
	br label %LU13
LU12:
	%r45 = load i64* %big
	store i64 %r45, i64* %.ret
	br label %LU11
LU11:
	%r29 = load i64* %.ret
	ret i64 %r29
}

define i64 @main () {
LU15:
	%list = alloca %struct.IntList*
	%.ret = alloca i64
	%r47 = call %struct.IntList* @getIntList()
	store %struct.IntList* %r47, %struct.IntList** %list
	%r48 = load %struct.IntList** %list
	%r49 = call i64 @biggestInList(%struct.IntList* %r48)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r49)
	store i64 0, i64* %.ret
	br label %LU16
LU16:
	%r46 = load i64* %.ret
	ret i64 %r46
}

