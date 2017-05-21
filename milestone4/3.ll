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


define i64 @main () {
LU0:
	store i64 9, i64* %r0
	%r1 = getelementptr inbounds %struct.A* null, i1 0, i32 0
	%r2 = load i64* %r1
	%r3 = icmp slt i64 8, %r2
	br i1 %r3, label %LU3, label %LU4
LU3:
	br label %LU1
LU4:
	%r5 = getelementptr inbounds %struct.A* null, i1 0, i32 0
	%r6 = load i64* %r5
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.print, i32 0, i32 0), i64 %r6)
	br label %LU2
LU2:
	br label %LU1
LU1:
	%r8 = phi i64 [ -2, %LU3 ], [ 0, %LU2 ]
	ret i64 %r8
}

