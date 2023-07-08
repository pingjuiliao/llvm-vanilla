; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -mtriple=x86_64-- -passes=slp-vectorizer,instcombine -S < %s | FileCheck %s

; These conversions should be vectorized by reviews.llvm.org/D57059

define dso_local <4 x float> @foo(<4 x i32> %0) {
; CHECK-LABEL: @foo(
; CHECK-NEXT:    [[TMP2:%.*]] = extractelement <4 x i32> [[TMP0:%.*]], i64 1
; CHECK-NEXT:    [[TMP3:%.*]] = sitofp i32 [[TMP2]] to float
; CHECK-NEXT:    [[TMP4:%.*]] = insertelement <4 x float> undef, float [[TMP3]], i64 0
; CHECK-NEXT:    [[TMP5:%.*]] = shufflevector <4 x float> [[TMP4]], <4 x float> poison, <4 x i32> <i32 0, i32 0, i32 undef, i32 undef>
; CHECK-NEXT:    [[TMP6:%.*]] = shufflevector <4 x i32> [[TMP0]], <4 x i32> undef, <2 x i32> <i32 2, i32 3>
; CHECK-NEXT:    [[TMP7:%.*]] = sitofp <2 x i32> [[TMP6]] to <2 x float>
; CHECK-NEXT:    [[TMP8:%.*]] = shufflevector <2 x float> [[TMP7]], <2 x float> poison, <4 x i32> <i32 0, i32 1, i32 undef, i32 undef>
; CHECK-NEXT:    [[TMP9:%.*]] = shufflevector <4 x float> [[TMP5]], <4 x float> [[TMP8]], <4 x i32> <i32 0, i32 1, i32 4, i32 5>
; CHECK-NEXT:    ret <4 x float> [[TMP9]]
;
  %2 = extractelement <4 x i32> %0, i32 1
  %3 = sitofp i32 %2 to float
  %4 = insertelement <4 x float> undef, float %3, i32 0
  %5 = insertelement <4 x float> %4, float %3, i32 1
  %6 = extractelement <4 x i32> %0, i32 2
  %7 = sitofp i32 %6 to float
  %8 = insertelement <4 x float> %5, float %7, i32 2
  %9 = extractelement <4 x i32> %0, i32 3
  %10 = sitofp i32 %9 to float
  %11 = insertelement <4 x float> %8, float %10, i32 3
  ret <4 x float> %11
}
