; NOTE: Assertions have been autogenerated by utils/update_mir_test_checks.py
; RUN: llc -global-isel -march=amdgcn -mcpu=gfx90a -verify-machineinstrs -stop-after=instruction-select < %s | FileCheck -check-prefix=GFX90A_GFX940 %s
; RUN: llc -global-isel -march=amdgcn -mcpu=gfx940 -verify-machineinstrs -stop-after=instruction-select < %s | FileCheck -check-prefix=GFX90A_GFX940 %s

define amdgpu_ps void @buffer_atomic_fadd_f64_offset_no_rtn(double %val, <4 x i32> inreg %rsrc, i32 inreg %soffset) {
  ; GFX90A_GFX940-LABEL: name: buffer_atomic_fadd_f64_offset_no_rtn
  ; GFX90A_GFX940: bb.1 (%ir-block.0):
  ; GFX90A_GFX940-NEXT:   liveins: $sgpr0, $sgpr1, $sgpr2, $sgpr3, $sgpr4, $vgpr0, $vgpr1
  ; GFX90A_GFX940-NEXT: {{  $}}
  ; GFX90A_GFX940-NEXT:   [[COPY:%[0-9]+]]:vgpr_32 = COPY $vgpr0
  ; GFX90A_GFX940-NEXT:   [[COPY1:%[0-9]+]]:vgpr_32 = COPY $vgpr1
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE:%[0-9]+]]:vreg_64_align2 = REG_SEQUENCE [[COPY]], %subreg.sub0, [[COPY1]], %subreg.sub1
  ; GFX90A_GFX940-NEXT:   [[COPY2:%[0-9]+]]:sreg_32 = COPY $sgpr0
  ; GFX90A_GFX940-NEXT:   [[COPY3:%[0-9]+]]:sreg_32 = COPY $sgpr1
  ; GFX90A_GFX940-NEXT:   [[COPY4:%[0-9]+]]:sreg_32 = COPY $sgpr2
  ; GFX90A_GFX940-NEXT:   [[COPY5:%[0-9]+]]:sreg_32 = COPY $sgpr3
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE1:%[0-9]+]]:sgpr_128 = REG_SEQUENCE [[COPY2]], %subreg.sub0, [[COPY3]], %subreg.sub1, [[COPY4]], %subreg.sub2, [[COPY5]], %subreg.sub3
  ; GFX90A_GFX940-NEXT:   [[COPY6:%[0-9]+]]:sreg_32 = COPY $sgpr4
  ; GFX90A_GFX940-NEXT:   BUFFER_ATOMIC_ADD_F64_OFFSET [[REG_SEQUENCE]], [[REG_SEQUENCE1]], [[COPY6]], 0, 0, implicit $exec :: (volatile dereferenceable load store (s64), align 1, addrspace 7)
  ; GFX90A_GFX940-NEXT:   S_ENDPGM 0
  %ret = call double @llvm.amdgcn.raw.buffer.atomic.fadd.f64(double %val, <4 x i32> %rsrc, i32 0, i32 %soffset, i32 0)
  ret void
}

define amdgpu_ps void @buffer_atomic_fadd_f64_offen_no_rtn(double %val, <4 x i32> inreg %rsrc, i32 %voffset, i32 inreg %soffset) {
  ; GFX90A_GFX940-LABEL: name: buffer_atomic_fadd_f64_offen_no_rtn
  ; GFX90A_GFX940: bb.1 (%ir-block.0):
  ; GFX90A_GFX940-NEXT:   liveins: $sgpr0, $sgpr1, $sgpr2, $sgpr3, $sgpr4, $vgpr0, $vgpr1, $vgpr2
  ; GFX90A_GFX940-NEXT: {{  $}}
  ; GFX90A_GFX940-NEXT:   [[COPY:%[0-9]+]]:vgpr_32 = COPY $vgpr0
  ; GFX90A_GFX940-NEXT:   [[COPY1:%[0-9]+]]:vgpr_32 = COPY $vgpr1
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE:%[0-9]+]]:vreg_64_align2 = REG_SEQUENCE [[COPY]], %subreg.sub0, [[COPY1]], %subreg.sub1
  ; GFX90A_GFX940-NEXT:   [[COPY2:%[0-9]+]]:sreg_32 = COPY $sgpr0
  ; GFX90A_GFX940-NEXT:   [[COPY3:%[0-9]+]]:sreg_32 = COPY $sgpr1
  ; GFX90A_GFX940-NEXT:   [[COPY4:%[0-9]+]]:sreg_32 = COPY $sgpr2
  ; GFX90A_GFX940-NEXT:   [[COPY5:%[0-9]+]]:sreg_32 = COPY $sgpr3
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE1:%[0-9]+]]:sgpr_128 = REG_SEQUENCE [[COPY2]], %subreg.sub0, [[COPY3]], %subreg.sub1, [[COPY4]], %subreg.sub2, [[COPY5]], %subreg.sub3
  ; GFX90A_GFX940-NEXT:   [[COPY6:%[0-9]+]]:vgpr_32 = COPY $vgpr2
  ; GFX90A_GFX940-NEXT:   [[COPY7:%[0-9]+]]:sreg_32 = COPY $sgpr4
  ; GFX90A_GFX940-NEXT:   BUFFER_ATOMIC_ADD_F64_OFFEN [[REG_SEQUENCE]], [[COPY6]], [[REG_SEQUENCE1]], [[COPY7]], 0, 0, implicit $exec :: (volatile dereferenceable load store (s64), align 1, addrspace 7)
  ; GFX90A_GFX940-NEXT:   S_ENDPGM 0
  %ret = call double @llvm.amdgcn.raw.buffer.atomic.fadd.f64(double %val, <4 x i32> %rsrc, i32 %voffset, i32 %soffset, i32 0)
  ret void
}

define amdgpu_ps void @buffer_atomic_fadd_f64_idxen_no_rtn(double %val, <4 x i32> inreg %rsrc, i32 %vindex, i32 inreg %soffset) {
  ; GFX90A_GFX940-LABEL: name: buffer_atomic_fadd_f64_idxen_no_rtn
  ; GFX90A_GFX940: bb.1 (%ir-block.0):
  ; GFX90A_GFX940-NEXT:   liveins: $sgpr0, $sgpr1, $sgpr2, $sgpr3, $sgpr4, $vgpr0, $vgpr1, $vgpr2
  ; GFX90A_GFX940-NEXT: {{  $}}
  ; GFX90A_GFX940-NEXT:   [[COPY:%[0-9]+]]:vgpr_32 = COPY $vgpr0
  ; GFX90A_GFX940-NEXT:   [[COPY1:%[0-9]+]]:vgpr_32 = COPY $vgpr1
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE:%[0-9]+]]:vreg_64_align2 = REG_SEQUENCE [[COPY]], %subreg.sub0, [[COPY1]], %subreg.sub1
  ; GFX90A_GFX940-NEXT:   [[COPY2:%[0-9]+]]:sreg_32 = COPY $sgpr0
  ; GFX90A_GFX940-NEXT:   [[COPY3:%[0-9]+]]:sreg_32 = COPY $sgpr1
  ; GFX90A_GFX940-NEXT:   [[COPY4:%[0-9]+]]:sreg_32 = COPY $sgpr2
  ; GFX90A_GFX940-NEXT:   [[COPY5:%[0-9]+]]:sreg_32 = COPY $sgpr3
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE1:%[0-9]+]]:sgpr_128 = REG_SEQUENCE [[COPY2]], %subreg.sub0, [[COPY3]], %subreg.sub1, [[COPY4]], %subreg.sub2, [[COPY5]], %subreg.sub3
  ; GFX90A_GFX940-NEXT:   [[COPY6:%[0-9]+]]:vgpr_32 = COPY $vgpr2
  ; GFX90A_GFX940-NEXT:   [[COPY7:%[0-9]+]]:sreg_32 = COPY $sgpr4
  ; GFX90A_GFX940-NEXT:   BUFFER_ATOMIC_ADD_F64_IDXEN [[REG_SEQUENCE]], [[COPY6]], [[REG_SEQUENCE1]], [[COPY7]], 0, 0, implicit $exec :: (volatile dereferenceable load store (s64), align 1, addrspace 7)
  ; GFX90A_GFX940-NEXT:   S_ENDPGM 0
  %ret = call double @llvm.amdgcn.struct.buffer.atomic.fadd.f64(double %val, <4 x i32> %rsrc, i32 %vindex, i32 0, i32 %soffset, i32 0)
  ret void
}

define amdgpu_ps void @buffer_atomic_fadd_f64_bothen_no_rtn(double %val, <4 x i32> inreg %rsrc, i32 %vindex, i32 %voffset, i32 inreg %soffset) {
  ; GFX90A_GFX940-LABEL: name: buffer_atomic_fadd_f64_bothen_no_rtn
  ; GFX90A_GFX940: bb.1 (%ir-block.0):
  ; GFX90A_GFX940-NEXT:   liveins: $sgpr0, $sgpr1, $sgpr2, $sgpr3, $sgpr4, $vgpr0, $vgpr1, $vgpr2, $vgpr3
  ; GFX90A_GFX940-NEXT: {{  $}}
  ; GFX90A_GFX940-NEXT:   [[COPY:%[0-9]+]]:vgpr_32 = COPY $vgpr0
  ; GFX90A_GFX940-NEXT:   [[COPY1:%[0-9]+]]:vgpr_32 = COPY $vgpr1
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE:%[0-9]+]]:vreg_64_align2 = REG_SEQUENCE [[COPY]], %subreg.sub0, [[COPY1]], %subreg.sub1
  ; GFX90A_GFX940-NEXT:   [[COPY2:%[0-9]+]]:sreg_32 = COPY $sgpr0
  ; GFX90A_GFX940-NEXT:   [[COPY3:%[0-9]+]]:sreg_32 = COPY $sgpr1
  ; GFX90A_GFX940-NEXT:   [[COPY4:%[0-9]+]]:sreg_32 = COPY $sgpr2
  ; GFX90A_GFX940-NEXT:   [[COPY5:%[0-9]+]]:sreg_32 = COPY $sgpr3
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE1:%[0-9]+]]:sgpr_128 = REG_SEQUENCE [[COPY2]], %subreg.sub0, [[COPY3]], %subreg.sub1, [[COPY4]], %subreg.sub2, [[COPY5]], %subreg.sub3
  ; GFX90A_GFX940-NEXT:   [[COPY6:%[0-9]+]]:vgpr_32 = COPY $vgpr2
  ; GFX90A_GFX940-NEXT:   [[COPY7:%[0-9]+]]:vgpr_32 = COPY $vgpr3
  ; GFX90A_GFX940-NEXT:   [[COPY8:%[0-9]+]]:sreg_32 = COPY $sgpr4
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE2:%[0-9]+]]:vreg_64_align2 = REG_SEQUENCE [[COPY6]], %subreg.sub0, [[COPY7]], %subreg.sub1
  ; GFX90A_GFX940-NEXT:   BUFFER_ATOMIC_ADD_F64_BOTHEN [[REG_SEQUENCE]], [[REG_SEQUENCE2]], [[REG_SEQUENCE1]], [[COPY8]], 0, 2, implicit $exec :: (volatile dereferenceable load store (s64), align 1, addrspace 7)
  ; GFX90A_GFX940-NEXT:   S_ENDPGM 0
  %ret = call double @llvm.amdgcn.struct.buffer.atomic.fadd.f64(double %val, <4 x i32> %rsrc, i32 %vindex, i32 %voffset, i32 %soffset, i32 2)
  ret void
}

define amdgpu_ps double @buffer_atomic_fadd_f64_offset_rtn(double %val, <4 x i32> inreg %rsrc, i32 inreg %soffset) {
  ; GFX90A_GFX940-LABEL: name: buffer_atomic_fadd_f64_offset_rtn
  ; GFX90A_GFX940: bb.1 (%ir-block.0):
  ; GFX90A_GFX940-NEXT:   liveins: $sgpr0, $sgpr1, $sgpr2, $sgpr3, $sgpr4, $vgpr0, $vgpr1
  ; GFX90A_GFX940-NEXT: {{  $}}
  ; GFX90A_GFX940-NEXT:   [[COPY:%[0-9]+]]:vgpr_32 = COPY $vgpr0
  ; GFX90A_GFX940-NEXT:   [[COPY1:%[0-9]+]]:vgpr_32 = COPY $vgpr1
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE:%[0-9]+]]:vreg_64_align2 = REG_SEQUENCE [[COPY]], %subreg.sub0, [[COPY1]], %subreg.sub1
  ; GFX90A_GFX940-NEXT:   [[COPY2:%[0-9]+]]:sreg_32 = COPY $sgpr0
  ; GFX90A_GFX940-NEXT:   [[COPY3:%[0-9]+]]:sreg_32 = COPY $sgpr1
  ; GFX90A_GFX940-NEXT:   [[COPY4:%[0-9]+]]:sreg_32 = COPY $sgpr2
  ; GFX90A_GFX940-NEXT:   [[COPY5:%[0-9]+]]:sreg_32 = COPY $sgpr3
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE1:%[0-9]+]]:sgpr_128 = REG_SEQUENCE [[COPY2]], %subreg.sub0, [[COPY3]], %subreg.sub1, [[COPY4]], %subreg.sub2, [[COPY5]], %subreg.sub3
  ; GFX90A_GFX940-NEXT:   [[COPY6:%[0-9]+]]:sreg_32 = COPY $sgpr4
  ; GFX90A_GFX940-NEXT:   [[BUFFER_ATOMIC_ADD_F64_OFFSET_RTN:%[0-9]+]]:vreg_64_align2 = BUFFER_ATOMIC_ADD_F64_OFFSET_RTN [[REG_SEQUENCE]], [[REG_SEQUENCE1]], [[COPY6]], 0, 1, implicit $exec :: (volatile dereferenceable load store (s64), align 1, addrspace 7)
  ; GFX90A_GFX940-NEXT:   [[COPY7:%[0-9]+]]:vgpr_32 = COPY [[BUFFER_ATOMIC_ADD_F64_OFFSET_RTN]].sub0
  ; GFX90A_GFX940-NEXT:   [[COPY8:%[0-9]+]]:vgpr_32 = COPY [[BUFFER_ATOMIC_ADD_F64_OFFSET_RTN]].sub1
  ; GFX90A_GFX940-NEXT:   [[V_READFIRSTLANE_B32_:%[0-9]+]]:sreg_32 = V_READFIRSTLANE_B32 [[COPY7]], implicit $exec
  ; GFX90A_GFX940-NEXT:   $sgpr0 = COPY [[V_READFIRSTLANE_B32_]]
  ; GFX90A_GFX940-NEXT:   [[V_READFIRSTLANE_B32_1:%[0-9]+]]:sreg_32 = V_READFIRSTLANE_B32 [[COPY8]], implicit $exec
  ; GFX90A_GFX940-NEXT:   $sgpr1 = COPY [[V_READFIRSTLANE_B32_1]]
  ; GFX90A_GFX940-NEXT:   SI_RETURN_TO_EPILOG implicit $sgpr0, implicit $sgpr1
  %ret = call double @llvm.amdgcn.raw.buffer.atomic.fadd.f64(double %val, <4 x i32> %rsrc, i32 0, i32 %soffset, i32 0)
  ret double %ret
}

define amdgpu_ps double @buffer_atomic_fadd_f64_offen_rtn(double %val, <4 x i32> inreg %rsrc, i32 %voffset, i32 inreg %soffset) {
  ; GFX90A_GFX940-LABEL: name: buffer_atomic_fadd_f64_offen_rtn
  ; GFX90A_GFX940: bb.1 (%ir-block.0):
  ; GFX90A_GFX940-NEXT:   liveins: $sgpr0, $sgpr1, $sgpr2, $sgpr3, $sgpr4, $vgpr0, $vgpr1, $vgpr2
  ; GFX90A_GFX940-NEXT: {{  $}}
  ; GFX90A_GFX940-NEXT:   [[COPY:%[0-9]+]]:vgpr_32 = COPY $vgpr0
  ; GFX90A_GFX940-NEXT:   [[COPY1:%[0-9]+]]:vgpr_32 = COPY $vgpr1
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE:%[0-9]+]]:vreg_64_align2 = REG_SEQUENCE [[COPY]], %subreg.sub0, [[COPY1]], %subreg.sub1
  ; GFX90A_GFX940-NEXT:   [[COPY2:%[0-9]+]]:sreg_32 = COPY $sgpr0
  ; GFX90A_GFX940-NEXT:   [[COPY3:%[0-9]+]]:sreg_32 = COPY $sgpr1
  ; GFX90A_GFX940-NEXT:   [[COPY4:%[0-9]+]]:sreg_32 = COPY $sgpr2
  ; GFX90A_GFX940-NEXT:   [[COPY5:%[0-9]+]]:sreg_32 = COPY $sgpr3
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE1:%[0-9]+]]:sgpr_128 = REG_SEQUENCE [[COPY2]], %subreg.sub0, [[COPY3]], %subreg.sub1, [[COPY4]], %subreg.sub2, [[COPY5]], %subreg.sub3
  ; GFX90A_GFX940-NEXT:   [[COPY6:%[0-9]+]]:vgpr_32 = COPY $vgpr2
  ; GFX90A_GFX940-NEXT:   [[COPY7:%[0-9]+]]:sreg_32 = COPY $sgpr4
  ; GFX90A_GFX940-NEXT:   [[BUFFER_ATOMIC_ADD_F64_OFFEN_RTN:%[0-9]+]]:vreg_64_align2 = BUFFER_ATOMIC_ADD_F64_OFFEN_RTN [[REG_SEQUENCE]], [[COPY6]], [[REG_SEQUENCE1]], [[COPY7]], 0, 1, implicit $exec :: (volatile dereferenceable load store (s64), align 1, addrspace 7)
  ; GFX90A_GFX940-NEXT:   [[COPY8:%[0-9]+]]:vgpr_32 = COPY [[BUFFER_ATOMIC_ADD_F64_OFFEN_RTN]].sub0
  ; GFX90A_GFX940-NEXT:   [[COPY9:%[0-9]+]]:vgpr_32 = COPY [[BUFFER_ATOMIC_ADD_F64_OFFEN_RTN]].sub1
  ; GFX90A_GFX940-NEXT:   [[V_READFIRSTLANE_B32_:%[0-9]+]]:sreg_32 = V_READFIRSTLANE_B32 [[COPY8]], implicit $exec
  ; GFX90A_GFX940-NEXT:   $sgpr0 = COPY [[V_READFIRSTLANE_B32_]]
  ; GFX90A_GFX940-NEXT:   [[V_READFIRSTLANE_B32_1:%[0-9]+]]:sreg_32 = V_READFIRSTLANE_B32 [[COPY9]], implicit $exec
  ; GFX90A_GFX940-NEXT:   $sgpr1 = COPY [[V_READFIRSTLANE_B32_1]]
  ; GFX90A_GFX940-NEXT:   SI_RETURN_TO_EPILOG implicit $sgpr0, implicit $sgpr1
  %ret = call double @llvm.amdgcn.raw.buffer.atomic.fadd.f64(double %val, <4 x i32> %rsrc, i32 %voffset, i32 %soffset, i32 0)
  ret double %ret
}

define amdgpu_ps double @buffer_atomic_fadd_f64_idxen_rtn(double %val, <4 x i32> inreg %rsrc, i32 %vindex, i32 inreg %soffset) {
  ; GFX90A_GFX940-LABEL: name: buffer_atomic_fadd_f64_idxen_rtn
  ; GFX90A_GFX940: bb.1 (%ir-block.0):
  ; GFX90A_GFX940-NEXT:   liveins: $sgpr0, $sgpr1, $sgpr2, $sgpr3, $sgpr4, $vgpr0, $vgpr1, $vgpr2
  ; GFX90A_GFX940-NEXT: {{  $}}
  ; GFX90A_GFX940-NEXT:   [[COPY:%[0-9]+]]:vgpr_32 = COPY $vgpr0
  ; GFX90A_GFX940-NEXT:   [[COPY1:%[0-9]+]]:vgpr_32 = COPY $vgpr1
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE:%[0-9]+]]:vreg_64_align2 = REG_SEQUENCE [[COPY]], %subreg.sub0, [[COPY1]], %subreg.sub1
  ; GFX90A_GFX940-NEXT:   [[COPY2:%[0-9]+]]:sreg_32 = COPY $sgpr0
  ; GFX90A_GFX940-NEXT:   [[COPY3:%[0-9]+]]:sreg_32 = COPY $sgpr1
  ; GFX90A_GFX940-NEXT:   [[COPY4:%[0-9]+]]:sreg_32 = COPY $sgpr2
  ; GFX90A_GFX940-NEXT:   [[COPY5:%[0-9]+]]:sreg_32 = COPY $sgpr3
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE1:%[0-9]+]]:sgpr_128 = REG_SEQUENCE [[COPY2]], %subreg.sub0, [[COPY3]], %subreg.sub1, [[COPY4]], %subreg.sub2, [[COPY5]], %subreg.sub3
  ; GFX90A_GFX940-NEXT:   [[COPY6:%[0-9]+]]:vgpr_32 = COPY $vgpr2
  ; GFX90A_GFX940-NEXT:   [[COPY7:%[0-9]+]]:sreg_32 = COPY $sgpr4
  ; GFX90A_GFX940-NEXT:   [[BUFFER_ATOMIC_ADD_F64_IDXEN_RTN:%[0-9]+]]:vreg_64_align2 = BUFFER_ATOMIC_ADD_F64_IDXEN_RTN [[REG_SEQUENCE]], [[COPY6]], [[REG_SEQUENCE1]], [[COPY7]], 0, 1, implicit $exec :: (volatile dereferenceable load store (s64), align 1, addrspace 7)
  ; GFX90A_GFX940-NEXT:   [[COPY8:%[0-9]+]]:vgpr_32 = COPY [[BUFFER_ATOMIC_ADD_F64_IDXEN_RTN]].sub0
  ; GFX90A_GFX940-NEXT:   [[COPY9:%[0-9]+]]:vgpr_32 = COPY [[BUFFER_ATOMIC_ADD_F64_IDXEN_RTN]].sub1
  ; GFX90A_GFX940-NEXT:   [[V_READFIRSTLANE_B32_:%[0-9]+]]:sreg_32 = V_READFIRSTLANE_B32 [[COPY8]], implicit $exec
  ; GFX90A_GFX940-NEXT:   $sgpr0 = COPY [[V_READFIRSTLANE_B32_]]
  ; GFX90A_GFX940-NEXT:   [[V_READFIRSTLANE_B32_1:%[0-9]+]]:sreg_32 = V_READFIRSTLANE_B32 [[COPY9]], implicit $exec
  ; GFX90A_GFX940-NEXT:   $sgpr1 = COPY [[V_READFIRSTLANE_B32_1]]
  ; GFX90A_GFX940-NEXT:   SI_RETURN_TO_EPILOG implicit $sgpr0, implicit $sgpr1
  %ret = call double @llvm.amdgcn.struct.buffer.atomic.fadd.f64(double %val, <4 x i32> %rsrc, i32 %vindex, i32 0, i32 %soffset, i32 0)
  ret double %ret
}

define amdgpu_ps double @buffer_atomic_fadd_f64_bothen_rtn(double %val, <4 x i32> inreg %rsrc, i32 %vindex, i32 %voffset, i32 inreg %soffset) {
  ; GFX90A_GFX940-LABEL: name: buffer_atomic_fadd_f64_bothen_rtn
  ; GFX90A_GFX940: bb.1 (%ir-block.0):
  ; GFX90A_GFX940-NEXT:   liveins: $sgpr0, $sgpr1, $sgpr2, $sgpr3, $sgpr4, $vgpr0, $vgpr1, $vgpr2, $vgpr3
  ; GFX90A_GFX940-NEXT: {{  $}}
  ; GFX90A_GFX940-NEXT:   [[COPY:%[0-9]+]]:vgpr_32 = COPY $vgpr0
  ; GFX90A_GFX940-NEXT:   [[COPY1:%[0-9]+]]:vgpr_32 = COPY $vgpr1
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE:%[0-9]+]]:vreg_64_align2 = REG_SEQUENCE [[COPY]], %subreg.sub0, [[COPY1]], %subreg.sub1
  ; GFX90A_GFX940-NEXT:   [[COPY2:%[0-9]+]]:sreg_32 = COPY $sgpr0
  ; GFX90A_GFX940-NEXT:   [[COPY3:%[0-9]+]]:sreg_32 = COPY $sgpr1
  ; GFX90A_GFX940-NEXT:   [[COPY4:%[0-9]+]]:sreg_32 = COPY $sgpr2
  ; GFX90A_GFX940-NEXT:   [[COPY5:%[0-9]+]]:sreg_32 = COPY $sgpr3
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE1:%[0-9]+]]:sgpr_128 = REG_SEQUENCE [[COPY2]], %subreg.sub0, [[COPY3]], %subreg.sub1, [[COPY4]], %subreg.sub2, [[COPY5]], %subreg.sub3
  ; GFX90A_GFX940-NEXT:   [[COPY6:%[0-9]+]]:vgpr_32 = COPY $vgpr2
  ; GFX90A_GFX940-NEXT:   [[COPY7:%[0-9]+]]:vgpr_32 = COPY $vgpr3
  ; GFX90A_GFX940-NEXT:   [[COPY8:%[0-9]+]]:sreg_32 = COPY $sgpr4
  ; GFX90A_GFX940-NEXT:   [[REG_SEQUENCE2:%[0-9]+]]:vreg_64_align2 = REG_SEQUENCE [[COPY6]], %subreg.sub0, [[COPY7]], %subreg.sub1
  ; GFX90A_GFX940-NEXT:   [[BUFFER_ATOMIC_ADD_F64_BOTHEN_RTN:%[0-9]+]]:vreg_64_align2 = BUFFER_ATOMIC_ADD_F64_BOTHEN_RTN [[REG_SEQUENCE]], [[REG_SEQUENCE2]], [[REG_SEQUENCE1]], [[COPY8]], 0, 1, implicit $exec :: (volatile dereferenceable load store (s64), align 1, addrspace 7)
  ; GFX90A_GFX940-NEXT:   [[COPY9:%[0-9]+]]:vgpr_32 = COPY [[BUFFER_ATOMIC_ADD_F64_BOTHEN_RTN]].sub0
  ; GFX90A_GFX940-NEXT:   [[COPY10:%[0-9]+]]:vgpr_32 = COPY [[BUFFER_ATOMIC_ADD_F64_BOTHEN_RTN]].sub1
  ; GFX90A_GFX940-NEXT:   [[V_READFIRSTLANE_B32_:%[0-9]+]]:sreg_32 = V_READFIRSTLANE_B32 [[COPY9]], implicit $exec
  ; GFX90A_GFX940-NEXT:   $sgpr0 = COPY [[V_READFIRSTLANE_B32_]]
  ; GFX90A_GFX940-NEXT:   [[V_READFIRSTLANE_B32_1:%[0-9]+]]:sreg_32 = V_READFIRSTLANE_B32 [[COPY10]], implicit $exec
  ; GFX90A_GFX940-NEXT:   $sgpr1 = COPY [[V_READFIRSTLANE_B32_1]]
  ; GFX90A_GFX940-NEXT:   SI_RETURN_TO_EPILOG implicit $sgpr0, implicit $sgpr1
  %ret = call double @llvm.amdgcn.struct.buffer.atomic.fadd.f64(double %val, <4 x i32> %rsrc, i32 %vindex, i32 %voffset, i32 %soffset, i32 0)
  ret double %ret
}

declare double @llvm.amdgcn.raw.buffer.atomic.fadd.f64(double, <4 x i32>, i32, i32, i32 immarg)
declare double @llvm.amdgcn.struct.buffer.atomic.fadd.f64(double, <4 x i32>, i32, i32, i32, i32 immarg)