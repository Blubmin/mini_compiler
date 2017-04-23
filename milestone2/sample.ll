%struct.foo = type {i64, i64, %struct.simple*}
%struct.simple = type {i64}

@globalfoo = common global %struct.foo* null, align 8

define void @tailrecursive(i64 %num)
{
LU1:
	%_P_num = alloca i64
	%unused = alloca %struct.foo*
	store i64 %num, i64* %_P_num
	%u0 = load i64* %_P_num
	%u1 = icmp sle i64 %u0, 0
	br i1 %u1, label %LU3, label %LU5
LU3:
	br label %LU0
LU5:
	br label %LU6
LU6:
	%u2 = call i8* @malloc(i64 24)
	%u3 = bitcast i8* %u2 to %struct.foo*
	store %struct.foo* %u3, %struct.foo** %unused
	%u4 = load i64* %_P_num
	%u5 = sub i64 %u4, 1
	call void @tailrecursive(i64 %u5)
	br label %LU0
LU0:
	ret void
}

define i64 @add(i64 %x, i64 %y)
{
LU10:
	%_retval_ = alloca i64
	%_P_x = alloca i64
	%_P_y = alloca i64
	store i64 %x, i64* %_P_x
	store i64 %y, i64* %_P_y
	%u7 = load i64* %_P_x
	%u8 = load i64* %_P_y
	%u9 = add i64 %u7, %u8
	store i64 %u9, i64* %_retval_
	br label %LU9
LU9:
	%u10 = load i64* %_retval_
	ret i64 %u10
}

define void @domath(i64 %num)
{
LU13:
	%_P_num = alloca i64
	%math1 = alloca %struct.foo*
	%tmp = alloca i64
	%math2 = alloca %struct.foo*
	store i64 %num, i64* %_P_num
	%u11 = call i8* @malloc(i64 24)
	%u12 = bitcast i8* %u11 to %struct.foo*
	store %struct.foo* %u12, %struct.foo** %math1
	%u13 = call i8* @malloc(i64 8)
	%u14 = bitcast i8* %u13 to %struct.simple*
	%u15 = load %struct.foo** %math1
	%u16 = getelementptr %struct.foo* %u15, i1 0, i32 2
	store %struct.simple* %u14, %struct.simple** %u16
	%u17 = call i8* @malloc(i64 24)
	%u18 = bitcast i8* %u17 to %struct.foo*
	store %struct.foo* %u18, %struct.foo** %math2
	%u19 = call i8* @malloc(i64 8)
	%u20 = bitcast i8* %u19 to %struct.simple*
	%u21 = load %struct.foo** %math2
	%u22 = getelementptr %struct.foo* %u21, i1 0, i32 2
	store %struct.simple* %u20, %struct.simple** %u22
	%u23 = load i64* %_P_num
	%u24 = load %struct.foo** %math1
	%u25 = getelementptr %struct.foo* %u24, i1 0, i32 0
	store i64 %u23, i64* %u25
	%u26 = load %struct.foo** %math2
	%u27 = getelementptr %struct.foo* %u26, i1 0, i32 0
	store i64 3, i64* %u27
	%u28 = load %struct.foo** %math1
	%u29 = getelementptr %struct.foo* %u28, i1 0, i32 0
	%u30 = load i64* %u29
	%u31 = load %struct.foo** %math1
	%u32 = getelementptr %struct.foo* %u31, i1 0, i32 2
	%u33 = load %struct.simple** %u32
	%u34 = getelementptr %struct.simple* %u33, i1 0, i32 0
	store i64 %u30, i64* %u34
	%u35 = load %struct.foo** %math2
	%u36 = getelementptr %struct.foo* %u35, i1 0, i32 0
	%u37 = load i64* %u36
	%u38 = load %struct.foo** %math2
	%u39 = getelementptr %struct.foo* %u38, i1 0, i32 2
	%u40 = load %struct.simple** %u39
	%u41 = getelementptr %struct.simple* %u40, i1 0, i32 0
	store i64 %u37, i64* %u41
	%u42 = load i64* %_P_num
	%u43 = icmp sgt i64 %u42, 0
	br i1 %u43, label %LU24, label %LU23
LU24:
	%u44 = load %struct.foo** %math1
	%u45 = getelementptr %struct.foo* %u44, i1 0, i32 0
	%u46 = load i64* %u45
	%u47 = load %struct.foo** %math2
	%u48 = getelementptr %struct.foo* %u47, i1 0, i32 0
	%u49 = load i64* %u48
	%u50 = mul i64 %u46, %u49
	store i64 %u50, i64* %tmp
	%u52 = load %struct.foo** %math1
	%u53 = getelementptr %struct.foo* %u52, i1 0, i32 2
	%u54 = load %struct.simple** %u53
	%u55 = getelementptr %struct.simple* %u54, i1 0, i32 0
	%u56 = load i64* %u55
	%u51 = load i64* %tmp
	%u57 = mul i64 %u51, %u56
	%u58 = load %struct.foo** %math2
	%u59 = getelementptr %struct.foo* %u58, i1 0, i32 0
	%u60 = load i64* %u59
	%u61 = sdiv i64 %u57, %u60
	store i64 %u61, i64* %tmp
	%u62 = load %struct.foo** %math2
	%u63 = getelementptr %struct.foo* %u62, i1 0, i32 2
	%u64 = load %struct.simple** %u63
	%u65 = getelementptr %struct.simple* %u64, i1 0, i32 0
	%u66 = load i64* %u65
	%u67 = load %struct.foo** %math1
	%u68 = getelementptr %struct.foo* %u67, i1 0, i32 0
	%u69 = load i64* %u68
	%u70 = call i64 @add(i64 %u66, i64 %u69)
	store i64 %u70, i64* %tmp
	%u71 = load %struct.foo** %math2
	%u72 = getelementptr %struct.foo* %u71, i1 0, i32 0
	%u73 = load i64* %u72
	%u74 = load %struct.foo** %math1
	%u75 = getelementptr %struct.foo* %u74, i1 0, i32 0
	%u76 = load i64* %u75
	%u77 = sub i64 %u73, %u76
	store i64 %u77, i64* %tmp
	%u78 = load i64* %_P_num
	%u79 = sub i64 %u78, 1
	store i64 %u79, i64* %_P_num
	%u80 = load i64* %_P_num
	%u81 = icmp sgt i64 %u80, 0
	br i1 %u81, label %LU24, label %LU23
LU23:
	%u82 = load %struct.foo** %math1
	%u83 = bitcast %struct.foo* %u82 to i8*
	call void @free(i8* %u83)
	%u84 = load %struct.foo** %math2
	%u85 = bitcast %struct.foo* %u84 to i8*
	call void @free(i8* %u85)
	br label %LU12
LU12:
	ret void
}

define void @objinstantiation(i64 %num)
{
LU33:
	%_P_num = alloca i64
	%tmp = alloca %struct.foo*
	store i64 %num, i64* %_P_num
	%u86 = load i64* %_P_num
	%u87 = icmp sgt i64 %u86, 0
	br i1 %u87, label %LU36, label %LU35
LU36:
	%u88 = call i8* @malloc(i64 24)
	%u89 = bitcast i8* %u88 to %struct.foo*
	store %struct.foo* %u89, %struct.foo** %tmp
	%u90 = load %struct.foo** %tmp
	%u91 = bitcast %struct.foo* %u90 to i8*
	call void @free(i8* %u91)
	%u92 = load i64* %_P_num
	%u93 = sub i64 %u92, 1
	store i64 %u93, i64* %_P_num
	%u94 = load i64* %_P_num
	%u95 = icmp sgt i64 %u94, 0
	br i1 %u95, label %LU36, label %LU35
LU35:
	br label %LU32
LU32:
	ret void
}

define i64 @ackermann(i64 %m, i64 %n)
{
LU41:
	%_retval_ = alloca i64
	%_P_m = alloca i64
	%_P_n = alloca i64
	store i64 %m, i64* %_P_m
	store i64 %n, i64* %_P_n
	%u96 = load i64* %_P_m
	%u97 = icmp eq i64 %u96, 0
	br i1 %u97, label %LU43, label %LU45
LU43:
	%u98 = load i64* %_P_n
	%u99 = add i64 %u98, 1
	store i64 %u99, i64* %_retval_
	br label %LU40
LU45:
	br label %LU46
LU46:
	%u100 = load i64* %_P_n
	%u101 = icmp eq i64 %u100, 0
	br i1 %u101, label %LU48, label %LU50
LU48:
	%u102 = load i64* %_P_m
	%u103 = sub i64 %u102, 1
	%u104 = call i64 @ackermann(i64 %u103, i64 1)
	store i64 %u104, i64* %_retval_
	br label %LU40
LU50:
	%u105 = load i64* %_P_m
	%u106 = sub i64 %u105, 1
	%u108 = load i64* %_P_n
	%u109 = sub i64 %u108, 1
	%u107 = load i64* %_P_m
	%u110 = call i64 @ackermann(i64 %u107, i64 %u109)
	%u111 = call i64 @ackermann(i64 %u106, i64 %u110)
	store i64 %u111, i64* %_retval_
	br label %LU40
LU40:
	%u112 = load i64* %_retval_
	ret i64 %u112
}

define i64 @main()
{
LU53:
	%_retval_ = alloca i64
	%a = alloca i64
	%b = alloca i64
	%c = alloca i64
	%d = alloca i64
	%e = alloca i64
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* %a)
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* %b)
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* %c)
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* %d)
	call i32 (i8*, ...)* @scanf(i8* getelementptr inbounds ([4 x i8]* @.read, i32 0, i32 0), i64* %e)
	%u113 = load i64* %a
	call void @tailrecursive(i64 %u113)
	%u115 = load i64* %a
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i64 %u115)
	%u116 = load i64* %b
	call void @domath(i64 %u116)
	%u118 = load i64* %b
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i64 %u118)
	%u119 = load i64* %c
	call void @objinstantiation(i64 %u119)
	%u121 = load i64* %c
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i64 %u121)
	%u122 = load i64* %d
	%u123 = load i64* %e
	%u124 = call i64 @ackermann(i64 %u122, i64 %u123)
	call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.println, i32 0, i32 0), i64 %u124)
	store i64 0, i64* %_retval_
	br label %LU52
LU52:
	%u125 = load i64* %_retval_
	ret i64 %u125
}

declare i8* @malloc(i64)
declare void @free(i8*)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
@.println = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.print = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@.read = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@.read_scratch = common global i64 0, align 8