# NOTE: Assertions have been autogenerated by utils/update_mca_test_checks.py
# RUN: llvm-mca %s -mtriple=x86_64-unknown-unknown -mcpu=x86-64 -resource-pressure=false -instruction-info=false < %s | FileCheck --check-prefixes=ALL,BARCELONA %s
# RUN: llvm-mca %s -mtriple=x86_64-unknown-unknown -mcpu=bdver2 -resource-pressure=false -instruction-info=false < %s | FileCheck --check-prefixes=ALL,BDVER2 %s
# RUN: llvm-mca %s -mtriple=x86_64-unknown-unknown -mcpu=btver2 -resource-pressure=false -instruction-info=false < %s | FileCheck --check-prefixes=ALL,BTVER2 %s
# RUN: llvm-mca %s -mtriple=x86_64-unknown-unknown -mcpu=znver1 -resource-pressure=false -instruction-info=false < %s | FileCheck --check-prefixes=ALL,ZNVER1 %s
# RUN: llvm-mca %s -mtriple=x86_64-unknown-unknown -mcpu=znver2 -resource-pressure=false -instruction-info=false < %s | FileCheck --check-prefixes=ALL,ZNVER2 %s
# RUN: llvm-mca %s -mtriple=x86_64-unknown-unknown -mcpu=znver3 -resource-pressure=false -instruction-info=false < %s | FileCheck --check-prefixes=ALL,ZNVER3 %s
# RUN: llvm-mca %s -mtriple=x86_64-unknown-unknown -mcpu=sandybridge -resource-pressure=false -instruction-info=false < %s | FileCheck --check-prefixes=ALL,SANDYBRIDGE %s
# RUN: llvm-mca %s -mtriple=x86_64-unknown-unknown -mcpu=ivybridge -resource-pressure=false -instruction-info=false < %s | FileCheck --check-prefixes=ALL,IVYBRIDGE %s
# RUN: llvm-mca %s -mtriple=x86_64-unknown-unknown -mcpu=haswell -resource-pressure=false -instruction-info=false < %s | FileCheck --check-prefixes=ALL,HASWELL %s
# RUN: llvm-mca %s -mtriple=x86_64-unknown-unknown -mcpu=broadwell -resource-pressure=false -instruction-info=false < %s | FileCheck --check-prefixes=ALL,BROADWELL %s
# RUN: llvm-mca %s -mtriple=x86_64-unknown-unknown -mcpu=knl -resource-pressure=false -instruction-info=false < %s | FileCheck --check-prefixes=ALL,KNL %s
# RUN: llvm-mca %s -mtriple=x86_64-unknown-unknown -mcpu=skylake -resource-pressure=false -instruction-info=false < %s | FileCheck --check-prefixes=ALL,SKX %s
# RUN: llvm-mca %s -mtriple=x86_64-unknown-unknown -mcpu=skylake-avx512 -resource-pressure=false -instruction-info=false < %s | FileCheck --check-prefixes=ALL,SKX-AVX512 %s
# RUN: llvm-mca %s -mtriple=x86_64-unknown-unknown -mcpu=icelake-client -resource-pressure=false -instruction-info=false < %s | FileCheck --check-prefixes=ALL,ICX %s
# RUN: llvm-mca %s -mtriple=x86_64-unknown-unknown -mcpu=icelake-server -resource-pressure=false -instruction-info=false < %s | FileCheck --check-prefixes=ALL,ICX %s
# RUN: llvm-mca %s -mtriple=x86_64-unknown-unknown -mcpu=rocketlake -resource-pressure=false -instruction-info=false < %s | FileCheck --check-prefixes=ALL,ICX %s
# RUN: llvm-mca %s -mtriple=x86_64-unknown-unknown -mcpu=tigerlake -resource-pressure=false -instruction-info=false < %s | FileCheck --check-prefixes=ALL,ICX %s
# RUN: llvm-mca %s -mtriple=x86_64-unknown-unknown -mcpu=slm -resource-pressure=false -instruction-info=false < %s | FileCheck --check-prefixes=ALL,SLM %s

add %edi, %eax

# ALL:              Iterations:        100
# ALL-NEXT:         Instructions:      100
# ALL-NEXT:         Total Cycles:      103
# ALL-NEXT:         Total uOps:        100

# BARCELONA:        Dispatch Width:    4
# BARCELONA-NEXT:   uOps Per Cycle:    0.97
# BARCELONA-NEXT:   IPC:               0.97
# BARCELONA-NEXT:   Block RThroughput: 0.3

# BDVER2:           Dispatch Width:    4
# BDVER2-NEXT:      uOps Per Cycle:    0.97
# BDVER2-NEXT:      IPC:               0.97
# BDVER2-NEXT:      Block RThroughput: 1.0

# BROADWELL:        Dispatch Width:    4
# BROADWELL-NEXT:   uOps Per Cycle:    0.97
# BROADWELL-NEXT:   IPC:               0.97
# BROADWELL-NEXT:   Block RThroughput: 0.3

# BTVER2:           Dispatch Width:    2
# BTVER2-NEXT:      uOps Per Cycle:    0.97
# BTVER2-NEXT:      IPC:               0.97
# BTVER2-NEXT:      Block RThroughput: 0.5

# HASWELL:          Dispatch Width:    4
# HASWELL-NEXT:     uOps Per Cycle:    0.97
# HASWELL-NEXT:     IPC:               0.97
# HASWELL-NEXT:     Block RThroughput: 0.3

# ICX:              Dispatch Width:    6
# ICX-NEXT:         uOps Per Cycle:    0.97
# ICX-NEXT:         IPC:               0.97
# ICX-NEXT:         Block RThroughput: 0.3

# IVYBRIDGE:        Dispatch Width:    4
# IVYBRIDGE-NEXT:   uOps Per Cycle:    0.97
# IVYBRIDGE-NEXT:   IPC:               0.97
# IVYBRIDGE-NEXT:   Block RThroughput: 0.3

# KNL:              Dispatch Width:    4
# KNL-NEXT:         uOps Per Cycle:    0.97
# KNL-NEXT:         IPC:               0.97
# KNL-NEXT:         Block RThroughput: 0.3

# SANDYBRIDGE:      Dispatch Width:    4
# SANDYBRIDGE-NEXT: uOps Per Cycle:    0.97
# SANDYBRIDGE-NEXT: IPC:               0.97
# SANDYBRIDGE-NEXT: Block RThroughput: 0.3

# SKX:              Dispatch Width:    6
# SKX-NEXT:         uOps Per Cycle:    0.97
# SKX-NEXT:         IPC:               0.97
# SKX-NEXT:         Block RThroughput: 0.3

# SKX-AVX512:       Dispatch Width:    6
# SKX-AVX512-NEXT:  uOps Per Cycle:    0.97
# SKX-AVX512-NEXT:  IPC:               0.97
# SKX-AVX512-NEXT:  Block RThroughput: 0.3

# SLM:              Dispatch Width:    2
# SLM-NEXT:         uOps Per Cycle:    0.97
# SLM-NEXT:         IPC:               0.97
# SLM-NEXT:         Block RThroughput: 0.5

# ZNVER1:           Dispatch Width:    4
# ZNVER1-NEXT:      uOps Per Cycle:    0.97
# ZNVER1-NEXT:      IPC:               0.97
# ZNVER1-NEXT:      Block RThroughput: 0.3

# ZNVER2:           Dispatch Width:    4
# ZNVER2-NEXT:      uOps Per Cycle:    0.97
# ZNVER2-NEXT:      IPC:               0.97
# ZNVER2-NEXT:      Block RThroughput: 0.3

# ZNVER3:           Dispatch Width:    6
# ZNVER3-NEXT:      uOps Per Cycle:    0.97
# ZNVER3-NEXT:      IPC:               0.97
# ZNVER3-NEXT:      Block RThroughput: 0.3