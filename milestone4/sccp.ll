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


@y = common global i64 0, align 8

define void @foo (i64 %r0) {
LU0:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.print, i32 0, i32 0), i64 96)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.print, i32 0, i32 0), i64 4)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.print, i32 0, i32 0), i64 7)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.print, i32 0, i32 0), i64 28)
	%r8 = sdiv i64 4, 0
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.print, i32 0, i32 0), i64 %r8)
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* @.read_scratch)
	%r9 = load i64* @.read_scratch
	%r10 = add i64 %r9, 1
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.print, i32 0, i32 0), i64 %r10)
	br label %LU1
LU1:
	ret void
}

define i64 @bar (i64 %r12, i64 %r13) {
LU2:
	%r14 = icmp sgt i64 %r12, %r13
	br i1 %r14, label %LU5, label %LU6
LU5:
	br label %LU4
LU6:
	br label %LU4
LU4:
	br label %LU3
LU3:
	ret i64 5
}

define i64 @baz (i64 %r19, i64 %r20) {
LU7:
	%r21 = icmp sgt i64 %r19, %r20
	br i1 %r21, label %LU10, label %LU11
LU10:
	br label %LU9
LU11:
	br label %LU9
LU9:
	br label %LU13
LU13:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 1)
	br label %LU12
LU12:
	br label %LU17
LU17:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 4)
	br label %LU15
LU15:
	br label %LU8
LU8:
	ret i64 0
}

define void @fbool (i64 %r34) {
LU18:
	br label %LU19
LU19:
	ret void
}

define i64 @quux (i64 %r36, i64 %r37) {
LU20:
	%r38 = icmp sgt i64 %r36, %r37
	br i1 %r38, label %LU23, label %LU24
LU23:
	br label %LU22
LU24:
	br label %LU22
LU22:
	call void @fbool(i64 0)
	call void @fbool(i64 1)
	call void @fbool(i64 1)
	call void @fbool(i64 1)
	call void @fbool(i64 0)
	call void @fbool(i64 1)
	call void @fbool(i64 1)
	call void @fbool(i64 1)
	br label %LU21
LU21:
	ret i64 0
}

define i64 @quux2 (i64 %r50, i64 %r51) {
LU25:
	%r52 = icmp sgt i64 %r50, %r51
	br i1 %r52, label %LU28, label %LU29
LU28:
	br label %LU27
LU29:
	br label %LU27
LU27:
	call void @fbool(i64 0)
	call void @fbool(i64 1)
	call void @fbool(i64 1)
	call void @fbool(i64 1)
	call void @fbool(i64 0)
	call void @fbool(i64 1)
	call void @fbool(i64 1)
	call void @fbool(i64 1)
	br label %LU26
LU26:
	ret i64 0
}

define i64 @flrgrl (i64 %r65, i64 %r66) {
LU30:
	%r67 = icmp sgt i64 %r65, %r66
	br i1 %r67, label %LU33, label %LU34
LU33:
	br label %LU32
LU34:
	br label %LU32
LU32:
	br label %LU31
LU31:
	ret i64 4
}

define i64 @blergh () {
LU35:
	br label %LU38
LU38:
	br label %LU37
LU37:
	br label %LU36
LU36:
	ret i64 3
}

define i64 @main () {
LU40:
	br label %LU41
LU41:
	ret i64 0
}

