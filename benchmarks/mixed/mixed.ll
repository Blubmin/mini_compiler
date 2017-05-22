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

%struct.simple = type {i64}
%struct.foo = type {i64, i64, %struct.simple*}

@globalfoo = common global %struct.foo* null, align 8

define void @tailrecursive (i64 %r0) {
LU0:
	%r1 = icmp sle i64 %r0, 0
	br i1 %r1, label %LU3, label %LU2
LU3:
	br label %LU1
LU2:
	%r4 = sub i64 %r0, 1
	call void @tailrecursive(i64 %r4)
	br label %LU1
LU1:
	ret void
}

define i64 @add (i64 %r6, i64 %r7) {
LU4:
	%r8 = add i64 %r6, %r7
	ret i64 %r8
}

define void @domath (i64 %r10) {
LU6:
	%r11 = call i8* @malloc(i64 24)
	%r12 = bitcast i8* %r11 to %struct.foo*
	%r13 = call i8* @malloc(i64 8)
	%r14 = bitcast i8* %r13 to %struct.simple*
	%r15 = getelementptr inbounds %struct.foo* %r12, i1 0, i32 2
	store %struct.simple* %r14, %struct.simple** %r15
	%r16 = call i8* @malloc(i64 24)
	%r17 = bitcast i8* %r16 to %struct.foo*
	%r18 = call i8* @malloc(i64 8)
	%r19 = bitcast i8* %r18 to %struct.simple*
	%r20 = getelementptr inbounds %struct.foo* %r17, i1 0, i32 2
	store %struct.simple* %r19, %struct.simple** %r20
	%r21 = getelementptr inbounds %struct.foo* %r12, i1 0, i32 0
	store i64 %r10, i64* %r21
	%r22 = getelementptr inbounds %struct.foo* %r17, i1 0, i32 0
	store i64 3, i64* %r22
	%r23 = getelementptr inbounds %struct.foo* %r12, i1 0, i32 0
	%r24 = load i64* %r23
	%r25 = getelementptr inbounds %struct.foo* %r12, i1 0, i32 2
	%r26 = load %struct.simple** %r25
	%r27 = getelementptr inbounds %struct.simple* %r26, i1 0, i32 0
	store i64 %r24, i64* %r27
	%r28 = getelementptr inbounds %struct.foo* %r17, i1 0, i32 0
	%r29 = load i64* %r28
	%r30 = getelementptr inbounds %struct.foo* %r17, i1 0, i32 2
	%r31 = load %struct.simple** %r30
	%r32 = getelementptr inbounds %struct.simple* %r31, i1 0, i32 0
	store i64 %r29, i64* %r32
	%r33 = icmp sgt i64 %r10, 0
	br i1 %r33, label %LU10, label %LU7
LU10:
	%r62 = phi i64 [ %r10, %LU6 ], [ %r63, %LU10 ]
	%r50 = getelementptr inbounds %struct.foo* %r17, i1 0, i32 2
	%r51 = load %struct.simple** %r50
	%r52 = getelementptr inbounds %struct.simple* %r51, i1 0, i32 0
	%r53 = load i64* %r52
	%r54 = getelementptr inbounds %struct.foo* %r12, i1 0, i32 0
	%r55 = load i64* %r54
	%r56 = call i64 @add(i64 %r53, i64 %r55)
	%r63 = sub i64 %r62, 1
	%r64 = icmp sgt i64 %r63, 0
	br i1 %r64, label %LU10, label %LU7
LU7:
	ret void
}

define void @objinstantiation (i64 %r70) {
LU14:
	%r71 = icmp sgt i64 %r70, 0
	br i1 %r71, label %LU15, label %LU12
LU15:
	%r76 = phi i64 [ %r70, %LU14 ], [ %r77, %LU15 ]
	%r77 = sub i64 %r76, 1
	%r78 = icmp sgt i64 %r77, 0
	br i1 %r78, label %LU15, label %LU12
LU12:
	ret void
}

define i64 @ackermann (i64 %r80, i64 %r81) {
LU16:
	%r82 = icmp eq i64 %r80, 0
	br i1 %r82, label %LU19, label %LU18
LU19:
	%r83 = add i64 %r81, 1
	br label %LU17
LU18:
	%r84 = icmp eq i64 %r81, 0
	br i1 %r84, label %LU21, label %LU22
LU21:
	%r85 = sub i64 %r80, 1
	%r86 = call i64 @ackermann(i64 %r85, i64 1)
	br label %LU17
LU22:
	%r87 = sub i64 %r80, 1
	%r88 = sub i64 %r81, 1
	%r89 = call i64 @ackermann(i64 %r80, i64 %r88)
	%r90 = call i64 @ackermann(i64 %r87, i64 %r89)
	br label %LU17
LU17:
	%r92 = phi i64 [ %r83, %LU19 ], [ %r86, %LU21 ], [ %r90, %LU22 ]
	ret i64 %r92
}

define i64 @main () {
LU23:
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r93 = load i64* @.read_scratch
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r94 = load i64* @.read_scratch
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r95 = load i64* @.read_scratch
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r96 = load i64* @.read_scratch
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r97 = load i64* @.read_scratch
	call void @tailrecursive(i64 %r93)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r93)
	call void @domath(i64 %r94)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r94)
	call void @objinstantiation(i64 %r95)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r95)
	%r98 = call i64 @ackermann(i64 %r96, i64 %r97)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r98)
	ret i64 0
}

