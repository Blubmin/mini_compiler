%struct.simple = type {i64}

@g = common global i64 0, align 8
@thing = common global %struct.simple* null, align 8

define void @other()
{
START:
    %r0 = add i64 0, 0
    br label %LOOP
LOOP:
    %r1 = phi i64 [%r0, %START], [%r3, %LOOP]
    call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i64 %r1)
    %r2 = icmp sgt i64 %r1, 9
    %r3 = add i64 %r1, 1
    br i1 %r2, label %RETURN, label %LOOP
RETURN:
    ret void
}


define i64 @main()
{
START:
    %r0 = add i64 0, 0
    store i8* null, %struct.simple** @thing
    br label %LOOP
LOOP:
    %r1 = phi i64 [%r0, %START], [%r3, %LOOP]
    call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i64 %r1)
    %r2 = icmp sgt i64 %r1, 9
    %r3 = add i64 %r1, 1
    br i1 %r2, label %RETURN, label %LOOP
RETURN:
    call void ()* @other()
    ret i64 0
}

declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1