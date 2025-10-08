; ModuleID = 'tasks/task3.c'
source_filename = "tasks/task3.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx15.0.0"

@__const.main.arr = private unnamed_addr constant [10 x i32] [i32 64, i32 34, i32 25, i32 12, i32 22, i32 11, i32 90, i32 5, i32 77, i32 30], align 4

; Function Attrs: noinline nounwind ssp uwtable(sync)
define void @bubble_sort(ptr noundef %0, i32 noundef %1) #0 !dbg !9 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !15, metadata !DIExpression()), !dbg !16
  store i32 %1, ptr %4, align 4
  call void @llvm.dbg.declare(metadata ptr %4, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata ptr %5, metadata !19, metadata !DIExpression()), !dbg !21
  store i32 0, ptr %5, align 4, !dbg !21
  br label %8, !dbg !22

8:                                                ; preds = %61, %2
  %9 = load i32, ptr %5, align 4, !dbg !23
  %10 = load i32, ptr %4, align 4, !dbg !25
  %11 = sub nsw i32 %10, 1, !dbg !26
  %12 = icmp slt i32 %9, %11, !dbg !27
  br i1 %12, label %13, label %64, !dbg !28

13:                                               ; preds = %8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !29, metadata !DIExpression()), !dbg !32
  store i32 0, ptr %6, align 4, !dbg !32
  br label %14, !dbg !33

14:                                               ; preds = %57, %13
  %15 = load i32, ptr %6, align 4, !dbg !34
  %16 = load i32, ptr %4, align 4, !dbg !36
  %17 = sub nsw i32 %16, 1, !dbg !37
  %18 = load i32, ptr %5, align 4, !dbg !38
  %19 = sub nsw i32 %17, %18, !dbg !39
  %20 = icmp slt i32 %15, %19, !dbg !40
  br i1 %20, label %21, label %60, !dbg !41

21:                                               ; preds = %14
  %22 = load ptr, ptr %3, align 8, !dbg !42
  %23 = load i32, ptr %6, align 4, !dbg !45
  %24 = sext i32 %23 to i64, !dbg !42
  %25 = getelementptr inbounds i32, ptr %22, i64 %24, !dbg !42
  %26 = load i32, ptr %25, align 4, !dbg !42
  %27 = load ptr, ptr %3, align 8, !dbg !46
  %28 = load i32, ptr %6, align 4, !dbg !47
  %29 = add nsw i32 %28, 1, !dbg !48
  %30 = sext i32 %29 to i64, !dbg !46
  %31 = getelementptr inbounds i32, ptr %27, i64 %30, !dbg !46
  %32 = load i32, ptr %31, align 4, !dbg !46
  %33 = icmp sgt i32 %26, %32, !dbg !49
  br i1 %33, label %34, label %56, !dbg !50

34:                                               ; preds = %21
  call void @llvm.dbg.declare(metadata ptr %7, metadata !51, metadata !DIExpression()), !dbg !53
  %35 = load ptr, ptr %3, align 8, !dbg !54
  %36 = load i32, ptr %6, align 4, !dbg !55
  %37 = sext i32 %36 to i64, !dbg !54
  %38 = getelementptr inbounds i32, ptr %35, i64 %37, !dbg !54
  %39 = load i32, ptr %38, align 4, !dbg !54
  store i32 %39, ptr %7, align 4, !dbg !53
  %40 = load ptr, ptr %3, align 8, !dbg !56
  %41 = load i32, ptr %6, align 4, !dbg !57
  %42 = add nsw i32 %41, 1, !dbg !58
  %43 = sext i32 %42 to i64, !dbg !56
  %44 = getelementptr inbounds i32, ptr %40, i64 %43, !dbg !56
  %45 = load i32, ptr %44, align 4, !dbg !56
  %46 = load ptr, ptr %3, align 8, !dbg !59
  %47 = load i32, ptr %6, align 4, !dbg !60
  %48 = sext i32 %47 to i64, !dbg !59
  %49 = getelementptr inbounds i32, ptr %46, i64 %48, !dbg !59
  store i32 %45, ptr %49, align 4, !dbg !61
  %50 = load i32, ptr %7, align 4, !dbg !62
  %51 = load ptr, ptr %3, align 8, !dbg !63
  %52 = load i32, ptr %6, align 4, !dbg !64
  %53 = add nsw i32 %52, 1, !dbg !65
  %54 = sext i32 %53 to i64, !dbg !63
  %55 = getelementptr inbounds i32, ptr %51, i64 %54, !dbg !63
  store i32 %50, ptr %55, align 4, !dbg !66
  br label %56, !dbg !67

56:                                               ; preds = %34, %21
  br label %57, !dbg !68

57:                                               ; preds = %56
  %58 = load i32, ptr %6, align 4, !dbg !69
  %59 = add nsw i32 %58, 1, !dbg !69
  store i32 %59, ptr %6, align 4, !dbg !69
  br label %14, !dbg !70, !llvm.loop !71

60:                                               ; preds = %14
  br label %61, !dbg !74

61:                                               ; preds = %60
  %62 = load i32, ptr %5, align 4, !dbg !75
  %63 = add nsw i32 %62, 1, !dbg !75
  store i32 %63, ptr %5, align 4, !dbg !75
  br label %8, !dbg !76, !llvm.loop !77

64:                                               ; preds = %8
  ret void, !dbg !79
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind ssp uwtable(sync)
define void @matrix_multiply(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !80 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !87, metadata !DIExpression()), !dbg !88
  store ptr %1, ptr %5, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !89, metadata !DIExpression()), !dbg !90
  store ptr %2, ptr %6, align 8
  call void @llvm.dbg.declare(metadata ptr %6, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata ptr %7, metadata !93, metadata !DIExpression()), !dbg !95
  store i32 0, ptr %7, align 4, !dbg !95
  br label %10, !dbg !96

10:                                               ; preds = %63, %3
  %11 = load i32, ptr %7, align 4, !dbg !97
  %12 = icmp slt i32 %11, 10, !dbg !99
  br i1 %12, label %13, label %66, !dbg !100

13:                                               ; preds = %10
  call void @llvm.dbg.declare(metadata ptr %8, metadata !101, metadata !DIExpression()), !dbg !104
  store i32 0, ptr %8, align 4, !dbg !104
  br label %14, !dbg !105

14:                                               ; preds = %59, %13
  %15 = load i32, ptr %8, align 4, !dbg !106
  %16 = icmp slt i32 %15, 10, !dbg !108
  br i1 %16, label %17, label %62, !dbg !109

17:                                               ; preds = %14
  %18 = load ptr, ptr %6, align 8, !dbg !110
  %19 = load i32, ptr %7, align 4, !dbg !112
  %20 = sext i32 %19 to i64, !dbg !110
  %21 = getelementptr inbounds [10 x i32], ptr %18, i64 %20, !dbg !110
  %22 = load i32, ptr %8, align 4, !dbg !113
  %23 = sext i32 %22 to i64, !dbg !110
  %24 = getelementptr inbounds [10 x i32], ptr %21, i64 0, i64 %23, !dbg !110
  store i32 0, ptr %24, align 4, !dbg !114
  call void @llvm.dbg.declare(metadata ptr %9, metadata !115, metadata !DIExpression()), !dbg !117
  store i32 0, ptr %9, align 4, !dbg !117
  br label %25, !dbg !118

25:                                               ; preds = %55, %17
  %26 = load i32, ptr %9, align 4, !dbg !119
  %27 = icmp slt i32 %26, 10, !dbg !121
  br i1 %27, label %28, label %58, !dbg !122

28:                                               ; preds = %25
  %29 = load ptr, ptr %4, align 8, !dbg !123
  %30 = load i32, ptr %7, align 4, !dbg !125
  %31 = sext i32 %30 to i64, !dbg !123
  %32 = getelementptr inbounds [10 x i32], ptr %29, i64 %31, !dbg !123
  %33 = load i32, ptr %9, align 4, !dbg !126
  %34 = sext i32 %33 to i64, !dbg !123
  %35 = getelementptr inbounds [10 x i32], ptr %32, i64 0, i64 %34, !dbg !123
  %36 = load i32, ptr %35, align 4, !dbg !123
  %37 = load ptr, ptr %5, align 8, !dbg !127
  %38 = load i32, ptr %9, align 4, !dbg !128
  %39 = sext i32 %38 to i64, !dbg !127
  %40 = getelementptr inbounds [10 x i32], ptr %37, i64 %39, !dbg !127
  %41 = load i32, ptr %8, align 4, !dbg !129
  %42 = sext i32 %41 to i64, !dbg !127
  %43 = getelementptr inbounds [10 x i32], ptr %40, i64 0, i64 %42, !dbg !127
  %44 = load i32, ptr %43, align 4, !dbg !127
  %45 = mul nsw i32 %36, %44, !dbg !130
  %46 = load ptr, ptr %6, align 8, !dbg !131
  %47 = load i32, ptr %7, align 4, !dbg !132
  %48 = sext i32 %47 to i64, !dbg !131
  %49 = getelementptr inbounds [10 x i32], ptr %46, i64 %48, !dbg !131
  %50 = load i32, ptr %8, align 4, !dbg !133
  %51 = sext i32 %50 to i64, !dbg !131
  %52 = getelementptr inbounds [10 x i32], ptr %49, i64 0, i64 %51, !dbg !131
  %53 = load i32, ptr %52, align 4, !dbg !134
  %54 = add nsw i32 %53, %45, !dbg !134
  store i32 %54, ptr %52, align 4, !dbg !134
  br label %55, !dbg !135

55:                                               ; preds = %28
  %56 = load i32, ptr %9, align 4, !dbg !136
  %57 = add nsw i32 %56, 1, !dbg !136
  store i32 %57, ptr %9, align 4, !dbg !136
  br label %25, !dbg !137, !llvm.loop !138

58:                                               ; preds = %25
  br label %59, !dbg !140

59:                                               ; preds = %58
  %60 = load i32, ptr %8, align 4, !dbg !141
  %61 = add nsw i32 %60, 1, !dbg !141
  store i32 %61, ptr %8, align 4, !dbg !141
  br label %14, !dbg !142, !llvm.loop !143

62:                                               ; preds = %14
  br label %63, !dbg !145

63:                                               ; preds = %62
  %64 = load i32, ptr %7, align 4, !dbg !146
  %65 = add nsw i32 %64, 1, !dbg !146
  store i32 %65, ptr %7, align 4, !dbg !146
  br label %10, !dbg !147, !llvm.loop !148

66:                                               ; preds = %10
  ret void, !dbg !150
}

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @main() #0 !dbg !151 {
  %1 = alloca i32, align 4
  %2 = alloca [10 x i32], align 4
  %3 = alloca i32, align 4
  %4 = alloca [10 x [10 x i32]], align 4
  %5 = alloca [10 x [10 x i32]], align 4
  %6 = alloca [10 x [10 x i32]], align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @llvm.dbg.declare(metadata ptr %2, metadata !154, metadata !DIExpression()), !dbg !155
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %2, ptr align 4 @__const.main.arr, i64 40, i1 false), !dbg !155
  call void @llvm.dbg.declare(metadata ptr %3, metadata !156, metadata !DIExpression()), !dbg !157
  store i32 10, ptr %3, align 4, !dbg !157
  %9 = getelementptr inbounds [10 x i32], ptr %2, i64 0, i64 0, !dbg !158
  %10 = load i32, ptr %3, align 4, !dbg !159
  call void @bubble_sort(ptr noundef %9, i32 noundef %10), !dbg !160
  call void @llvm.dbg.declare(metadata ptr %4, metadata !161, metadata !DIExpression()), !dbg !164
  call void @llvm.dbg.declare(metadata ptr %5, metadata !165, metadata !DIExpression()), !dbg !166
  call void @llvm.dbg.declare(metadata ptr %6, metadata !167, metadata !DIExpression()), !dbg !168
  call void @llvm.dbg.declare(metadata ptr %7, metadata !169, metadata !DIExpression()), !dbg !171
  store i32 0, ptr %7, align 4, !dbg !171
  br label %11, !dbg !172

11:                                               ; preds = %41, %0
  %12 = load i32, ptr %7, align 4, !dbg !173
  %13 = icmp slt i32 %12, 10, !dbg !175
  br i1 %13, label %14, label %44, !dbg !176

14:                                               ; preds = %11
  call void @llvm.dbg.declare(metadata ptr %8, metadata !177, metadata !DIExpression()), !dbg !180
  store i32 0, ptr %8, align 4, !dbg !180
  br label %15, !dbg !181

15:                                               ; preds = %37, %14
  %16 = load i32, ptr %8, align 4, !dbg !182
  %17 = icmp slt i32 %16, 10, !dbg !184
  br i1 %17, label %18, label %40, !dbg !185

18:                                               ; preds = %15
  %19 = load i32, ptr %7, align 4, !dbg !186
  %20 = load i32, ptr %8, align 4, !dbg !188
  %21 = add nsw i32 %19, %20, !dbg !189
  %22 = load i32, ptr %7, align 4, !dbg !190
  %23 = sext i32 %22 to i64, !dbg !191
  %24 = getelementptr inbounds [10 x [10 x i32]], ptr %4, i64 0, i64 %23, !dbg !191
  %25 = load i32, ptr %8, align 4, !dbg !192
  %26 = sext i32 %25 to i64, !dbg !191
  %27 = getelementptr inbounds [10 x i32], ptr %24, i64 0, i64 %26, !dbg !191
  store i32 %21, ptr %27, align 4, !dbg !193
  %28 = load i32, ptr %7, align 4, !dbg !194
  %29 = load i32, ptr %8, align 4, !dbg !195
  %30 = mul nsw i32 %28, %29, !dbg !196
  %31 = load i32, ptr %7, align 4, !dbg !197
  %32 = sext i32 %31 to i64, !dbg !198
  %33 = getelementptr inbounds [10 x [10 x i32]], ptr %5, i64 0, i64 %32, !dbg !198
  %34 = load i32, ptr %8, align 4, !dbg !199
  %35 = sext i32 %34 to i64, !dbg !198
  %36 = getelementptr inbounds [10 x i32], ptr %33, i64 0, i64 %35, !dbg !198
  store i32 %30, ptr %36, align 4, !dbg !200
  br label %37, !dbg !201

37:                                               ; preds = %18
  %38 = load i32, ptr %8, align 4, !dbg !202
  %39 = add nsw i32 %38, 1, !dbg !202
  store i32 %39, ptr %8, align 4, !dbg !202
  br label %15, !dbg !203, !llvm.loop !204

40:                                               ; preds = %15
  br label %41, !dbg !206

41:                                               ; preds = %40
  %42 = load i32, ptr %7, align 4, !dbg !207
  %43 = add nsw i32 %42, 1, !dbg !207
  store i32 %43, ptr %7, align 4, !dbg !207
  br label %11, !dbg !208, !llvm.loop !209

44:                                               ; preds = %11
  %45 = getelementptr inbounds [10 x [10 x i32]], ptr %4, i64 0, i64 0, !dbg !211
  %46 = getelementptr inbounds [10 x [10 x i32]], ptr %5, i64 0, i64 0, !dbg !212
  %47 = getelementptr inbounds [10 x [10 x i32]], ptr %6, i64 0, i64 0, !dbg !213
  call void @matrix_multiply(ptr noundef %45, ptr noundef %46, ptr noundef %47), !dbg !214
  ret i32 0, !dbg !215
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

attributes #0 = { noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "Homebrew clang version 17.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: Apple, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk", sdk: "MacOSX15.sdk")
!1 = !DIFile(filename: "tasks/task3.c", directory: "/Users/jangjaehyeok/Desktop/LLVM")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 1}
!8 = !{!"Homebrew clang version 17.0.6"}
!9 = distinct !DISubprogram(name: "bubble_sort", scope: !1, file: !1, line: 4, type: !10, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DISubroutineType(types: !11)
!11 = !{null, !12, !13}
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "arr", arg: 1, scope: !9, file: !1, line: 4, type: !12)
!16 = !DILocation(line: 4, column: 22, scope: !9)
!17 = !DILocalVariable(name: "n", arg: 2, scope: !9, file: !1, line: 4, type: !13)
!18 = !DILocation(line: 4, column: 33, scope: !9)
!19 = !DILocalVariable(name: "i", scope: !20, file: !1, line: 5, type: !13)
!20 = distinct !DILexicalBlock(scope: !9, file: !1, line: 5, column: 5)
!21 = !DILocation(line: 5, column: 14, scope: !20)
!22 = !DILocation(line: 5, column: 10, scope: !20)
!23 = !DILocation(line: 5, column: 21, scope: !24)
!24 = distinct !DILexicalBlock(scope: !20, file: !1, line: 5, column: 5)
!25 = !DILocation(line: 5, column: 25, scope: !24)
!26 = !DILocation(line: 5, column: 27, scope: !24)
!27 = !DILocation(line: 5, column: 23, scope: !24)
!28 = !DILocation(line: 5, column: 5, scope: !20)
!29 = !DILocalVariable(name: "j", scope: !30, file: !1, line: 6, type: !13)
!30 = distinct !DILexicalBlock(scope: !31, file: !1, line: 6, column: 9)
!31 = distinct !DILexicalBlock(scope: !24, file: !1, line: 5, column: 37)
!32 = !DILocation(line: 6, column: 18, scope: !30)
!33 = !DILocation(line: 6, column: 14, scope: !30)
!34 = !DILocation(line: 6, column: 25, scope: !35)
!35 = distinct !DILexicalBlock(scope: !30, file: !1, line: 6, column: 9)
!36 = !DILocation(line: 6, column: 29, scope: !35)
!37 = !DILocation(line: 6, column: 31, scope: !35)
!38 = !DILocation(line: 6, column: 37, scope: !35)
!39 = !DILocation(line: 6, column: 35, scope: !35)
!40 = !DILocation(line: 6, column: 27, scope: !35)
!41 = !DILocation(line: 6, column: 9, scope: !30)
!42 = !DILocation(line: 7, column: 17, scope: !43)
!43 = distinct !DILexicalBlock(scope: !44, file: !1, line: 7, column: 17)
!44 = distinct !DILexicalBlock(scope: !35, file: !1, line: 6, column: 45)
!45 = !DILocation(line: 7, column: 21, scope: !43)
!46 = !DILocation(line: 7, column: 26, scope: !43)
!47 = !DILocation(line: 7, column: 30, scope: !43)
!48 = !DILocation(line: 7, column: 32, scope: !43)
!49 = !DILocation(line: 7, column: 24, scope: !43)
!50 = !DILocation(line: 7, column: 17, scope: !44)
!51 = !DILocalVariable(name: "temp", scope: !52, file: !1, line: 9, type: !13)
!52 = distinct !DILexicalBlock(scope: !43, file: !1, line: 7, column: 38)
!53 = !DILocation(line: 9, column: 21, scope: !52)
!54 = !DILocation(line: 9, column: 28, scope: !52)
!55 = !DILocation(line: 9, column: 32, scope: !52)
!56 = !DILocation(line: 10, column: 26, scope: !52)
!57 = !DILocation(line: 10, column: 30, scope: !52)
!58 = !DILocation(line: 10, column: 32, scope: !52)
!59 = !DILocation(line: 10, column: 17, scope: !52)
!60 = !DILocation(line: 10, column: 21, scope: !52)
!61 = !DILocation(line: 10, column: 24, scope: !52)
!62 = !DILocation(line: 11, column: 30, scope: !52)
!63 = !DILocation(line: 11, column: 17, scope: !52)
!64 = !DILocation(line: 11, column: 21, scope: !52)
!65 = !DILocation(line: 11, column: 23, scope: !52)
!66 = !DILocation(line: 11, column: 28, scope: !52)
!67 = !DILocation(line: 12, column: 13, scope: !52)
!68 = !DILocation(line: 13, column: 9, scope: !44)
!69 = !DILocation(line: 6, column: 41, scope: !35)
!70 = !DILocation(line: 6, column: 9, scope: !35)
!71 = distinct !{!71, !41, !72, !73}
!72 = !DILocation(line: 13, column: 9, scope: !30)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocation(line: 14, column: 5, scope: !31)
!75 = !DILocation(line: 5, column: 33, scope: !24)
!76 = !DILocation(line: 5, column: 5, scope: !24)
!77 = distinct !{!77, !28, !78, !73}
!78 = !DILocation(line: 14, column: 5, scope: !20)
!79 = !DILocation(line: 15, column: 1, scope: !9)
!80 = distinct !DISubprogram(name: "matrix_multiply", scope: !1, file: !1, line: 18, type: !81, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!81 = !DISubroutineType(types: !82)
!82 = !{null, !83, !83, !83}
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 320, elements: !85)
!85 = !{!86}
!86 = !DISubrange(count: 10)
!87 = !DILocalVariable(name: "a", arg: 1, scope: !80, file: !1, line: 18, type: !83)
!88 = !DILocation(line: 18, column: 26, scope: !80)
!89 = !DILocalVariable(name: "b", arg: 2, scope: !80, file: !1, line: 18, type: !83)
!90 = !DILocation(line: 18, column: 59, scope: !80)
!91 = !DILocalVariable(name: "result", arg: 3, scope: !80, file: !1, line: 18, type: !83)
!92 = !DILocation(line: 18, column: 92, scope: !80)
!93 = !DILocalVariable(name: "i", scope: !94, file: !1, line: 19, type: !13)
!94 = distinct !DILexicalBlock(scope: !80, file: !1, line: 19, column: 5)
!95 = !DILocation(line: 19, column: 14, scope: !94)
!96 = !DILocation(line: 19, column: 10, scope: !94)
!97 = !DILocation(line: 19, column: 21, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !1, line: 19, column: 5)
!99 = !DILocation(line: 19, column: 23, scope: !98)
!100 = !DILocation(line: 19, column: 5, scope: !94)
!101 = !DILocalVariable(name: "j", scope: !102, file: !1, line: 20, type: !13)
!102 = distinct !DILexicalBlock(scope: !103, file: !1, line: 20, column: 9)
!103 = distinct !DILexicalBlock(scope: !98, file: !1, line: 19, column: 43)
!104 = !DILocation(line: 20, column: 18, scope: !102)
!105 = !DILocation(line: 20, column: 14, scope: !102)
!106 = !DILocation(line: 20, column: 25, scope: !107)
!107 = distinct !DILexicalBlock(scope: !102, file: !1, line: 20, column: 9)
!108 = !DILocation(line: 20, column: 27, scope: !107)
!109 = !DILocation(line: 20, column: 9, scope: !102)
!110 = !DILocation(line: 21, column: 13, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !1, line: 20, column: 47)
!112 = !DILocation(line: 21, column: 20, scope: !111)
!113 = !DILocation(line: 21, column: 23, scope: !111)
!114 = !DILocation(line: 21, column: 26, scope: !111)
!115 = !DILocalVariable(name: "k", scope: !116, file: !1, line: 22, type: !13)
!116 = distinct !DILexicalBlock(scope: !111, file: !1, line: 22, column: 13)
!117 = !DILocation(line: 22, column: 22, scope: !116)
!118 = !DILocation(line: 22, column: 18, scope: !116)
!119 = !DILocation(line: 22, column: 29, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !1, line: 22, column: 13)
!121 = !DILocation(line: 22, column: 31, scope: !120)
!122 = !DILocation(line: 22, column: 13, scope: !116)
!123 = !DILocation(line: 23, column: 33, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !1, line: 22, column: 51)
!125 = !DILocation(line: 23, column: 35, scope: !124)
!126 = !DILocation(line: 23, column: 38, scope: !124)
!127 = !DILocation(line: 23, column: 43, scope: !124)
!128 = !DILocation(line: 23, column: 45, scope: !124)
!129 = !DILocation(line: 23, column: 48, scope: !124)
!130 = !DILocation(line: 23, column: 41, scope: !124)
!131 = !DILocation(line: 23, column: 17, scope: !124)
!132 = !DILocation(line: 23, column: 24, scope: !124)
!133 = !DILocation(line: 23, column: 27, scope: !124)
!134 = !DILocation(line: 23, column: 30, scope: !124)
!135 = !DILocation(line: 24, column: 13, scope: !124)
!136 = !DILocation(line: 22, column: 47, scope: !120)
!137 = !DILocation(line: 22, column: 13, scope: !120)
!138 = distinct !{!138, !122, !139, !73}
!139 = !DILocation(line: 24, column: 13, scope: !116)
!140 = !DILocation(line: 25, column: 9, scope: !111)
!141 = !DILocation(line: 20, column: 43, scope: !107)
!142 = !DILocation(line: 20, column: 9, scope: !107)
!143 = distinct !{!143, !109, !144, !73}
!144 = !DILocation(line: 25, column: 9, scope: !102)
!145 = !DILocation(line: 26, column: 5, scope: !103)
!146 = !DILocation(line: 19, column: 39, scope: !98)
!147 = !DILocation(line: 19, column: 5, scope: !98)
!148 = distinct !{!148, !100, !149, !73}
!149 = !DILocation(line: 26, column: 5, scope: !94)
!150 = !DILocation(line: 27, column: 1, scope: !80)
!151 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 29, type: !152, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!152 = !DISubroutineType(types: !153)
!153 = !{!13}
!154 = !DILocalVariable(name: "arr", scope: !151, file: !1, line: 31, type: !84)
!155 = !DILocation(line: 31, column: 9, scope: !151)
!156 = !DILocalVariable(name: "n", scope: !151, file: !1, line: 32, type: !13)
!157 = !DILocation(line: 32, column: 9, scope: !151)
!158 = !DILocation(line: 33, column: 17, scope: !151)
!159 = !DILocation(line: 33, column: 22, scope: !151)
!160 = !DILocation(line: 33, column: 5, scope: !151)
!161 = !DILocalVariable(name: "matrix_a", scope: !151, file: !1, line: 36, type: !162)
!162 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 3200, elements: !163)
!163 = !{!86, !86}
!164 = !DILocation(line: 36, column: 9, scope: !151)
!165 = !DILocalVariable(name: "matrix_b", scope: !151, file: !1, line: 37, type: !162)
!166 = !DILocation(line: 37, column: 9, scope: !151)
!167 = !DILocalVariable(name: "matrix_result", scope: !151, file: !1, line: 38, type: !162)
!168 = !DILocation(line: 38, column: 9, scope: !151)
!169 = !DILocalVariable(name: "i", scope: !170, file: !1, line: 41, type: !13)
!170 = distinct !DILexicalBlock(scope: !151, file: !1, line: 41, column: 5)
!171 = !DILocation(line: 41, column: 14, scope: !170)
!172 = !DILocation(line: 41, column: 10, scope: !170)
!173 = !DILocation(line: 41, column: 21, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !1, line: 41, column: 5)
!175 = !DILocation(line: 41, column: 23, scope: !174)
!176 = !DILocation(line: 41, column: 5, scope: !170)
!177 = !DILocalVariable(name: "j", scope: !178, file: !1, line: 42, type: !13)
!178 = distinct !DILexicalBlock(scope: !179, file: !1, line: 42, column: 9)
!179 = distinct !DILexicalBlock(scope: !174, file: !1, line: 41, column: 43)
!180 = !DILocation(line: 42, column: 18, scope: !178)
!181 = !DILocation(line: 42, column: 14, scope: !178)
!182 = !DILocation(line: 42, column: 25, scope: !183)
!183 = distinct !DILexicalBlock(scope: !178, file: !1, line: 42, column: 9)
!184 = !DILocation(line: 42, column: 27, scope: !183)
!185 = !DILocation(line: 42, column: 9, scope: !178)
!186 = !DILocation(line: 43, column: 30, scope: !187)
!187 = distinct !DILexicalBlock(scope: !183, file: !1, line: 42, column: 47)
!188 = !DILocation(line: 43, column: 34, scope: !187)
!189 = !DILocation(line: 43, column: 32, scope: !187)
!190 = !DILocation(line: 43, column: 22, scope: !187)
!191 = !DILocation(line: 43, column: 13, scope: !187)
!192 = !DILocation(line: 43, column: 25, scope: !187)
!193 = !DILocation(line: 43, column: 28, scope: !187)
!194 = !DILocation(line: 44, column: 30, scope: !187)
!195 = !DILocation(line: 44, column: 34, scope: !187)
!196 = !DILocation(line: 44, column: 32, scope: !187)
!197 = !DILocation(line: 44, column: 22, scope: !187)
!198 = !DILocation(line: 44, column: 13, scope: !187)
!199 = !DILocation(line: 44, column: 25, scope: !187)
!200 = !DILocation(line: 44, column: 28, scope: !187)
!201 = !DILocation(line: 45, column: 9, scope: !187)
!202 = !DILocation(line: 42, column: 43, scope: !183)
!203 = !DILocation(line: 42, column: 9, scope: !183)
!204 = distinct !{!204, !185, !205, !73}
!205 = !DILocation(line: 45, column: 9, scope: !178)
!206 = !DILocation(line: 46, column: 5, scope: !179)
!207 = !DILocation(line: 41, column: 39, scope: !174)
!208 = !DILocation(line: 41, column: 5, scope: !174)
!209 = distinct !{!209, !176, !210, !73}
!210 = !DILocation(line: 46, column: 5, scope: !170)
!211 = !DILocation(line: 48, column: 21, scope: !151)
!212 = !DILocation(line: 48, column: 31, scope: !151)
!213 = !DILocation(line: 48, column: 41, scope: !151)
!214 = !DILocation(line: 48, column: 5, scope: !151)
!215 = !DILocation(line: 50, column: 5, scope: !151)
