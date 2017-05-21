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
	%r0 = call i8* @malloc(i64 16)
	%r1 = bitcast i8* %r0 to %struct.IntList*
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r2 = load i64* @.read_scratch
	%r4 = icmp eq i64 %r2, -1
	br i1 %r4, label %LU3, label %LU4
LU3:
	%r5 = getelementptr inbounds %struct.IntList* %r1, i1 0, i32 0
	store i64 %r2, i64* %r5
	%r6 = getelementptr inbounds %struct.IntList* %r1, i1 0, i32 1
	store %struct.IntList* null, %struct.IntList** %r6
	br label %LU1
LU4:
	%r7 = getelementptr inbounds %struct.IntList* %r1, i1 0, i32 0
	store i64 %r2, i64* %r7
	%r8 = call %struct.IntList* @getIntList()
	%r9 = getelementptr inbounds %struct.IntList* %r1, i1 0, i32 1
	store %struct.IntList* %r8, %struct.IntList** %r9
	br label %LU1
LU1:
	%r11 = phi %struct.IntList* [ %r1, %LU3 ], [ %r1, %LU4 ]
	ret %struct.IntList* %r11
}

define i64 @biggest (i64 %r12, i64 %r13) {
LU5:
	%r14 = icmp sgt i64 %r12, %r13
	br i1 %r14, label %LU8, label %LU9
LU8:
	br label %LU6
LU9:
	br label %LU6
LU6:
	%r16 = phi i64 [ %r12, %LU8 ], [ %r13, %LU9 ]
	ret i64 %r16
}

define i64 @biggestInList (%struct.IntList* %r17) {
LU10:
	%r18 = getelementptr inbounds %struct.IntList* %r17, i1 0, i32 0
	%r19 = load i64* %r18
	br label %LU13
LU13:
	%r20 = getelementptr inbounds %struct.IntList* %r17, i1 0, i32 1
	%r21 = load %struct.IntList** %r20
	%r22 = icmp ne %struct.IntList* %r21, null
	br i1 %r22, label %LU14, label %LU12
LU14:
	%r24 = phi %struct.IntList* [ %r17, %LU13 ], [ %r29, %LU14 ]
	%r23 = phi i64 [ %r19, %LU13 ], [ %r27, %LU14 ]
	%r25 = getelementptr inbounds %struct.IntList* %r24, i1 0, i32 0
	%r26 = load i64* %r25
	%r27 = call i64 @biggest(i64 %r23, i64 %r26)
	%r28 = getelementptr inbounds %struct.IntList* %r24, i1 0, i32 1
	%r29 = load %struct.IntList** %r28
	%r30 = getelementptr inbounds %struct.IntList* %r29, i1 0, i32 1
	%r31 = load %struct.IntList** %r30
	%r32 = icmp ne %struct.IntList* %r31, null
	br i1 %r32, label %LU14, label %LU12
LU12:
	%r33 = phi i64 [ %r19, %LU13 ], [ %r27, %LU14 ]
	br label %LU11
LU11:
	ret i64 %r33
}

define i64 @main () {
LU15:
	%r35 = call %struct.IntList* @getIntList()
	%r36 = call i64 @biggestInList(%struct.IntList* %r35)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r36)
	br label %LU16
LU16:
	ret i64 0
}

