; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=riscv32 -verify-machineinstrs < %s \
; RUN:   | FileCheck -check-prefix=RV32I %s
; RUN: llc -mtriple=riscv32 -mattr=+f -verify-machineinstrs < %s \
; RUN:   | FileCheck -check-prefix=RV32IF %s
; RUN: llc -mtriple=riscv64 -verify-machineinstrs < %s \
; RUN:   | FileCheck -check-prefix=RV64I %s
; RUN: llc -mtriple=riscv64 -mattr=+f -verify-machineinstrs < %s \
; RUN:   | FileCheck -check-prefix=RV64IF %s

; This file tests cases where simple floating point operations can be
; profitably handled though bit manipulation if a soft-float ABI is being used
; (e.g. fneg implemented by XORing the sign bit). This is typically handled in
; DAGCombiner::visitBITCAST, but this target-independent code may not trigger
; in cases where we perform custom legalisation (e.g. RV64F).

define float @fneg(float %a) nounwind {
; RV32I-LABEL: fneg:
; RV32I:       # %bb.0:
; RV32I-NEXT:    lui a1, 524288
; RV32I-NEXT:    xor a0, a0, a1
; RV32I-NEXT:    ret
;
; RV32IF-LABEL: fneg:
; RV32IF:       # %bb.0:
; RV32IF-NEXT:    lui a1, 524288
; RV32IF-NEXT:    xor a0, a0, a1
; RV32IF-NEXT:    ret
;
; RV64I-LABEL: fneg:
; RV64I:       # %bb.0:
; RV64I-NEXT:    lui a1, 524288
; RV64I-NEXT:    xor a0, a0, a1
; RV64I-NEXT:    ret
;
; RV64IF-LABEL: fneg:
; RV64IF:       # %bb.0:
; RV64IF-NEXT:    lui a1, 524288
; RV64IF-NEXT:    xor a0, a0, a1
; RV64IF-NEXT:    ret
  %1 = fneg float %a
  ret float %1
}

declare float @llvm.fabs.f32(float)

define float @fabs(float %a) nounwind {
; RV32I-LABEL: fabs:
; RV32I:       # %bb.0:
; RV32I-NEXT:    slli a0, a0, 1
; RV32I-NEXT:    srli a0, a0, 1
; RV32I-NEXT:    ret
;
; RV32IF-LABEL: fabs:
; RV32IF:       # %bb.0:
; RV32IF-NEXT:    slli a0, a0, 1
; RV32IF-NEXT:    srli a0, a0, 1
; RV32IF-NEXT:    ret
;
; RV64I-LABEL: fabs:
; RV64I:       # %bb.0:
; RV64I-NEXT:    slli a0, a0, 33
; RV64I-NEXT:    srli a0, a0, 33
; RV64I-NEXT:    ret
;
; RV64IF-LABEL: fabs:
; RV64IF:       # %bb.0:
; RV64IF-NEXT:    slli a0, a0, 33
; RV64IF-NEXT:    srli a0, a0, 33
; RV64IF-NEXT:    ret
  %1 = call float @llvm.fabs.f32(float %a)
  ret float %1
}

declare float @llvm.copysign.f32(float, float)

; DAGTypeLegalizer::SoftenFloatRes_FCOPYSIGN will convert to bitwise
; operations if floating point isn't supported. A combine could be written to
; do the same even when f32 is legal.

define float @fcopysign_fneg(float %a, float %b) nounwind {
; RV32I-LABEL: fcopysign_fneg:
; RV32I:       # %bb.0:
; RV32I-NEXT:    not a1, a1
; RV32I-NEXT:    lui a2, 524288
; RV32I-NEXT:    and a1, a1, a2
; RV32I-NEXT:    slli a0, a0, 1
; RV32I-NEXT:    srli a0, a0, 1
; RV32I-NEXT:    or a0, a0, a1
; RV32I-NEXT:    ret
;
; RV32IF-LABEL: fcopysign_fneg:
; RV32IF:       # %bb.0:
; RV32IF-NEXT:    lui a2, 524288
; RV32IF-NEXT:    xor a1, a1, a2
; RV32IF-NEXT:    fmv.w.x ft0, a1
; RV32IF-NEXT:    fmv.w.x ft1, a0
; RV32IF-NEXT:    fsgnj.s ft0, ft1, ft0
; RV32IF-NEXT:    fmv.x.w a0, ft0
; RV32IF-NEXT:    ret
;
; RV64I-LABEL: fcopysign_fneg:
; RV64I:       # %bb.0:
; RV64I-NEXT:    not a1, a1
; RV64I-NEXT:    lui a2, 524288
; RV64I-NEXT:    and a1, a1, a2
; RV64I-NEXT:    slli a0, a0, 33
; RV64I-NEXT:    srli a0, a0, 33
; RV64I-NEXT:    or a0, a0, a1
; RV64I-NEXT:    ret
;
; RV64IF-LABEL: fcopysign_fneg:
; RV64IF:       # %bb.0:
; RV64IF-NEXT:    fmv.w.x ft0, a1
; RV64IF-NEXT:    fmv.w.x ft1, a0
; RV64IF-NEXT:    fsgnjn.s ft0, ft1, ft0
; RV64IF-NEXT:    fmv.x.w a0, ft0
; RV64IF-NEXT:    ret
  %1 = fneg float %b
  %2 = call float @llvm.copysign.f32(float %a, float %1)
  ret float %2
}