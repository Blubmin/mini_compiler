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

%struct.IntHolder = type {i64}

@interval = common global i64 0, align 8
@end = common global i64 0, align 8

define i64 @multBy4xTimes (%struct.IntHolder* %r0, i64 %r1) {
LU0:
	%r2 = icmp sle i64 %r1, 0
	br i1 %r2, label %LU3, label %LU2
LU3:
	%r3 = getelementptr inbounds %struct.IntHolder* %r0, i1 0, i32 0
	%r4 = load i64* %r3
	br label %LU1
LU2:
	%r5 = getelementptr inbounds %struct.IntHolder* %r0, i1 0, i32 0
	%r6 = load i64* %r5
	%r7 = mul i64 4, %r6
	%r8 = getelementptr inbounds %struct.IntHolder* %r0, i1 0, i32 0
	store i64 %r7, i64* %r8
	%r9 = sub i64 %r1, 1
	call i64 @multBy4xTimes(%struct.IntHolder* %r0, i64 %r9)
	%r10 = getelementptr inbounds %struct.IntHolder* %r0, i1 0, i32 0
	%r11 = load i64* %r10
	br label %LU1
LU1:
	%r13 = phi i64 [ %r4, %LU3 ], [ %r11, %LU2 ]
	ret i64 %r13
}

define void @divideBy8 (%struct.IntHolder* %r14) {
LU4:
	%r15 = getelementptr inbounds %struct.IntHolder* %r14, i1 0, i32 0
	%r16 = load i64* %r15
	%r17 = sdiv i64 %r16, 2
	%r18 = getelementptr inbounds %struct.IntHolder* %r14, i1 0, i32 0
	store i64 %r17, i64* %r18
	%r19 = getelementptr inbounds %struct.IntHolder* %r14, i1 0, i32 0
	%r20 = load i64* %r19
	%r21 = sdiv i64 %r20, 2
	%r22 = getelementptr inbounds %struct.IntHolder* %r14, i1 0, i32 0
	store i64 %r21, i64* %r22
	%r23 = getelementptr inbounds %struct.IntHolder* %r14, i1 0, i32 0
	%r24 = load i64* %r23
	%r25 = sdiv i64 %r24, 2
	%r26 = getelementptr inbounds %struct.IntHolder* %r14, i1 0, i32 0
	store i64 %r25, i64* %r26
	br label %LU5
LU5:
	ret void
}

define i64 @main () {
LU6:
	%r28 = call i8* @malloc(i64 8)
	%r29 = bitcast i8* %r28 to %struct.IntHolder*
	store i64 1000000, i64* @end
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r30 = load i64* @.read_scratch
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r31 = load i64* @.read_scratch
	store i64 %r31, i64* @interval
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r30)
	%r32 = load i64* @interval
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r32)
	br label %LU9
LU9:
	%r33 = icmp slt i64 0, 50
	br i1 %r33, label %LU10, label %LU8
LU10:
	%r70 = phi i64 [ 0, %LU9 ], [ %r73, %LU11 ]
	%r63 = phi i64 [ 0, %LU9 ], [ %r80, %LU11 ]
	%r60 = phi i64 [ 0, %LU9 ], [ %r79, %LU11 ]
	%r56 = phi i64 [ 0, %LU9 ], [ %r78, %LU11 ]
	%r51 = phi %struct.IntHolder* [ %r29, %LU9 ], [ %r51, %LU11 ]
	%r47 = phi i64 [ 0, %LU9 ], [ %r76, %LU11 ]
	%r34 = phi i64 [ 0, %LU9 ], [ %r75, %LU11 ]
	br label %LU12
LU12:
	%r35 = load i64* @end
	%r36 = icmp sle i64 0, %r35
	br i1 %r36, label %LU13, label %LU11
LU13:
	%r64 = phi i64 [ %r63, %LU12 ], [ %r65, %LU14 ]
	%r61 = phi i64 [ %r60, %LU12 ], [ %r59, %LU14 ]
	%r57 = phi i64 [ %r56, %LU12 ], [ %r55, %LU14 ]
	%r49 = phi i64 [ 0, %LU12 ], [ %r67, %LU14 ]
	%r48 = phi i64 [ %r47, %LU12 ], [ %r46, %LU14 ]
	%r37 = mul i64 1, 2
	%r38 = mul i64 %r37, 3
	%r39 = mul i64 %r38, 4
	%r40 = mul i64 %r39, 5
	%r41 = mul i64 %r40, 6
	%r42 = mul i64 %r41, 7
	%r43 = mul i64 %r42, 8
	%r44 = mul i64 %r43, 9
	%r45 = mul i64 %r44, 10
	%r46 = mul i64 %r45, 11
	%r50 = add i64 %r49, 1
	%r53 = getelementptr inbounds %struct.IntHolder* %r51, i1 0, i32 0
	store i64 %r50, i64* %r53
	%r54 = getelementptr inbounds %struct.IntHolder* %r51, i1 0, i32 0
	%r55 = load i64* %r54
	call i64 @multBy4xTimes(%struct.IntHolder* %r51, i64 2)
	call void @divideBy8(%struct.IntHolder* %r51)
	%r58 = load i64* @interval
	%r59 = sub i64 %r58, 1
	%r62 = icmp sle i64 %r59, 0
	%r65 = zext i1 %r62 to i64
	%r66 = icmp sle i64 %r59, 0
	br i1 %r66, label %LU15, label %LU14
LU15:
	br label %LU14
LU14:
	%r67 = add i64 %r50, %r59
	%r68 = load i64* @end
	%r69 = icmp sle i64 %r67, %r68
	br i1 %r69, label %LU13, label %LU11
LU11:
	%r80 = phi i64 [ %r63, %LU12 ], [ %r65, %LU14 ]
	%r79 = phi i64 [ %r60, %LU12 ], [ %r59, %LU14 ]
	%r78 = phi i64 [ %r56, %LU12 ], [ %r55, %LU14 ]
	%r76 = phi i64 [ %r47, %LU12 ], [ %r46, %LU14 ]
	%r75 = phi i64 [ 0, %LU12 ], [ %r67, %LU14 ]
	%r73 = add i64 %r70, 1
	%r74 = icmp slt i64 %r73, 50
	br i1 %r74, label %LU10, label %LU8
LU8:
	%r82 = phi i64 [ 0, %LU9 ], [ %r76, %LU11 ]
	%r81 = phi i64 [ 0, %LU9 ], [ %r75, %LU11 ]
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r81)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r82)
	br label %LU7
LU7:
	ret i64 0
}

