; ModuleID = 'tasks/task2.c'
source_filename = "tasks/task2.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx15.0.0"

@__const.main.student_names = private unnamed_addr constant [10 x [20 x i8]] [[20 x i8] c"\EA\B9\80\EC\B2\A0\EC\88\98\00\00\00\00\00\00\00\00\00\00\00", [20 x i8] c"\EC\9D\B4\EC\98\81\ED\9D\AC\00\00\00\00\00\00\00\00\00\00\00", [20 x i8] c"\EB\B0\95\EB\AF\BC\EC\88\98\00\00\00\00\00\00\00\00\00\00\00", [20 x i8] c"\EC\B5\9C\EC\A7\80\EC\98\81\00\00\00\00\00\00\00\00\00\00\00", [20 x i8] c"\EC\A0\95\ED\98\84\EC\9A\B0\00\00\00\00\00\00\00\00\00\00\00", [20 x i8] c"\ED\95\9C\EC\86\8C\EC\98\81\00\00\00\00\00\00\00\00\00\00\00", [20 x i8] c"\EA\B0\95\EB\8F\99\ED\98\84\00\00\00\00\00\00\00\00\00\00\00", [20 x i8] c"\EC\9C\A4\EC\84\9C\EC\97\B0\00\00\00\00\00\00\00\00\00\00\00", [20 x i8] c"\EC\9E\84\ED\83\9C\ED\98\B8\00\00\00\00\00\00\00\00\00\00\00", [20 x i8] c"\EC\A1\B0\EB\AF\B8\EB\9E\98\00\00\00\00\00\00\00\00\00\00\00"], align 1
@__const.main.scores = private unnamed_addr constant [10 x [3 x i32]] [[3 x i32] [i32 85, i32 92, i32 78], [3 x i32] [i32 90, i32 88, i32 95], [3 x i32] [i32 76, i32 84, i32 89], [3 x i32] [i32 92, i32 96, i32 88], [3 x i32] [i32 83, i32 79, i32 91], [3 x i32] [i32 88, i32 85, i32 87], [3 x i32] [i32 95, i32 90, i32 93], [3 x i32] [i32 81, i32 87, i32 82], [3 x i32] [i32 89, i32 91, i32 86], [3 x i32] [i32 87, i32 83, i32 90]], align 4
@__const.main.subjects = private unnamed_addr constant [3 x [15 x i8]] [[15 x i8] c"\EC\88\98\ED\95\99\00\00\00\00\00\00\00\00\00", [15 x i8] c"\EC\98\81\EC\96\B4\00\00\00\00\00\00\00\00\00", [15 x i8] c"\EA\B3\BC\ED\95\99\00\00\00\00\00\00\00\00\00"], align 1
@.str = private unnamed_addr constant [41 x i8] c"=== \ED\95\99\EC\83\9D \EC\84\B1\EC\A0\81 \EA\B4\80\EB\A6\AC \EC\8B\9C\EC\8A\A4\ED\85\9C ===\0A\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [29 x i8] c"1. \EC\A0\84\EC\B2\B4 \ED\95\99\EC\83\9D \EC\84\B1\EC\A0\81\ED\91\9C:\0A\00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [27 x i8] c"%-10s %-8s %-8s %-8s %-8s\0A\00", align 1, !dbg !12
@.str.3 = private unnamed_addr constant [7 x i8] c"\EC\9D\B4\EB\A6\84\00", align 1, !dbg !17
@.str.4 = private unnamed_addr constant [7 x i8] c"\EC\88\98\ED\95\99\00", align 1, !dbg !22
@.str.5 = private unnamed_addr constant [7 x i8] c"\EC\98\81\EC\96\B4\00", align 1, !dbg !24
@.str.6 = private unnamed_addr constant [7 x i8] c"\EA\B3\BC\ED\95\99\00", align 1, !dbg !26
@.str.7 = private unnamed_addr constant [7 x i8] c"\ED\8F\89\EA\B7\A0\00", align 1, !dbg !28
@.str.8 = private unnamed_addr constant [42 x i8] c"----------------------------------------\0A\00", align 1, !dbg !30
@.str.9 = private unnamed_addr constant [29 x i8] c"%-10s %-8d %-8d %-8d %-8.1f\0A\00", align 1, !dbg !35
@.str.10 = private unnamed_addr constant [30 x i8] c"\0A2. \EA\B3\BC\EB\AA\A9\EB\B3\84 \ED\8F\89\EA\B7\A0 \EC\A0\90\EC\88\98:\0A\00", align 1, !dbg !37
@.str.11 = private unnamed_addr constant [15 x i8] c"%-8s: %.1f\EC\A0\90\0A\00", align 1, !dbg !42
@.str.12 = private unnamed_addr constant [20 x i8] c"\0A3. \EC\84\B1\EC\A0\81 \EB\B6\84\EC\84\9D:\0A\00", align 1, !dbg !47
@.str.13 = private unnamed_addr constant [32 x i8] c"\EC\B5\9C\EA\B3\A0\EC\A0\90 \ED\95\99\EC\83\9D: %s (%.1f\EC\A0\90)\0A\00", align 1, !dbg !52
@.str.14 = private unnamed_addr constant [32 x i8] c"\EC\B5\9C\EC\A0\80\EC\A0\90 \ED\95\99\EC\83\9D: %s (%.1f\EC\A0\90)\0A\00", align 1, !dbg !57
@.str.15 = private unnamed_addr constant [33 x i8] c"\0A4. 90\EC\A0\90 \EC\9D\B4\EC\83\81 \ED\95\99\EC\83\9D \EB\AA\A9\EB\A1\9D:\0A\00", align 1, !dbg !59
@.str.16 = private unnamed_addr constant [15 x i8] c"- %s: %.1f\EC\A0\90\0A\00", align 1, !dbg !64
@.str.17 = private unnamed_addr constant [38 x i8] c"90\EC\A0\90 \EC\9D\B4\EC\83\81 \ED\95\99\EC\83\9D\EC\9D\B4 \EC\97\86\EC\8A\B5\EB\8B\88\EB\8B\A4.\0A\00", align 1, !dbg !66
@.str.18 = private unnamed_addr constant [42 x i8] c"\0A5. \ED\8F\89\EA\B7\A0 \EC\A0\90\EC\88\98 \EC\88\9C\EC\9C\84 (\EB\82\B4\EB\A6\BC\EC\B0\A8\EC\88\9C):\0A\00", align 1, !dbg !71
@.str.19 = private unnamed_addr constant [21 x i8] c"%d\EB\93\B1: %s (%.1f\EC\A0\90)\0A\00", align 1, !dbg !73

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @main() #0 !dbg !87 {
  %1 = alloca i32, align 4
  %2 = alloca [10 x [20 x i8]], align 1
  %3 = alloca [10 x [3 x i32]], align 4
  %4 = alloca [3 x [15 x i8]], align 1
  %5 = alloca [10 x float], align 4
  %6 = alloca i32, align 4
  %7 = alloca float, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca float, align 4
  %11 = alloca i32, align 4
  %12 = alloca float, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca [10 x i32], align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca [10 x i32], align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @llvm.dbg.declare(metadata ptr %2, metadata !92, metadata !DIExpression()), !dbg !96
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %2, ptr align 1 @__const.main.student_names, i64 200, i1 false), !dbg !96
  call void @llvm.dbg.declare(metadata ptr %3, metadata !97, metadata !DIExpression()), !dbg !101
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %3, ptr align 4 @__const.main.scores, i64 120, i1 false), !dbg !101
  call void @llvm.dbg.declare(metadata ptr %4, metadata !102, metadata !DIExpression()), !dbg !105
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %4, ptr align 1 @__const.main.subjects, i64 45, i1 false), !dbg !105
  call void @llvm.dbg.declare(metadata ptr %5, metadata !106, metadata !DIExpression()), !dbg !110
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str), !dbg !111
  %29 = call i32 (ptr, ...) @printf(ptr noundef @.str.1), !dbg !112
  %30 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, ptr noundef @.str.3, ptr noundef @.str.4, ptr noundef @.str.5, ptr noundef @.str.6, ptr noundef @.str.7), !dbg !113
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.8), !dbg !114
  call void @llvm.dbg.declare(metadata ptr %6, metadata !115, metadata !DIExpression()), !dbg !117
  store i32 0, ptr %6, align 4, !dbg !117
  br label %32, !dbg !118

32:                                               ; preds = %84, %0
  %33 = load i32, ptr %6, align 4, !dbg !119
  %34 = icmp slt i32 %33, 10, !dbg !121
  br i1 %34, label %35, label %87, !dbg !122

35:                                               ; preds = %32
  call void @llvm.dbg.declare(metadata ptr %7, metadata !123, metadata !DIExpression()), !dbg !125
  store float 0.000000e+00, ptr %7, align 4, !dbg !125
  call void @llvm.dbg.declare(metadata ptr %8, metadata !126, metadata !DIExpression()), !dbg !128
  store i32 0, ptr %8, align 4, !dbg !128
  br label %36, !dbg !129

36:                                               ; preds = %50, %35
  %37 = load i32, ptr %8, align 4, !dbg !130
  %38 = icmp slt i32 %37, 3, !dbg !132
  br i1 %38, label %39, label %53, !dbg !133

39:                                               ; preds = %36
  %40 = load i32, ptr %6, align 4, !dbg !134
  %41 = sext i32 %40 to i64, !dbg !136
  %42 = getelementptr inbounds [10 x [3 x i32]], ptr %3, i64 0, i64 %41, !dbg !136
  %43 = load i32, ptr %8, align 4, !dbg !137
  %44 = sext i32 %43 to i64, !dbg !136
  %45 = getelementptr inbounds [3 x i32], ptr %42, i64 0, i64 %44, !dbg !136
  %46 = load i32, ptr %45, align 4, !dbg !136
  %47 = sitofp i32 %46 to float, !dbg !136
  %48 = load float, ptr %7, align 4, !dbg !138
  %49 = fadd float %48, %47, !dbg !138
  store float %49, ptr %7, align 4, !dbg !138
  br label %50, !dbg !139

50:                                               ; preds = %39
  %51 = load i32, ptr %8, align 4, !dbg !140
  %52 = add nsw i32 %51, 1, !dbg !140
  store i32 %52, ptr %8, align 4, !dbg !140
  br label %36, !dbg !141, !llvm.loop !142

53:                                               ; preds = %36
  %54 = load float, ptr %7, align 4, !dbg !145
  %55 = fdiv float %54, 3.000000e+00, !dbg !146
  %56 = load i32, ptr %6, align 4, !dbg !147
  %57 = sext i32 %56 to i64, !dbg !148
  %58 = getelementptr inbounds [10 x float], ptr %5, i64 0, i64 %57, !dbg !148
  store float %55, ptr %58, align 4, !dbg !149
  %59 = load i32, ptr %6, align 4, !dbg !150
  %60 = sext i32 %59 to i64, !dbg !151
  %61 = getelementptr inbounds [10 x [20 x i8]], ptr %2, i64 0, i64 %60, !dbg !151
  %62 = getelementptr inbounds [20 x i8], ptr %61, i64 0, i64 0, !dbg !151
  %63 = load i32, ptr %6, align 4, !dbg !152
  %64 = sext i32 %63 to i64, !dbg !153
  %65 = getelementptr inbounds [10 x [3 x i32]], ptr %3, i64 0, i64 %64, !dbg !153
  %66 = getelementptr inbounds [3 x i32], ptr %65, i64 0, i64 0, !dbg !153
  %67 = load i32, ptr %66, align 4, !dbg !153
  %68 = load i32, ptr %6, align 4, !dbg !154
  %69 = sext i32 %68 to i64, !dbg !155
  %70 = getelementptr inbounds [10 x [3 x i32]], ptr %3, i64 0, i64 %69, !dbg !155
  %71 = getelementptr inbounds [3 x i32], ptr %70, i64 0, i64 1, !dbg !155
  %72 = load i32, ptr %71, align 4, !dbg !155
  %73 = load i32, ptr %6, align 4, !dbg !156
  %74 = sext i32 %73 to i64, !dbg !157
  %75 = getelementptr inbounds [10 x [3 x i32]], ptr %3, i64 0, i64 %74, !dbg !157
  %76 = getelementptr inbounds [3 x i32], ptr %75, i64 0, i64 2, !dbg !157
  %77 = load i32, ptr %76, align 4, !dbg !157
  %78 = load i32, ptr %6, align 4, !dbg !158
  %79 = sext i32 %78 to i64, !dbg !159
  %80 = getelementptr inbounds [10 x float], ptr %5, i64 0, i64 %79, !dbg !159
  %81 = load float, ptr %80, align 4, !dbg !159
  %82 = fpext float %81 to double, !dbg !159
  %83 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, ptr noundef %62, i32 noundef %67, i32 noundef %72, i32 noundef %77, double noundef %82), !dbg !160
  br label %84, !dbg !161

84:                                               ; preds = %53
  %85 = load i32, ptr %6, align 4, !dbg !162
  %86 = add nsw i32 %85, 1, !dbg !162
  store i32 %86, ptr %6, align 4, !dbg !162
  br label %32, !dbg !163, !llvm.loop !164

87:                                               ; preds = %32
  %88 = call i32 (ptr, ...) @printf(ptr noundef @.str.10), !dbg !166
  call void @llvm.dbg.declare(metadata ptr %9, metadata !167, metadata !DIExpression()), !dbg !169
  store i32 0, ptr %9, align 4, !dbg !169
  br label %89, !dbg !170

89:                                               ; preds = %120, %87
  %90 = load i32, ptr %9, align 4, !dbg !171
  %91 = icmp slt i32 %90, 3, !dbg !173
  br i1 %91, label %92, label %123, !dbg !174

92:                                               ; preds = %89
  call void @llvm.dbg.declare(metadata ptr %10, metadata !175, metadata !DIExpression()), !dbg !177
  store float 0.000000e+00, ptr %10, align 4, !dbg !177
  call void @llvm.dbg.declare(metadata ptr %11, metadata !178, metadata !DIExpression()), !dbg !180
  store i32 0, ptr %11, align 4, !dbg !180
  br label %93, !dbg !181

93:                                               ; preds = %107, %92
  %94 = load i32, ptr %11, align 4, !dbg !182
  %95 = icmp slt i32 %94, 10, !dbg !184
  br i1 %95, label %96, label %110, !dbg !185

96:                                               ; preds = %93
  %97 = load i32, ptr %11, align 4, !dbg !186
  %98 = sext i32 %97 to i64, !dbg !188
  %99 = getelementptr inbounds [10 x [3 x i32]], ptr %3, i64 0, i64 %98, !dbg !188
  %100 = load i32, ptr %9, align 4, !dbg !189
  %101 = sext i32 %100 to i64, !dbg !188
  %102 = getelementptr inbounds [3 x i32], ptr %99, i64 0, i64 %101, !dbg !188
  %103 = load i32, ptr %102, align 4, !dbg !188
  %104 = sitofp i32 %103 to float, !dbg !188
  %105 = load float, ptr %10, align 4, !dbg !190
  %106 = fadd float %105, %104, !dbg !190
  store float %106, ptr %10, align 4, !dbg !190
  br label %107, !dbg !191

107:                                              ; preds = %96
  %108 = load i32, ptr %11, align 4, !dbg !192
  %109 = add nsw i32 %108, 1, !dbg !192
  store i32 %109, ptr %11, align 4, !dbg !192
  br label %93, !dbg !193, !llvm.loop !194

110:                                              ; preds = %93
  call void @llvm.dbg.declare(metadata ptr %12, metadata !196, metadata !DIExpression()), !dbg !197
  %111 = load float, ptr %10, align 4, !dbg !198
  %112 = fdiv float %111, 1.000000e+01, !dbg !199
  store float %112, ptr %12, align 4, !dbg !197
  %113 = load i32, ptr %9, align 4, !dbg !200
  %114 = sext i32 %113 to i64, !dbg !201
  %115 = getelementptr inbounds [3 x [15 x i8]], ptr %4, i64 0, i64 %114, !dbg !201
  %116 = getelementptr inbounds [15 x i8], ptr %115, i64 0, i64 0, !dbg !201
  %117 = load float, ptr %12, align 4, !dbg !202
  %118 = fpext float %117 to double, !dbg !202
  %119 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, ptr noundef %116, double noundef %118), !dbg !203
  br label %120, !dbg !204

120:                                              ; preds = %110
  %121 = load i32, ptr %9, align 4, !dbg !205
  %122 = add nsw i32 %121, 1, !dbg !205
  store i32 %122, ptr %9, align 4, !dbg !205
  br label %89, !dbg !206, !llvm.loop !207

123:                                              ; preds = %89
  call void @llvm.dbg.declare(metadata ptr %13, metadata !209, metadata !DIExpression()), !dbg !210
  store i32 0, ptr %13, align 4, !dbg !210
  call void @llvm.dbg.declare(metadata ptr %14, metadata !211, metadata !DIExpression()), !dbg !212
  store i32 0, ptr %14, align 4, !dbg !212
  call void @llvm.dbg.declare(metadata ptr %15, metadata !213, metadata !DIExpression()), !dbg !215
  store i32 1, ptr %15, align 4, !dbg !215
  br label %124, !dbg !216

124:                                              ; preds = %152, %123
  %125 = load i32, ptr %15, align 4, !dbg !217
  %126 = icmp slt i32 %125, 10, !dbg !219
  br i1 %126, label %127, label %155, !dbg !220

127:                                              ; preds = %124
  %128 = load i32, ptr %15, align 4, !dbg !221
  %129 = sext i32 %128 to i64, !dbg !224
  %130 = getelementptr inbounds [10 x float], ptr %5, i64 0, i64 %129, !dbg !224
  %131 = load float, ptr %130, align 4, !dbg !224
  %132 = load i32, ptr %13, align 4, !dbg !225
  %133 = sext i32 %132 to i64, !dbg !226
  %134 = getelementptr inbounds [10 x float], ptr %5, i64 0, i64 %133, !dbg !226
  %135 = load float, ptr %134, align 4, !dbg !226
  %136 = fcmp ogt float %131, %135, !dbg !227
  br i1 %136, label %137, label %139, !dbg !228

137:                                              ; preds = %127
  %138 = load i32, ptr %15, align 4, !dbg !229
  store i32 %138, ptr %13, align 4, !dbg !231
  br label %139, !dbg !232

139:                                              ; preds = %137, %127
  %140 = load i32, ptr %15, align 4, !dbg !233
  %141 = sext i32 %140 to i64, !dbg !235
  %142 = getelementptr inbounds [10 x float], ptr %5, i64 0, i64 %141, !dbg !235
  %143 = load float, ptr %142, align 4, !dbg !235
  %144 = load i32, ptr %14, align 4, !dbg !236
  %145 = sext i32 %144 to i64, !dbg !237
  %146 = getelementptr inbounds [10 x float], ptr %5, i64 0, i64 %145, !dbg !237
  %147 = load float, ptr %146, align 4, !dbg !237
  %148 = fcmp olt float %143, %147, !dbg !238
  br i1 %148, label %149, label %151, !dbg !239

149:                                              ; preds = %139
  %150 = load i32, ptr %15, align 4, !dbg !240
  store i32 %150, ptr %14, align 4, !dbg !242
  br label %151, !dbg !243

151:                                              ; preds = %149, %139
  br label %152, !dbg !244

152:                                              ; preds = %151
  %153 = load i32, ptr %15, align 4, !dbg !245
  %154 = add nsw i32 %153, 1, !dbg !245
  store i32 %154, ptr %15, align 4, !dbg !245
  br label %124, !dbg !246, !llvm.loop !247

155:                                              ; preds = %124
  %156 = call i32 (ptr, ...) @printf(ptr noundef @.str.12), !dbg !249
  %157 = load i32, ptr %13, align 4, !dbg !250
  %158 = sext i32 %157 to i64, !dbg !251
  %159 = getelementptr inbounds [10 x [20 x i8]], ptr %2, i64 0, i64 %158, !dbg !251
  %160 = getelementptr inbounds [20 x i8], ptr %159, i64 0, i64 0, !dbg !251
  %161 = load i32, ptr %13, align 4, !dbg !252
  %162 = sext i32 %161 to i64, !dbg !253
  %163 = getelementptr inbounds [10 x float], ptr %5, i64 0, i64 %162, !dbg !253
  %164 = load float, ptr %163, align 4, !dbg !253
  %165 = fpext float %164 to double, !dbg !253
  %166 = call i32 (ptr, ...) @printf(ptr noundef @.str.13, ptr noundef %160, double noundef %165), !dbg !254
  %167 = load i32, ptr %14, align 4, !dbg !255
  %168 = sext i32 %167 to i64, !dbg !256
  %169 = getelementptr inbounds [10 x [20 x i8]], ptr %2, i64 0, i64 %168, !dbg !256
  %170 = getelementptr inbounds [20 x i8], ptr %169, i64 0, i64 0, !dbg !256
  %171 = load i32, ptr %14, align 4, !dbg !257
  %172 = sext i32 %171 to i64, !dbg !258
  %173 = getelementptr inbounds [10 x float], ptr %5, i64 0, i64 %172, !dbg !258
  %174 = load float, ptr %173, align 4, !dbg !258
  %175 = fpext float %174 to double, !dbg !258
  %176 = call i32 (ptr, ...) @printf(ptr noundef @.str.14, ptr noundef %170, double noundef %175), !dbg !259
  %177 = call i32 (ptr, ...) @printf(ptr noundef @.str.15), !dbg !260
  call void @llvm.dbg.declare(metadata ptr %16, metadata !261, metadata !DIExpression()), !dbg !263
  call void @llvm.dbg.declare(metadata ptr %17, metadata !264, metadata !DIExpression()), !dbg !265
  store i32 0, ptr %17, align 4, !dbg !265
  call void @llvm.dbg.declare(metadata ptr %18, metadata !266, metadata !DIExpression()), !dbg !268
  store i32 0, ptr %18, align 4, !dbg !268
  br label %178, !dbg !269

178:                                              ; preds = %196, %155
  %179 = load i32, ptr %18, align 4, !dbg !270
  %180 = icmp slt i32 %179, 10, !dbg !272
  br i1 %180, label %181, label %199, !dbg !273

181:                                              ; preds = %178
  %182 = load i32, ptr %18, align 4, !dbg !274
  %183 = sext i32 %182 to i64, !dbg !277
  %184 = getelementptr inbounds [10 x float], ptr %5, i64 0, i64 %183, !dbg !277
  %185 = load float, ptr %184, align 4, !dbg !277
  %186 = fpext float %185 to double, !dbg !277
  %187 = fcmp oge double %186, 9.000000e+01, !dbg !278
  br i1 %187, label %188, label %195, !dbg !279

188:                                              ; preds = %181
  %189 = load i32, ptr %18, align 4, !dbg !280
  %190 = load i32, ptr %17, align 4, !dbg !282
  %191 = sext i32 %190 to i64, !dbg !283
  %192 = getelementptr inbounds [10 x i32], ptr %16, i64 0, i64 %191, !dbg !283
  store i32 %189, ptr %192, align 4, !dbg !284
  %193 = load i32, ptr %17, align 4, !dbg !285
  %194 = add nsw i32 %193, 1, !dbg !285
  store i32 %194, ptr %17, align 4, !dbg !285
  br label %195, !dbg !286

195:                                              ; preds = %188, %181
  br label %196, !dbg !287

196:                                              ; preds = %195
  %197 = load i32, ptr %18, align 4, !dbg !288
  %198 = add nsw i32 %197, 1, !dbg !288
  store i32 %198, ptr %18, align 4, !dbg !288
  br label %178, !dbg !289, !llvm.loop !290

199:                                              ; preds = %178
  %200 = load i32, ptr %17, align 4, !dbg !292
  %201 = icmp sgt i32 %200, 0, !dbg !294
  br i1 %201, label %202, label %226, !dbg !295

202:                                              ; preds = %199
  call void @llvm.dbg.declare(metadata ptr %19, metadata !296, metadata !DIExpression()), !dbg !299
  store i32 0, ptr %19, align 4, !dbg !299
  br label %203, !dbg !300

203:                                              ; preds = %222, %202
  %204 = load i32, ptr %19, align 4, !dbg !301
  %205 = load i32, ptr %17, align 4, !dbg !303
  %206 = icmp slt i32 %204, %205, !dbg !304
  br i1 %206, label %207, label %225, !dbg !305

207:                                              ; preds = %203
  call void @llvm.dbg.declare(metadata ptr %20, metadata !306, metadata !DIExpression()), !dbg !308
  %208 = load i32, ptr %19, align 4, !dbg !309
  %209 = sext i32 %208 to i64, !dbg !310
  %210 = getelementptr inbounds [10 x i32], ptr %16, i64 0, i64 %209, !dbg !310
  %211 = load i32, ptr %210, align 4, !dbg !310
  store i32 %211, ptr %20, align 4, !dbg !308
  %212 = load i32, ptr %20, align 4, !dbg !311
  %213 = sext i32 %212 to i64, !dbg !312
  %214 = getelementptr inbounds [10 x [20 x i8]], ptr %2, i64 0, i64 %213, !dbg !312
  %215 = getelementptr inbounds [20 x i8], ptr %214, i64 0, i64 0, !dbg !312
  %216 = load i32, ptr %20, align 4, !dbg !313
  %217 = sext i32 %216 to i64, !dbg !314
  %218 = getelementptr inbounds [10 x float], ptr %5, i64 0, i64 %217, !dbg !314
  %219 = load float, ptr %218, align 4, !dbg !314
  %220 = fpext float %219 to double, !dbg !314
  %221 = call i32 (ptr, ...) @printf(ptr noundef @.str.16, ptr noundef %215, double noundef %220), !dbg !315
  br label %222, !dbg !316

222:                                              ; preds = %207
  %223 = load i32, ptr %19, align 4, !dbg !317
  %224 = add nsw i32 %223, 1, !dbg !317
  store i32 %224, ptr %19, align 4, !dbg !317
  br label %203, !dbg !318, !llvm.loop !319

225:                                              ; preds = %203
  br label %228, !dbg !321

226:                                              ; preds = %199
  %227 = call i32 (ptr, ...) @printf(ptr noundef @.str.17), !dbg !322
  br label %228

228:                                              ; preds = %226, %225
  %229 = call i32 (ptr, ...) @printf(ptr noundef @.str.18), !dbg !324
  call void @llvm.dbg.declare(metadata ptr %21, metadata !325, metadata !DIExpression()), !dbg !326
  call void @llvm.dbg.declare(metadata ptr %22, metadata !327, metadata !DIExpression()), !dbg !329
  store i32 0, ptr %22, align 4, !dbg !329
  br label %230, !dbg !330

230:                                              ; preds = %238, %228
  %231 = load i32, ptr %22, align 4, !dbg !331
  %232 = icmp slt i32 %231, 10, !dbg !333
  br i1 %232, label %233, label %241, !dbg !334

233:                                              ; preds = %230
  %234 = load i32, ptr %22, align 4, !dbg !335
  %235 = load i32, ptr %22, align 4, !dbg !337
  %236 = sext i32 %235 to i64, !dbg !338
  %237 = getelementptr inbounds [10 x i32], ptr %21, i64 0, i64 %236, !dbg !338
  store i32 %234, ptr %237, align 4, !dbg !339
  br label %238, !dbg !340

238:                                              ; preds = %233
  %239 = load i32, ptr %22, align 4, !dbg !341
  %240 = add nsw i32 %239, 1, !dbg !341
  store i32 %240, ptr %22, align 4, !dbg !341
  br label %230, !dbg !342, !llvm.loop !343

241:                                              ; preds = %230
  call void @llvm.dbg.declare(metadata ptr %23, metadata !345, metadata !DIExpression()), !dbg !347
  store i32 0, ptr %23, align 4, !dbg !347
  br label %242, !dbg !348

242:                                              ; preds = %291, %241
  %243 = load i32, ptr %23, align 4, !dbg !349
  %244 = icmp slt i32 %243, 9, !dbg !351
  br i1 %244, label %245, label %294, !dbg !352

245:                                              ; preds = %242
  call void @llvm.dbg.declare(metadata ptr %24, metadata !353, metadata !DIExpression()), !dbg !356
  store i32 0, ptr %24, align 4, !dbg !356
  br label %246, !dbg !357

246:                                              ; preds = %287, %245
  %247 = load i32, ptr %24, align 4, !dbg !358
  %248 = load i32, ptr %23, align 4, !dbg !360
  %249 = sub nsw i32 9, %248, !dbg !361
  %250 = icmp slt i32 %247, %249, !dbg !362
  br i1 %250, label %251, label %290, !dbg !363

251:                                              ; preds = %246
  %252 = load i32, ptr %24, align 4, !dbg !364
  %253 = sext i32 %252 to i64, !dbg !367
  %254 = getelementptr inbounds [10 x i32], ptr %21, i64 0, i64 %253, !dbg !367
  %255 = load i32, ptr %254, align 4, !dbg !367
  %256 = sext i32 %255 to i64, !dbg !368
  %257 = getelementptr inbounds [10 x float], ptr %5, i64 0, i64 %256, !dbg !368
  %258 = load float, ptr %257, align 4, !dbg !368
  %259 = load i32, ptr %24, align 4, !dbg !369
  %260 = add nsw i32 %259, 1, !dbg !370
  %261 = sext i32 %260 to i64, !dbg !371
  %262 = getelementptr inbounds [10 x i32], ptr %21, i64 0, i64 %261, !dbg !371
  %263 = load i32, ptr %262, align 4, !dbg !371
  %264 = sext i32 %263 to i64, !dbg !372
  %265 = getelementptr inbounds [10 x float], ptr %5, i64 0, i64 %264, !dbg !372
  %266 = load float, ptr %265, align 4, !dbg !372
  %267 = fcmp olt float %258, %266, !dbg !373
  br i1 %267, label %268, label %286, !dbg !374

268:                                              ; preds = %251
  call void @llvm.dbg.declare(metadata ptr %25, metadata !375, metadata !DIExpression()), !dbg !377
  %269 = load i32, ptr %24, align 4, !dbg !378
  %270 = sext i32 %269 to i64, !dbg !379
  %271 = getelementptr inbounds [10 x i32], ptr %21, i64 0, i64 %270, !dbg !379
  %272 = load i32, ptr %271, align 4, !dbg !379
  store i32 %272, ptr %25, align 4, !dbg !377
  %273 = load i32, ptr %24, align 4, !dbg !380
  %274 = add nsw i32 %273, 1, !dbg !381
  %275 = sext i32 %274 to i64, !dbg !382
  %276 = getelementptr inbounds [10 x i32], ptr %21, i64 0, i64 %275, !dbg !382
  %277 = load i32, ptr %276, align 4, !dbg !382
  %278 = load i32, ptr %24, align 4, !dbg !383
  %279 = sext i32 %278 to i64, !dbg !384
  %280 = getelementptr inbounds [10 x i32], ptr %21, i64 0, i64 %279, !dbg !384
  store i32 %277, ptr %280, align 4, !dbg !385
  %281 = load i32, ptr %25, align 4, !dbg !386
  %282 = load i32, ptr %24, align 4, !dbg !387
  %283 = add nsw i32 %282, 1, !dbg !388
  %284 = sext i32 %283 to i64, !dbg !389
  %285 = getelementptr inbounds [10 x i32], ptr %21, i64 0, i64 %284, !dbg !389
  store i32 %281, ptr %285, align 4, !dbg !390
  br label %286, !dbg !391

286:                                              ; preds = %268, %251
  br label %287, !dbg !392

287:                                              ; preds = %286
  %288 = load i32, ptr %24, align 4, !dbg !393
  %289 = add nsw i32 %288, 1, !dbg !393
  store i32 %289, ptr %24, align 4, !dbg !393
  br label %246, !dbg !394, !llvm.loop !395

290:                                              ; preds = %246
  br label %291, !dbg !397

291:                                              ; preds = %290
  %292 = load i32, ptr %23, align 4, !dbg !398
  %293 = add nsw i32 %292, 1, !dbg !398
  store i32 %293, ptr %23, align 4, !dbg !398
  br label %242, !dbg !399, !llvm.loop !400

294:                                              ; preds = %242
  call void @llvm.dbg.declare(metadata ptr %26, metadata !402, metadata !DIExpression()), !dbg !404
  store i32 0, ptr %26, align 4, !dbg !404
  br label %295, !dbg !405

295:                                              ; preds = %315, %294
  %296 = load i32, ptr %26, align 4, !dbg !406
  %297 = icmp slt i32 %296, 10, !dbg !408
  br i1 %297, label %298, label %318, !dbg !409

298:                                              ; preds = %295
  call void @llvm.dbg.declare(metadata ptr %27, metadata !410, metadata !DIExpression()), !dbg !412
  %299 = load i32, ptr %26, align 4, !dbg !413
  %300 = sext i32 %299 to i64, !dbg !414
  %301 = getelementptr inbounds [10 x i32], ptr %21, i64 0, i64 %300, !dbg !414
  %302 = load i32, ptr %301, align 4, !dbg !414
  store i32 %302, ptr %27, align 4, !dbg !412
  %303 = load i32, ptr %26, align 4, !dbg !415
  %304 = add nsw i32 %303, 1, !dbg !416
  %305 = load i32, ptr %27, align 4, !dbg !417
  %306 = sext i32 %305 to i64, !dbg !418
  %307 = getelementptr inbounds [10 x [20 x i8]], ptr %2, i64 0, i64 %306, !dbg !418
  %308 = getelementptr inbounds [20 x i8], ptr %307, i64 0, i64 0, !dbg !418
  %309 = load i32, ptr %27, align 4, !dbg !419
  %310 = sext i32 %309 to i64, !dbg !420
  %311 = getelementptr inbounds [10 x float], ptr %5, i64 0, i64 %310, !dbg !420
  %312 = load float, ptr %311, align 4, !dbg !420
  %313 = fpext float %312 to double, !dbg !420
  %314 = call i32 (ptr, ...) @printf(ptr noundef @.str.19, i32 noundef %304, ptr noundef %308, double noundef %313), !dbg !421
  br label %315, !dbg !422

315:                                              ; preds = %298
  %316 = load i32, ptr %26, align 4, !dbg !423
  %317 = add nsw i32 %316, 1, !dbg !423
  store i32 %317, ptr %26, align 4, !dbg !423
  br label %295, !dbg !424, !llvm.loop !425

318:                                              ; preds = %295
  ret i32 0, !dbg !427
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

declare i32 @printf(ptr noundef, ...) #3

attributes #0 = { noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }

!llvm.dbg.cu = !{!78}
!llvm.module.flags = !{!80, !81, !82, !83, !84, !85}
!llvm.ident = !{!86}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 28, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "tasks/task2.c", directory: "/Users/jangjaehyeok/Desktop/LLVM")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 328, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 41)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 31, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 232, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 29)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(scope: null, file: !2, line: 32, type: !14, isLocal: true, isDefinition: true)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 27)
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression())
!18 = distinct !DIGlobalVariable(scope: null, file: !2, line: 32, type: !19, isLocal: true, isDefinition: true)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 56, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 7)
!22 = !DIGlobalVariableExpression(var: !23, expr: !DIExpression())
!23 = distinct !DIGlobalVariable(scope: null, file: !2, line: 32, type: !19, isLocal: true, isDefinition: true)
!24 = !DIGlobalVariableExpression(var: !25, expr: !DIExpression())
!25 = distinct !DIGlobalVariable(scope: null, file: !2, line: 32, type: !19, isLocal: true, isDefinition: true)
!26 = !DIGlobalVariableExpression(var: !27, expr: !DIExpression())
!27 = distinct !DIGlobalVariable(scope: null, file: !2, line: 32, type: !19, isLocal: true, isDefinition: true)
!28 = !DIGlobalVariableExpression(var: !29, expr: !DIExpression())
!29 = distinct !DIGlobalVariable(scope: null, file: !2, line: 32, type: !19, isLocal: true, isDefinition: true)
!30 = !DIGlobalVariableExpression(var: !31, expr: !DIExpression())
!31 = distinct !DIGlobalVariable(scope: null, file: !2, line: 33, type: !32, isLocal: true, isDefinition: true)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 336, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 42)
!35 = !DIGlobalVariableExpression(var: !36, expr: !DIExpression())
!36 = distinct !DIGlobalVariable(scope: null, file: !2, line: 43, type: !9, isLocal: true, isDefinition: true)
!37 = !DIGlobalVariableExpression(var: !38, expr: !DIExpression())
!38 = distinct !DIGlobalVariable(scope: null, file: !2, line: 48, type: !39, isLocal: true, isDefinition: true)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 240, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 30)
!42 = !DIGlobalVariableExpression(var: !43, expr: !DIExpression())
!43 = distinct !DIGlobalVariable(scope: null, file: !2, line: 55, type: !44, isLocal: true, isDefinition: true)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 120, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 15)
!47 = !DIGlobalVariableExpression(var: !48, expr: !DIExpression())
!48 = distinct !DIGlobalVariable(scope: null, file: !2, line: 69, type: !49, isLocal: true, isDefinition: true)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 160, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 20)
!52 = !DIGlobalVariableExpression(var: !53, expr: !DIExpression())
!53 = distinct !DIGlobalVariable(scope: null, file: !2, line: 70, type: !54, isLocal: true, isDefinition: true)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 256, elements: !55)
!55 = !{!56}
!56 = !DISubrange(count: 32)
!57 = !DIGlobalVariableExpression(var: !58, expr: !DIExpression())
!58 = distinct !DIGlobalVariable(scope: null, file: !2, line: 71, type: !54, isLocal: true, isDefinition: true)
!59 = !DIGlobalVariableExpression(var: !60, expr: !DIExpression())
!60 = distinct !DIGlobalVariable(scope: null, file: !2, line: 74, type: !61, isLocal: true, isDefinition: true)
!61 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 264, elements: !62)
!62 = !{!63}
!63 = !DISubrange(count: 33)
!64 = !DIGlobalVariableExpression(var: !65, expr: !DIExpression())
!65 = distinct !DIGlobalVariable(scope: null, file: !2, line: 88, type: !44, isLocal: true, isDefinition: true)
!66 = !DIGlobalVariableExpression(var: !67, expr: !DIExpression())
!67 = distinct !DIGlobalVariable(scope: null, file: !2, line: 91, type: !68, isLocal: true, isDefinition: true)
!68 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 304, elements: !69)
!69 = !{!70}
!70 = !DISubrange(count: 38)
!71 = !DIGlobalVariableExpression(var: !72, expr: !DIExpression())
!72 = distinct !DIGlobalVariable(scope: null, file: !2, line: 95, type: !32, isLocal: true, isDefinition: true)
!73 = !DIGlobalVariableExpression(var: !74, expr: !DIExpression())
!74 = distinct !DIGlobalVariable(scope: null, file: !2, line: 114, type: !75, isLocal: true, isDefinition: true)
!75 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 168, elements: !76)
!76 = !{!77}
!77 = !DISubrange(count: 21)
!78 = distinct !DICompileUnit(language: DW_LANG_C11, file: !2, producer: "Homebrew clang version 17.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !79, splitDebugInlining: false, nameTableKind: Apple, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk", sdk: "MacOSX15.sdk")
!79 = !{!0, !7, !12, !17, !22, !24, !26, !28, !30, !35, !37, !42, !47, !52, !57, !59, !64, !66, !71, !73}
!80 = !{i32 7, !"Dwarf Version", i32 4}
!81 = !{i32 2, !"Debug Info Version", i32 3}
!82 = !{i32 1, !"wchar_size", i32 4}
!83 = !{i32 8, !"PIC Level", i32 2}
!84 = !{i32 7, !"uwtable", i32 1}
!85 = !{i32 7, !"frame-pointer", i32 1}
!86 = !{!"Homebrew clang version 17.0.6"}
!87 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 8, type: !88, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !78, retainedNodes: !91)
!88 = !DISubroutineType(types: !89)
!89 = !{!90}
!90 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!91 = !{}
!92 = !DILocalVariable(name: "student_names", scope: !87, file: !2, line: 10, type: !93)
!93 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 1600, elements: !94)
!94 = !{!95, !51}
!95 = !DISubrange(count: 10)
!96 = !DILocation(line: 10, column: 10, scope: !87)
!97 = !DILocalVariable(name: "scores", scope: !87, file: !2, line: 16, type: !98)
!98 = !DICompositeType(tag: DW_TAG_array_type, baseType: !90, size: 960, elements: !99)
!99 = !{!95, !100}
!100 = !DISubrange(count: 3)
!101 = !DILocation(line: 16, column: 9, scope: !87)
!102 = !DILocalVariable(name: "subjects", scope: !87, file: !2, line: 23, type: !103)
!103 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 360, elements: !104)
!104 = !{!100, !46}
!105 = !DILocation(line: 23, column: 10, scope: !87)
!106 = !DILocalVariable(name: "averages", scope: !87, file: !2, line: 26, type: !107)
!107 = !DICompositeType(tag: DW_TAG_array_type, baseType: !108, size: 320, elements: !109)
!108 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!109 = !{!95}
!110 = !DILocation(line: 26, column: 11, scope: !87)
!111 = !DILocation(line: 28, column: 5, scope: !87)
!112 = !DILocation(line: 31, column: 5, scope: !87)
!113 = !DILocation(line: 32, column: 5, scope: !87)
!114 = !DILocation(line: 33, column: 5, scope: !87)
!115 = !DILocalVariable(name: "i", scope: !116, file: !2, line: 35, type: !90)
!116 = distinct !DILexicalBlock(scope: !87, file: !2, line: 35, column: 5)
!117 = !DILocation(line: 35, column: 14, scope: !116)
!118 = !DILocation(line: 35, column: 10, scope: !116)
!119 = !DILocation(line: 35, column: 21, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !2, line: 35, column: 5)
!121 = !DILocation(line: 35, column: 23, scope: !120)
!122 = !DILocation(line: 35, column: 5, scope: !116)
!123 = !DILocalVariable(name: "sum", scope: !124, file: !2, line: 37, type: !108)
!124 = distinct !DILexicalBlock(scope: !120, file: !2, line: 35, column: 44)
!125 = !DILocation(line: 37, column: 15, scope: !124)
!126 = !DILocalVariable(name: "j", scope: !127, file: !2, line: 38, type: !90)
!127 = distinct !DILexicalBlock(scope: !124, file: !2, line: 38, column: 9)
!128 = !DILocation(line: 38, column: 18, scope: !127)
!129 = !DILocation(line: 38, column: 14, scope: !127)
!130 = !DILocation(line: 38, column: 25, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !2, line: 38, column: 9)
!132 = !DILocation(line: 38, column: 27, scope: !131)
!133 = !DILocation(line: 38, column: 9, scope: !127)
!134 = !DILocation(line: 39, column: 27, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !2, line: 38, column: 48)
!136 = !DILocation(line: 39, column: 20, scope: !135)
!137 = !DILocation(line: 39, column: 30, scope: !135)
!138 = !DILocation(line: 39, column: 17, scope: !135)
!139 = !DILocation(line: 40, column: 9, scope: !135)
!140 = !DILocation(line: 38, column: 44, scope: !131)
!141 = !DILocation(line: 38, column: 9, scope: !131)
!142 = distinct !{!142, !133, !143, !144}
!143 = !DILocation(line: 40, column: 9, scope: !127)
!144 = !{!"llvm.loop.mustprogress"}
!145 = !DILocation(line: 41, column: 23, scope: !124)
!146 = !DILocation(line: 41, column: 27, scope: !124)
!147 = !DILocation(line: 41, column: 18, scope: !124)
!148 = !DILocation(line: 41, column: 9, scope: !124)
!149 = !DILocation(line: 41, column: 21, scope: !124)
!150 = !DILocation(line: 44, column: 30, scope: !124)
!151 = !DILocation(line: 44, column: 16, scope: !124)
!152 = !DILocation(line: 44, column: 41, scope: !124)
!153 = !DILocation(line: 44, column: 34, scope: !124)
!154 = !DILocation(line: 44, column: 55, scope: !124)
!155 = !DILocation(line: 44, column: 48, scope: !124)
!156 = !DILocation(line: 44, column: 69, scope: !124)
!157 = !DILocation(line: 44, column: 62, scope: !124)
!158 = !DILocation(line: 44, column: 85, scope: !124)
!159 = !DILocation(line: 44, column: 76, scope: !124)
!160 = !DILocation(line: 43, column: 9, scope: !124)
!161 = !DILocation(line: 45, column: 5, scope: !124)
!162 = !DILocation(line: 35, column: 40, scope: !120)
!163 = !DILocation(line: 35, column: 5, scope: !120)
!164 = distinct !{!164, !122, !165, !144}
!165 = !DILocation(line: 45, column: 5, scope: !116)
!166 = !DILocation(line: 48, column: 5, scope: !87)
!167 = !DILocalVariable(name: "j", scope: !168, file: !2, line: 49, type: !90)
!168 = distinct !DILexicalBlock(scope: !87, file: !2, line: 49, column: 5)
!169 = !DILocation(line: 49, column: 14, scope: !168)
!170 = !DILocation(line: 49, column: 10, scope: !168)
!171 = !DILocation(line: 49, column: 21, scope: !172)
!172 = distinct !DILexicalBlock(scope: !168, file: !2, line: 49, column: 5)
!173 = !DILocation(line: 49, column: 23, scope: !172)
!174 = !DILocation(line: 49, column: 5, scope: !168)
!175 = !DILocalVariable(name: "subject_sum", scope: !176, file: !2, line: 50, type: !108)
!176 = distinct !DILexicalBlock(scope: !172, file: !2, line: 49, column: 44)
!177 = !DILocation(line: 50, column: 15, scope: !176)
!178 = !DILocalVariable(name: "i", scope: !179, file: !2, line: 51, type: !90)
!179 = distinct !DILexicalBlock(scope: !176, file: !2, line: 51, column: 9)
!180 = !DILocation(line: 51, column: 18, scope: !179)
!181 = !DILocation(line: 51, column: 14, scope: !179)
!182 = !DILocation(line: 51, column: 25, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !2, line: 51, column: 9)
!184 = !DILocation(line: 51, column: 27, scope: !183)
!185 = !DILocation(line: 51, column: 9, scope: !179)
!186 = !DILocation(line: 52, column: 35, scope: !187)
!187 = distinct !DILexicalBlock(scope: !183, file: !2, line: 51, column: 48)
!188 = !DILocation(line: 52, column: 28, scope: !187)
!189 = !DILocation(line: 52, column: 38, scope: !187)
!190 = !DILocation(line: 52, column: 25, scope: !187)
!191 = !DILocation(line: 53, column: 9, scope: !187)
!192 = !DILocation(line: 51, column: 44, scope: !183)
!193 = !DILocation(line: 51, column: 9, scope: !183)
!194 = distinct !{!194, !185, !195, !144}
!195 = !DILocation(line: 53, column: 9, scope: !179)
!196 = !DILocalVariable(name: "subject_avg", scope: !176, file: !2, line: 54, type: !108)
!197 = !DILocation(line: 54, column: 15, scope: !176)
!198 = !DILocation(line: 54, column: 29, scope: !176)
!199 = !DILocation(line: 54, column: 41, scope: !176)
!200 = !DILocation(line: 55, column: 44, scope: !176)
!201 = !DILocation(line: 55, column: 35, scope: !176)
!202 = !DILocation(line: 55, column: 48, scope: !176)
!203 = !DILocation(line: 55, column: 9, scope: !176)
!204 = !DILocation(line: 56, column: 5, scope: !176)
!205 = !DILocation(line: 49, column: 40, scope: !172)
!206 = !DILocation(line: 49, column: 5, scope: !172)
!207 = distinct !{!207, !174, !208, !144}
!208 = !DILocation(line: 56, column: 5, scope: !168)
!209 = !DILocalVariable(name: "max_idx", scope: !87, file: !2, line: 59, type: !90)
!210 = !DILocation(line: 59, column: 9, scope: !87)
!211 = !DILocalVariable(name: "min_idx", scope: !87, file: !2, line: 59, type: !90)
!212 = !DILocation(line: 59, column: 22, scope: !87)
!213 = !DILocalVariable(name: "i", scope: !214, file: !2, line: 60, type: !90)
!214 = distinct !DILexicalBlock(scope: !87, file: !2, line: 60, column: 5)
!215 = !DILocation(line: 60, column: 14, scope: !214)
!216 = !DILocation(line: 60, column: 10, scope: !214)
!217 = !DILocation(line: 60, column: 21, scope: !218)
!218 = distinct !DILexicalBlock(scope: !214, file: !2, line: 60, column: 5)
!219 = !DILocation(line: 60, column: 23, scope: !218)
!220 = !DILocation(line: 60, column: 5, scope: !214)
!221 = !DILocation(line: 61, column: 22, scope: !222)
!222 = distinct !DILexicalBlock(scope: !223, file: !2, line: 61, column: 13)
!223 = distinct !DILexicalBlock(scope: !218, file: !2, line: 60, column: 44)
!224 = !DILocation(line: 61, column: 13, scope: !222)
!225 = !DILocation(line: 61, column: 36, scope: !222)
!226 = !DILocation(line: 61, column: 27, scope: !222)
!227 = !DILocation(line: 61, column: 25, scope: !222)
!228 = !DILocation(line: 61, column: 13, scope: !223)
!229 = !DILocation(line: 62, column: 23, scope: !230)
!230 = distinct !DILexicalBlock(scope: !222, file: !2, line: 61, column: 46)
!231 = !DILocation(line: 62, column: 21, scope: !230)
!232 = !DILocation(line: 63, column: 9, scope: !230)
!233 = !DILocation(line: 64, column: 22, scope: !234)
!234 = distinct !DILexicalBlock(scope: !223, file: !2, line: 64, column: 13)
!235 = !DILocation(line: 64, column: 13, scope: !234)
!236 = !DILocation(line: 64, column: 36, scope: !234)
!237 = !DILocation(line: 64, column: 27, scope: !234)
!238 = !DILocation(line: 64, column: 25, scope: !234)
!239 = !DILocation(line: 64, column: 13, scope: !223)
!240 = !DILocation(line: 65, column: 23, scope: !241)
!241 = distinct !DILexicalBlock(scope: !234, file: !2, line: 64, column: 46)
!242 = !DILocation(line: 65, column: 21, scope: !241)
!243 = !DILocation(line: 66, column: 9, scope: !241)
!244 = !DILocation(line: 67, column: 5, scope: !223)
!245 = !DILocation(line: 60, column: 40, scope: !218)
!246 = !DILocation(line: 60, column: 5, scope: !218)
!247 = distinct !{!247, !220, !248, !144}
!248 = !DILocation(line: 67, column: 5, scope: !214)
!249 = !DILocation(line: 69, column: 5, scope: !87)
!250 = !DILocation(line: 70, column: 62, scope: !87)
!251 = !DILocation(line: 70, column: 48, scope: !87)
!252 = !DILocation(line: 70, column: 81, scope: !87)
!253 = !DILocation(line: 70, column: 72, scope: !87)
!254 = !DILocation(line: 70, column: 5, scope: !87)
!255 = !DILocation(line: 71, column: 62, scope: !87)
!256 = !DILocation(line: 71, column: 48, scope: !87)
!257 = !DILocation(line: 71, column: 81, scope: !87)
!258 = !DILocation(line: 71, column: 72, scope: !87)
!259 = !DILocation(line: 71, column: 5, scope: !87)
!260 = !DILocation(line: 74, column: 5, scope: !87)
!261 = !DILocalVariable(name: "high_achievers", scope: !87, file: !2, line: 75, type: !262)
!262 = !DICompositeType(tag: DW_TAG_array_type, baseType: !90, size: 320, elements: !109)
!263 = !DILocation(line: 75, column: 9, scope: !87)
!264 = !DILocalVariable(name: "count", scope: !87, file: !2, line: 76, type: !90)
!265 = !DILocation(line: 76, column: 9, scope: !87)
!266 = !DILocalVariable(name: "i", scope: !267, file: !2, line: 78, type: !90)
!267 = distinct !DILexicalBlock(scope: !87, file: !2, line: 78, column: 5)
!268 = !DILocation(line: 78, column: 14, scope: !267)
!269 = !DILocation(line: 78, column: 10, scope: !267)
!270 = !DILocation(line: 78, column: 21, scope: !271)
!271 = distinct !DILexicalBlock(scope: !267, file: !2, line: 78, column: 5)
!272 = !DILocation(line: 78, column: 23, scope: !271)
!273 = !DILocation(line: 78, column: 5, scope: !267)
!274 = !DILocation(line: 79, column: 22, scope: !275)
!275 = distinct !DILexicalBlock(scope: !276, file: !2, line: 79, column: 13)
!276 = distinct !DILexicalBlock(scope: !271, file: !2, line: 78, column: 44)
!277 = !DILocation(line: 79, column: 13, scope: !275)
!278 = !DILocation(line: 79, column: 25, scope: !275)
!279 = !DILocation(line: 79, column: 13, scope: !276)
!280 = !DILocation(line: 80, column: 37, scope: !281)
!281 = distinct !DILexicalBlock(scope: !275, file: !2, line: 79, column: 34)
!282 = !DILocation(line: 80, column: 28, scope: !281)
!283 = !DILocation(line: 80, column: 13, scope: !281)
!284 = !DILocation(line: 80, column: 35, scope: !281)
!285 = !DILocation(line: 81, column: 18, scope: !281)
!286 = !DILocation(line: 82, column: 9, scope: !281)
!287 = !DILocation(line: 83, column: 5, scope: !276)
!288 = !DILocation(line: 78, column: 40, scope: !271)
!289 = !DILocation(line: 78, column: 5, scope: !271)
!290 = distinct !{!290, !273, !291, !144}
!291 = !DILocation(line: 83, column: 5, scope: !267)
!292 = !DILocation(line: 85, column: 9, scope: !293)
!293 = distinct !DILexicalBlock(scope: !87, file: !2, line: 85, column: 9)
!294 = !DILocation(line: 85, column: 15, scope: !293)
!295 = !DILocation(line: 85, column: 9, scope: !87)
!296 = !DILocalVariable(name: "i", scope: !297, file: !2, line: 86, type: !90)
!297 = distinct !DILexicalBlock(scope: !298, file: !2, line: 86, column: 9)
!298 = distinct !DILexicalBlock(scope: !293, file: !2, line: 85, column: 20)
!299 = !DILocation(line: 86, column: 18, scope: !297)
!300 = !DILocation(line: 86, column: 14, scope: !297)
!301 = !DILocation(line: 86, column: 25, scope: !302)
!302 = distinct !DILexicalBlock(scope: !297, file: !2, line: 86, column: 9)
!303 = !DILocation(line: 86, column: 29, scope: !302)
!304 = !DILocation(line: 86, column: 27, scope: !302)
!305 = !DILocation(line: 86, column: 9, scope: !297)
!306 = !DILocalVariable(name: "idx", scope: !307, file: !2, line: 87, type: !90)
!307 = distinct !DILexicalBlock(scope: !302, file: !2, line: 86, column: 41)
!308 = !DILocation(line: 87, column: 17, scope: !307)
!309 = !DILocation(line: 87, column: 38, scope: !307)
!310 = !DILocation(line: 87, column: 23, scope: !307)
!311 = !DILocation(line: 88, column: 53, scope: !307)
!312 = !DILocation(line: 88, column: 39, scope: !307)
!313 = !DILocation(line: 88, column: 68, scope: !307)
!314 = !DILocation(line: 88, column: 59, scope: !307)
!315 = !DILocation(line: 88, column: 13, scope: !307)
!316 = !DILocation(line: 89, column: 9, scope: !307)
!317 = !DILocation(line: 86, column: 37, scope: !302)
!318 = !DILocation(line: 86, column: 9, scope: !302)
!319 = distinct !{!319, !305, !320, !144}
!320 = !DILocation(line: 89, column: 9, scope: !297)
!321 = !DILocation(line: 90, column: 5, scope: !298)
!322 = !DILocation(line: 91, column: 9, scope: !323)
!323 = distinct !DILexicalBlock(scope: !293, file: !2, line: 90, column: 12)
!324 = !DILocation(line: 95, column: 5, scope: !87)
!325 = !DILocalVariable(name: "sorted_indices", scope: !87, file: !2, line: 96, type: !262)
!326 = !DILocation(line: 96, column: 9, scope: !87)
!327 = !DILocalVariable(name: "i", scope: !328, file: !2, line: 97, type: !90)
!328 = distinct !DILexicalBlock(scope: !87, file: !2, line: 97, column: 5)
!329 = !DILocation(line: 97, column: 14, scope: !328)
!330 = !DILocation(line: 97, column: 10, scope: !328)
!331 = !DILocation(line: 97, column: 21, scope: !332)
!332 = distinct !DILexicalBlock(scope: !328, file: !2, line: 97, column: 5)
!333 = !DILocation(line: 97, column: 23, scope: !332)
!334 = !DILocation(line: 97, column: 5, scope: !328)
!335 = !DILocation(line: 98, column: 29, scope: !336)
!336 = distinct !DILexicalBlock(scope: !332, file: !2, line: 97, column: 44)
!337 = !DILocation(line: 98, column: 24, scope: !336)
!338 = !DILocation(line: 98, column: 9, scope: !336)
!339 = !DILocation(line: 98, column: 27, scope: !336)
!340 = !DILocation(line: 99, column: 5, scope: !336)
!341 = !DILocation(line: 97, column: 40, scope: !332)
!342 = !DILocation(line: 97, column: 5, scope: !332)
!343 = distinct !{!343, !334, !344, !144}
!344 = !DILocation(line: 99, column: 5, scope: !328)
!345 = !DILocalVariable(name: "i", scope: !346, file: !2, line: 102, type: !90)
!346 = distinct !DILexicalBlock(scope: !87, file: !2, line: 102, column: 5)
!347 = !DILocation(line: 102, column: 14, scope: !346)
!348 = !DILocation(line: 102, column: 10, scope: !346)
!349 = !DILocation(line: 102, column: 21, scope: !350)
!350 = distinct !DILexicalBlock(scope: !346, file: !2, line: 102, column: 5)
!351 = !DILocation(line: 102, column: 23, scope: !350)
!352 = !DILocation(line: 102, column: 5, scope: !346)
!353 = !DILocalVariable(name: "j", scope: !354, file: !2, line: 103, type: !90)
!354 = distinct !DILexicalBlock(scope: !355, file: !2, line: 103, column: 9)
!355 = distinct !DILexicalBlock(scope: !350, file: !2, line: 102, column: 48)
!356 = !DILocation(line: 103, column: 18, scope: !354)
!357 = !DILocation(line: 103, column: 14, scope: !354)
!358 = !DILocation(line: 103, column: 25, scope: !359)
!359 = distinct !DILexicalBlock(scope: !354, file: !2, line: 103, column: 9)
!360 = !DILocation(line: 103, column: 48, scope: !359)
!361 = !DILocation(line: 103, column: 46, scope: !359)
!362 = !DILocation(line: 103, column: 27, scope: !359)
!363 = !DILocation(line: 103, column: 9, scope: !354)
!364 = !DILocation(line: 104, column: 41, scope: !365)
!365 = distinct !DILexicalBlock(scope: !366, file: !2, line: 104, column: 17)
!366 = distinct !DILexicalBlock(scope: !359, file: !2, line: 103, column: 56)
!367 = !DILocation(line: 104, column: 26, scope: !365)
!368 = !DILocation(line: 104, column: 17, scope: !365)
!369 = !DILocation(line: 104, column: 71, scope: !365)
!370 = !DILocation(line: 104, column: 73, scope: !365)
!371 = !DILocation(line: 104, column: 56, scope: !365)
!372 = !DILocation(line: 104, column: 47, scope: !365)
!373 = !DILocation(line: 104, column: 45, scope: !365)
!374 = !DILocation(line: 104, column: 17, scope: !366)
!375 = !DILocalVariable(name: "temp", scope: !376, file: !2, line: 105, type: !90)
!376 = distinct !DILexicalBlock(scope: !365, file: !2, line: 104, column: 80)
!377 = !DILocation(line: 105, column: 21, scope: !376)
!378 = !DILocation(line: 105, column: 43, scope: !376)
!379 = !DILocation(line: 105, column: 28, scope: !376)
!380 = !DILocation(line: 106, column: 52, scope: !376)
!381 = !DILocation(line: 106, column: 54, scope: !376)
!382 = !DILocation(line: 106, column: 37, scope: !376)
!383 = !DILocation(line: 106, column: 32, scope: !376)
!384 = !DILocation(line: 106, column: 17, scope: !376)
!385 = !DILocation(line: 106, column: 35, scope: !376)
!386 = !DILocation(line: 107, column: 41, scope: !376)
!387 = !DILocation(line: 107, column: 32, scope: !376)
!388 = !DILocation(line: 107, column: 34, scope: !376)
!389 = !DILocation(line: 107, column: 17, scope: !376)
!390 = !DILocation(line: 107, column: 39, scope: !376)
!391 = !DILocation(line: 108, column: 13, scope: !376)
!392 = !DILocation(line: 109, column: 9, scope: !366)
!393 = !DILocation(line: 103, column: 52, scope: !359)
!394 = !DILocation(line: 103, column: 9, scope: !359)
!395 = distinct !{!395, !363, !396, !144}
!396 = !DILocation(line: 109, column: 9, scope: !354)
!397 = !DILocation(line: 110, column: 5, scope: !355)
!398 = !DILocation(line: 102, column: 44, scope: !350)
!399 = !DILocation(line: 102, column: 5, scope: !350)
!400 = distinct !{!400, !352, !401, !144}
!401 = !DILocation(line: 110, column: 5, scope: !346)
!402 = !DILocalVariable(name: "i", scope: !403, file: !2, line: 112, type: !90)
!403 = distinct !DILexicalBlock(scope: !87, file: !2, line: 112, column: 5)
!404 = !DILocation(line: 112, column: 14, scope: !403)
!405 = !DILocation(line: 112, column: 10, scope: !403)
!406 = !DILocation(line: 112, column: 21, scope: !407)
!407 = distinct !DILexicalBlock(scope: !403, file: !2, line: 112, column: 5)
!408 = !DILocation(line: 112, column: 23, scope: !407)
!409 = !DILocation(line: 112, column: 5, scope: !403)
!410 = !DILocalVariable(name: "idx", scope: !411, file: !2, line: 113, type: !90)
!411 = distinct !DILexicalBlock(scope: !407, file: !2, line: 112, column: 44)
!412 = !DILocation(line: 113, column: 13, scope: !411)
!413 = !DILocation(line: 113, column: 34, scope: !411)
!414 = !DILocation(line: 113, column: 19, scope: !411)
!415 = !DILocation(line: 114, column: 41, scope: !411)
!416 = !DILocation(line: 114, column: 43, scope: !411)
!417 = !DILocation(line: 114, column: 62, scope: !411)
!418 = !DILocation(line: 114, column: 48, scope: !411)
!419 = !DILocation(line: 114, column: 77, scope: !411)
!420 = !DILocation(line: 114, column: 68, scope: !411)
!421 = !DILocation(line: 114, column: 9, scope: !411)
!422 = !DILocation(line: 115, column: 5, scope: !411)
!423 = !DILocation(line: 112, column: 40, scope: !407)
!424 = !DILocation(line: 112, column: 5, scope: !407)
!425 = distinct !{!425, !409, !426, !144}
!426 = !DILocation(line: 115, column: 5, scope: !403)
!427 = !DILocation(line: 117, column: 5, scope: !87)
