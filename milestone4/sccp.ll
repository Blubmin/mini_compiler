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
	ret void
}

define i64 @bar (i64 %r12, i64 %r13) {
LU2:
	ret i64 5
}

define i64 @baz (i64 %r19, i64 %r20) {
LU7:
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 1)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]*@.println, i32 0, i32 0), i64 4)
	ret i64 0
}

define void @fbool (i64 %r34) {
LU19:
	ret void
}

define i64 @quux (i64 %r36, i64 %r37) {
LU20:
	call void @fbool(i64 0)
	call void @fbool(i64 1)
	call void @fbool(i64 1)
	call void @fbool(i64 1)
	call void @fbool(i64 0)
	call void @fbool(i64 1)
	call void @fbool(i64 1)
	call void @fbool(i64 1)
	ret i64 0
}

define i64 @quux2 (i64 %r50, i64 %r51) {
LU25:
	call void @fbool(i64 0)
	call void @fbool(i64 1)
	call void @fbool(i64 1)
	call void @fbool(i64 1)
	call void @fbool(i64 0)
	call void @fbool(i64 1)
	call void @fbool(i64 1)
	call void @fbool(i64 1)
	ret i64 0
}

define i64 @flrgrl (i64 %r65, i64 %r66) {
LU30:
	ret i64 4
}

define i64 @blergh () {
LU36:
	ret i64 3
}

define i64 @main () {
LU41:
	ret i64 0
}

