; ModuleID = 'tasks/task.c'
source_filename = "tasks/task.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

%struct.record = type { ptr, i32, %union.anon }
%union.anon = type { %struct.anon }
%struct.anon = type { i32, i32, [31 x i8] }
%struct.test_task_context = type { ptr, ptr, i32, i32, i8, i8, [50 x i32], [50 x [50 x i32]], [31 x i8], [31 x i8] }

@global_ch_1_glob = internal global i8 0, align 1, !dbg !0
@global_int_glob = internal global i32 0, align 4, !dbg !22
@.str = private unnamed_addr constant [31 x i8] c"DHRYSTONE PROGRAM, 2'ND STRING\00", align 1, !dbg !14
@.str.1 = private unnamed_addr constant [31 x i8] c"DHRYSTONE PROGRAM, 3'RD STRING\00", align 1, !dbg !20

; Function Attrs: noinline nounwind uwtable
define dso_local void @Proc_1(ptr noundef %0) #0 !dbg !33 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !63, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata ptr %3, metadata !65, metadata !DIExpression()), !dbg !66
  %4 = load ptr, ptr %2, align 8, !dbg !67
  %5 = getelementptr inbounds %struct.record, ptr %4, i32 0, i32 0, !dbg !68
  %6 = load ptr, ptr %5, align 8, !dbg !68
  store ptr %6, ptr %3, align 8, !dbg !66
  %7 = load ptr, ptr %2, align 8, !dbg !69
  %8 = getelementptr inbounds %struct.record, ptr %7, i32 0, i32 0, !dbg !70
  %9 = load ptr, ptr %8, align 8, !dbg !70
  %10 = load ptr, ptr %2, align 8, !dbg !71
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %9, ptr align 8 %10, i64 56, i1 false), !dbg !72
  %11 = load ptr, ptr %2, align 8, !dbg !73
  %12 = getelementptr inbounds %struct.record, ptr %11, i32 0, i32 2, !dbg !74
  %13 = getelementptr inbounds %struct.anon, ptr %12, i32 0, i32 1, !dbg !75
  store i32 5, ptr %13, align 4, !dbg !76
  %14 = load ptr, ptr %2, align 8, !dbg !77
  %15 = getelementptr inbounds %struct.record, ptr %14, i32 0, i32 2, !dbg !78
  %16 = getelementptr inbounds %struct.anon, ptr %15, i32 0, i32 1, !dbg !79
  %17 = load i32, ptr %16, align 4, !dbg !79
  %18 = load ptr, ptr %3, align 8, !dbg !80
  %19 = getelementptr inbounds %struct.record, ptr %18, i32 0, i32 2, !dbg !81
  %20 = getelementptr inbounds %struct.anon, ptr %19, i32 0, i32 1, !dbg !82
  store i32 %17, ptr %20, align 4, !dbg !83
  %21 = load ptr, ptr %2, align 8, !dbg !84
  %22 = getelementptr inbounds %struct.record, ptr %21, i32 0, i32 0, !dbg !85
  %23 = load ptr, ptr %22, align 8, !dbg !85
  %24 = load ptr, ptr %3, align 8, !dbg !86
  %25 = getelementptr inbounds %struct.record, ptr %24, i32 0, i32 0, !dbg !87
  store ptr %23, ptr %25, align 8, !dbg !88
  %26 = load ptr, ptr %3, align 8, !dbg !89
  %27 = getelementptr inbounds %struct.record, ptr %26, i32 0, i32 0, !dbg !90
  call void @Proc_3(ptr noundef %27), !dbg !91
  %28 = load ptr, ptr %3, align 8, !dbg !92
  %29 = getelementptr inbounds %struct.record, ptr %28, i32 0, i32 1, !dbg !94
  %30 = load i32, ptr %29, align 8, !dbg !94
  %31 = icmp eq i32 %30, 0, !dbg !95
  br i1 %31, label %32, label %55, !dbg !96

32:                                               ; preds = %1
  %33 = load ptr, ptr %3, align 8, !dbg !97
  %34 = getelementptr inbounds %struct.record, ptr %33, i32 0, i32 2, !dbg !99
  %35 = getelementptr inbounds %struct.anon, ptr %34, i32 0, i32 1, !dbg !100
  store i32 6, ptr %35, align 4, !dbg !101
  %36 = load ptr, ptr %2, align 8, !dbg !102
  %37 = getelementptr inbounds %struct.record, ptr %36, i32 0, i32 2, !dbg !103
  %38 = getelementptr inbounds %struct.anon, ptr %37, i32 0, i32 0, !dbg !104
  %39 = load i32, ptr %38, align 4, !dbg !104
  %40 = load ptr, ptr %3, align 8, !dbg !105
  %41 = getelementptr inbounds %struct.record, ptr %40, i32 0, i32 2, !dbg !106
  %42 = getelementptr inbounds %struct.anon, ptr %41, i32 0, i32 0, !dbg !107
  call void @Proc_6(i32 noundef %39, ptr noundef %42), !dbg !108
  %43 = load ptr, ptr %2, align 8, !dbg !109
  %44 = getelementptr inbounds %struct.record, ptr %43, i32 0, i32 0, !dbg !110
  %45 = load ptr, ptr %44, align 8, !dbg !110
  %46 = load ptr, ptr %3, align 8, !dbg !111
  %47 = getelementptr inbounds %struct.record, ptr %46, i32 0, i32 0, !dbg !112
  store ptr %45, ptr %47, align 8, !dbg !113
  %48 = load ptr, ptr %3, align 8, !dbg !114
  %49 = getelementptr inbounds %struct.record, ptr %48, i32 0, i32 2, !dbg !115
  %50 = getelementptr inbounds %struct.anon, ptr %49, i32 0, i32 1, !dbg !116
  %51 = load i32, ptr %50, align 4, !dbg !116
  %52 = load ptr, ptr %3, align 8, !dbg !117
  %53 = getelementptr inbounds %struct.record, ptr %52, i32 0, i32 2, !dbg !118
  %54 = getelementptr inbounds %struct.anon, ptr %53, i32 0, i32 1, !dbg !119
  call void @Proc_7(i32 noundef %51, i32 noundef 10, ptr noundef %54), !dbg !120
  br label %60, !dbg !121

55:                                               ; preds = %1
  %56 = load ptr, ptr %2, align 8, !dbg !122
  %57 = load ptr, ptr %2, align 8, !dbg !124
  %58 = getelementptr inbounds %struct.record, ptr %57, i32 0, i32 0, !dbg !125
  %59 = load ptr, ptr %58, align 8, !dbg !125
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %56, ptr align 8 %59, i64 56, i1 false), !dbg !126
  br label %60

60:                                               ; preds = %55, %32
  ret void, !dbg !127
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @Proc_3(ptr noundef %0) #0 !dbg !128 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !132, metadata !DIExpression()), !dbg !133
  %3 = load i32, ptr @global_int_glob, align 4, !dbg !134
  %4 = icmp sgt i32 %3, 100, !dbg !136
  br i1 %4, label %5, label %6, !dbg !137

5:                                                ; preds = %1
  store i32 100, ptr @global_int_glob, align 4, !dbg !138
  br label %6, !dbg !140

6:                                                ; preds = %5, %1
  ret void, !dbg !141
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Proc_6(i32 noundef %0, ptr noundef %1) #0 !dbg !142 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !146, metadata !DIExpression()), !dbg !147
  store ptr %1, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !148, metadata !DIExpression()), !dbg !149
  %5 = load i32, ptr %3, align 4, !dbg !150
  %6 = load ptr, ptr %4, align 8, !dbg !151
  store i32 %5, ptr %6, align 4, !dbg !152
  %7 = load i32, ptr %3, align 4, !dbg !153
  %8 = call i32 @Func_3(i32 noundef %7), !dbg !155
  %9 = icmp ne i32 %8, 0, !dbg !155
  br i1 %9, label %12, label %10, !dbg !156

10:                                               ; preds = %2
  %11 = load ptr, ptr %4, align 8, !dbg !157
  store i32 3, ptr %11, align 4, !dbg !159
  br label %12, !dbg !160

12:                                               ; preds = %10, %2
  %13 = load i32, ptr %3, align 4, !dbg !161
  switch i32 %13, label %29 [
    i32 0, label %14
    i32 1, label %16
    i32 2, label %24
    i32 3, label %26
    i32 4, label %27
  ], !dbg !162

14:                                               ; preds = %12
  %15 = load ptr, ptr %4, align 8, !dbg !163
  store i32 0, ptr %15, align 4, !dbg !165
  br label %29, !dbg !166

16:                                               ; preds = %12
  %17 = load i32, ptr @global_int_glob, align 4, !dbg !167
  %18 = icmp sgt i32 %17, 100, !dbg !169
  br i1 %18, label %19, label %21, !dbg !170

19:                                               ; preds = %16
  %20 = load ptr, ptr %4, align 8, !dbg !171
  store i32 0, ptr %20, align 4, !dbg !172
  br label %23, !dbg !173

21:                                               ; preds = %16
  %22 = load ptr, ptr %4, align 8, !dbg !174
  store i32 3, ptr %22, align 4, !dbg !175
  br label %23

23:                                               ; preds = %21, %19
  br label %29, !dbg !176

24:                                               ; preds = %12
  %25 = load ptr, ptr %4, align 8, !dbg !177
  store i32 1, ptr %25, align 4, !dbg !178
  br label %29, !dbg !179

26:                                               ; preds = %12
  br label %29, !dbg !180

27:                                               ; preds = %12
  %28 = load ptr, ptr %4, align 8, !dbg !181
  store i32 2, ptr %28, align 4, !dbg !182
  br label %29, !dbg !183

29:                                               ; preds = %12, %27, %26, %24, %23, %14
  ret void, !dbg !184
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Proc_7(i32 noundef %0, i32 noundef %1, ptr noundef %2) #0 !dbg !185 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !190, metadata !DIExpression()), !dbg !191
  store i32 %1, ptr %5, align 4
  call void @llvm.dbg.declare(metadata ptr %5, metadata !192, metadata !DIExpression()), !dbg !193
  store ptr %2, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !194, metadata !DIExpression()), !dbg !195
  call void @llvm.dbg.declare(metadata ptr %7, metadata !196, metadata !DIExpression()), !dbg !197
  %8 = load i32, ptr %4, align 4, !dbg !198
  %9 = add nsw i32 %8, 2, !dbg !199
  store i32 %9, ptr %7, align 4, !dbg !200
  %10 = load i32, ptr %5, align 4, !dbg !201
  %11 = load i32, ptr %7, align 4, !dbg !202
  %12 = add nsw i32 %10, %11, !dbg !203
  %13 = load ptr, ptr %6, align 8, !dbg !204
  store i32 %12, ptr %13, align 4, !dbg !205
  ret void, !dbg !206
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Proc_2(ptr noundef %0) #0 !dbg !207 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !210, metadata !DIExpression()), !dbg !211
  call void @llvm.dbg.declare(metadata ptr %3, metadata !212, metadata !DIExpression()), !dbg !213
  call void @llvm.dbg.declare(metadata ptr %4, metadata !214, metadata !DIExpression()), !dbg !215
  %5 = load ptr, ptr %2, align 8, !dbg !216
  %6 = load i32, ptr %5, align 4, !dbg !217
  %7 = add nsw i32 %6, 10, !dbg !218
  store i32 %7, ptr %3, align 4, !dbg !219
  %8 = load i8, ptr @global_ch_1_glob, align 1, !dbg !220
  %9 = zext i8 %8 to i32, !dbg !220
  %10 = icmp eq i32 %9, 65, !dbg !222
  br i1 %10, label %11, label %18, !dbg !223

11:                                               ; preds = %1
  %12 = load i32, ptr %3, align 4, !dbg !224
  %13 = sub nsw i32 %12, 1, !dbg !224
  store i32 %13, ptr %3, align 4, !dbg !224
  %14 = load i32, ptr %3, align 4, !dbg !226
  %15 = load i32, ptr @global_int_glob, align 4, !dbg !227
  %16 = sub nsw i32 %14, %15, !dbg !228
  %17 = load ptr, ptr %2, align 8, !dbg !229
  store i32 %16, ptr %17, align 4, !dbg !230
  store i32 0, ptr %4, align 4, !dbg !231
  br label %21, !dbg !232

18:                                               ; preds = %1
  %19 = load i32, ptr %3, align 4, !dbg !233
  %20 = load ptr, ptr %2, align 8, !dbg !235
  store i32 %19, ptr %20, align 4, !dbg !236
  store i32 0, ptr %4, align 4, !dbg !237
  br label %21

21:                                               ; preds = %18, %11
  ret void, !dbg !238
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Proc_4() #0 !dbg !239 {
  %1 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata ptr %1, metadata !242, metadata !DIExpression()), !dbg !244
  %2 = load i8, ptr @global_ch_1_glob, align 1, !dbg !245
  %3 = zext i8 %2 to i32, !dbg !245
  %4 = icmp eq i32 %3, 65, !dbg !246
  %5 = zext i1 %4 to i32, !dbg !246
  store i32 %5, ptr %1, align 4, !dbg !247
  store i8 66, ptr @global_ch_1_glob, align 1, !dbg !248
  ret void, !dbg !249
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Proc_5() #0 !dbg !250 {
  store i8 65, ptr @global_ch_1_glob, align 1, !dbg !251
  %1 = load i8, ptr @global_ch_1_glob, align 1, !dbg !252
  store i8 %1, ptr @global_ch_1_glob, align 1, !dbg !253
  ret void, !dbg !254
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @Func_3(i32 noundef %0) #0 !dbg !255 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !258, metadata !DIExpression()), !dbg !259
  call void @llvm.dbg.declare(metadata ptr %4, metadata !260, metadata !DIExpression()), !dbg !261
  %5 = load i32, ptr %3, align 4, !dbg !262
  store i32 %5, ptr %4, align 4, !dbg !263
  %6 = load i32, ptr %4, align 4, !dbg !264
  %7 = icmp eq i32 %6, 2, !dbg !266
  br i1 %7, label %8, label %9, !dbg !267

8:                                                ; preds = %1
  store i32 1, ptr %2, align 4, !dbg !268
  br label %10, !dbg !268

9:                                                ; preds = %1
  store i32 0, ptr %2, align 4, !dbg !269
  br label %10, !dbg !269

10:                                               ; preds = %9, %8
  %11 = load i32, ptr %2, align 4, !dbg !270
  ret i32 %11, !dbg !270
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @Proc_8(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 !dbg !271 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !279, metadata !DIExpression()), !dbg !280
  store ptr %1, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !281, metadata !DIExpression()), !dbg !282
  store i32 %2, ptr %7, align 4
  call void @llvm.dbg.declare(metadata ptr %7, metadata !283, metadata !DIExpression()), !dbg !284
  store i32 %3, ptr %8, align 4
  call void @llvm.dbg.declare(metadata ptr %8, metadata !285, metadata !DIExpression()), !dbg !286
  call void @llvm.dbg.declare(metadata ptr %9, metadata !287, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.declare(metadata ptr %10, metadata !289, metadata !DIExpression()), !dbg !290
  %11 = load i32, ptr %7, align 4, !dbg !291
  %12 = add nsw i32 %11, 5, !dbg !292
  store i32 %12, ptr %10, align 4, !dbg !293
  %13 = load i32, ptr %10, align 4, !dbg !294
  %14 = icmp sge i32 %13, 50, !dbg !296
  br i1 %14, label %31, label %15, !dbg !297

15:                                               ; preds = %4
  %16 = load i32, ptr %10, align 4, !dbg !298
  %17 = add nsw i32 %16, 1, !dbg !299
  %18 = icmp sge i32 %17, 50, !dbg !300
  br i1 %18, label %31, label %19, !dbg !301

19:                                               ; preds = %15
  %20 = load i32, ptr %10, align 4, !dbg !302
  %21 = add nsw i32 %20, 30, !dbg !303
  %22 = icmp sge i32 %21, 50, !dbg !304
  br i1 %22, label %31, label %23, !dbg !305

23:                                               ; preds = %19
  %24 = load i32, ptr %10, align 4, !dbg !306
  %25 = add nsw i32 %24, 20, !dbg !307
  %26 = icmp sge i32 %25, 50, !dbg !308
  br i1 %26, label %31, label %27, !dbg !309

27:                                               ; preds = %23
  %28 = load i32, ptr %10, align 4, !dbg !310
  %29 = sub nsw i32 %28, 1, !dbg !311
  %30 = icmp slt i32 %29, 0, !dbg !312
  br i1 %30, label %31, label %32, !dbg !313

31:                                               ; preds = %27, %23, %19, %15, %4
  br label %96, !dbg !314

32:                                               ; preds = %27
  %33 = load i32, ptr %8, align 4, !dbg !316
  %34 = load ptr, ptr %5, align 8, !dbg !317
  %35 = load i32, ptr %10, align 4, !dbg !318
  %36 = sext i32 %35 to i64, !dbg !317
  %37 = getelementptr inbounds i32, ptr %34, i64 %36, !dbg !317
  store i32 %33, ptr %37, align 4, !dbg !319
  %38 = load ptr, ptr %5, align 8, !dbg !320
  %39 = load i32, ptr %10, align 4, !dbg !321
  %40 = sext i32 %39 to i64, !dbg !320
  %41 = getelementptr inbounds i32, ptr %38, i64 %40, !dbg !320
  %42 = load i32, ptr %41, align 4, !dbg !320
  %43 = load ptr, ptr %5, align 8, !dbg !322
  %44 = load i32, ptr %10, align 4, !dbg !323
  %45 = add nsw i32 %44, 1, !dbg !324
  %46 = sext i32 %45 to i64, !dbg !322
  %47 = getelementptr inbounds i32, ptr %43, i64 %46, !dbg !322
  store i32 %42, ptr %47, align 4, !dbg !325
  %48 = load i32, ptr %10, align 4, !dbg !326
  %49 = load ptr, ptr %5, align 8, !dbg !327
  %50 = load i32, ptr %10, align 4, !dbg !328
  %51 = add nsw i32 %50, 30, !dbg !329
  %52 = sext i32 %51 to i64, !dbg !327
  %53 = getelementptr inbounds i32, ptr %49, i64 %52, !dbg !327
  store i32 %48, ptr %53, align 4, !dbg !330
  %54 = load i32, ptr %10, align 4, !dbg !331
  store i32 %54, ptr %9, align 4, !dbg !333
  br label %55, !dbg !334

55:                                               ; preds = %69, %32
  %56 = load i32, ptr %9, align 4, !dbg !335
  %57 = load i32, ptr %10, align 4, !dbg !337
  %58 = add nsw i32 %57, 1, !dbg !338
  %59 = icmp sle i32 %56, %58, !dbg !339
  br i1 %59, label %60, label %72, !dbg !340

60:                                               ; preds = %55
  %61 = load i32, ptr %10, align 4, !dbg !341
  %62 = load ptr, ptr %6, align 8, !dbg !342
  %63 = load i32, ptr %10, align 4, !dbg !343
  %64 = sext i32 %63 to i64, !dbg !342
  %65 = getelementptr inbounds [50 x i32], ptr %62, i64 %64, !dbg !342
  %66 = load i32, ptr %9, align 4, !dbg !344
  %67 = sext i32 %66 to i64, !dbg !342
  %68 = getelementptr inbounds [50 x i32], ptr %65, i64 0, i64 %67, !dbg !342
  store i32 %61, ptr %68, align 4, !dbg !345
  br label %69, !dbg !342

69:                                               ; preds = %60
  %70 = load i32, ptr %9, align 4, !dbg !346
  %71 = add nsw i32 %70, 1, !dbg !346
  store i32 %71, ptr %9, align 4, !dbg !346
  br label %55, !dbg !347, !llvm.loop !348

72:                                               ; preds = %55
  %73 = load ptr, ptr %6, align 8, !dbg !351
  %74 = load i32, ptr %10, align 4, !dbg !352
  %75 = sext i32 %74 to i64, !dbg !351
  %76 = getelementptr inbounds [50 x i32], ptr %73, i64 %75, !dbg !351
  %77 = load i32, ptr %10, align 4, !dbg !353
  %78 = sub nsw i32 %77, 1, !dbg !354
  %79 = sext i32 %78 to i64, !dbg !351
  %80 = getelementptr inbounds [50 x i32], ptr %76, i64 0, i64 %79, !dbg !351
  %81 = load i32, ptr %80, align 4, !dbg !355
  %82 = add nsw i32 %81, 1, !dbg !355
  store i32 %82, ptr %80, align 4, !dbg !355
  %83 = load ptr, ptr %5, align 8, !dbg !356
  %84 = load i32, ptr %10, align 4, !dbg !357
  %85 = sext i32 %84 to i64, !dbg !356
  %86 = getelementptr inbounds i32, ptr %83, i64 %85, !dbg !356
  %87 = load i32, ptr %86, align 4, !dbg !356
  %88 = load ptr, ptr %6, align 8, !dbg !358
  %89 = load i32, ptr %10, align 4, !dbg !359
  %90 = add nsw i32 %89, 20, !dbg !360
  %91 = sext i32 %90 to i64, !dbg !358
  %92 = getelementptr inbounds [50 x i32], ptr %88, i64 %91, !dbg !358
  %93 = load i32, ptr %10, align 4, !dbg !361
  %94 = sext i32 %93 to i64, !dbg !358
  %95 = getelementptr inbounds [50 x i32], ptr %92, i64 0, i64 %94, !dbg !358
  store i32 %87, ptr %95, align 4, !dbg !362
  store i32 5, ptr @global_int_glob, align 4, !dbg !363
  br label %96, !dbg !364

96:                                               ; preds = %72, %31
  ret void, !dbg !364
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @Func_1(i8 noundef %0, i8 noundef %1) #0 !dbg !365 {
  %3 = alloca i32, align 4
  %4 = alloca i8, align 1
  %5 = alloca i8, align 1
  %6 = alloca i8, align 1
  %7 = alloca i8, align 1
  store i8 %0, ptr %4, align 1
  call void @llvm.dbg.declare(metadata ptr %4, metadata !369, metadata !DIExpression()), !dbg !370
  store i8 %1, ptr %5, align 1
  call void @llvm.dbg.declare(metadata ptr %5, metadata !371, metadata !DIExpression()), !dbg !372
  call void @llvm.dbg.declare(metadata ptr %6, metadata !373, metadata !DIExpression()), !dbg !374
  call void @llvm.dbg.declare(metadata ptr %7, metadata !375, metadata !DIExpression()), !dbg !376
  %8 = load i8, ptr %4, align 1, !dbg !377
  store i8 %8, ptr %6, align 1, !dbg !378
  %9 = load i8, ptr %6, align 1, !dbg !379
  store i8 %9, ptr %7, align 1, !dbg !380
  %10 = load i8, ptr %7, align 1, !dbg !381
  %11 = zext i8 %10 to i32, !dbg !381
  %12 = load i8, ptr %5, align 1, !dbg !383
  %13 = zext i8 %12 to i32, !dbg !383
  %14 = icmp ne i32 %11, %13, !dbg !384
  br i1 %14, label %15, label %16, !dbg !385

15:                                               ; preds = %2
  store i32 0, ptr %3, align 4, !dbg !386
  br label %18, !dbg !386

16:                                               ; preds = %2
  %17 = load i8, ptr %6, align 1, !dbg !387
  store i8 %17, ptr @global_ch_1_glob, align 1, !dbg !389
  store i32 1, ptr %3, align 4, !dbg !390
  br label %18, !dbg !390

18:                                               ; preds = %16, %15
  %19 = load i32, ptr %3, align 4, !dbg !391
  ret i32 %19, !dbg !391
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @Func_2(ptr noundef %0, ptr noundef %1) #0 !dbg !392 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i8, align 1
  store ptr %0, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !396, metadata !DIExpression()), !dbg !397
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !398, metadata !DIExpression()), !dbg !399
  call void @llvm.dbg.declare(metadata ptr %6, metadata !400, metadata !DIExpression()), !dbg !402
  call void @llvm.dbg.declare(metadata ptr %7, metadata !403, metadata !DIExpression()), !dbg !404
  store i8 65, ptr %7, align 1, !dbg !404
  store i32 2, ptr %6, align 4, !dbg !405
  br label %8, !dbg !406

8:                                                ; preds = %29, %2
  %9 = load i32, ptr %6, align 4, !dbg !407
  %10 = icmp sle i32 %9, 2, !dbg !408
  br i1 %10, label %11, label %30, !dbg !406

11:                                               ; preds = %8
  %12 = load ptr, ptr %4, align 8, !dbg !409
  %13 = load i32, ptr %6, align 4, !dbg !412
  %14 = sext i32 %13 to i64, !dbg !409
  %15 = getelementptr inbounds i8, ptr %12, i64 %14, !dbg !409
  %16 = load i8, ptr %15, align 1, !dbg !409
  %17 = load ptr, ptr %5, align 8, !dbg !413
  %18 = load i32, ptr %6, align 4, !dbg !414
  %19 = add nsw i32 %18, 1, !dbg !415
  %20 = sext i32 %19 to i64, !dbg !413
  %21 = getelementptr inbounds i8, ptr %17, i64 %20, !dbg !413
  %22 = load i8, ptr %21, align 1, !dbg !413
  %23 = call i32 @Func_1(i8 noundef %16, i8 noundef %22), !dbg !416
  %24 = icmp eq i32 %23, 0, !dbg !417
  br i1 %24, label %25, label %28, !dbg !418

25:                                               ; preds = %11
  store i8 65, ptr %7, align 1, !dbg !419
  %26 = load i32, ptr %6, align 4, !dbg !421
  %27 = add nsw i32 %26, 1, !dbg !421
  store i32 %27, ptr %6, align 4, !dbg !421
  br label %29, !dbg !422

28:                                               ; preds = %11
  br label %30, !dbg !423

29:                                               ; preds = %25
  br label %8, !dbg !406, !llvm.loop !425

30:                                               ; preds = %28, %8
  %31 = load i8, ptr %7, align 1, !dbg !427
  %32 = zext i8 %31 to i32, !dbg !427
  %33 = icmp sge i32 %32, 87, !dbg !429
  br i1 %33, label %34, label %39, !dbg !430

34:                                               ; preds = %30
  %35 = load i8, ptr %7, align 1, !dbg !431
  %36 = zext i8 %35 to i32, !dbg !431
  %37 = icmp slt i32 %36, 90, !dbg !432
  br i1 %37, label %38, label %39, !dbg !433

38:                                               ; preds = %34
  store i32 7, ptr %6, align 4, !dbg !434
  br label %39, !dbg !435

39:                                               ; preds = %38, %34, %30
  %40 = load i8, ptr %7, align 1, !dbg !436
  %41 = zext i8 %40 to i32, !dbg !436
  %42 = icmp eq i32 %41, 82, !dbg !438
  br i1 %42, label %43, label %44, !dbg !439

43:                                               ; preds = %39
  store i32 1, ptr %3, align 4, !dbg !440
  br label %54, !dbg !440

44:                                               ; preds = %39
  %45 = load ptr, ptr %4, align 8, !dbg !441
  %46 = load ptr, ptr %5, align 8, !dbg !444
  %47 = call i32 @strcmp(ptr noundef %45, ptr noundef %46) #5, !dbg !445
  %48 = icmp sgt i32 %47, 0, !dbg !446
  br i1 %48, label %49, label %53, !dbg !447

49:                                               ; preds = %44
  %50 = load i32, ptr %6, align 4, !dbg !448
  %51 = add nsw i32 %50, 7, !dbg !448
  store i32 %51, ptr %6, align 4, !dbg !448
  %52 = load i32, ptr %6, align 4, !dbg !450
  store i32 %52, ptr @global_int_glob, align 4, !dbg !451
  store i32 1, ptr %3, align 4, !dbg !452
  br label %54, !dbg !452

53:                                               ; preds = %44
  store i32 0, ptr %3, align 4, !dbg !453
  br label %54, !dbg !453

54:                                               ; preds = %53, %49, %43
  %55 = load i32, ptr %3, align 4, !dbg !454
  ret i32 %55, !dbg !454
}

; Function Attrs: nounwind readonly willreturn
declare i32 @strcmp(ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @run_dhrystone_workload(ptr noundef %0) #0 !dbg !455 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i8, align 1
  %7 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !477, metadata !DIExpression()), !dbg !478
  call void @llvm.dbg.declare(metadata ptr %3, metadata !479, metadata !DIExpression()), !dbg !480
  call void @llvm.dbg.declare(metadata ptr %4, metadata !481, metadata !DIExpression()), !dbg !482
  call void @llvm.dbg.declare(metadata ptr %5, metadata !483, metadata !DIExpression()), !dbg !484
  call void @llvm.dbg.declare(metadata ptr %6, metadata !485, metadata !DIExpression()), !dbg !486
  call void @llvm.dbg.declare(metadata ptr %7, metadata !487, metadata !DIExpression()), !dbg !488
  call void @Proc_5(), !dbg !489
  call void @Proc_4(), !dbg !490
  store i32 2, ptr %3, align 4, !dbg !491
  store i32 3, ptr %4, align 4, !dbg !492
  %8 = load ptr, ptr %2, align 8, !dbg !493
  %9 = getelementptr inbounds %struct.test_task_context, ptr %8, i32 0, i32 9, !dbg !494
  %10 = getelementptr inbounds [31 x i8], ptr %9, i64 0, i64 0, !dbg !493
  %11 = call ptr @strcpy(ptr noundef %10, ptr noundef @.str) #6, !dbg !495
  store i32 1, ptr %7, align 4, !dbg !496
  %12 = load ptr, ptr %2, align 8, !dbg !497
  %13 = getelementptr inbounds %struct.test_task_context, ptr %12, i32 0, i32 8, !dbg !498
  %14 = getelementptr inbounds [31 x i8], ptr %13, i64 0, i64 0, !dbg !497
  %15 = load ptr, ptr %2, align 8, !dbg !499
  %16 = getelementptr inbounds %struct.test_task_context, ptr %15, i32 0, i32 9, !dbg !500
  %17 = getelementptr inbounds [31 x i8], ptr %16, i64 0, i64 0, !dbg !499
  %18 = call i32 @Func_2(ptr noundef %14, ptr noundef %17), !dbg !501
  %19 = icmp ne i32 %18, 0, !dbg !502
  %20 = xor i1 %19, true, !dbg !502
  %21 = zext i1 %20 to i32, !dbg !502
  %22 = load ptr, ptr %2, align 8, !dbg !503
  %23 = getelementptr inbounds %struct.test_task_context, ptr %22, i32 0, i32 3, !dbg !504
  store i32 %21, ptr %23, align 4, !dbg !505
  br label %24, !dbg !506

24:                                               ; preds = %28, %1
  %25 = load i32, ptr %3, align 4, !dbg !507
  %26 = load i32, ptr %4, align 4, !dbg !508
  %27 = icmp slt i32 %25, %26, !dbg !509
  br i1 %27, label %28, label %37, !dbg !506

28:                                               ; preds = %24
  %29 = load i32, ptr %3, align 4, !dbg !510
  %30 = mul nsw i32 5, %29, !dbg !512
  %31 = load i32, ptr %4, align 4, !dbg !513
  %32 = sub nsw i32 %30, %31, !dbg !514
  store i32 %32, ptr %5, align 4, !dbg !515
  %33 = load i32, ptr %3, align 4, !dbg !516
  %34 = load i32, ptr %4, align 4, !dbg !517
  call void @Proc_7(i32 noundef %33, i32 noundef %34, ptr noundef %5), !dbg !518
  %35 = load i32, ptr %3, align 4, !dbg !519
  %36 = add nsw i32 %35, 1, !dbg !519
  store i32 %36, ptr %3, align 4, !dbg !519
  br label %24, !dbg !506, !llvm.loop !520

37:                                               ; preds = %24
  %38 = load ptr, ptr %2, align 8, !dbg !522
  %39 = getelementptr inbounds %struct.test_task_context, ptr %38, i32 0, i32 6, !dbg !523
  %40 = getelementptr inbounds [50 x i32], ptr %39, i64 0, i64 0, !dbg !522
  %41 = load ptr, ptr %2, align 8, !dbg !524
  %42 = getelementptr inbounds %struct.test_task_context, ptr %41, i32 0, i32 7, !dbg !525
  %43 = getelementptr inbounds [50 x [50 x i32]], ptr %42, i64 0, i64 0, !dbg !524
  %44 = load i32, ptr %3, align 4, !dbg !526
  %45 = load i32, ptr %5, align 4, !dbg !527
  call void @Proc_8(ptr noundef %40, ptr noundef %43, i32 noundef %44, i32 noundef %45), !dbg !528
  %46 = load ptr, ptr %2, align 8, !dbg !529
  %47 = getelementptr inbounds %struct.test_task_context, ptr %46, i32 0, i32 0, !dbg !530
  %48 = load ptr, ptr %47, align 8, !dbg !530
  call void @Proc_1(ptr noundef %48), !dbg !531
  store i8 65, ptr %6, align 1, !dbg !532
  br label %49, !dbg !534

49:                                               ; preds = %74, %37
  %50 = load i8, ptr %6, align 1, !dbg !535
  %51 = zext i8 %50 to i32, !dbg !535
  %52 = load ptr, ptr %2, align 8, !dbg !537
  %53 = getelementptr inbounds %struct.test_task_context, ptr %52, i32 0, i32 5, !dbg !538
  %54 = load i8, ptr %53, align 1, !dbg !538
  %55 = zext i8 %54 to i32, !dbg !537
  %56 = icmp sle i32 %51, %55, !dbg !539
  br i1 %56, label %57, label %77, !dbg !540

57:                                               ; preds = %49
  %58 = load i32, ptr %7, align 4, !dbg !541
  %59 = load i8, ptr %6, align 1, !dbg !544
  %60 = call i32 @Func_1(i8 noundef %59, i8 noundef 67), !dbg !545
  %61 = icmp eq i32 %58, %60, !dbg !546
  br i1 %61, label %62, label %73, !dbg !547

62:                                               ; preds = %57
  call void @Proc_6(i32 noundef 0, ptr noundef %7), !dbg !548
  %63 = load ptr, ptr %2, align 8, !dbg !550
  %64 = getelementptr inbounds %struct.test_task_context, ptr %63, i32 0, i32 9, !dbg !551
  %65 = getelementptr inbounds [31 x i8], ptr %64, i64 0, i64 0, !dbg !550
  %66 = call ptr @strcpy(ptr noundef %65, ptr noundef @.str.1) #6, !dbg !552
  %67 = load i8, ptr %6, align 1, !dbg !553
  %68 = zext i8 %67 to i32, !dbg !553
  store i32 %68, ptr %4, align 4, !dbg !554
  %69 = load i8, ptr %6, align 1, !dbg !555
  %70 = zext i8 %69 to i32, !dbg !555
  %71 = load ptr, ptr %2, align 8, !dbg !556
  %72 = getelementptr inbounds %struct.test_task_context, ptr %71, i32 0, i32 2, !dbg !557
  store i32 %70, ptr %72, align 8, !dbg !558
  br label %73, !dbg !559

73:                                               ; preds = %62, %57
  br label %74, !dbg !560

74:                                               ; preds = %73
  %75 = load i8, ptr %6, align 1, !dbg !561
  %76 = add i8 %75, 1, !dbg !561
  store i8 %76, ptr %6, align 1, !dbg !561
  br label %49, !dbg !562, !llvm.loop !563

77:                                               ; preds = %49
  %78 = load i32, ptr %4, align 4, !dbg !565
  %79 = load i32, ptr %3, align 4, !dbg !566
  %80 = mul nsw i32 %78, %79, !dbg !567
  store i32 %80, ptr %4, align 4, !dbg !568
  %81 = load i32, ptr %4, align 4, !dbg !569
  %82 = load i32, ptr %5, align 4, !dbg !570
  %83 = sdiv i32 %81, %82, !dbg !571
  store i32 %83, ptr %3, align 4, !dbg !572
  %84 = load i32, ptr %4, align 4, !dbg !573
  %85 = load i32, ptr %5, align 4, !dbg !574
  %86 = sub nsw i32 %84, %85, !dbg !575
  %87 = mul nsw i32 7, %86, !dbg !576
  %88 = load i32, ptr %3, align 4, !dbg !577
  %89 = sub nsw i32 %87, %88, !dbg !578
  store i32 %89, ptr %4, align 4, !dbg !579
  call void @Proc_2(ptr noundef %3), !dbg !580
  ret void, !dbg !581
}

; Function Attrs: nounwind
declare ptr @strcpy(ptr noundef, ptr noundef) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+outline-atomics,+v8a" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nocallback nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+outline-atomics,+v8a" }
attributes #4 = { nounwind "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+outline-atomics,+v8a" }
attributes #5 = { nounwind readonly willreturn }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!25, !26, !27, !28, !29, !30, !31}
!llvm.ident = !{!32}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "global_ch_1_glob", scope: !2, file: !3, line: 73, type: !17, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 15.0.7", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !13, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "tasks/task.c", directory: "/app", checksumkind: CSK_MD5, checksum: "fe061b0f2580595dd2ca1f6e04160248")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !3, line: 21, baseType: !6, size: 32, elements: !7)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!8, !9, !10, !11, !12}
!8 = !DIEnumerator(name: "Ident_1", value: 0)
!9 = !DIEnumerator(name: "Ident_2", value: 1)
!10 = !DIEnumerator(name: "Ident_3", value: 2)
!11 = !DIEnumerator(name: "Ident_4", value: 3)
!12 = !DIEnumerator(name: "Ident_5", value: 4)
!13 = !{!14, !20, !22, !0}
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(scope: null, file: !3, line: 235, type: !16, isLocal: true, isDefinition: true)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 248, elements: !18)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_unsigned_char)
!18 = !{!19}
!19 = !DISubrange(count: 31)
!20 = !DIGlobalVariableExpression(var: !21, expr: !DIExpression())
!21 = distinct !DIGlobalVariable(scope: null, file: !3, line: 251, type: !16, isLocal: true, isDefinition: true)
!22 = !DIGlobalVariableExpression(var: !23, expr: !DIExpression())
!23 = distinct !DIGlobalVariable(name: "global_int_glob", scope: !2, file: !3, line: 72, type: !24, isLocal: true, isDefinition: true)
!24 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!25 = !{i32 7, !"Dwarf Version", i32 5}
!26 = !{i32 2, !"Debug Info Version", i32 3}
!27 = !{i32 1, !"wchar_size", i32 4}
!28 = !{i32 7, !"PIC Level", i32 2}
!29 = !{i32 7, !"PIE Level", i32 2}
!30 = !{i32 7, !"uwtable", i32 2}
!31 = !{i32 7, !"frame-pointer", i32 1}
!32 = !{!"Ubuntu clang version 15.0.7"}
!33 = distinct !DISubprogram(name: "Proc_1", scope: !3, file: !3, line: 75, type: !34, scopeLine: 75, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !62)
!34 = !DISubroutineType(types: !35)
!35 = !{null, !36}
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "Rec_Pointer", file: !3, line: 42, baseType: !37)
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !38, size: 64)
!38 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "record", file: !3, line: 23, size: 448, elements: !39)
!39 = !{!40, !41, !43}
!40 = !DIDerivedType(tag: DW_TAG_member, name: "Ptr_Comp", scope: !38, file: !3, line: 25, baseType: !37, size: 64)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "Discr", scope: !38, file: !3, line: 26, baseType: !42, size: 32, offset: 64)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "Enumeration", file: !3, line: 21, baseType: !5)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "variant", scope: !38, file: !3, line: 41, baseType: !44, size: 320, offset: 96)
!44 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !38, file: !3, line: 27, size: 320, elements: !45)
!45 = !{!46, !52, !57}
!46 = !DIDerivedType(tag: DW_TAG_member, name: "var_1", scope: !44, file: !3, line: 32, baseType: !47, size: 320)
!47 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !44, file: !3, line: 28, size: 320, elements: !48)
!48 = !{!49, !50, !51}
!49 = !DIDerivedType(tag: DW_TAG_member, name: "Enum_Comp", scope: !47, file: !3, line: 29, baseType: !42, size: 32)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "Int_Comp", scope: !47, file: !3, line: 30, baseType: !24, size: 32, offset: 32)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "Str_Comp", scope: !47, file: !3, line: 31, baseType: !16, size: 248, offset: 64)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "var_2", scope: !44, file: !3, line: 36, baseType: !53, size: 288)
!53 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !44, file: !3, line: 33, size: 288, elements: !54)
!54 = !{!55, !56}
!55 = !DIDerivedType(tag: DW_TAG_member, name: "E_Comp_2", scope: !53, file: !3, line: 34, baseType: !42, size: 32)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "Str_2_Comp", scope: !53, file: !3, line: 35, baseType: !16, size: 248, offset: 32)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "var_3", scope: !44, file: !3, line: 40, baseType: !58, size: 16)
!58 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !44, file: !3, line: 37, size: 16, elements: !59)
!59 = !{!60, !61}
!60 = !DIDerivedType(tag: DW_TAG_member, name: "Ch_1_Comp", scope: !58, file: !3, line: 38, baseType: !17, size: 8)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "Ch_2_Comp", scope: !58, file: !3, line: 39, baseType: !17, size: 8, offset: 8)
!62 = !{}
!63 = !DILocalVariable(name: "Ptr_Val_Par", arg: 1, scope: !33, file: !3, line: 75, type: !36)
!64 = !DILocation(line: 75, column: 25, scope: !33)
!65 = !DILocalVariable(name: "Next_Record", scope: !33, file: !3, line: 76, type: !36)
!66 = !DILocation(line: 76, column: 17, scope: !33)
!67 = !DILocation(line: 76, column: 31, scope: !33)
!68 = !DILocation(line: 76, column: 44, scope: !33)
!69 = !DILocation(line: 77, column: 6, scope: !33)
!70 = !DILocation(line: 77, column: 19, scope: !33)
!71 = !DILocation(line: 77, column: 31, scope: !33)
!72 = !DILocation(line: 77, column: 30, scope: !33)
!73 = !DILocation(line: 78, column: 5, scope: !33)
!74 = !DILocation(line: 78, column: 18, scope: !33)
!75 = !DILocation(line: 78, column: 32, scope: !33)
!76 = !DILocation(line: 78, column: 41, scope: !33)
!77 = !DILocation(line: 79, column: 43, scope: !33)
!78 = !DILocation(line: 79, column: 56, scope: !33)
!79 = !DILocation(line: 79, column: 70, scope: !33)
!80 = !DILocation(line: 79, column: 5, scope: !33)
!81 = !DILocation(line: 79, column: 18, scope: !33)
!82 = !DILocation(line: 79, column: 32, scope: !33)
!83 = !DILocation(line: 79, column: 41, scope: !33)
!84 = !DILocation(line: 80, column: 29, scope: !33)
!85 = !DILocation(line: 80, column: 42, scope: !33)
!86 = !DILocation(line: 80, column: 5, scope: !33)
!87 = !DILocation(line: 80, column: 18, scope: !33)
!88 = !DILocation(line: 80, column: 27, scope: !33)
!89 = !DILocation(line: 81, column: 13, scope: !33)
!90 = !DILocation(line: 81, column: 26, scope: !33)
!91 = !DILocation(line: 81, column: 5, scope: !33)
!92 = !DILocation(line: 82, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !33, file: !3, line: 82, column: 9)
!94 = !DILocation(line: 82, column: 22, scope: !93)
!95 = !DILocation(line: 82, column: 28, scope: !93)
!96 = !DILocation(line: 82, column: 9, scope: !33)
!97 = !DILocation(line: 83, column: 9, scope: !98)
!98 = distinct !DILexicalBlock(scope: !93, file: !3, line: 82, column: 40)
!99 = !DILocation(line: 83, column: 22, scope: !98)
!100 = !DILocation(line: 83, column: 36, scope: !98)
!101 = !DILocation(line: 83, column: 45, scope: !98)
!102 = !DILocation(line: 84, column: 16, scope: !98)
!103 = !DILocation(line: 84, column: 29, scope: !98)
!104 = !DILocation(line: 84, column: 43, scope: !98)
!105 = !DILocation(line: 84, column: 55, scope: !98)
!106 = !DILocation(line: 84, column: 68, scope: !98)
!107 = !DILocation(line: 84, column: 82, scope: !98)
!108 = !DILocation(line: 84, column: 9, scope: !98)
!109 = !DILocation(line: 85, column: 33, scope: !98)
!110 = !DILocation(line: 85, column: 46, scope: !98)
!111 = !DILocation(line: 85, column: 9, scope: !98)
!112 = !DILocation(line: 85, column: 22, scope: !98)
!113 = !DILocation(line: 85, column: 31, scope: !98)
!114 = !DILocation(line: 86, column: 16, scope: !98)
!115 = !DILocation(line: 86, column: 29, scope: !98)
!116 = !DILocation(line: 86, column: 43, scope: !98)
!117 = !DILocation(line: 86, column: 58, scope: !98)
!118 = !DILocation(line: 86, column: 71, scope: !98)
!119 = !DILocation(line: 86, column: 85, scope: !98)
!120 = !DILocation(line: 86, column: 9, scope: !98)
!121 = !DILocation(line: 87, column: 5, scope: !98)
!122 = !DILocation(line: 88, column: 10, scope: !123)
!123 = distinct !DILexicalBlock(scope: !93, file: !3, line: 87, column: 12)
!124 = !DILocation(line: 88, column: 25, scope: !123)
!125 = !DILocation(line: 88, column: 38, scope: !123)
!126 = !DILocation(line: 88, column: 24, scope: !123)
!127 = !DILocation(line: 90, column: 1, scope: !33)
!128 = distinct !DISubprogram(name: "Proc_3", scope: !3, file: !3, line: 107, type: !129, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !62)
!129 = !DISubroutineType(types: !130)
!130 = !{null, !131}
!131 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 64)
!132 = !DILocalVariable(name: "Ptr_Ref_Par", arg: 1, scope: !128, file: !3, line: 107, type: !131)
!133 = !DILocation(line: 107, column: 26, scope: !128)
!134 = !DILocation(line: 108, column: 9, scope: !135)
!135 = distinct !DILexicalBlock(scope: !128, file: !3, line: 108, column: 9)
!136 = !DILocation(line: 108, column: 25, scope: !135)
!137 = !DILocation(line: 108, column: 9, scope: !128)
!138 = !DILocation(line: 109, column: 25, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !3, line: 108, column: 32)
!140 = !DILocation(line: 110, column: 5, scope: !139)
!141 = !DILocation(line: 111, column: 1, scope: !128)
!142 = distinct !DISubprogram(name: "Proc_6", scope: !3, file: !3, line: 124, type: !143, scopeLine: 124, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !62)
!143 = !DISubroutineType(types: !144)
!144 = !{null, !42, !145}
!145 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 64)
!146 = !DILocalVariable(name: "Enum_Val_Par", arg: 1, scope: !142, file: !3, line: 124, type: !42)
!147 = !DILocation(line: 124, column: 25, scope: !142)
!148 = !DILocalVariable(name: "Enum_Ref_Par", arg: 2, scope: !142, file: !3, line: 124, type: !145)
!149 = !DILocation(line: 124, column: 52, scope: !142)
!150 = !DILocation(line: 125, column: 21, scope: !142)
!151 = !DILocation(line: 125, column: 6, scope: !142)
!152 = !DILocation(line: 125, column: 19, scope: !142)
!153 = !DILocation(line: 126, column: 17, scope: !154)
!154 = distinct !DILexicalBlock(scope: !142, file: !3, line: 126, column: 9)
!155 = !DILocation(line: 126, column: 10, scope: !154)
!156 = !DILocation(line: 126, column: 9, scope: !142)
!157 = !DILocation(line: 127, column: 10, scope: !158)
!158 = distinct !DILexicalBlock(scope: !154, file: !3, line: 126, column: 32)
!159 = !DILocation(line: 127, column: 23, scope: !158)
!160 = !DILocation(line: 128, column: 5, scope: !158)
!161 = !DILocation(line: 129, column: 13, scope: !142)
!162 = !DILocation(line: 129, column: 5, scope: !142)
!163 = !DILocation(line: 131, column: 14, scope: !164)
!164 = distinct !DILexicalBlock(scope: !142, file: !3, line: 129, column: 27)
!165 = !DILocation(line: 131, column: 27, scope: !164)
!166 = !DILocation(line: 132, column: 13, scope: !164)
!167 = !DILocation(line: 134, column: 17, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !3, line: 134, column: 17)
!169 = !DILocation(line: 134, column: 33, scope: !168)
!170 = !DILocation(line: 134, column: 17, scope: !164)
!171 = !DILocation(line: 135, column: 18, scope: !168)
!172 = !DILocation(line: 135, column: 31, scope: !168)
!173 = !DILocation(line: 135, column: 17, scope: !168)
!174 = !DILocation(line: 137, column: 18, scope: !168)
!175 = !DILocation(line: 137, column: 31, scope: !168)
!176 = !DILocation(line: 138, column: 13, scope: !164)
!177 = !DILocation(line: 140, column: 14, scope: !164)
!178 = !DILocation(line: 140, column: 27, scope: !164)
!179 = !DILocation(line: 141, column: 13, scope: !164)
!180 = !DILocation(line: 143, column: 13, scope: !164)
!181 = !DILocation(line: 145, column: 14, scope: !164)
!182 = !DILocation(line: 145, column: 27, scope: !164)
!183 = !DILocation(line: 146, column: 13, scope: !164)
!184 = !DILocation(line: 148, column: 1, scope: !142)
!185 = distinct !DISubprogram(name: "Proc_7", scope: !3, file: !3, line: 150, type: !186, scopeLine: 150, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !62)
!186 = !DISubroutineType(types: !187)
!187 = !{null, !188, !188, !189}
!188 = !DIDerivedType(tag: DW_TAG_typedef, name: "One_Fifty", file: !3, line: 14, baseType: !24)
!189 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !188, size: 64)
!190 = !DILocalVariable(name: "Int_1_Par_Val", arg: 1, scope: !185, file: !3, line: 150, type: !188)
!191 = !DILocation(line: 150, column: 23, scope: !185)
!192 = !DILocalVariable(name: "Int_2_Par_Val", arg: 2, scope: !185, file: !3, line: 150, type: !188)
!193 = !DILocation(line: 150, column: 48, scope: !185)
!194 = !DILocalVariable(name: "Int_Par_Ref", arg: 3, scope: !185, file: !3, line: 150, type: !189)
!195 = !DILocation(line: 150, column: 74, scope: !185)
!196 = !DILocalVariable(name: "Int_Loc", scope: !185, file: !3, line: 151, type: !188)
!197 = !DILocation(line: 151, column: 15, scope: !185)
!198 = !DILocation(line: 152, column: 15, scope: !185)
!199 = !DILocation(line: 152, column: 29, scope: !185)
!200 = !DILocation(line: 152, column: 13, scope: !185)
!201 = !DILocation(line: 153, column: 20, scope: !185)
!202 = !DILocation(line: 153, column: 36, scope: !185)
!203 = !DILocation(line: 153, column: 34, scope: !185)
!204 = !DILocation(line: 153, column: 6, scope: !185)
!205 = !DILocation(line: 153, column: 18, scope: !185)
!206 = !DILocation(line: 154, column: 1, scope: !185)
!207 = distinct !DISubprogram(name: "Proc_2", scope: !3, file: !3, line: 92, type: !208, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !62)
!208 = !DISubroutineType(types: !209)
!209 = !{null, !189}
!210 = !DILocalVariable(name: "Int_Par_Ref", arg: 1, scope: !207, file: !3, line: 92, type: !189)
!211 = !DILocation(line: 92, column: 24, scope: !207)
!212 = !DILocalVariable(name: "Int_Loc", scope: !207, file: !3, line: 93, type: !188)
!213 = !DILocation(line: 93, column: 15, scope: !207)
!214 = !DILocalVariable(name: "Enum_Loc", scope: !207, file: !3, line: 94, type: !42)
!215 = !DILocation(line: 94, column: 17, scope: !207)
!216 = !DILocation(line: 95, column: 16, scope: !207)
!217 = !DILocation(line: 95, column: 15, scope: !207)
!218 = !DILocation(line: 95, column: 28, scope: !207)
!219 = !DILocation(line: 95, column: 13, scope: !207)
!220 = !DILocation(line: 97, column: 9, scope: !221)
!221 = distinct !DILexicalBlock(scope: !207, file: !3, line: 97, column: 9)
!222 = !DILocation(line: 97, column: 26, scope: !221)
!223 = !DILocation(line: 97, column: 9, scope: !207)
!224 = !DILocation(line: 98, column: 17, scope: !225)
!225 = distinct !DILexicalBlock(scope: !221, file: !3, line: 97, column: 34)
!226 = !DILocation(line: 99, column: 24, scope: !225)
!227 = !DILocation(line: 99, column: 34, scope: !225)
!228 = !DILocation(line: 99, column: 32, scope: !225)
!229 = !DILocation(line: 99, column: 10, scope: !225)
!230 = !DILocation(line: 99, column: 22, scope: !225)
!231 = !DILocation(line: 100, column: 18, scope: !225)
!232 = !DILocation(line: 101, column: 5, scope: !225)
!233 = !DILocation(line: 102, column: 24, scope: !234)
!234 = distinct !DILexicalBlock(scope: !221, file: !3, line: 101, column: 12)
!235 = !DILocation(line: 102, column: 10, scope: !234)
!236 = !DILocation(line: 102, column: 22, scope: !234)
!237 = !DILocation(line: 103, column: 18, scope: !234)
!238 = !DILocation(line: 105, column: 1, scope: !207)
!239 = distinct !DISubprogram(name: "Proc_4", scope: !3, file: !3, line: 113, type: !240, scopeLine: 113, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !62)
!240 = !DISubroutineType(types: !241)
!241 = !{null}
!242 = !DILocalVariable(name: "Bool_Loc", scope: !239, file: !3, line: 114, type: !243)
!243 = !DIDerivedType(tag: DW_TAG_typedef, name: "Boolean", file: !3, line: 16, baseType: !24)
!244 = !DILocation(line: 114, column: 13, scope: !239)
!245 = !DILocation(line: 115, column: 16, scope: !239)
!246 = !DILocation(line: 115, column: 33, scope: !239)
!247 = !DILocation(line: 115, column: 14, scope: !239)
!248 = !DILocation(line: 116, column: 22, scope: !239)
!249 = !DILocation(line: 117, column: 1, scope: !239)
!250 = distinct !DISubprogram(name: "Proc_5", scope: !3, file: !3, line: 119, type: !240, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !62)
!251 = !DILocation(line: 120, column: 22, scope: !250)
!252 = !DILocation(line: 121, column: 24, scope: !250)
!253 = !DILocation(line: 121, column: 22, scope: !250)
!254 = !DILocation(line: 122, column: 1, scope: !250)
!255 = distinct !DISubprogram(name: "Func_3", scope: !3, file: !3, line: 215, type: !256, scopeLine: 215, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !62)
!256 = !DISubroutineType(types: !257)
!257 = !{!243, !42}
!258 = !DILocalVariable(name: "Enum_Par_Val", arg: 1, scope: !255, file: !3, line: 215, type: !42)
!259 = !DILocation(line: 215, column: 28, scope: !255)
!260 = !DILocalVariable(name: "Enum_Loc", scope: !255, file: !3, line: 216, type: !42)
!261 = !DILocation(line: 216, column: 17, scope: !255)
!262 = !DILocation(line: 217, column: 16, scope: !255)
!263 = !DILocation(line: 217, column: 14, scope: !255)
!264 = !DILocation(line: 218, column: 9, scope: !265)
!265 = distinct !DILexicalBlock(scope: !255, file: !3, line: 218, column: 9)
!266 = !DILocation(line: 218, column: 18, scope: !265)
!267 = !DILocation(line: 218, column: 9, scope: !255)
!268 = !DILocation(line: 219, column: 9, scope: !265)
!269 = !DILocation(line: 221, column: 9, scope: !265)
!270 = !DILocation(line: 222, column: 1, scope: !255)
!271 = distinct !DISubprogram(name: "Proc_8", scope: !3, file: !3, line: 156, type: !272, scopeLine: 156, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !62)
!272 = !DISubroutineType(types: !273)
!273 = !{null, !274, !275, !24, !24}
!274 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!275 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !276, size: 64)
!276 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 1600, elements: !277)
!277 = !{!278}
!278 = !DISubrange(count: 50)
!279 = !DILocalVariable(name: "Arr_1_Par_Ref", arg: 1, scope: !271, file: !3, line: 156, type: !274)
!280 = !DILocation(line: 156, column: 23, scope: !271)
!281 = !DILocalVariable(name: "Arr_2_Par_Ref", arg: 2, scope: !271, file: !3, line: 156, type: !275)
!282 = !DILocation(line: 156, column: 48, scope: !271)
!283 = !DILocalVariable(name: "Int_1_Par_Val", arg: 3, scope: !271, file: !3, line: 156, type: !24)
!284 = !DILocation(line: 156, column: 67, scope: !271)
!285 = !DILocalVariable(name: "Int_2_Par_Val", arg: 4, scope: !271, file: !3, line: 156, type: !24)
!286 = !DILocation(line: 156, column: 86, scope: !271)
!287 = !DILocalVariable(name: "Int_Index", scope: !271, file: !3, line: 157, type: !188)
!288 = !DILocation(line: 157, column: 15, scope: !271)
!289 = !DILocalVariable(name: "Int_Loc", scope: !271, file: !3, line: 158, type: !188)
!290 = !DILocation(line: 158, column: 15, scope: !271)
!291 = !DILocation(line: 159, column: 15, scope: !271)
!292 = !DILocation(line: 159, column: 29, scope: !271)
!293 = !DILocation(line: 159, column: 13, scope: !271)
!294 = !DILocation(line: 161, column: 9, scope: !295)
!295 = distinct !DILexicalBlock(scope: !271, file: !3, line: 161, column: 9)
!296 = !DILocation(line: 161, column: 17, scope: !295)
!297 = !DILocation(line: 161, column: 23, scope: !295)
!298 = !DILocation(line: 161, column: 26, scope: !295)
!299 = !DILocation(line: 161, column: 34, scope: !295)
!300 = !DILocation(line: 161, column: 38, scope: !295)
!301 = !DILocation(line: 161, column: 44, scope: !295)
!302 = !DILocation(line: 161, column: 47, scope: !295)
!303 = !DILocation(line: 161, column: 55, scope: !295)
!304 = !DILocation(line: 161, column: 60, scope: !295)
!305 = !DILocation(line: 161, column: 66, scope: !295)
!306 = !DILocation(line: 162, column: 9, scope: !295)
!307 = !DILocation(line: 162, column: 17, scope: !295)
!308 = !DILocation(line: 162, column: 22, scope: !295)
!309 = !DILocation(line: 162, column: 28, scope: !295)
!310 = !DILocation(line: 162, column: 31, scope: !295)
!311 = !DILocation(line: 162, column: 39, scope: !295)
!312 = !DILocation(line: 162, column: 43, scope: !295)
!313 = !DILocation(line: 161, column: 9, scope: !271)
!314 = !DILocation(line: 163, column: 9, scope: !315)
!315 = distinct !DILexicalBlock(scope: !295, file: !3, line: 162, column: 48)
!316 = !DILocation(line: 166, column: 30, scope: !271)
!317 = !DILocation(line: 166, column: 5, scope: !271)
!318 = !DILocation(line: 166, column: 19, scope: !271)
!319 = !DILocation(line: 166, column: 28, scope: !271)
!320 = !DILocation(line: 167, column: 32, scope: !271)
!321 = !DILocation(line: 167, column: 46, scope: !271)
!322 = !DILocation(line: 167, column: 5, scope: !271)
!323 = !DILocation(line: 167, column: 19, scope: !271)
!324 = !DILocation(line: 167, column: 26, scope: !271)
!325 = !DILocation(line: 167, column: 30, scope: !271)
!326 = !DILocation(line: 168, column: 33, scope: !271)
!327 = !DILocation(line: 168, column: 5, scope: !271)
!328 = !DILocation(line: 168, column: 19, scope: !271)
!329 = !DILocation(line: 168, column: 26, scope: !271)
!330 = !DILocation(line: 168, column: 31, scope: !271)
!331 = !DILocation(line: 169, column: 22, scope: !332)
!332 = distinct !DILexicalBlock(scope: !271, file: !3, line: 169, column: 5)
!333 = !DILocation(line: 169, column: 20, scope: !332)
!334 = !DILocation(line: 169, column: 10, scope: !332)
!335 = !DILocation(line: 169, column: 31, scope: !336)
!336 = distinct !DILexicalBlock(scope: !332, file: !3, line: 169, column: 5)
!337 = !DILocation(line: 169, column: 44, scope: !336)
!338 = !DILocation(line: 169, column: 51, scope: !336)
!339 = !DILocation(line: 169, column: 41, scope: !336)
!340 = !DILocation(line: 169, column: 5, scope: !332)
!341 = !DILocation(line: 170, column: 45, scope: !336)
!342 = !DILocation(line: 170, column: 9, scope: !336)
!343 = !DILocation(line: 170, column: 23, scope: !336)
!344 = !DILocation(line: 170, column: 32, scope: !336)
!345 = !DILocation(line: 170, column: 43, scope: !336)
!346 = !DILocation(line: 169, column: 55, scope: !336)
!347 = !DILocation(line: 169, column: 5, scope: !336)
!348 = distinct !{!348, !340, !349, !350}
!349 = !DILocation(line: 170, column: 45, scope: !332)
!350 = !{!"llvm.loop.mustprogress"}
!351 = !DILocation(line: 171, column: 5, scope: !271)
!352 = !DILocation(line: 171, column: 19, scope: !271)
!353 = !DILocation(line: 171, column: 28, scope: !271)
!354 = !DILocation(line: 171, column: 35, scope: !271)
!355 = !DILocation(line: 171, column: 39, scope: !271)
!356 = !DILocation(line: 172, column: 42, scope: !271)
!357 = !DILocation(line: 172, column: 56, scope: !271)
!358 = !DILocation(line: 172, column: 5, scope: !271)
!359 = !DILocation(line: 172, column: 19, scope: !271)
!360 = !DILocation(line: 172, column: 26, scope: !271)
!361 = !DILocation(line: 172, column: 31, scope: !271)
!362 = !DILocation(line: 172, column: 40, scope: !271)
!363 = !DILocation(line: 173, column: 21, scope: !271)
!364 = !DILocation(line: 174, column: 1, scope: !271)
!365 = distinct !DISubprogram(name: "Func_1", scope: !3, file: !3, line: 176, type: !366, scopeLine: 176, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !62)
!366 = !DISubroutineType(types: !367)
!367 = !{!42, !368, !368}
!368 = !DIDerivedType(tag: DW_TAG_typedef, name: "Capital_Letter", file: !3, line: 15, baseType: !17)
!369 = !DILocalVariable(name: "Ch_1_Par_Val", arg: 1, scope: !365, file: !3, line: 176, type: !368)
!370 = !DILocation(line: 176, column: 35, scope: !365)
!371 = !DILocalVariable(name: "Ch_2_Par_Val", arg: 2, scope: !365, file: !3, line: 176, type: !368)
!372 = !DILocation(line: 176, column: 64, scope: !365)
!373 = !DILocalVariable(name: "Ch_1_Loc", scope: !365, file: !3, line: 177, type: !368)
!374 = !DILocation(line: 177, column: 20, scope: !365)
!375 = !DILocalVariable(name: "Ch_2_Loc", scope: !365, file: !3, line: 178, type: !368)
!376 = !DILocation(line: 178, column: 20, scope: !365)
!377 = !DILocation(line: 179, column: 16, scope: !365)
!378 = !DILocation(line: 179, column: 14, scope: !365)
!379 = !DILocation(line: 180, column: 16, scope: !365)
!380 = !DILocation(line: 180, column: 14, scope: !365)
!381 = !DILocation(line: 181, column: 9, scope: !382)
!382 = distinct !DILexicalBlock(scope: !365, file: !3, line: 181, column: 9)
!383 = !DILocation(line: 181, column: 21, scope: !382)
!384 = !DILocation(line: 181, column: 18, scope: !382)
!385 = !DILocation(line: 181, column: 9, scope: !365)
!386 = !DILocation(line: 182, column: 9, scope: !382)
!387 = !DILocation(line: 184, column: 28, scope: !388)
!388 = distinct !DILexicalBlock(scope: !382, file: !3, line: 183, column: 10)
!389 = !DILocation(line: 184, column: 26, scope: !388)
!390 = !DILocation(line: 185, column: 9, scope: !388)
!391 = !DILocation(line: 187, column: 1, scope: !365)
!392 = distinct !DISubprogram(name: "Func_2", scope: !3, file: !3, line: 189, type: !393, scopeLine: 189, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !62)
!393 = !DISubroutineType(types: !394)
!394 = !{!243, !395, !395}
!395 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!396 = !DILocalVariable(name: "Str_1_Par_Ref", arg: 1, scope: !392, file: !3, line: 189, type: !395)
!397 = !DILocation(line: 189, column: 23, scope: !392)
!398 = !DILocalVariable(name: "Str_2_Par_Ref", arg: 2, scope: !392, file: !3, line: 189, type: !395)
!399 = !DILocation(line: 189, column: 45, scope: !392)
!400 = !DILocalVariable(name: "Int_Loc", scope: !392, file: !3, line: 190, type: !401)
!401 = !DIDerivedType(tag: DW_TAG_typedef, name: "One_Thirty", file: !3, line: 13, baseType: !24)
!402 = !DILocation(line: 190, column: 16, scope: !392)
!403 = !DILocalVariable(name: "Ch_Loc", scope: !392, file: !3, line: 191, type: !368)
!404 = !DILocation(line: 191, column: 20, scope: !392)
!405 = !DILocation(line: 192, column: 13, scope: !392)
!406 = !DILocation(line: 193, column: 5, scope: !392)
!407 = !DILocation(line: 193, column: 12, scope: !392)
!408 = !DILocation(line: 193, column: 20, scope: !392)
!409 = !DILocation(line: 194, column: 20, scope: !410)
!410 = distinct !DILexicalBlock(scope: !411, file: !3, line: 194, column: 13)
!411 = distinct !DILexicalBlock(scope: !392, file: !3, line: 193, column: 26)
!412 = !DILocation(line: 194, column: 34, scope: !410)
!413 = !DILocation(line: 194, column: 44, scope: !410)
!414 = !DILocation(line: 194, column: 58, scope: !410)
!415 = !DILocation(line: 194, column: 65, scope: !410)
!416 = !DILocation(line: 194, column: 13, scope: !410)
!417 = !DILocation(line: 194, column: 70, scope: !410)
!418 = !DILocation(line: 194, column: 13, scope: !411)
!419 = !DILocation(line: 195, column: 20, scope: !420)
!420 = distinct !DILexicalBlock(scope: !410, file: !3, line: 194, column: 82)
!421 = !DILocation(line: 196, column: 21, scope: !420)
!422 = !DILocation(line: 197, column: 9, scope: !420)
!423 = !DILocation(line: 198, column: 13, scope: !424)
!424 = distinct !DILexicalBlock(scope: !410, file: !3, line: 197, column: 16)
!425 = distinct !{!425, !406, !426, !350}
!426 = !DILocation(line: 200, column: 5, scope: !392)
!427 = !DILocation(line: 201, column: 9, scope: !428)
!428 = distinct !DILexicalBlock(scope: !392, file: !3, line: 201, column: 9)
!429 = !DILocation(line: 201, column: 16, scope: !428)
!430 = !DILocation(line: 201, column: 23, scope: !428)
!431 = !DILocation(line: 201, column: 26, scope: !428)
!432 = !DILocation(line: 201, column: 33, scope: !428)
!433 = !DILocation(line: 201, column: 9, scope: !392)
!434 = !DILocation(line: 202, column: 17, scope: !428)
!435 = !DILocation(line: 202, column: 9, scope: !428)
!436 = !DILocation(line: 203, column: 9, scope: !437)
!437 = distinct !DILexicalBlock(scope: !392, file: !3, line: 203, column: 9)
!438 = !DILocation(line: 203, column: 16, scope: !437)
!439 = !DILocation(line: 203, column: 9, scope: !392)
!440 = !DILocation(line: 204, column: 9, scope: !437)
!441 = !DILocation(line: 206, column: 20, scope: !442)
!442 = distinct !DILexicalBlock(scope: !443, file: !3, line: 206, column: 13)
!443 = distinct !DILexicalBlock(scope: !437, file: !3, line: 205, column: 10)
!444 = !DILocation(line: 206, column: 35, scope: !442)
!445 = !DILocation(line: 206, column: 13, scope: !442)
!446 = !DILocation(line: 206, column: 50, scope: !442)
!447 = !DILocation(line: 206, column: 13, scope: !443)
!448 = !DILocation(line: 207, column: 21, scope: !449)
!449 = distinct !DILexicalBlock(scope: !442, file: !3, line: 206, column: 55)
!450 = !DILocation(line: 208, column: 31, scope: !449)
!451 = !DILocation(line: 208, column: 29, scope: !449)
!452 = !DILocation(line: 209, column: 13, scope: !449)
!453 = !DILocation(line: 211, column: 13, scope: !442)
!454 = !DILocation(line: 213, column: 1, scope: !392)
!455 = distinct !DISubprogram(name: "run_dhrystone_workload", scope: !3, file: !3, line: 224, type: !456, scopeLine: 224, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !62)
!456 = !DISubroutineType(types: !457)
!457 = !{null, !458}
!458 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !459, size: 64)
!459 = !DIDerivedType(tag: DW_TAG_typedef, name: "test_task_context", file: !3, line: 68, baseType: !460)
!460 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 57, size: 82368, elements: !461)
!461 = !{!462, !463, !464, !465, !466, !467, !468, !470, !474, !476}
!462 = !DIDerivedType(tag: DW_TAG_member, name: "ptr_glob", scope: !460, file: !3, line: 58, baseType: !36, size: 64)
!463 = !DIDerivedType(tag: DW_TAG_member, name: "next_ptr_glob", scope: !460, file: !3, line: 59, baseType: !36, size: 64, offset: 64)
!464 = !DIDerivedType(tag: DW_TAG_member, name: "int_glob", scope: !460, file: !3, line: 60, baseType: !24, size: 32, offset: 128)
!465 = !DIDerivedType(tag: DW_TAG_member, name: "bool_glob", scope: !460, file: !3, line: 61, baseType: !243, size: 32, offset: 160)
!466 = !DIDerivedType(tag: DW_TAG_member, name: "ch_1_glob", scope: !460, file: !3, line: 62, baseType: !17, size: 8, offset: 192)
!467 = !DIDerivedType(tag: DW_TAG_member, name: "ch_2_glob", scope: !460, file: !3, line: 63, baseType: !17, size: 8, offset: 200)
!468 = !DIDerivedType(tag: DW_TAG_member, name: "arr_1_glob", scope: !460, file: !3, line: 64, baseType: !469, size: 1600, offset: 224)
!469 = !DIDerivedType(tag: DW_TAG_typedef, name: "Arr_1_Dim", file: !3, line: 18, baseType: !276)
!470 = !DIDerivedType(tag: DW_TAG_member, name: "arr_2_glob", scope: !460, file: !3, line: 65, baseType: !471, size: 80000, offset: 1824)
!471 = !DIDerivedType(tag: DW_TAG_typedef, name: "Arr_2_Dim", file: !3, line: 19, baseType: !472)
!472 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 80000, elements: !473)
!473 = !{!278, !278}
!474 = !DIDerivedType(tag: DW_TAG_member, name: "str_1_loc", scope: !460, file: !3, line: 66, baseType: !475, size: 248, offset: 81824)
!475 = !DIDerivedType(tag: DW_TAG_typedef, name: "Str_30", file: !3, line: 17, baseType: !16)
!476 = !DIDerivedType(tag: DW_TAG_member, name: "str_2_loc", scope: !460, file: !3, line: 67, baseType: !475, size: 248, offset: 82072)
!477 = !DILocalVariable(name: "ctx", arg: 1, scope: !455, file: !3, line: 224, type: !458)
!478 = !DILocation(line: 224, column: 48, scope: !455)
!479 = !DILocalVariable(name: "Int_1_Loc", scope: !455, file: !3, line: 225, type: !188)
!480 = !DILocation(line: 225, column: 15, scope: !455)
!481 = !DILocalVariable(name: "Int_2_Loc", scope: !455, file: !3, line: 226, type: !188)
!482 = !DILocation(line: 226, column: 15, scope: !455)
!483 = !DILocalVariable(name: "Int_3_Loc", scope: !455, file: !3, line: 227, type: !188)
!484 = !DILocation(line: 227, column: 15, scope: !455)
!485 = !DILocalVariable(name: "Ch_Index", scope: !455, file: !3, line: 228, type: !17)
!486 = !DILocation(line: 228, column: 10, scope: !455)
!487 = !DILocalVariable(name: "Enum_Loc", scope: !455, file: !3, line: 229, type: !42)
!488 = !DILocation(line: 229, column: 17, scope: !455)
!489 = !DILocation(line: 231, column: 5, scope: !455)
!490 = !DILocation(line: 232, column: 5, scope: !455)
!491 = !DILocation(line: 233, column: 15, scope: !455)
!492 = !DILocation(line: 234, column: 15, scope: !455)
!493 = !DILocation(line: 235, column: 12, scope: !455)
!494 = !DILocation(line: 235, column: 17, scope: !455)
!495 = !DILocation(line: 235, column: 5, scope: !455)
!496 = !DILocation(line: 236, column: 14, scope: !455)
!497 = !DILocation(line: 237, column: 30, scope: !455)
!498 = !DILocation(line: 237, column: 35, scope: !455)
!499 = !DILocation(line: 237, column: 46, scope: !455)
!500 = !DILocation(line: 237, column: 51, scope: !455)
!501 = !DILocation(line: 237, column: 23, scope: !455)
!502 = !DILocation(line: 237, column: 22, scope: !455)
!503 = !DILocation(line: 237, column: 5, scope: !455)
!504 = !DILocation(line: 237, column: 10, scope: !455)
!505 = !DILocation(line: 237, column: 20, scope: !455)
!506 = !DILocation(line: 239, column: 5, scope: !455)
!507 = !DILocation(line: 239, column: 12, scope: !455)
!508 = !DILocation(line: 239, column: 24, scope: !455)
!509 = !DILocation(line: 239, column: 22, scope: !455)
!510 = !DILocation(line: 240, column: 25, scope: !511)
!511 = distinct !DILexicalBlock(scope: !455, file: !3, line: 239, column: 35)
!512 = !DILocation(line: 240, column: 23, scope: !511)
!513 = !DILocation(line: 240, column: 37, scope: !511)
!514 = !DILocation(line: 240, column: 35, scope: !511)
!515 = !DILocation(line: 240, column: 19, scope: !511)
!516 = !DILocation(line: 241, column: 16, scope: !511)
!517 = !DILocation(line: 241, column: 27, scope: !511)
!518 = !DILocation(line: 241, column: 9, scope: !511)
!519 = !DILocation(line: 242, column: 19, scope: !511)
!520 = distinct !{!520, !506, !521, !350}
!521 = !DILocation(line: 243, column: 5, scope: !455)
!522 = !DILocation(line: 245, column: 12, scope: !455)
!523 = !DILocation(line: 245, column: 17, scope: !455)
!524 = !DILocation(line: 245, column: 29, scope: !455)
!525 = !DILocation(line: 245, column: 34, scope: !455)
!526 = !DILocation(line: 245, column: 46, scope: !455)
!527 = !DILocation(line: 245, column: 57, scope: !455)
!528 = !DILocation(line: 245, column: 5, scope: !455)
!529 = !DILocation(line: 246, column: 12, scope: !455)
!530 = !DILocation(line: 246, column: 17, scope: !455)
!531 = !DILocation(line: 246, column: 5, scope: !455)
!532 = !DILocation(line: 248, column: 19, scope: !533)
!533 = distinct !DILexicalBlock(scope: !455, file: !3, line: 248, column: 5)
!534 = !DILocation(line: 248, column: 10, scope: !533)
!535 = !DILocation(line: 248, column: 26, scope: !536)
!536 = distinct !DILexicalBlock(scope: !533, file: !3, line: 248, column: 5)
!537 = !DILocation(line: 248, column: 38, scope: !536)
!538 = !DILocation(line: 248, column: 43, scope: !536)
!539 = !DILocation(line: 248, column: 35, scope: !536)
!540 = !DILocation(line: 248, column: 5, scope: !533)
!541 = !DILocation(line: 249, column: 13, scope: !542)
!542 = distinct !DILexicalBlock(scope: !543, file: !3, line: 249, column: 13)
!543 = distinct !DILexicalBlock(scope: !536, file: !3, line: 248, column: 66)
!544 = !DILocation(line: 249, column: 32, scope: !542)
!545 = !DILocation(line: 249, column: 25, scope: !542)
!546 = !DILocation(line: 249, column: 22, scope: !542)
!547 = !DILocation(line: 249, column: 13, scope: !543)
!548 = !DILocation(line: 250, column: 13, scope: !549)
!549 = distinct !DILexicalBlock(scope: !542, file: !3, line: 249, column: 48)
!550 = !DILocation(line: 251, column: 20, scope: !549)
!551 = !DILocation(line: 251, column: 25, scope: !549)
!552 = !DILocation(line: 251, column: 13, scope: !549)
!553 = !DILocation(line: 252, column: 25, scope: !549)
!554 = !DILocation(line: 252, column: 23, scope: !549)
!555 = !DILocation(line: 253, column: 29, scope: !549)
!556 = !DILocation(line: 253, column: 13, scope: !549)
!557 = !DILocation(line: 253, column: 18, scope: !549)
!558 = !DILocation(line: 253, column: 27, scope: !549)
!559 = !DILocation(line: 254, column: 9, scope: !549)
!560 = !DILocation(line: 255, column: 5, scope: !543)
!561 = !DILocation(line: 248, column: 54, scope: !536)
!562 = !DILocation(line: 248, column: 5, scope: !536)
!563 = distinct !{!563, !540, !564, !350}
!564 = !DILocation(line: 255, column: 5, scope: !533)
!565 = !DILocation(line: 257, column: 17, scope: !455)
!566 = !DILocation(line: 257, column: 29, scope: !455)
!567 = !DILocation(line: 257, column: 27, scope: !455)
!568 = !DILocation(line: 257, column: 15, scope: !455)
!569 = !DILocation(line: 258, column: 17, scope: !455)
!570 = !DILocation(line: 258, column: 29, scope: !455)
!571 = !DILocation(line: 258, column: 27, scope: !455)
!572 = !DILocation(line: 258, column: 15, scope: !455)
!573 = !DILocation(line: 259, column: 22, scope: !455)
!574 = !DILocation(line: 259, column: 34, scope: !455)
!575 = !DILocation(line: 259, column: 32, scope: !455)
!576 = !DILocation(line: 259, column: 19, scope: !455)
!577 = !DILocation(line: 259, column: 47, scope: !455)
!578 = !DILocation(line: 259, column: 45, scope: !455)
!579 = !DILocation(line: 259, column: 15, scope: !455)
!580 = !DILocation(line: 260, column: 5, scope: !455)
!581 = !DILocation(line: 262, column: 1, scope: !455)
