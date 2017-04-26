declare i8* @malloc(i64)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i64 0, align 8

%struct.A = type {i64, i64}
%struct.B = type {i64, i64}

@h = common global i64 0, align 8
@me = common global %struct.A* null, align 8

define i64 @test (i64 %r0) {
LU0:
	%.ret = alloca i64
	%x = alloca i64
	store i64 %r0, i64* %x
	store i64 0, i64* %x
	store i64 0, i64* %.ret
	br label %LU1
LU1:
	%r1 = load i64* %.ret
	ret i64 %r1
}

define i64 @main () {
LU2:
	%a = alloca %struct.A*
	%i = alloca i64
	%.ret = alloca i64
	%r3 = call i8* @malloc(i64 16)
	%r4 = bitcast i8* %r3 to %struct.A*
	store %struct.A* %r4, %struct.A** %a
	%r5 = load %struct.A** %a
	%r6 = getelementptr inbounds %struct.A* %r5, i1 0, i32 0
	store i64 0, i64* %r6
	store i64 0, i64* %i
	br label %LU5
LU5:
	%r7 = load i64* %i
	%r8 = icmp slt i64 %r7, 10
	br i1 %r8, label %LU6, label %LU4
LU6:
	%r9 = load i64* %i
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.print, i32 0, i32 0), i64 %r9)
	%r10 = load i64* %i
	%r11 = add i64 %r10, 1
	store i64 %r11, i64* %i
	br label %LU5
LU4:
	store i64 0, i64* %.ret
	br label %LU3
LU3:
	%r2 = load i64* %.ret
	ret i64 %r2
}

