; ModuleID = 'tasks/example.c'
source_filename = "tasks/example.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @example1() #0 !dbg !10 {
  %1 = alloca [100 x i32], align 4
  %2 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata ptr %1, metadata !15, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata ptr %2, metadata !20, metadata !DIExpression()), !dbg !21
  store i32 0, ptr %2, align 4, !dbg !21
  %3 = getelementptr inbounds [100 x i32], ptr %1, i64 0, i64 0, !dbg !22
  store i32 10, ptr %3, align 4, !dbg !23
  %4 = getelementptr inbounds [100 x i32], ptr %1, i64 0, i64 1, !dbg !24
  store i32 20, ptr %4, align 4, !dbg !25
  %5 = getelementptr inbounds [100 x i32], ptr %1, i64 0, i64 0, !dbg !26
  %6 = load i32, ptr %5, align 4, !dbg !26
  store i32 %6, ptr %2, align 4, !dbg !27
  %7 = getelementptr inbounds [100 x i32], ptr %1, i64 0, i64 2, !dbg !28
  store i32 30, ptr %7, align 4, !dbg !29
  %8 = getelementptr inbounds [100 x i32], ptr %1, i64 0, i64 1, !dbg !30
  %9 = load i32, ptr %8, align 4, !dbg !30
  %10 = load i32, ptr %2, align 4, !dbg !31
  %11 = add nsw i32 %10, %9, !dbg !31
  store i32 %11, ptr %2, align 4, !dbg !31
  %12 = load i32, ptr %2, align 4, !dbg !32
  %13 = getelementptr inbounds [100 x i32], ptr %1, i64 0, i64 0, !dbg !33
  store i32 %12, ptr %13, align 4, !dbg !34
  %14 = load i32, ptr %2, align 4, !dbg !35
  ret i32 %14, !dbg !36
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="non-leaf" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+outline-atomics,+v8a" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Ubuntu clang version 15.0.7", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "tasks/example.c", directory: "/app", checksumkind: CSK_MD5, checksum: "af59f17a06cce02aa231f801e4c76ef5")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 2}
!8 = !{i32 7, !"frame-pointer", i32 1}
!9 = !{!"Ubuntu clang version 15.0.7"}
!10 = distinct !DISubprogram(name: "example1", scope: !1, file: !1, line: 1, type: !11, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "arr", scope: !10, file: !1, line: 2, type: !16)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 3200, elements: !17)
!17 = !{!18}
!18 = !DISubrange(count: 100)
!19 = !DILocation(line: 2, column: 9, scope: !10)
!20 = !DILocalVariable(name: "sum", scope: !10, file: !1, line: 3, type: !13)
!21 = !DILocation(line: 3, column: 9, scope: !10)
!22 = !DILocation(line: 5, column: 5, scope: !10)
!23 = !DILocation(line: 5, column: 12, scope: !10)
!24 = !DILocation(line: 6, column: 5, scope: !10)
!25 = !DILocation(line: 6, column: 12, scope: !10)
!26 = !DILocation(line: 7, column: 11, scope: !10)
!27 = !DILocation(line: 7, column: 9, scope: !10)
!28 = !DILocation(line: 8, column: 5, scope: !10)
!29 = !DILocation(line: 8, column: 12, scope: !10)
!30 = !DILocation(line: 9, column: 12, scope: !10)
!31 = !DILocation(line: 9, column: 9, scope: !10)
!32 = !DILocation(line: 10, column: 14, scope: !10)
!33 = !DILocation(line: 10, column: 5, scope: !10)
!34 = !DILocation(line: 10, column: 12, scope: !10)
!35 = !DILocation(line: 12, column: 12, scope: !10)
!36 = !DILocation(line: 12, column: 5, scope: !10)
