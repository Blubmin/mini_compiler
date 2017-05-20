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

%struct.A = type {i64}

@ha = common global i64 0, align 8

define i64 @test (%struct.A* %r0) {
LU0:
	%r1 = getelementptr inbounds %struct.A* %r0, i1 0, i32 0
	%r2 = load i64* %r1
	br label %LU1
LU1:
	ret i64 %r2
}

define i64 @main () {
LU2:
	store i64 8, i64* @ha
	%r4 = load i64* @ha
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r4)
	%r5 = call i8* @malloc(i64 8)
	%r6 = bitcast i8* %r5 to %struct.A*
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r7 = load i64* @.read_scratch
	%r8 = getelementptr inbounds %struct.A* %r6, i1 0, i32 0
	store i64 %r7, i64* %r8
	br label %LU5
LU5:
	%r9 = getelementptr inbounds %struct.A* %r6, i1 0, i32 0
	%r10 = load i64* %r9
	%r11 = icmp sge i64 %r10, 0
	br i1 %r11, label %LU6, label %LU4
LU6:
	%r13 = call i64 @test(%struct.A* %r6)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r13)
	%r14 = getelementptr inbounds %struct.A* %r6, i1 0, i32 0
	%r15 = load i64* %r14
	%r16 = sub i64 %r15, 1
	%r17 = getelementptr inbounds %struct.A* %r6, i1 0, i32 0
	store i64 %r16, i64* %r17
	%r18 = getelementptr inbounds %struct.A* %r6, i1 0, i32 0
	%r19 = load i64* %r18
	%r20 = icmp sge i64 %r19, 0
	br i1 %r20, label %LU6, label %LU4
LU4:
	%r22 = getelementptr inbounds %struct.A* %r6, i1 0, i32 0
	%r23 = load i64* %r22
	%r24 = icmp sgt i64 %r23, 5
	br i1 %r24, label %LU8, label %LU9
LU8:
	%r25 = sub i64 0, 1
	%r26 = getelementptr inbounds %struct.A* %r6, i1 0, i32 0
	store i64 %r25, i64* %r26
	br label %LU7
LU9:
	%r27 = getelementptr inbounds %struct.A* %r6, i1 0, i32 0
	store i64 1, i64* %r27
	br label %LU7
LU7:
	%r29 = call i64 @test(%struct.A* %r6)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r29)
	br label %LU3
LU3:
	ret i64 0
}

