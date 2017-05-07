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
	%r1 = icmp eq %struct.intList* %r0, null
	br i1 %r1, label %LU3, label %LU2
LU3:
	br label %LU1
LU2:
	%r2 = getelementptr inbounds %struct.intList* %r0, i1 0, i32 1
	%r3 = load %struct.intList** %r2
	%r4 = call i64 @length(%struct.intList* %r3)
	%r5 = add i64 1, %r4
	br label %LU1
LU1:
	%r7 = phi i64 [ 0, %LU3 ], [ %r5, %LU2 ]
	ret i64 %r7
}

define %struct.intList* @addToFront (%struct.intList* %r8, i64 %r9) {
LU4:
	%r10 = icmp eq %struct.intList* %r8, null
	br i1 %r10, label %LU7, label %LU6
LU7:
	%r11 = call i8* @malloc(i64 16)
	%r12 = bitcast i8* %r11 to %struct.intList*
	%r13 = getelementptr inbounds %struct.intList* %r12, i1 0, i32 0
	store i64 %r9, i64* %r13
	%r14 = getelementptr inbounds %struct.intList* %r12, i1 0, i32 1
	store %struct.intList* null, %struct.intList** %r14
	br label %LU5
LU6:
	%r15 = call i8* @malloc(i64 16)
	%r16 = bitcast i8* %r15 to %struct.intList*
	%r17 = getelementptr inbounds %struct.intList* %r16, i1 0, i32 0
	store i64 %r9, i64* %r17
	%r18 = getelementptr inbounds %struct.intList* %r16, i1 0, i32 1
	store %struct.intList* %r8, %struct.intList** %r18
	br label %LU5
LU5:
	%r20 = phi %struct.intList* [ %r12, %LU7 ], [ %r16, %LU6 ]
	ret %struct.intList* %r20
}

define %struct.intList* @deleteFirst (%struct.intList* %r21) {
LU8:
	%r22 = icmp eq %struct.intList* %r21, null
	br i1 %r22, label %LU11, label %LU10
LU11:
	br label %LU9
LU10:
	%r23 = getelementptr inbounds %struct.intList* %r21, i1 0, i32 1
	%r24 = load %struct.intList** %r23
	%r25 = bitcast %struct.intList* %r21 to i8*
	call void @free(i8* %r25)
	br label %LU9
LU9:
	%r27 = phi %struct.intList* [ null, %LU11 ], [ %r24, %LU10 ]
	ret %struct.intList* %r27
}

define i64 @main () {
LU12:
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r28 = load i64* @.read_scratch
	store i64 %r28, i64* @intList
	br label %LU15
LU15:
	%r29 = load i64* @intList
	%r30 = icmp sgt i64 %r29, 0
	br i1 %r30, label %LU16, label %LU14
LU16:
	%r31 = phi %struct.intList* [ null, %LU15 ], [ %r33, %LU16 ]
	%r32 = load i64* @intList
	%r33 = call %struct.intList* @addToFront(%struct.intList* %r31, i64 %r32)
	%r34 = getelementptr inbounds %struct.intList* %r33, i1 0, i32 0
	%r35 = load i64* %r34
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.print, i32 0, i32 0), i64 %r35)
	%r36 = load i64* @intList
	%r37 = sub i64 %r36, 1
	store i64 %r37, i64* @intList
	%r38 = load i64* @intList
	%r39 = icmp sgt i64 %r38, 0
	br i1 %r39, label %LU16, label %LU14
LU14:
	%r40 = phi %struct.intList* [ null, %LU15 ], [ %r33, %LU16 ]
	%r41 = call i64 @length(%struct.intList* %r40)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.print, i32 0, i32 0), i64 %r41)
	br label %LU18
LU18:
	%r42 = call i64 @length(%struct.intList* %r40)
	%r43 = icmp sgt i64 %r42, 0
	br i1 %r43, label %LU19, label %LU17
LU19:
	%r47 = phi %struct.intList* [ %r40, %LU18 ], [ %r52, %LU19 ]
	%r46 = phi i64 [ 0, %LU18 ], [ %r50, %LU19 ]
	%r48 = getelementptr inbounds %struct.intList* %r47, i1 0, i32 0
	%r49 = load i64* %r48
	%r50 = add i64 %r46, %r49
	%r51 = call i64 @length(%struct.intList* %r47)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.print, i32 0, i32 0), i64 %r51)
	%r52 = call %struct.intList* @deleteFirst(%struct.intList* %r47)
	%r53 = call i64 @length(%struct.intList* %r52)
	%r54 = icmp sgt i64 %r53, 0
	br i1 %r54, label %LU19, label %LU17
LU17:
	%r55 = phi i64 [ 0, %LU18 ], [ %r50, %LU19 ]
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r55)
	br label %LU13
LU13:
	ret i64 0
}

