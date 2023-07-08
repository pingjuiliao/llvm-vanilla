; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -global-isel -mtriple=amdgcn-amd-amdhsa -mcpu=gfx803 --amdhsa-code-object-version=3 < %s | FileCheck --check-prefix=GFX8V3 %s
; RUN: llc -global-isel -mtriple=amdgcn-amd-amdhsa -mcpu=gfx803 --amdhsa-code-object-version=4 < %s | FileCheck --check-prefix=GFX8V4 %s
; RUN: llc -global-isel -mtriple=amdgcn-amd-amdhsa -mcpu=gfx803 --amdhsa-code-object-version=5 < %s | FileCheck --check-prefix=GFX8V5 %s

; RUN: llc -global-isel -mtriple=amdgcn-amd-amdhsa -mcpu=gfx906 --amdhsa-code-object-version=3 < %s | FileCheck --check-prefixes=GFX9V3 %s
; RUN: llc -global-isel -mtriple=amdgcn-amd-amdhsa -mcpu=gfx906 --amdhsa-code-object-version=4 < %s | FileCheck --check-prefixes=GFX9V4 %s
; RUN: llc -global-isel -mtriple=amdgcn-amd-amdhsa -mcpu=gfx906 --amdhsa-code-object-version=5 < %s | FileCheck --check-prefixes=GFX9V5 %s

define amdgpu_kernel void @addrspacecast(ptr addrspace(5) %ptr.private, ptr addrspace(3) %ptr.local) {
; GFX8V3-LABEL: addrspacecast:
; GFX8V3:       ; %bb.0:
; GFX8V3-NEXT:    s_load_dwordx2 s[0:1], s[6:7], 0x0
; GFX8V3-NEXT:    s_load_dwordx2 s[2:3], s[4:5], 0x40
; GFX8V3-NEXT:    v_mov_b32_e32 v2, 1
; GFX8V3-NEXT:    s_waitcnt lgkmcnt(0)
; GFX8V3-NEXT:    s_mov_b32 s4, s0
; GFX8V3-NEXT:    s_mov_b32 s5, s3
; GFX8V3-NEXT:    s_cmp_lg_u32 s0, -1
; GFX8V3-NEXT:    s_cselect_b64 s[4:5], s[4:5], 0
; GFX8V3-NEXT:    s_mov_b32 s6, s1
; GFX8V3-NEXT:    s_mov_b32 s7, s2
; GFX8V3-NEXT:    s_cmp_lg_u32 s1, -1
; GFX8V3-NEXT:    v_mov_b32_e32 v0, s4
; GFX8V3-NEXT:    s_cselect_b64 s[0:1], s[6:7], 0
; GFX8V3-NEXT:    v_mov_b32_e32 v1, s5
; GFX8V3-NEXT:    flat_store_dword v[0:1], v2
; GFX8V3-NEXT:    s_waitcnt vmcnt(0)
; GFX8V3-NEXT:    v_mov_b32_e32 v0, s0
; GFX8V3-NEXT:    v_mov_b32_e32 v2, 2
; GFX8V3-NEXT:    v_mov_b32_e32 v1, s1
; GFX8V3-NEXT:    flat_store_dword v[0:1], v2
; GFX8V3-NEXT:    s_waitcnt vmcnt(0)
; GFX8V3-NEXT:    s_endpgm
;
; GFX8V4-LABEL: addrspacecast:
; GFX8V4:       ; %bb.0:
; GFX8V4-NEXT:    s_load_dwordx2 s[0:1], s[6:7], 0x0
; GFX8V4-NEXT:    s_load_dwordx2 s[2:3], s[4:5], 0x40
; GFX8V4-NEXT:    v_mov_b32_e32 v2, 1
; GFX8V4-NEXT:    s_waitcnt lgkmcnt(0)
; GFX8V4-NEXT:    s_mov_b32 s4, s0
; GFX8V4-NEXT:    s_mov_b32 s5, s3
; GFX8V4-NEXT:    s_cmp_lg_u32 s0, -1
; GFX8V4-NEXT:    s_cselect_b64 s[4:5], s[4:5], 0
; GFX8V4-NEXT:    s_mov_b32 s6, s1
; GFX8V4-NEXT:    s_mov_b32 s7, s2
; GFX8V4-NEXT:    s_cmp_lg_u32 s1, -1
; GFX8V4-NEXT:    v_mov_b32_e32 v0, s4
; GFX8V4-NEXT:    s_cselect_b64 s[0:1], s[6:7], 0
; GFX8V4-NEXT:    v_mov_b32_e32 v1, s5
; GFX8V4-NEXT:    flat_store_dword v[0:1], v2
; GFX8V4-NEXT:    s_waitcnt vmcnt(0)
; GFX8V4-NEXT:    v_mov_b32_e32 v0, s0
; GFX8V4-NEXT:    v_mov_b32_e32 v2, 2
; GFX8V4-NEXT:    v_mov_b32_e32 v1, s1
; GFX8V4-NEXT:    flat_store_dword v[0:1], v2
; GFX8V4-NEXT:    s_waitcnt vmcnt(0)
; GFX8V4-NEXT:    s_endpgm
;
; GFX8V5-LABEL: addrspacecast:
; GFX8V5:       ; %bb.0:
; GFX8V5-NEXT:    s_load_dwordx2 s[0:1], s[4:5], 0x0
; GFX8V5-NEXT:    s_load_dwordx2 s[2:3], s[4:5], 0xc8
; GFX8V5-NEXT:    v_mov_b32_e32 v2, 1
; GFX8V5-NEXT:    s_waitcnt lgkmcnt(0)
; GFX8V5-NEXT:    s_mov_b32 s4, s0
; GFX8V5-NEXT:    s_mov_b32 s5, s2
; GFX8V5-NEXT:    s_cmp_lg_u32 s0, -1
; GFX8V5-NEXT:    s_cselect_b64 s[4:5], s[4:5], 0
; GFX8V5-NEXT:    s_mov_b32 s2, s1
; GFX8V5-NEXT:    s_cmp_lg_u32 s1, -1
; GFX8V5-NEXT:    v_mov_b32_e32 v0, s4
; GFX8V5-NEXT:    s_cselect_b64 s[0:1], s[2:3], 0
; GFX8V5-NEXT:    v_mov_b32_e32 v1, s5
; GFX8V5-NEXT:    flat_store_dword v[0:1], v2
; GFX8V5-NEXT:    s_waitcnt vmcnt(0)
; GFX8V5-NEXT:    v_mov_b32_e32 v0, s0
; GFX8V5-NEXT:    v_mov_b32_e32 v2, 2
; GFX8V5-NEXT:    v_mov_b32_e32 v1, s1
; GFX8V5-NEXT:    flat_store_dword v[0:1], v2
; GFX8V5-NEXT:    s_waitcnt vmcnt(0)
; GFX8V5-NEXT:    s_endpgm
;
; GFX9V3-LABEL: addrspacecast:
; GFX9V3:       ; %bb.0:
; GFX9V3-NEXT:    s_load_dwordx2 s[0:1], s[4:5], 0x0
; GFX9V3-NEXT:    s_mov_b64 s[2:3], src_private_base
; GFX9V3-NEXT:    s_mov_b64 s[4:5], src_shared_base
; GFX9V3-NEXT:    v_mov_b32_e32 v2, 1
; GFX9V3-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9V3-NEXT:    s_mov_b32 s2, s0
; GFX9V3-NEXT:    s_cmp_lg_u32 s0, -1
; GFX9V3-NEXT:    s_cselect_b64 s[2:3], s[2:3], 0
; GFX9V3-NEXT:    s_mov_b32 s4, s1
; GFX9V3-NEXT:    s_cmp_lg_u32 s1, -1
; GFX9V3-NEXT:    v_mov_b32_e32 v0, s2
; GFX9V3-NEXT:    s_cselect_b64 s[0:1], s[4:5], 0
; GFX9V3-NEXT:    v_mov_b32_e32 v1, s3
; GFX9V3-NEXT:    flat_store_dword v[0:1], v2
; GFX9V3-NEXT:    s_waitcnt vmcnt(0)
; GFX9V3-NEXT:    v_mov_b32_e32 v0, s0
; GFX9V3-NEXT:    v_mov_b32_e32 v2, 2
; GFX9V3-NEXT:    v_mov_b32_e32 v1, s1
; GFX9V3-NEXT:    flat_store_dword v[0:1], v2
; GFX9V3-NEXT:    s_waitcnt vmcnt(0)
; GFX9V3-NEXT:    s_endpgm
;
; GFX9V4-LABEL: addrspacecast:
; GFX9V4:       ; %bb.0:
; GFX9V4-NEXT:    s_load_dwordx2 s[0:1], s[4:5], 0x0
; GFX9V4-NEXT:    s_mov_b64 s[2:3], src_private_base
; GFX9V4-NEXT:    s_mov_b64 s[4:5], src_shared_base
; GFX9V4-NEXT:    v_mov_b32_e32 v2, 1
; GFX9V4-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9V4-NEXT:    s_mov_b32 s2, s0
; GFX9V4-NEXT:    s_cmp_lg_u32 s0, -1
; GFX9V4-NEXT:    s_cselect_b64 s[2:3], s[2:3], 0
; GFX9V4-NEXT:    s_mov_b32 s4, s1
; GFX9V4-NEXT:    s_cmp_lg_u32 s1, -1
; GFX9V4-NEXT:    v_mov_b32_e32 v0, s2
; GFX9V4-NEXT:    s_cselect_b64 s[0:1], s[4:5], 0
; GFX9V4-NEXT:    v_mov_b32_e32 v1, s3
; GFX9V4-NEXT:    flat_store_dword v[0:1], v2
; GFX9V4-NEXT:    s_waitcnt vmcnt(0)
; GFX9V4-NEXT:    v_mov_b32_e32 v0, s0
; GFX9V4-NEXT:    v_mov_b32_e32 v2, 2
; GFX9V4-NEXT:    v_mov_b32_e32 v1, s1
; GFX9V4-NEXT:    flat_store_dword v[0:1], v2
; GFX9V4-NEXT:    s_waitcnt vmcnt(0)
; GFX9V4-NEXT:    s_endpgm
;
; GFX9V5-LABEL: addrspacecast:
; GFX9V5:       ; %bb.0:
; GFX9V5-NEXT:    s_load_dwordx2 s[0:1], s[4:5], 0x0
; GFX9V5-NEXT:    s_mov_b64 s[2:3], src_private_base
; GFX9V5-NEXT:    s_mov_b64 s[4:5], src_shared_base
; GFX9V5-NEXT:    v_mov_b32_e32 v2, 1
; GFX9V5-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9V5-NEXT:    s_mov_b32 s2, s0
; GFX9V5-NEXT:    s_cmp_lg_u32 s0, -1
; GFX9V5-NEXT:    s_cselect_b64 s[2:3], s[2:3], 0
; GFX9V5-NEXT:    s_mov_b32 s4, s1
; GFX9V5-NEXT:    s_cmp_lg_u32 s1, -1
; GFX9V5-NEXT:    v_mov_b32_e32 v0, s2
; GFX9V5-NEXT:    s_cselect_b64 s[0:1], s[4:5], 0
; GFX9V5-NEXT:    v_mov_b32_e32 v1, s3
; GFX9V5-NEXT:    flat_store_dword v[0:1], v2
; GFX9V5-NEXT:    s_waitcnt vmcnt(0)
; GFX9V5-NEXT:    v_mov_b32_e32 v0, s0
; GFX9V5-NEXT:    v_mov_b32_e32 v2, 2
; GFX9V5-NEXT:    v_mov_b32_e32 v1, s1
; GFX9V5-NEXT:    flat_store_dword v[0:1], v2
; GFX9V5-NEXT:    s_waitcnt vmcnt(0)
; GFX9V5-NEXT:    s_endpgm
  %flat.private = addrspacecast ptr addrspace(5) %ptr.private to ptr
  %flat.local = addrspacecast ptr addrspace(3) %ptr.local to ptr
  store volatile i32 1, ptr %flat.private
  store volatile i32 2, ptr %flat.local
  ret void
}

define amdgpu_kernel void @llvm_amdgcn_is_shared(ptr %ptr) {
; GFX8V3-LABEL: llvm_amdgcn_is_shared:
; GFX8V3:       ; %bb.0:
; GFX8V3-NEXT:    s_load_dwordx2 s[0:1], s[6:7], 0x0
; GFX8V3-NEXT:    s_waitcnt lgkmcnt(0)
; GFX8V3-NEXT:    s_load_dword s0, s[4:5], 0x40
; GFX8V3-NEXT:    s_waitcnt lgkmcnt(0)
; GFX8V3-NEXT:    s_cmp_eq_u32 s1, s0
; GFX8V3-NEXT:    s_cselect_b32 s0, 1, 0
; GFX8V3-NEXT:    v_mov_b32_e32 v0, s0
; GFX8V3-NEXT:    flat_store_dword v[0:1], v0
; GFX8V3-NEXT:    s_waitcnt vmcnt(0)
; GFX8V3-NEXT:    s_endpgm
;
; GFX8V4-LABEL: llvm_amdgcn_is_shared:
; GFX8V4:       ; %bb.0:
; GFX8V4-NEXT:    s_load_dwordx2 s[0:1], s[6:7], 0x0
; GFX8V4-NEXT:    s_waitcnt lgkmcnt(0)
; GFX8V4-NEXT:    s_load_dword s0, s[4:5], 0x40
; GFX8V4-NEXT:    s_waitcnt lgkmcnt(0)
; GFX8V4-NEXT:    s_cmp_eq_u32 s1, s0
; GFX8V4-NEXT:    s_cselect_b32 s0, 1, 0
; GFX8V4-NEXT:    v_mov_b32_e32 v0, s0
; GFX8V4-NEXT:    flat_store_dword v[0:1], v0
; GFX8V4-NEXT:    s_waitcnt vmcnt(0)
; GFX8V4-NEXT:    s_endpgm
;
; GFX8V5-LABEL: llvm_amdgcn_is_shared:
; GFX8V5:       ; %bb.0:
; GFX8V5-NEXT:    s_load_dwordx2 s[0:1], s[4:5], 0x0
; GFX8V5-NEXT:    s_waitcnt lgkmcnt(0)
; GFX8V5-NEXT:    s_load_dword s0, s[4:5], 0xcc
; GFX8V5-NEXT:    s_waitcnt lgkmcnt(0)
; GFX8V5-NEXT:    s_cmp_eq_u32 s1, s0
; GFX8V5-NEXT:    s_cselect_b32 s0, 1, 0
; GFX8V5-NEXT:    v_mov_b32_e32 v0, s0
; GFX8V5-NEXT:    flat_store_dword v[0:1], v0
; GFX8V5-NEXT:    s_waitcnt vmcnt(0)
; GFX8V5-NEXT:    s_endpgm
;
; GFX9V3-LABEL: llvm_amdgcn_is_shared:
; GFX9V3:       ; %bb.0:
; GFX9V3-NEXT:    s_load_dwordx2 s[0:1], s[4:5], 0x0
; GFX9V3-NEXT:    s_mov_b64 s[2:3], src_shared_base
; GFX9V3-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9V3-NEXT:    s_cmp_eq_u32 s1, s3
; GFX9V3-NEXT:    s_cselect_b32 s0, 1, 0
; GFX9V3-NEXT:    v_mov_b32_e32 v0, s0
; GFX9V3-NEXT:    global_store_dword v[0:1], v0, off
; GFX9V3-NEXT:    s_waitcnt vmcnt(0)
; GFX9V3-NEXT:    s_endpgm
;
; GFX9V4-LABEL: llvm_amdgcn_is_shared:
; GFX9V4:       ; %bb.0:
; GFX9V4-NEXT:    s_load_dwordx2 s[0:1], s[4:5], 0x0
; GFX9V4-NEXT:    s_mov_b64 s[2:3], src_shared_base
; GFX9V4-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9V4-NEXT:    s_cmp_eq_u32 s1, s3
; GFX9V4-NEXT:    s_cselect_b32 s0, 1, 0
; GFX9V4-NEXT:    v_mov_b32_e32 v0, s0
; GFX9V4-NEXT:    global_store_dword v[0:1], v0, off
; GFX9V4-NEXT:    s_waitcnt vmcnt(0)
; GFX9V4-NEXT:    s_endpgm
;
; GFX9V5-LABEL: llvm_amdgcn_is_shared:
; GFX9V5:       ; %bb.0:
; GFX9V5-NEXT:    s_load_dwordx2 s[0:1], s[4:5], 0x0
; GFX9V5-NEXT:    s_mov_b64 s[2:3], src_shared_base
; GFX9V5-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9V5-NEXT:    s_cmp_eq_u32 s1, s3
; GFX9V5-NEXT:    s_cselect_b32 s0, 1, 0
; GFX9V5-NEXT:    v_mov_b32_e32 v0, s0
; GFX9V5-NEXT:    global_store_dword v[0:1], v0, off
; GFX9V5-NEXT:    s_waitcnt vmcnt(0)
; GFX9V5-NEXT:    s_endpgm
  %is.shared = call i1 @llvm.amdgcn.is.shared(ptr %ptr)
  %zext = zext i1 %is.shared to i32
  store volatile i32 %zext, ptr addrspace(1) undef
  ret void
}

define amdgpu_kernel void @llvm_amdgcn_is_private(ptr %ptr) {
; GFX8V3-LABEL: llvm_amdgcn_is_private:
; GFX8V3:       ; %bb.0:
; GFX8V3-NEXT:    s_load_dwordx2 s[0:1], s[6:7], 0x0
; GFX8V3-NEXT:    s_waitcnt lgkmcnt(0)
; GFX8V3-NEXT:    s_load_dword s0, s[4:5], 0x44
; GFX8V3-NEXT:    s_waitcnt lgkmcnt(0)
; GFX8V3-NEXT:    s_cmp_eq_u32 s1, s0
; GFX8V3-NEXT:    s_cselect_b32 s0, 1, 0
; GFX8V3-NEXT:    v_mov_b32_e32 v0, s0
; GFX8V3-NEXT:    flat_store_dword v[0:1], v0
; GFX8V3-NEXT:    s_waitcnt vmcnt(0)
; GFX8V3-NEXT:    s_endpgm
;
; GFX8V4-LABEL: llvm_amdgcn_is_private:
; GFX8V4:       ; %bb.0:
; GFX8V4-NEXT:    s_load_dwordx2 s[0:1], s[6:7], 0x0
; GFX8V4-NEXT:    s_waitcnt lgkmcnt(0)
; GFX8V4-NEXT:    s_load_dword s0, s[4:5], 0x44
; GFX8V4-NEXT:    s_waitcnt lgkmcnt(0)
; GFX8V4-NEXT:    s_cmp_eq_u32 s1, s0
; GFX8V4-NEXT:    s_cselect_b32 s0, 1, 0
; GFX8V4-NEXT:    v_mov_b32_e32 v0, s0
; GFX8V4-NEXT:    flat_store_dword v[0:1], v0
; GFX8V4-NEXT:    s_waitcnt vmcnt(0)
; GFX8V4-NEXT:    s_endpgm
;
; GFX8V5-LABEL: llvm_amdgcn_is_private:
; GFX8V5:       ; %bb.0:
; GFX8V5-NEXT:    s_load_dwordx2 s[0:1], s[4:5], 0x0
; GFX8V5-NEXT:    s_waitcnt lgkmcnt(0)
; GFX8V5-NEXT:    s_load_dword s0, s[4:5], 0xc8
; GFX8V5-NEXT:    s_waitcnt lgkmcnt(0)
; GFX8V5-NEXT:    s_cmp_eq_u32 s1, s0
; GFX8V5-NEXT:    s_cselect_b32 s0, 1, 0
; GFX8V5-NEXT:    v_mov_b32_e32 v0, s0
; GFX8V5-NEXT:    flat_store_dword v[0:1], v0
; GFX8V5-NEXT:    s_waitcnt vmcnt(0)
; GFX8V5-NEXT:    s_endpgm
;
; GFX9V3-LABEL: llvm_amdgcn_is_private:
; GFX9V3:       ; %bb.0:
; GFX9V3-NEXT:    s_load_dwordx2 s[0:1], s[4:5], 0x0
; GFX9V3-NEXT:    s_mov_b64 s[2:3], src_private_base
; GFX9V3-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9V3-NEXT:    s_cmp_eq_u32 s1, s3
; GFX9V3-NEXT:    s_cselect_b32 s0, 1, 0
; GFX9V3-NEXT:    v_mov_b32_e32 v0, s0
; GFX9V3-NEXT:    global_store_dword v[0:1], v0, off
; GFX9V3-NEXT:    s_waitcnt vmcnt(0)
; GFX9V3-NEXT:    s_endpgm
;
; GFX9V4-LABEL: llvm_amdgcn_is_private:
; GFX9V4:       ; %bb.0:
; GFX9V4-NEXT:    s_load_dwordx2 s[0:1], s[4:5], 0x0
; GFX9V4-NEXT:    s_mov_b64 s[2:3], src_private_base
; GFX9V4-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9V4-NEXT:    s_cmp_eq_u32 s1, s3
; GFX9V4-NEXT:    s_cselect_b32 s0, 1, 0
; GFX9V4-NEXT:    v_mov_b32_e32 v0, s0
; GFX9V4-NEXT:    global_store_dword v[0:1], v0, off
; GFX9V4-NEXT:    s_waitcnt vmcnt(0)
; GFX9V4-NEXT:    s_endpgm
;
; GFX9V5-LABEL: llvm_amdgcn_is_private:
; GFX9V5:       ; %bb.0:
; GFX9V5-NEXT:    s_load_dwordx2 s[0:1], s[4:5], 0x0
; GFX9V5-NEXT:    s_mov_b64 s[2:3], src_private_base
; GFX9V5-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9V5-NEXT:    s_cmp_eq_u32 s1, s3
; GFX9V5-NEXT:    s_cselect_b32 s0, 1, 0
; GFX9V5-NEXT:    v_mov_b32_e32 v0, s0
; GFX9V5-NEXT:    global_store_dword v[0:1], v0, off
; GFX9V5-NEXT:    s_waitcnt vmcnt(0)
; GFX9V5-NEXT:    s_endpgm
  %is.private = call i1 @llvm.amdgcn.is.private(ptr %ptr)
  %zext = zext i1 %is.private to i32
  store volatile i32 %zext, ptr addrspace(1) undef
  ret void
}

define amdgpu_kernel void @llvm_trap() {
; GFX8V3-LABEL: llvm_trap:
; GFX8V3:       ; %bb.0:
; GFX8V3-NEXT:    s_mov_b64 s[0:1], s[4:5]
; GFX8V3-NEXT:    s_trap 2
;
; GFX8V4-LABEL: llvm_trap:
; GFX8V4:       ; %bb.0:
; GFX8V4-NEXT:    s_mov_b64 s[0:1], s[4:5]
; GFX8V4-NEXT:    s_trap 2
;
; GFX8V5-LABEL: llvm_trap:
; GFX8V5:       ; %bb.0:
; GFX8V5-NEXT:    s_load_dwordx2 s[0:1], s[4:5], 0xc8
; GFX8V5-NEXT:    s_waitcnt lgkmcnt(0)
; GFX8V5-NEXT:    s_trap 2
;
; GFX9V3-LABEL: llvm_trap:
; GFX9V3:       ; %bb.0:
; GFX9V3-NEXT:    s_mov_b64 s[0:1], s[4:5]
; GFX9V3-NEXT:    s_trap 2
;
; GFX9V4-LABEL: llvm_trap:
; GFX9V4:       ; %bb.0:
; GFX9V4-NEXT:    s_trap 2
;
; GFX9V5-LABEL: llvm_trap:
; GFX9V5:       ; %bb.0:
; GFX9V5-NEXT:    s_trap 2
  call void @llvm.trap()
  unreachable
}

define amdgpu_kernel void @llvm_debugtrap() {
; GFX8V3-LABEL: llvm_debugtrap:
; GFX8V3:       ; %bb.0:
; GFX8V3-NEXT:    s_trap 3
;
; GFX8V4-LABEL: llvm_debugtrap:
; GFX8V4:       ; %bb.0:
; GFX8V4-NEXT:    s_trap 3
;
; GFX8V5-LABEL: llvm_debugtrap:
; GFX8V5:       ; %bb.0:
; GFX8V5-NEXT:    s_trap 3
;
; GFX9V3-LABEL: llvm_debugtrap:
; GFX9V3:       ; %bb.0:
; GFX9V3-NEXT:    s_trap 3
;
; GFX9V4-LABEL: llvm_debugtrap:
; GFX9V4:       ; %bb.0:
; GFX9V4-NEXT:    s_trap 3
;
; GFX9V5-LABEL: llvm_debugtrap:
; GFX9V5:       ; %bb.0:
; GFX9V5-NEXT:    s_trap 3
  call void @llvm.debugtrap()
  unreachable
}

define amdgpu_kernel void @llvm_amdgcn_queue_ptr(ptr addrspace(1) %ptr)  {
; GFX8V3-LABEL: llvm_amdgcn_queue_ptr:
; GFX8V3:       ; %bb.0:
; GFX8V3-NEXT:    v_mov_b32_e32 v0, s6
; GFX8V3-NEXT:    v_mov_b32_e32 v1, s7
; GFX8V3-NEXT:    s_add_u32 s0, s8, 8
; GFX8V3-NEXT:    flat_load_ubyte v0, v[0:1] glc
; GFX8V3-NEXT:    s_addc_u32 s1, s9, 0
; GFX8V3-NEXT:    s_waitcnt vmcnt(0)
; GFX8V3-NEXT:    v_mov_b32_e32 v0, s0
; GFX8V3-NEXT:    v_mov_b32_e32 v1, s1
; GFX8V3-NEXT:    flat_load_ubyte v0, v[0:1] glc
; GFX8V3-NEXT:    s_waitcnt vmcnt(0)
; GFX8V3-NEXT:    v_mov_b32_e32 v0, s4
; GFX8V3-NEXT:    v_mov_b32_e32 v1, s5
; GFX8V3-NEXT:    flat_load_ubyte v0, v[0:1] glc
; GFX8V3-NEXT:    s_load_dwordx2 s[0:1], s[8:9], 0x0
; GFX8V3-NEXT:    s_waitcnt vmcnt(0)
; GFX8V3-NEXT:    v_mov_b32_e32 v0, s10
; GFX8V3-NEXT:    v_mov_b32_e32 v1, s11
; GFX8V3-NEXT:    s_waitcnt lgkmcnt(0)
; GFX8V3-NEXT:    v_mov_b32_e32 v3, s1
; GFX8V3-NEXT:    v_mov_b32_e32 v2, s0
; GFX8V3-NEXT:    flat_store_dwordx2 v[2:3], v[0:1]
; GFX8V3-NEXT:    s_waitcnt vmcnt(0)
; GFX8V3-NEXT:    s_endpgm
;
; GFX8V4-LABEL: llvm_amdgcn_queue_ptr:
; GFX8V4:       ; %bb.0:
; GFX8V4-NEXT:    v_mov_b32_e32 v0, s6
; GFX8V4-NEXT:    v_mov_b32_e32 v1, s7
; GFX8V4-NEXT:    s_add_u32 s0, s8, 8
; GFX8V4-NEXT:    flat_load_ubyte v0, v[0:1] glc
; GFX8V4-NEXT:    s_addc_u32 s1, s9, 0
; GFX8V4-NEXT:    s_waitcnt vmcnt(0)
; GFX8V4-NEXT:    v_mov_b32_e32 v0, s0
; GFX8V4-NEXT:    v_mov_b32_e32 v1, s1
; GFX8V4-NEXT:    flat_load_ubyte v0, v[0:1] glc
; GFX8V4-NEXT:    s_waitcnt vmcnt(0)
; GFX8V4-NEXT:    v_mov_b32_e32 v0, s4
; GFX8V4-NEXT:    v_mov_b32_e32 v1, s5
; GFX8V4-NEXT:    flat_load_ubyte v0, v[0:1] glc
; GFX8V4-NEXT:    s_load_dwordx2 s[0:1], s[8:9], 0x0
; GFX8V4-NEXT:    s_waitcnt vmcnt(0)
; GFX8V4-NEXT:    v_mov_b32_e32 v0, s10
; GFX8V4-NEXT:    v_mov_b32_e32 v1, s11
; GFX8V4-NEXT:    s_waitcnt lgkmcnt(0)
; GFX8V4-NEXT:    v_mov_b32_e32 v3, s1
; GFX8V4-NEXT:    v_mov_b32_e32 v2, s0
; GFX8V4-NEXT:    flat_store_dwordx2 v[2:3], v[0:1]
; GFX8V4-NEXT:    s_waitcnt vmcnt(0)
; GFX8V4-NEXT:    s_endpgm
;
; GFX8V5-LABEL: llvm_amdgcn_queue_ptr:
; GFX8V5:       ; %bb.0:
; GFX8V5-NEXT:    s_add_u32 s0, s6, 8
; GFX8V5-NEXT:    flat_load_ubyte v0, v[0:1] glc
; GFX8V5-NEXT:    s_addc_u32 s1, s7, 0
; GFX8V5-NEXT:    s_waitcnt vmcnt(0)
; GFX8V5-NEXT:    v_mov_b32_e32 v0, s0
; GFX8V5-NEXT:    v_mov_b32_e32 v1, s1
; GFX8V5-NEXT:    flat_load_ubyte v0, v[0:1] glc
; GFX8V5-NEXT:    s_waitcnt vmcnt(0)
; GFX8V5-NEXT:    v_mov_b32_e32 v0, s4
; GFX8V5-NEXT:    v_mov_b32_e32 v1, s5
; GFX8V5-NEXT:    flat_load_ubyte v0, v[0:1] glc
; GFX8V5-NEXT:    s_load_dwordx2 s[0:1], s[6:7], 0x0
; GFX8V5-NEXT:    s_waitcnt vmcnt(0)
; GFX8V5-NEXT:    v_mov_b32_e32 v0, s8
; GFX8V5-NEXT:    v_mov_b32_e32 v1, s9
; GFX8V5-NEXT:    s_waitcnt lgkmcnt(0)
; GFX8V5-NEXT:    v_mov_b32_e32 v3, s1
; GFX8V5-NEXT:    v_mov_b32_e32 v2, s0
; GFX8V5-NEXT:    flat_store_dwordx2 v[2:3], v[0:1]
; GFX8V5-NEXT:    s_waitcnt vmcnt(0)
; GFX8V5-NEXT:    s_endpgm
;
; GFX9V3-LABEL: llvm_amdgcn_queue_ptr:
; GFX9V3:       ; %bb.0:
; GFX9V3-NEXT:    v_mov_b32_e32 v2, 0
; GFX9V3-NEXT:    global_load_ubyte v0, v2, s[6:7] glc
; GFX9V3-NEXT:    global_load_ubyte v0, v2, s[8:9] offset:8 glc
; GFX9V3-NEXT:    global_load_ubyte v0, v2, s[4:5] glc
; GFX9V3-NEXT:    s_load_dwordx2 s[0:1], s[8:9], 0x0
; GFX9V3-NEXT:    s_waitcnt vmcnt(0)
; GFX9V3-NEXT:    v_mov_b32_e32 v0, s10
; GFX9V3-NEXT:    v_mov_b32_e32 v1, s11
; GFX9V3-NEXT:    ; kill: killed $sgpr6_sgpr7
; GFX9V3-NEXT:    ; kill: killed $sgpr4_sgpr5
; GFX9V3-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9V3-NEXT:    global_store_dwordx2 v2, v[0:1], s[0:1]
; GFX9V3-NEXT:    s_waitcnt vmcnt(0)
; GFX9V3-NEXT:    s_endpgm
;
; GFX9V4-LABEL: llvm_amdgcn_queue_ptr:
; GFX9V4:       ; %bb.0:
; GFX9V4-NEXT:    v_mov_b32_e32 v2, 0
; GFX9V4-NEXT:    global_load_ubyte v0, v2, s[6:7] glc
; GFX9V4-NEXT:    global_load_ubyte v0, v2, s[8:9] offset:8 glc
; GFX9V4-NEXT:    global_load_ubyte v0, v2, s[4:5] glc
; GFX9V4-NEXT:    s_load_dwordx2 s[0:1], s[8:9], 0x0
; GFX9V4-NEXT:    s_waitcnt vmcnt(0)
; GFX9V4-NEXT:    v_mov_b32_e32 v0, s10
; GFX9V4-NEXT:    v_mov_b32_e32 v1, s11
; GFX9V4-NEXT:    ; kill: killed $sgpr6_sgpr7
; GFX9V4-NEXT:    ; kill: killed $sgpr4_sgpr5
; GFX9V4-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9V4-NEXT:    global_store_dwordx2 v2, v[0:1], s[0:1]
; GFX9V4-NEXT:    s_waitcnt vmcnt(0)
; GFX9V4-NEXT:    s_endpgm
;
; GFX9V5-LABEL: llvm_amdgcn_queue_ptr:
; GFX9V5:       ; %bb.0:
; GFX9V5-NEXT:    v_mov_b32_e32 v2, 0
; GFX9V5-NEXT:    global_load_ubyte v0, v[0:1], off glc
; GFX9V5-NEXT:    s_load_dwordx2 s[0:1], s[6:7], 0x0
; GFX9V5-NEXT:    global_load_ubyte v0, v2, s[6:7] offset:8 glc
; GFX9V5-NEXT:    global_load_ubyte v0, v2, s[4:5] glc
; GFX9V5-NEXT:    s_waitcnt vmcnt(0)
; GFX9V5-NEXT:    v_mov_b32_e32 v0, s8
; GFX9V5-NEXT:    v_mov_b32_e32 v1, s9
; GFX9V5-NEXT:    ; kill: killed $sgpr4_sgpr5
; GFX9V5-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9V5-NEXT:    global_store_dwordx2 v2, v[0:1], s[0:1]
; GFX9V5-NEXT:    s_waitcnt vmcnt(0)
; GFX9V5-NEXT:    s_endpgm
  %queue.ptr = call ptr addrspace(4) @llvm.amdgcn.queue.ptr()
  %implicitarg.ptr = call ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
  %dispatch.ptr = call ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
  %dispatch.id = call i64 @llvm.amdgcn.dispatch.id()
  %queue.load = load volatile i8, ptr addrspace(4) %queue.ptr
  %implicitarg.load = load volatile i8, ptr addrspace(4) %implicitarg.ptr
  %dispatch.load = load volatile i8, ptr addrspace(4) %dispatch.ptr
  store volatile i64 %dispatch.id, ptr addrspace(1) %ptr
  ret void
}

declare noalias ptr addrspace(4) @llvm.amdgcn.queue.ptr()
declare noalias ptr addrspace(4) @llvm.amdgcn.implicitarg.ptr()
declare i64 @llvm.amdgcn.dispatch.id()
declare noalias ptr addrspace(4) @llvm.amdgcn.dispatch.ptr()
declare i1 @llvm.amdgcn.is.shared(ptr)
declare i1 @llvm.amdgcn.is.private(ptr)
declare void @llvm.trap()
declare void @llvm.debugtrap()