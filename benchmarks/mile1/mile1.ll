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

%struct.Power = type {i64, i64}


define i64 @calcPower (i64 %r0, i64 %r1) {
LU0:
	br label %LU3
LU3:
	%r2 = icmp sgt i64 %r1, 0
	br i1 %r2, label %LU4, label %LU2
LU4:
	%r6 = phi i64 [ %r1, %LU3 ], [ %r7, %LU4 ]
	%r3 = phi i64 [ 1, %LU3 ], [ %r5, %LU4 ]
	%r5 = mul i64 %r3, %r0
	%r7 = sub i64 %r6, 1
	%r8 = icmp sgt i64 %r7, 0
	br i1 %r8, label %LU4, label %LU2
LU2:
	%r9 = phi i64 [ 1, %LU3 ], [ %r5, %LU4 ]
	br label %LU1
LU1:
	ret i64 %r9
}

define i64 @main () {
LU5:
	%r11 = call i8* @malloc(i64 16)
	%r12 = bitcast i8* %r11 to %struct.Power*
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r13 = load i64* @.read_scratch
	%r14 = getelementptr inbounds %struct.Power* %r12, i1 0, i32 0
	store i64 %r13, i64* %r14
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r15 = load i64* @.read_scratch
	%r16 = icmp slt i64 %r15, 0
	br i1 %r16, label %LU8, label %LU7
LU8:
	br label %LU6
LU7:
	%r18 = getelementptr inbounds %struct.Power* %r12, i1 0, i32 1
	store i64 %r15, i64* %r18
	br label %LU10
LU10:
	br label %LU11
LU11:
	%r20 = phi i64 [ 0, %LU10 ], [ %r21, %LU11 ]
	%r21 = add i64 %r20, 1
	%r23 = getelementptr inbounds %struct.Power* %r12, i1 0, i32 0
	%r24 = load i64* %r23
	%r25 = getelementptr inbounds %struct.Power* %r12, i1 0, i32 1
	%r26 = load i64* %r25
	%r27 = call i64 @calcPower(i64 %r24, i64 %r26)
	%r29 = icmp slt i64 %r21, 1000000
	br i1 %r29, label %LU11, label %LU9
LU9:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r27)
	br label %LU6
LU6:
	%r32 = phi i64 [ -1, %LU8 ], [ 1, %LU9 ]
	ret i64 %r32
}

