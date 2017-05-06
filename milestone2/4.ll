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

%struct.A = type {i64, i64, i64, %struct.A*}
%struct.B = type {%struct.A*}

@i = common global i64 0, align 8
@j = common global i64 0, align 8
@k = common global i64 0, align 8
@b = common global %struct.B* null, align 8
@bb = common global %struct.B* null, align 8
@bbb = common global %struct.B* null, align 8
@bob = common global i64 0, align 8

define i64 @g (i64 %r0, %struct.B* %r1) {
LU0:
	%g = alloca i64
	%m = alloca i64
	%k = alloca i64
	%.ret = alloca i64
	%i = alloca i64
	store i64 %r0, i64* %i
	%j = alloca %struct.B*
	store %struct.B* %r1, %struct.B** %j
	store i64 3, i64* %.ret
	br label %LU1
LU1:
	%r2 = load i64* %.ret
	ret i64 %r2
}

define i64 @foo (i64 %r3) {
LU2:
	%.ret = alloca i64
	%n = alloca i64
	store i64 %r3, i64* %n
	%r5 = load i64* %n
	%r6 = icmp sle i64 %r5, 0
	br i1 %r6, label %LU5, label %LU6
LU5:
	store i64 1, i64* %.ret
	br label %LU3
LU6:
	%r7 = load i64* %n
	%r8 = load i64* %n
	%r9 = sub i64 %r8, 1
	%r10 = call i64 @foo(i64 %r9)
	%r11 = mul i64 %r7, %r10
	store i64 %r11, i64* %.ret
	br label %LU3
LU3:
	%r4 = load i64* %.ret
	ret i64 %r4
}

define %struct.A* @f (i64 %r12, %struct.B* %r13) {
LU7:
	%f = alloca i64
	%l = alloca i64
	%k = alloca i64
	%.ret = alloca %struct.A*
	%i = alloca i64
	store i64 %r12, i64* %i
	%j = alloca %struct.B*
	store %struct.B* %r13, %struct.B** %j
	%r15 = load %struct.B** @b
	%r16 = getelementptr inbounds %struct.B* %r15, i1 0, i32 0
	%r17 = load %struct.A** %r16
	%r18 = getelementptr inbounds %struct.A* %r17, i1 0, i32 3
	%r19 = load %struct.A** %r18
	%r20 = getelementptr inbounds %struct.A* %r19, i1 0, i32 3
	%r21 = load %struct.A** %r20
	%r22 = getelementptr inbounds %struct.A* %r21, i1 0, i32 0
	store i64 7, i64* %r22
	%r23 = load %struct.B** @b
	%r24 = getelementptr inbounds %struct.B* %r23, i1 0, i32 0
	%r25 = load %struct.A** %r24
	%r26 = getelementptr inbounds %struct.A* %r25, i1 0, i32 3
	%r27 = load %struct.A** %r26
	%r28 = getelementptr inbounds %struct.A* %r27, i1 0, i32 3
	%r29 = load %struct.A** %r28
	%r30 = getelementptr inbounds %struct.A* %r29, i1 0, i32 3
	%r31 = load %struct.A** %r30
	store %struct.A* %r31, %struct.A** %.ret
	br label %LU8
LU8:
	%r14 = load %struct.A** %.ret
	ret %struct.A* %r14
}

define void @bar (%struct.B* %r32, i64 %r33) {
LU9:
	%j = alloca %struct.B*
	store %struct.B* %r32, %struct.B** %j
	%i = alloca i64
	store i64 %r33, i64* %i
	br label %LU10
LU10:
	ret void
}

define i64 @main () {
LU11:
	%a = alloca %struct.A*
	%i = alloca i64
	%j = alloca i64
	%k = alloca i64
	%b = alloca i64
	%h = alloca i64
	%.ret = alloca i64
	store i64 2, i64* %i
	%r36 = load i64* %i
	%r37 = call i64 @g(i64 1, %struct.B* null)
	%r38 = icmp slt i64 %r36, %r37
	br i1 %r38, label %LU14, label %LU13
LU14:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.print, i32 0, i32 0), i64 1)
	br label %LU13
LU13:
	%r39 = load i64* %i
	%r40 = call i64 @g(i64 1, %struct.B* null)
	%r41 = icmp sgt i64 %r39, %r40
	br i1 %r41, label %LU16, label %LU17
LU16:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.print, i32 0, i32 0), i64 1)
	br label %LU15
LU17:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 3)
	br label %LU15
LU15:
	br label %LU19
LU19:
	%r42 = trunc i64 1 to i1
	br i1 %r42, label %LU20, label %LU18
LU20:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.print, i32 0, i32 0), i64 7)
	br label %LU20
	%r43 = trunc i64 1 to i1
LU18:
	%r44 = call i8* @malloc(i64 8)
	%r45 = bitcast i8* %r44 to %struct.B*
	%r46 = call i64 @g(i64 1, %struct.B* %r45)
	%r47 = call i8* @malloc(i64 8)
	%r48 = bitcast i8* %r47 to %struct.B*
	call %struct.A* @f(i64 %r46, %struct.B* %r48)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.print, i32 0, i32 0), i64 1)
	%r49 = call i8* @malloc(i64 8)
	%r50 = bitcast i8* %r49 to %struct.B*
	%r51 = call i8* @malloc(i64 8)
	%r52 = bitcast i8* %r51 to %struct.B*
	%r53 = call i64 @g(i64 1, %struct.B* %r52)
	call void @bar(%struct.B* %r50, i64 %r53)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.print, i32 0, i32 0), i64 2)
	%r54 = call i8* @malloc(i64 8)
	%r55 = bitcast i8* %r54 to %struct.B*
	%r56 = call i64 @g(i64 1, %struct.B* %r55)
	%r57 = call i8* @malloc(i64 8)
	%r58 = bitcast i8* %r57 to %struct.B*
	%r59 = call %struct.A* @f(i64 %r56, %struct.B* %r58)
	%r60 = getelementptr inbounds %struct.A* %r59, i1 0, i32 0
	%r61 = load i64* %r60
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 %r61)
	store i64 0, i64* %.ret
	br label %LU12
LU12:
	%r35 = load i64* %.ret
	ret i64 %r35
}

