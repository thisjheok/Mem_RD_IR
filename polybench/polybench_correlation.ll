; ModuleID = 'tasks/polybench_correlation.c'
source_filename = "tasks/polybench_correlation.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx15.0.0"

@mean = global [25 x double] zeroinitializer, align 8, !dbg !0
@data = global [30 x [25 x double]] zeroinitializer, align 8, !dbg !7
@stddev = global [25 x double] zeroinitializer, align 8, !dbg !17
@corr = global [25 x [25 x double]] zeroinitializer, align 8, !dbg !13

; Function Attrs: noinline nounwind ssp uwtable(sync)
define void @correlation_kernel() #0 !dbg !28 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca double, align 8
  call void @llvm.dbg.declare(metadata ptr %1, metadata !32, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata ptr %2, metadata !35, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata ptr %3, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata ptr %4, metadata !39, metadata !DIExpression()), !dbg !40
  store double 1.000000e-01, ptr %4, align 8, !dbg !40
  store i32 0, ptr %2, align 4, !dbg !41
  br label %5, !dbg !43

5:                                                ; preds = %37, %0
  %6 = load i32, ptr %2, align 4, !dbg !44
  %7 = icmp slt i32 %6, 25, !dbg !46
  br i1 %7, label %8, label %40, !dbg !47

8:                                                ; preds = %5
  %9 = load i32, ptr %2, align 4, !dbg !48
  %10 = sext i32 %9 to i64, !dbg !50
  %11 = getelementptr inbounds [25 x double], ptr @mean, i64 0, i64 %10, !dbg !50
  store double 0.000000e+00, ptr %11, align 8, !dbg !51
  store i32 0, ptr %1, align 4, !dbg !52
  br label %12, !dbg !54

12:                                               ; preds = %28, %8
  %13 = load i32, ptr %1, align 4, !dbg !55
  %14 = icmp slt i32 %13, 30, !dbg !57
  br i1 %14, label %15, label %31, !dbg !58

15:                                               ; preds = %12
  %16 = load i32, ptr %1, align 4, !dbg !59
  %17 = sext i32 %16 to i64, !dbg !61
  %18 = getelementptr inbounds [30 x [25 x double]], ptr @data, i64 0, i64 %17, !dbg !61
  %19 = load i32, ptr %2, align 4, !dbg !62
  %20 = sext i32 %19 to i64, !dbg !61
  %21 = getelementptr inbounds [25 x double], ptr %18, i64 0, i64 %20, !dbg !61
  %22 = load double, ptr %21, align 8, !dbg !61
  %23 = load i32, ptr %2, align 4, !dbg !63
  %24 = sext i32 %23 to i64, !dbg !64
  %25 = getelementptr inbounds [25 x double], ptr @mean, i64 0, i64 %24, !dbg !64
  %26 = load double, ptr %25, align 8, !dbg !65
  %27 = fadd double %26, %22, !dbg !65
  store double %27, ptr %25, align 8, !dbg !65
  br label %28, !dbg !66

28:                                               ; preds = %15
  %29 = load i32, ptr %1, align 4, !dbg !67
  %30 = add nsw i32 %29, 1, !dbg !67
  store i32 %30, ptr %1, align 4, !dbg !67
  br label %12, !dbg !68, !llvm.loop !69

31:                                               ; preds = %12
  %32 = load i32, ptr %2, align 4, !dbg !72
  %33 = sext i32 %32 to i64, !dbg !73
  %34 = getelementptr inbounds [25 x double], ptr @mean, i64 0, i64 %33, !dbg !73
  %35 = load double, ptr %34, align 8, !dbg !74
  %36 = fdiv double %35, 3.000000e+01, !dbg !74
  store double %36, ptr %34, align 8, !dbg !74
  br label %37, !dbg !75

37:                                               ; preds = %31
  %38 = load i32, ptr %2, align 4, !dbg !76
  %39 = add nsw i32 %38, 1, !dbg !76
  store i32 %39, ptr %2, align 4, !dbg !76
  br label %5, !dbg !77, !llvm.loop !78

40:                                               ; preds = %5
  store i32 0, ptr %2, align 4, !dbg !80
  br label %41, !dbg !82

41:                                               ; preds = %115, %40
  %42 = load i32, ptr %2, align 4, !dbg !83
  %43 = icmp slt i32 %42, 25, !dbg !85
  br i1 %43, label %44, label %118, !dbg !86

44:                                               ; preds = %41
  %45 = load i32, ptr %2, align 4, !dbg !87
  %46 = sext i32 %45 to i64, !dbg !89
  %47 = getelementptr inbounds [25 x double], ptr @stddev, i64 0, i64 %46, !dbg !89
  store double 0.000000e+00, ptr %47, align 8, !dbg !90
  store i32 0, ptr %1, align 4, !dbg !91
  br label %48, !dbg !93

48:                                               ; preds = %81, %44
  %49 = load i32, ptr %1, align 4, !dbg !94
  %50 = icmp slt i32 %49, 30, !dbg !96
  br i1 %50, label %51, label %84, !dbg !97

51:                                               ; preds = %48
  %52 = load i32, ptr %1, align 4, !dbg !98
  %53 = sext i32 %52 to i64, !dbg !100
  %54 = getelementptr inbounds [30 x [25 x double]], ptr @data, i64 0, i64 %53, !dbg !100
  %55 = load i32, ptr %2, align 4, !dbg !101
  %56 = sext i32 %55 to i64, !dbg !100
  %57 = getelementptr inbounds [25 x double], ptr %54, i64 0, i64 %56, !dbg !100
  %58 = load double, ptr %57, align 8, !dbg !100
  %59 = load i32, ptr %2, align 4, !dbg !102
  %60 = sext i32 %59 to i64, !dbg !103
  %61 = getelementptr inbounds [25 x double], ptr @mean, i64 0, i64 %60, !dbg !103
  %62 = load double, ptr %61, align 8, !dbg !103
  %63 = fsub double %58, %62, !dbg !104
  %64 = load i32, ptr %1, align 4, !dbg !105
  %65 = sext i32 %64 to i64, !dbg !106
  %66 = getelementptr inbounds [30 x [25 x double]], ptr @data, i64 0, i64 %65, !dbg !106
  %67 = load i32, ptr %2, align 4, !dbg !107
  %68 = sext i32 %67 to i64, !dbg !106
  %69 = getelementptr inbounds [25 x double], ptr %66, i64 0, i64 %68, !dbg !106
  %70 = load double, ptr %69, align 8, !dbg !106
  %71 = load i32, ptr %2, align 4, !dbg !108
  %72 = sext i32 %71 to i64, !dbg !109
  %73 = getelementptr inbounds [25 x double], ptr @mean, i64 0, i64 %72, !dbg !109
  %74 = load double, ptr %73, align 8, !dbg !109
  %75 = fsub double %70, %74, !dbg !110
  %76 = load i32, ptr %2, align 4, !dbg !111
  %77 = sext i32 %76 to i64, !dbg !112
  %78 = getelementptr inbounds [25 x double], ptr @stddev, i64 0, i64 %77, !dbg !112
  %79 = load double, ptr %78, align 8, !dbg !113
  %80 = call double @llvm.fmuladd.f64(double %63, double %75, double %79), !dbg !113
  store double %80, ptr %78, align 8, !dbg !113
  br label %81, !dbg !114

81:                                               ; preds = %51
  %82 = load i32, ptr %1, align 4, !dbg !115
  %83 = add nsw i32 %82, 1, !dbg !115
  store i32 %83, ptr %1, align 4, !dbg !115
  br label %48, !dbg !116, !llvm.loop !117

84:                                               ; preds = %48
  %85 = load i32, ptr %2, align 4, !dbg !119
  %86 = sext i32 %85 to i64, !dbg !120
  %87 = getelementptr inbounds [25 x double], ptr @stddev, i64 0, i64 %86, !dbg !120
  %88 = load double, ptr %87, align 8, !dbg !121
  %89 = fdiv double %88, 3.000000e+01, !dbg !121
  store double %89, ptr %87, align 8, !dbg !121
  %90 = load i32, ptr %2, align 4, !dbg !122
  %91 = sext i32 %90 to i64, !dbg !123
  %92 = getelementptr inbounds [25 x double], ptr @stddev, i64 0, i64 %91, !dbg !123
  %93 = load double, ptr %92, align 8, !dbg !123
  %94 = call double @llvm.sqrt.f64(double %93), !dbg !124
  %95 = load i32, ptr %2, align 4, !dbg !125
  %96 = sext i32 %95 to i64, !dbg !126
  %97 = getelementptr inbounds [25 x double], ptr @stddev, i64 0, i64 %96, !dbg !126
  store double %94, ptr %97, align 8, !dbg !127
  %98 = load i32, ptr %2, align 4, !dbg !128
  %99 = sext i32 %98 to i64, !dbg !129
  %100 = getelementptr inbounds [25 x double], ptr @stddev, i64 0, i64 %99, !dbg !129
  %101 = load double, ptr %100, align 8, !dbg !129
  %102 = load double, ptr %4, align 8, !dbg !130
  %103 = fcmp ole double %101, %102, !dbg !131
  br i1 %103, label %104, label %105, !dbg !132

104:                                              ; preds = %84
  br label %110, !dbg !132

105:                                              ; preds = %84
  %106 = load i32, ptr %2, align 4, !dbg !133
  %107 = sext i32 %106 to i64, !dbg !134
  %108 = getelementptr inbounds [25 x double], ptr @stddev, i64 0, i64 %107, !dbg !134
  %109 = load double, ptr %108, align 8, !dbg !134
  br label %110, !dbg !132

110:                                              ; preds = %105, %104
  %111 = phi double [ 1.000000e+00, %104 ], [ %109, %105 ], !dbg !132
  %112 = load i32, ptr %2, align 4, !dbg !135
  %113 = sext i32 %112 to i64, !dbg !136
  %114 = getelementptr inbounds [25 x double], ptr @stddev, i64 0, i64 %113, !dbg !136
  store double %111, ptr %114, align 8, !dbg !137
  br label %115, !dbg !138

115:                                              ; preds = %110
  %116 = load i32, ptr %2, align 4, !dbg !139
  %117 = add nsw i32 %116, 1, !dbg !139
  store i32 %117, ptr %2, align 4, !dbg !139
  br label %41, !dbg !140, !llvm.loop !141

118:                                              ; preds = %41
  store i32 0, ptr %1, align 4, !dbg !143
  br label %119, !dbg !145

119:                                              ; preds = %157, %118
  %120 = load i32, ptr %1, align 4, !dbg !146
  %121 = icmp slt i32 %120, 30, !dbg !148
  br i1 %121, label %122, label %160, !dbg !149

122:                                              ; preds = %119
  store i32 0, ptr %2, align 4, !dbg !150
  br label %123, !dbg !153

123:                                              ; preds = %153, %122
  %124 = load i32, ptr %2, align 4, !dbg !154
  %125 = icmp slt i32 %124, 25, !dbg !156
  br i1 %125, label %126, label %156, !dbg !157

126:                                              ; preds = %123
  %127 = load i32, ptr %2, align 4, !dbg !158
  %128 = sext i32 %127 to i64, !dbg !160
  %129 = getelementptr inbounds [25 x double], ptr @mean, i64 0, i64 %128, !dbg !160
  %130 = load double, ptr %129, align 8, !dbg !160
  %131 = load i32, ptr %1, align 4, !dbg !161
  %132 = sext i32 %131 to i64, !dbg !162
  %133 = getelementptr inbounds [30 x [25 x double]], ptr @data, i64 0, i64 %132, !dbg !162
  %134 = load i32, ptr %2, align 4, !dbg !163
  %135 = sext i32 %134 to i64, !dbg !162
  %136 = getelementptr inbounds [25 x double], ptr %133, i64 0, i64 %135, !dbg !162
  %137 = load double, ptr %136, align 8, !dbg !164
  %138 = fsub double %137, %130, !dbg !164
  store double %138, ptr %136, align 8, !dbg !164
  %139 = call double @llvm.sqrt.f64(double 3.000000e+01), !dbg !165
  %140 = load i32, ptr %2, align 4, !dbg !166
  %141 = sext i32 %140 to i64, !dbg !167
  %142 = getelementptr inbounds [25 x double], ptr @stddev, i64 0, i64 %141, !dbg !167
  %143 = load double, ptr %142, align 8, !dbg !167
  %144 = fmul double %139, %143, !dbg !168
  %145 = load i32, ptr %1, align 4, !dbg !169
  %146 = sext i32 %145 to i64, !dbg !170
  %147 = getelementptr inbounds [30 x [25 x double]], ptr @data, i64 0, i64 %146, !dbg !170
  %148 = load i32, ptr %2, align 4, !dbg !171
  %149 = sext i32 %148 to i64, !dbg !170
  %150 = getelementptr inbounds [25 x double], ptr %147, i64 0, i64 %149, !dbg !170
  %151 = load double, ptr %150, align 8, !dbg !172
  %152 = fdiv double %151, %144, !dbg !172
  store double %152, ptr %150, align 8, !dbg !172
  br label %153, !dbg !173

153:                                              ; preds = %126
  %154 = load i32, ptr %2, align 4, !dbg !174
  %155 = add nsw i32 %154, 1, !dbg !174
  store i32 %155, ptr %2, align 4, !dbg !174
  br label %123, !dbg !175, !llvm.loop !176

156:                                              ; preds = %123
  br label %157, !dbg !178

157:                                              ; preds = %156
  %158 = load i32, ptr %1, align 4, !dbg !179
  %159 = add nsw i32 %158, 1, !dbg !179
  store i32 %159, ptr %1, align 4, !dbg !179
  br label %119, !dbg !180, !llvm.loop !181

160:                                              ; preds = %119
  store i32 0, ptr %1, align 4, !dbg !183
  br label %161, !dbg !185

161:                                              ; preds = %223, %160
  %162 = load i32, ptr %1, align 4, !dbg !186
  %163 = icmp slt i32 %162, 25, !dbg !188
  br i1 %163, label %164, label %226, !dbg !189

164:                                              ; preds = %161
  %165 = load i32, ptr %1, align 4, !dbg !190
  store i32 %165, ptr %2, align 4, !dbg !193
  br label %166, !dbg !194

166:                                              ; preds = %219, %164
  %167 = load i32, ptr %2, align 4, !dbg !195
  %168 = icmp slt i32 %167, 25, !dbg !197
  br i1 %168, label %169, label %222, !dbg !198

169:                                              ; preds = %166
  %170 = load i32, ptr %1, align 4, !dbg !199
  %171 = sext i32 %170 to i64, !dbg !201
  %172 = getelementptr inbounds [25 x [25 x double]], ptr @corr, i64 0, i64 %171, !dbg !201
  %173 = load i32, ptr %2, align 4, !dbg !202
  %174 = sext i32 %173 to i64, !dbg !201
  %175 = getelementptr inbounds [25 x double], ptr %172, i64 0, i64 %174, !dbg !201
  store double 0.000000e+00, ptr %175, align 8, !dbg !203
  store i32 0, ptr %3, align 4, !dbg !204
  br label %176, !dbg !206

176:                                              ; preds = %202, %169
  %177 = load i32, ptr %3, align 4, !dbg !207
  %178 = icmp slt i32 %177, 30, !dbg !209
  br i1 %178, label %179, label %205, !dbg !210

179:                                              ; preds = %176
  %180 = load i32, ptr %3, align 4, !dbg !211
  %181 = sext i32 %180 to i64, !dbg !213
  %182 = getelementptr inbounds [30 x [25 x double]], ptr @data, i64 0, i64 %181, !dbg !213
  %183 = load i32, ptr %1, align 4, !dbg !214
  %184 = sext i32 %183 to i64, !dbg !213
  %185 = getelementptr inbounds [25 x double], ptr %182, i64 0, i64 %184, !dbg !213
  %186 = load double, ptr %185, align 8, !dbg !213
  %187 = load i32, ptr %3, align 4, !dbg !215
  %188 = sext i32 %187 to i64, !dbg !216
  %189 = getelementptr inbounds [30 x [25 x double]], ptr @data, i64 0, i64 %188, !dbg !216
  %190 = load i32, ptr %2, align 4, !dbg !217
  %191 = sext i32 %190 to i64, !dbg !216
  %192 = getelementptr inbounds [25 x double], ptr %189, i64 0, i64 %191, !dbg !216
  %193 = load double, ptr %192, align 8, !dbg !216
  %194 = load i32, ptr %1, align 4, !dbg !218
  %195 = sext i32 %194 to i64, !dbg !219
  %196 = getelementptr inbounds [25 x [25 x double]], ptr @corr, i64 0, i64 %195, !dbg !219
  %197 = load i32, ptr %2, align 4, !dbg !220
  %198 = sext i32 %197 to i64, !dbg !219
  %199 = getelementptr inbounds [25 x double], ptr %196, i64 0, i64 %198, !dbg !219
  %200 = load double, ptr %199, align 8, !dbg !221
  %201 = call double @llvm.fmuladd.f64(double %186, double %193, double %200), !dbg !221
  store double %201, ptr %199, align 8, !dbg !221
  br label %202, !dbg !222

202:                                              ; preds = %179
  %203 = load i32, ptr %3, align 4, !dbg !223
  %204 = add nsw i32 %203, 1, !dbg !223
  store i32 %204, ptr %3, align 4, !dbg !223
  br label %176, !dbg !224, !llvm.loop !225

205:                                              ; preds = %176
  %206 = load i32, ptr %1, align 4, !dbg !227
  %207 = sext i32 %206 to i64, !dbg !228
  %208 = getelementptr inbounds [25 x [25 x double]], ptr @corr, i64 0, i64 %207, !dbg !228
  %209 = load i32, ptr %2, align 4, !dbg !229
  %210 = sext i32 %209 to i64, !dbg !228
  %211 = getelementptr inbounds [25 x double], ptr %208, i64 0, i64 %210, !dbg !228
  %212 = load double, ptr %211, align 8, !dbg !228
  %213 = load i32, ptr %2, align 4, !dbg !230
  %214 = sext i32 %213 to i64, !dbg !231
  %215 = getelementptr inbounds [25 x [25 x double]], ptr @corr, i64 0, i64 %214, !dbg !231
  %216 = load i32, ptr %1, align 4, !dbg !232
  %217 = sext i32 %216 to i64, !dbg !231
  %218 = getelementptr inbounds [25 x double], ptr %215, i64 0, i64 %217, !dbg !231
  store double %212, ptr %218, align 8, !dbg !233
  br label %219, !dbg !234

219:                                              ; preds = %205
  %220 = load i32, ptr %2, align 4, !dbg !235
  %221 = add nsw i32 %220, 1, !dbg !235
  store i32 %221, ptr %2, align 4, !dbg !235
  br label %166, !dbg !236, !llvm.loop !237

222:                                              ; preds = %166
  br label %223, !dbg !239

223:                                              ; preds = %222
  %224 = load i32, ptr %1, align 4, !dbg !240
  %225 = add nsw i32 %224, 1, !dbg !240
  store i32 %225, ptr %1, align 4, !dbg !240
  br label %161, !dbg !241, !llvm.loop !242

226:                                              ; preds = %161
  ret void, !dbg !244
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.sqrt.f64(double) #1

; Function Attrs: noinline nounwind ssp uwtable(sync)
define i32 @main() #0 !dbg !245 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @llvm.dbg.declare(metadata ptr %2, metadata !248, metadata !DIExpression()), !dbg !249
  call void @llvm.dbg.declare(metadata ptr %3, metadata !250, metadata !DIExpression()), !dbg !251
  store i32 0, ptr %2, align 4, !dbg !252
  br label %4, !dbg !254

4:                                                ; preds = %27, %0
  %5 = load i32, ptr %2, align 4, !dbg !255
  %6 = icmp slt i32 %5, 30, !dbg !257
  br i1 %6, label %7, label %30, !dbg !258

7:                                                ; preds = %4
  store i32 0, ptr %3, align 4, !dbg !259
  br label %8, !dbg !262

8:                                                ; preds = %23, %7
  %9 = load i32, ptr %3, align 4, !dbg !263
  %10 = icmp slt i32 %9, 25, !dbg !265
  br i1 %10, label %11, label %26, !dbg !266

11:                                               ; preds = %8
  %12 = load i32, ptr %2, align 4, !dbg !267
  %13 = load i32, ptr %3, align 4, !dbg !269
  %14 = mul nsw i32 %12, %13, !dbg !270
  %15 = sitofp i32 %14 to double, !dbg !271
  %16 = fdiv double %15, 3.000000e+01, !dbg !272
  %17 = load i32, ptr %2, align 4, !dbg !273
  %18 = sext i32 %17 to i64, !dbg !274
  %19 = getelementptr inbounds [30 x [25 x double]], ptr @data, i64 0, i64 %18, !dbg !274
  %20 = load i32, ptr %3, align 4, !dbg !275
  %21 = sext i32 %20 to i64, !dbg !274
  %22 = getelementptr inbounds [25 x double], ptr %19, i64 0, i64 %21, !dbg !274
  store double %16, ptr %22, align 8, !dbg !276
  br label %23, !dbg !277

23:                                               ; preds = %11
  %24 = load i32, ptr %3, align 4, !dbg !278
  %25 = add nsw i32 %24, 1, !dbg !278
  store i32 %25, ptr %3, align 4, !dbg !278
  br label %8, !dbg !279, !llvm.loop !280

26:                                               ; preds = %8
  br label %27, !dbg !282

27:                                               ; preds = %26
  %28 = load i32, ptr %2, align 4, !dbg !283
  %29 = add nsw i32 %28, 1, !dbg !283
  store i32 %29, ptr %2, align 4, !dbg !283
  br label %4, !dbg !284, !llvm.loop !285

30:                                               ; preds = %4
  call void @correlation_kernel(), !dbg !287
  ret i32 0, !dbg !288
}

attributes #0 = { noinline nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!21, !22, !23, !24, !25, !26}
!llvm.ident = !{!27}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "mean", scope: !2, file: !3, line: 20, type: !19, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Homebrew clang version 17.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !6, splitDebugInlining: false, nameTableKind: Apple, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk", sdk: "MacOSX15.sdk")
!3 = !DIFile(filename: "tasks/polybench_correlation.c", directory: "/Users/jangjaehyeok/Desktop/LLVM")
!4 = !{!5}
!5 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!6 = !{!7, !13, !0, !17}
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(name: "data", scope: !2, file: !3, line: 18, type: !9, isLocal: false, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 48000, elements: !10)
!10 = !{!11, !12}
!11 = !DISubrange(count: 30)
!12 = !DISubrange(count: 25)
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "corr", scope: !2, file: !3, line: 19, type: !15, isLocal: false, isDefinition: true)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 40000, elements: !16)
!16 = !{!12, !12}
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression())
!18 = distinct !DIGlobalVariable(name: "stddev", scope: !2, file: !3, line: 21, type: !19, isLocal: false, isDefinition: true)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !20)
!20 = !{!12}
!21 = !{i32 7, !"Dwarf Version", i32 4}
!22 = !{i32 2, !"Debug Info Version", i32 3}
!23 = !{i32 1, !"wchar_size", i32 4}
!24 = !{i32 8, !"PIC Level", i32 2}
!25 = !{i32 7, !"uwtable", i32 1}
!26 = !{i32 7, !"frame-pointer", i32 1}
!27 = !{!"Homebrew clang version 17.0.6"}
!28 = distinct !DISubprogram(name: "correlation_kernel", scope: !3, file: !3, line: 23, type: !29, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !31)
!29 = !DISubroutineType(types: !30)
!30 = !{null}
!31 = !{}
!32 = !DILocalVariable(name: "i", scope: !28, file: !3, line: 24, type: !33)
!33 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!34 = !DILocation(line: 24, column: 9, scope: !28)
!35 = !DILocalVariable(name: "j", scope: !28, file: !3, line: 24, type: !33)
!36 = !DILocation(line: 24, column: 12, scope: !28)
!37 = !DILocalVariable(name: "k", scope: !28, file: !3, line: 24, type: !33)
!38 = !DILocation(line: 24, column: 15, scope: !28)
!39 = !DILocalVariable(name: "eps", scope: !28, file: !3, line: 25, type: !5)
!40 = !DILocation(line: 25, column: 12, scope: !28)
!41 = !DILocation(line: 28, column: 12, scope: !42)
!42 = distinct !DILexicalBlock(scope: !28, file: !3, line: 28, column: 5)
!43 = !DILocation(line: 28, column: 10, scope: !42)
!44 = !DILocation(line: 28, column: 17, scope: !45)
!45 = distinct !DILexicalBlock(scope: !42, file: !3, line: 28, column: 5)
!46 = !DILocation(line: 28, column: 19, scope: !45)
!47 = !DILocation(line: 28, column: 5, scope: !42)
!48 = !DILocation(line: 29, column: 14, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !3, line: 28, column: 29)
!50 = !DILocation(line: 29, column: 9, scope: !49)
!51 = !DILocation(line: 29, column: 17, scope: !49)
!52 = !DILocation(line: 30, column: 16, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !3, line: 30, column: 9)
!54 = !DILocation(line: 30, column: 14, scope: !53)
!55 = !DILocation(line: 30, column: 21, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !3, line: 30, column: 9)
!57 = !DILocation(line: 30, column: 23, scope: !56)
!58 = !DILocation(line: 30, column: 9, scope: !53)
!59 = !DILocation(line: 31, column: 29, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !3, line: 30, column: 33)
!61 = !DILocation(line: 31, column: 24, scope: !60)
!62 = !DILocation(line: 31, column: 32, scope: !60)
!63 = !DILocation(line: 31, column: 18, scope: !60)
!64 = !DILocation(line: 31, column: 13, scope: !60)
!65 = !DILocation(line: 31, column: 21, scope: !60)
!66 = !DILocation(line: 32, column: 9, scope: !60)
!67 = !DILocation(line: 30, column: 29, scope: !56)
!68 = !DILocation(line: 30, column: 9, scope: !56)
!69 = distinct !{!69, !58, !70, !71}
!70 = !DILocation(line: 32, column: 9, scope: !53)
!71 = !{!"llvm.loop.mustprogress"}
!72 = !DILocation(line: 33, column: 14, scope: !49)
!73 = !DILocation(line: 33, column: 9, scope: !49)
!74 = !DILocation(line: 33, column: 17, scope: !49)
!75 = !DILocation(line: 34, column: 5, scope: !49)
!76 = !DILocation(line: 28, column: 25, scope: !45)
!77 = !DILocation(line: 28, column: 5, scope: !45)
!78 = distinct !{!78, !47, !79, !71}
!79 = !DILocation(line: 34, column: 5, scope: !42)
!80 = !DILocation(line: 37, column: 12, scope: !81)
!81 = distinct !DILexicalBlock(scope: !28, file: !3, line: 37, column: 5)
!82 = !DILocation(line: 37, column: 10, scope: !81)
!83 = !DILocation(line: 37, column: 17, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !3, line: 37, column: 5)
!85 = !DILocation(line: 37, column: 19, scope: !84)
!86 = !DILocation(line: 37, column: 5, scope: !81)
!87 = !DILocation(line: 38, column: 16, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !3, line: 37, column: 29)
!89 = !DILocation(line: 38, column: 9, scope: !88)
!90 = !DILocation(line: 38, column: 19, scope: !88)
!91 = !DILocation(line: 39, column: 16, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !3, line: 39, column: 9)
!93 = !DILocation(line: 39, column: 14, scope: !92)
!94 = !DILocation(line: 39, column: 21, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !3, line: 39, column: 9)
!96 = !DILocation(line: 39, column: 23, scope: !95)
!97 = !DILocation(line: 39, column: 9, scope: !92)
!98 = !DILocation(line: 40, column: 32, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !3, line: 39, column: 33)
!100 = !DILocation(line: 40, column: 27, scope: !99)
!101 = !DILocation(line: 40, column: 35, scope: !99)
!102 = !DILocation(line: 40, column: 45, scope: !99)
!103 = !DILocation(line: 40, column: 40, scope: !99)
!104 = !DILocation(line: 40, column: 38, scope: !99)
!105 = !DILocation(line: 40, column: 57, scope: !99)
!106 = !DILocation(line: 40, column: 52, scope: !99)
!107 = !DILocation(line: 40, column: 60, scope: !99)
!108 = !DILocation(line: 40, column: 70, scope: !99)
!109 = !DILocation(line: 40, column: 65, scope: !99)
!110 = !DILocation(line: 40, column: 63, scope: !99)
!111 = !DILocation(line: 40, column: 20, scope: !99)
!112 = !DILocation(line: 40, column: 13, scope: !99)
!113 = !DILocation(line: 40, column: 23, scope: !99)
!114 = !DILocation(line: 42, column: 9, scope: !99)
!115 = !DILocation(line: 39, column: 29, scope: !95)
!116 = !DILocation(line: 39, column: 9, scope: !95)
!117 = distinct !{!117, !97, !118, !71}
!118 = !DILocation(line: 42, column: 9, scope: !92)
!119 = !DILocation(line: 43, column: 16, scope: !88)
!120 = !DILocation(line: 43, column: 9, scope: !88)
!121 = !DILocation(line: 43, column: 19, scope: !88)
!122 = !DILocation(line: 44, column: 33, scope: !88)
!123 = !DILocation(line: 44, column: 26, scope: !88)
!124 = !DILocation(line: 44, column: 21, scope: !88)
!125 = !DILocation(line: 44, column: 16, scope: !88)
!126 = !DILocation(line: 44, column: 9, scope: !88)
!127 = !DILocation(line: 44, column: 19, scope: !88)
!128 = !DILocation(line: 45, column: 29, scope: !88)
!129 = !DILocation(line: 45, column: 22, scope: !88)
!130 = !DILocation(line: 45, column: 35, scope: !88)
!131 = !DILocation(line: 45, column: 32, scope: !88)
!132 = !DILocation(line: 45, column: 21, scope: !88)
!133 = !DILocation(line: 45, column: 55, scope: !88)
!134 = !DILocation(line: 45, column: 48, scope: !88)
!135 = !DILocation(line: 45, column: 16, scope: !88)
!136 = !DILocation(line: 45, column: 9, scope: !88)
!137 = !DILocation(line: 45, column: 19, scope: !88)
!138 = !DILocation(line: 46, column: 5, scope: !88)
!139 = !DILocation(line: 37, column: 25, scope: !84)
!140 = !DILocation(line: 37, column: 5, scope: !84)
!141 = distinct !{!141, !86, !142, !71}
!142 = !DILocation(line: 46, column: 5, scope: !81)
!143 = !DILocation(line: 49, column: 12, scope: !144)
!144 = distinct !DILexicalBlock(scope: !28, file: !3, line: 49, column: 5)
!145 = !DILocation(line: 49, column: 10, scope: !144)
!146 = !DILocation(line: 49, column: 17, scope: !147)
!147 = distinct !DILexicalBlock(scope: !144, file: !3, line: 49, column: 5)
!148 = !DILocation(line: 49, column: 19, scope: !147)
!149 = !DILocation(line: 49, column: 5, scope: !144)
!150 = !DILocation(line: 50, column: 16, scope: !151)
!151 = distinct !DILexicalBlock(scope: !152, file: !3, line: 50, column: 9)
!152 = distinct !DILexicalBlock(scope: !147, file: !3, line: 49, column: 29)
!153 = !DILocation(line: 50, column: 14, scope: !151)
!154 = !DILocation(line: 50, column: 21, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !3, line: 50, column: 9)
!156 = !DILocation(line: 50, column: 23, scope: !155)
!157 = !DILocation(line: 50, column: 9, scope: !151)
!158 = !DILocation(line: 51, column: 32, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !3, line: 50, column: 33)
!160 = !DILocation(line: 51, column: 27, scope: !159)
!161 = !DILocation(line: 51, column: 18, scope: !159)
!162 = !DILocation(line: 51, column: 13, scope: !159)
!163 = !DILocation(line: 51, column: 21, scope: !159)
!164 = !DILocation(line: 51, column: 24, scope: !159)
!165 = !DILocation(line: 52, column: 27, scope: !159)
!166 = !DILocation(line: 52, column: 44, scope: !159)
!167 = !DILocation(line: 52, column: 37, scope: !159)
!168 = !DILocation(line: 52, column: 35, scope: !159)
!169 = !DILocation(line: 52, column: 18, scope: !159)
!170 = !DILocation(line: 52, column: 13, scope: !159)
!171 = !DILocation(line: 52, column: 21, scope: !159)
!172 = !DILocation(line: 52, column: 24, scope: !159)
!173 = !DILocation(line: 53, column: 9, scope: !159)
!174 = !DILocation(line: 50, column: 29, scope: !155)
!175 = !DILocation(line: 50, column: 9, scope: !155)
!176 = distinct !{!176, !157, !177, !71}
!177 = !DILocation(line: 53, column: 9, scope: !151)
!178 = !DILocation(line: 54, column: 5, scope: !152)
!179 = !DILocation(line: 49, column: 25, scope: !147)
!180 = !DILocation(line: 49, column: 5, scope: !147)
!181 = distinct !{!181, !149, !182, !71}
!182 = !DILocation(line: 54, column: 5, scope: !144)
!183 = !DILocation(line: 57, column: 12, scope: !184)
!184 = distinct !DILexicalBlock(scope: !28, file: !3, line: 57, column: 5)
!185 = !DILocation(line: 57, column: 10, scope: !184)
!186 = !DILocation(line: 57, column: 17, scope: !187)
!187 = distinct !DILexicalBlock(scope: !184, file: !3, line: 57, column: 5)
!188 = !DILocation(line: 57, column: 19, scope: !187)
!189 = !DILocation(line: 57, column: 5, scope: !184)
!190 = !DILocation(line: 58, column: 18, scope: !191)
!191 = distinct !DILexicalBlock(scope: !192, file: !3, line: 58, column: 9)
!192 = distinct !DILexicalBlock(scope: !187, file: !3, line: 57, column: 29)
!193 = !DILocation(line: 58, column: 16, scope: !191)
!194 = !DILocation(line: 58, column: 14, scope: !191)
!195 = !DILocation(line: 58, column: 21, scope: !196)
!196 = distinct !DILexicalBlock(scope: !191, file: !3, line: 58, column: 9)
!197 = !DILocation(line: 58, column: 23, scope: !196)
!198 = !DILocation(line: 58, column: 9, scope: !191)
!199 = !DILocation(line: 59, column: 18, scope: !200)
!200 = distinct !DILexicalBlock(scope: !196, file: !3, line: 58, column: 33)
!201 = !DILocation(line: 59, column: 13, scope: !200)
!202 = !DILocation(line: 59, column: 21, scope: !200)
!203 = !DILocation(line: 59, column: 24, scope: !200)
!204 = !DILocation(line: 60, column: 20, scope: !205)
!205 = distinct !DILexicalBlock(scope: !200, file: !3, line: 60, column: 13)
!206 = !DILocation(line: 60, column: 18, scope: !205)
!207 = !DILocation(line: 60, column: 25, scope: !208)
!208 = distinct !DILexicalBlock(scope: !205, file: !3, line: 60, column: 13)
!209 = !DILocation(line: 60, column: 27, scope: !208)
!210 = !DILocation(line: 60, column: 13, scope: !205)
!211 = !DILocation(line: 61, column: 36, scope: !212)
!212 = distinct !DILexicalBlock(scope: !208, file: !3, line: 60, column: 37)
!213 = !DILocation(line: 61, column: 31, scope: !212)
!214 = !DILocation(line: 61, column: 39, scope: !212)
!215 = !DILocation(line: 61, column: 49, scope: !212)
!216 = !DILocation(line: 61, column: 44, scope: !212)
!217 = !DILocation(line: 61, column: 52, scope: !212)
!218 = !DILocation(line: 61, column: 22, scope: !212)
!219 = !DILocation(line: 61, column: 17, scope: !212)
!220 = !DILocation(line: 61, column: 25, scope: !212)
!221 = !DILocation(line: 61, column: 28, scope: !212)
!222 = !DILocation(line: 63, column: 13, scope: !212)
!223 = !DILocation(line: 60, column: 33, scope: !208)
!224 = !DILocation(line: 60, column: 13, scope: !208)
!225 = distinct !{!225, !210, !226, !71}
!226 = !DILocation(line: 63, column: 13, scope: !205)
!227 = !DILocation(line: 64, column: 31, scope: !200)
!228 = !DILocation(line: 64, column: 26, scope: !200)
!229 = !DILocation(line: 64, column: 34, scope: !200)
!230 = !DILocation(line: 64, column: 18, scope: !200)
!231 = !DILocation(line: 64, column: 13, scope: !200)
!232 = !DILocation(line: 64, column: 21, scope: !200)
!233 = !DILocation(line: 64, column: 24, scope: !200)
!234 = !DILocation(line: 65, column: 9, scope: !200)
!235 = !DILocation(line: 58, column: 29, scope: !196)
!236 = !DILocation(line: 58, column: 9, scope: !196)
!237 = distinct !{!237, !198, !238, !71}
!238 = !DILocation(line: 65, column: 9, scope: !191)
!239 = !DILocation(line: 66, column: 5, scope: !192)
!240 = !DILocation(line: 57, column: 25, scope: !187)
!241 = !DILocation(line: 57, column: 5, scope: !187)
!242 = distinct !{!242, !189, !243, !71}
!243 = !DILocation(line: 66, column: 5, scope: !184)
!244 = !DILocation(line: 67, column: 1, scope: !28)
!245 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 69, type: !246, scopeLine: 69, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !31)
!246 = !DISubroutineType(types: !247)
!247 = !{!33}
!248 = !DILocalVariable(name: "i", scope: !245, file: !3, line: 70, type: !33)
!249 = !DILocation(line: 70, column: 9, scope: !245)
!250 = !DILocalVariable(name: "j", scope: !245, file: !3, line: 70, type: !33)
!251 = !DILocation(line: 70, column: 12, scope: !245)
!252 = !DILocation(line: 73, column: 12, scope: !253)
!253 = distinct !DILexicalBlock(scope: !245, file: !3, line: 73, column: 5)
!254 = !DILocation(line: 73, column: 10, scope: !253)
!255 = !DILocation(line: 73, column: 17, scope: !256)
!256 = distinct !DILexicalBlock(scope: !253, file: !3, line: 73, column: 5)
!257 = !DILocation(line: 73, column: 19, scope: !256)
!258 = !DILocation(line: 73, column: 5, scope: !253)
!259 = !DILocation(line: 74, column: 16, scope: !260)
!260 = distinct !DILexicalBlock(scope: !261, file: !3, line: 74, column: 9)
!261 = distinct !DILexicalBlock(scope: !256, file: !3, line: 73, column: 29)
!262 = !DILocation(line: 74, column: 14, scope: !260)
!263 = !DILocation(line: 74, column: 21, scope: !264)
!264 = distinct !DILexicalBlock(scope: !260, file: !3, line: 74, column: 9)
!265 = !DILocation(line: 74, column: 23, scope: !264)
!266 = !DILocation(line: 74, column: 9, scope: !260)
!267 = !DILocation(line: 75, column: 35, scope: !268)
!268 = distinct !DILexicalBlock(scope: !264, file: !3, line: 74, column: 33)
!269 = !DILocation(line: 75, column: 39, scope: !268)
!270 = !DILocation(line: 75, column: 37, scope: !268)
!271 = !DILocation(line: 75, column: 26, scope: !268)
!272 = !DILocation(line: 75, column: 42, scope: !268)
!273 = !DILocation(line: 75, column: 18, scope: !268)
!274 = !DILocation(line: 75, column: 13, scope: !268)
!275 = !DILocation(line: 75, column: 21, scope: !268)
!276 = !DILocation(line: 75, column: 24, scope: !268)
!277 = !DILocation(line: 76, column: 9, scope: !268)
!278 = !DILocation(line: 74, column: 29, scope: !264)
!279 = !DILocation(line: 74, column: 9, scope: !264)
!280 = distinct !{!280, !266, !281, !71}
!281 = !DILocation(line: 76, column: 9, scope: !260)
!282 = !DILocation(line: 77, column: 5, scope: !261)
!283 = !DILocation(line: 73, column: 25, scope: !256)
!284 = !DILocation(line: 73, column: 5, scope: !256)
!285 = distinct !{!285, !258, !286, !71}
!286 = !DILocation(line: 77, column: 5, scope: !253)
!287 = !DILocation(line: 79, column: 5, scope: !245)
!288 = !DILocation(line: 81, column: 5, scope: !245)
