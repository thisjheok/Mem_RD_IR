; ModuleID = 'tasks/example.c'
source_filename = "tasks/example.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

@.str = private unnamed_addr constant [12 x i8] c"result: %d\0A\00", align 1, !dbg !0

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @example1() #0 !dbg !17 {
  %1 = alloca [10 x i32], align 4
  %2 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata ptr %1, metadata !22, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata ptr %2, metadata !27, metadata !DIExpression()), !dbg !29
  store i32 0, ptr %2, align 4, !dbg !29
  br label %3, !dbg !30

3:                                                ; preds = %12, %0
  %4 = load i32, ptr %2, align 4, !dbg !31
  %5 = icmp slt i32 %4, 10, !dbg !33
  br i1 %5, label %6, label %15, !dbg !34

6:                                                ; preds = %3
  %7 = load i32, ptr %2, align 4, !dbg !35
  %8 = sext i32 %7 to i64, !dbg !37
  %9 = getelementptr inbounds [10 x i32], ptr %1, i64 0, i64 %8, !dbg !37
  %10 = load i32, ptr %9, align 4, !dbg !38
  %11 = add nsw i32 %10, 1, !dbg !38
  store i32 %11, ptr %9, align 4, !dbg !38
  br label %12, !dbg !39

12:                                               ; preds = %6
  %13 = load i32, ptr %2, align 4, !dbg !40
  %14 = add nsw i32 %13, 1, !dbg !40
  store i32 %14, ptr %2, align 4, !dbg !40
  br label %3, !dbg !41, !llvm.loop !42

15:                                               ; preds = %3
  %16 = getelementptr inbounds [10 x i32], ptr %1, i64 0, i64 0, !dbg !45
  %17 = load i32, ptr %16, align 4, !dbg !45
  %18 = getelementptr inbounds [10 x i32], ptr %1, i64 0, i64 1, !dbg !46
  %19 = load i32, ptr %18, align 4, !dbg !46
  %20 = add nsw i32 %17, %19, !dbg !47
  %21 = getelementptr inbounds [10 x i32], ptr %1, i64 0, i64 2, !dbg !48
  %22 = load i32, ptr %21, align 4, !dbg !48
  %23 = add nsw i32 %20, %22, !dbg !49
  %24 = getelementptr inbounds [10 x i32], ptr %1, i64 0, i64 3, !dbg !50
  %25 = load i32, ptr %24, align 4, !dbg !50
  %26 = add nsw i32 %23, %25, !dbg !51
  %27 = getelementptr inbounds [10 x i32], ptr %1, i64 0, i64 4, !dbg !52
  %28 = load i32, ptr %27, align 4, !dbg !52
  %29 = add nsw i32 %26, %28, !dbg !53
  %30 = getelementptr inbounds [10 x i32], ptr %1, i64 0, i64 5, !dbg !54
  %31 = load i32, ptr %30, align 4, !dbg !54
  %32 = add nsw i32 %29, %31, !dbg !55
  %33 = getelementptr inbounds [10 x i32], ptr %1, i64 0, i64 6, !dbg !56
  %34 = load i32, ptr %33, align 4, !dbg !56
  %35 = add nsw i32 %32, %34, !dbg !57
  %36 = getelementptr inbounds [10 x i32], ptr %1, i64 0, i64 7, !dbg !58
  %37 = load i32, ptr %36, align 4, !dbg !58
  %38 = add nsw i32 %35, %37, !dbg !59
  %39 = getelementptr inbounds [10 x i32], ptr %1, i64 0, i64 8, !dbg !60
  %40 = load i32, ptr %39, align 4, !dbg !60
  %41 = add nsw i32 %38, %40, !dbg !61
  %42 = getelementptr inbounds [10 x i32], ptr %1, i64 0, i64 9, !dbg !62
  %43 = load i32, ptr %42, align 4, !dbg !62
  %44 = add nsw i32 %41, %43, !dbg !63
  ret i32 %44, !dbg !64
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !65 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @llvm.dbg.declare(metadata ptr %2, metadata !66, metadata !DIExpression()), !dbg !67
  %3 = call i32 @example1(), !dbg !68
  store i32 %3, ptr %2, align 4, !dbg !67
  %4 = load i32, ptr %2, align 4, !dbg !69
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %4), !dbg !70
  ret i32 0, !dbg !71
}

declare i32 @printf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+outline-atomics,+v8a" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+outline-atomics,+v8a" }

!llvm.dbg.cu = !{!7}
!llvm.module.flags = !{!9, !10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 14, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "tasks/example.c", directory: "/app", checksumkind: CSK_MD5, checksum: "6e936a046b040df3380e5d23582f8133")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 96, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_unsigned_char)
!5 = !{!6}
!6 = !DISubrange(count: 12)
!7 = distinct !DICompileUnit(language: DW_LANG_C99, file: !2, producer: "Ubuntu clang version 15.0.7", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !8, splitDebugInlining: false, nameTableKind: None)
!8 = !{!0}
!9 = !{i32 7, !"Dwarf Version", i32 5}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"PIC Level", i32 2}
!13 = !{i32 7, !"PIE Level", i32 2}
!14 = !{i32 7, !"uwtable", i32 2}
!15 = !{i32 7, !"frame-pointer", i32 1}
!16 = !{!"Ubuntu clang version 15.0.7"}
!17 = distinct !DISubprogram(name: "example1", scope: !2, file: !2, line: 1, type: !18, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !21)
!18 = !DISubroutineType(types: !19)
!19 = !{!20}
!20 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!21 = !{}
!22 = !DILocalVariable(name: "arr", scope: !17, file: !2, line: 2, type: !23)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 320, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 10)
!26 = !DILocation(line: 2, column: 9, scope: !17)
!27 = !DILocalVariable(name: "i", scope: !28, file: !2, line: 5, type: !20)
!28 = distinct !DILexicalBlock(scope: !17, file: !2, line: 5, column: 5)
!29 = !DILocation(line: 5, column: 13, scope: !28)
!30 = !DILocation(line: 5, column: 9, scope: !28)
!31 = !DILocation(line: 5, column: 17, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !2, line: 5, column: 5)
!33 = !DILocation(line: 5, column: 18, scope: !32)
!34 = !DILocation(line: 5, column: 5, scope: !28)
!35 = !DILocation(line: 6, column: 13, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !2, line: 5, column: 26)
!37 = !DILocation(line: 6, column: 9, scope: !36)
!38 = !DILocation(line: 6, column: 16, scope: !36)
!39 = !DILocation(line: 7, column: 5, scope: !36)
!40 = !DILocation(line: 5, column: 23, scope: !32)
!41 = !DILocation(line: 5, column: 5, scope: !32)
!42 = distinct !{!42, !34, !43, !44}
!43 = !DILocation(line: 7, column: 5, scope: !28)
!44 = !{!"llvm.loop.mustprogress"}
!45 = !DILocation(line: 9, column: 12, scope: !17)
!46 = !DILocation(line: 9, column: 19, scope: !17)
!47 = !DILocation(line: 9, column: 18, scope: !17)
!48 = !DILocation(line: 9, column: 26, scope: !17)
!49 = !DILocation(line: 9, column: 25, scope: !17)
!50 = !DILocation(line: 9, column: 33, scope: !17)
!51 = !DILocation(line: 9, column: 32, scope: !17)
!52 = !DILocation(line: 9, column: 40, scope: !17)
!53 = !DILocation(line: 9, column: 39, scope: !17)
!54 = !DILocation(line: 9, column: 47, scope: !17)
!55 = !DILocation(line: 9, column: 46, scope: !17)
!56 = !DILocation(line: 9, column: 54, scope: !17)
!57 = !DILocation(line: 9, column: 53, scope: !17)
!58 = !DILocation(line: 9, column: 61, scope: !17)
!59 = !DILocation(line: 9, column: 60, scope: !17)
!60 = !DILocation(line: 9, column: 68, scope: !17)
!61 = !DILocation(line: 9, column: 67, scope: !17)
!62 = !DILocation(line: 9, column: 75, scope: !17)
!63 = !DILocation(line: 9, column: 74, scope: !17)
!64 = !DILocation(line: 9, column: 5, scope: !17)
!65 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 12, type: !18, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !21)
!66 = !DILocalVariable(name: "result", scope: !65, file: !2, line: 13, type: !20)
!67 = !DILocation(line: 13, column: 9, scope: !65)
!68 = !DILocation(line: 13, column: 18, scope: !65)
!69 = !DILocation(line: 14, column: 28, scope: !65)
!70 = !DILocation(line: 14, column: 5, scope: !65)
!71 = !DILocation(line: 15, column: 5, scope: !65)
