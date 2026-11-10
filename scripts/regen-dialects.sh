#!/bin/sh
# Regenerates every tblgen dialect in src/dialects from LLVM 23.1.5's ODS.
#   scripts/regen-dialects.sh [out dir]
# `td/` is `mlir/include` as llvm-project 23.1.5 has it, cut down to what these dialects include:
# the upstream files, unchanged, at their own paths, and `-I td` is the root their
# `include "mlir/..."` lines read from. `LinalgNamedStructuredOps.yamlgen.td` is the one file a
# 23.1.5 build generates (from the OpDSL YAML) instead of keeping in the source tree.
# A dialect whose ops upstream splits over several files is one run over those files.
set -e
cd "$(dirname "$0")/.."
OUT=${1:-src/dialects}
mkdir -p "$OUT"
cargo build -q --release --bin mlirformat
D=td/mlir/Dialect
while read -r ns files; do
    # shellcheck disable=SC2086
    target/release/mlirformat tblgen --dialect "$ns" -I td -o "$OUT" $files
done <<EOF
affine $D/Affine/IR/AffineOps.td
amdgpu $D/AMDGPU/IR/AMDGPU.td
arm_neon $D/ArmNeon/ArmNeon.td
arm_sme $D/ArmSME/IR/ArmSMEOps.td $D/ArmSME/IR/ArmSMEIntrinsicOps.td
arm_sve $D/ArmSVE/IR/ArmSVE.td
async $D/Async/IR/AsyncOps.td
bufferization $D/Bufferization/IR/BufferizationOps.td
emitc $D/EmitC/IR/EmitC.td
gpu $D/GPU/IR/GPUOps.td
linalg $D/Linalg/IR/LinalgOps.td $D/Linalg/IR/LinalgStructuredOps.td $D/Linalg/IR/LinalgRelayoutOps.td
llvm $D/LLVMIR/LLVMOps.td $D/LLVMIR/LLVMIntrinsicOps.td
memref $D/MemRef/IR/MemRefOps.td
nvgpu $D/NVGPU/IR/NVGPUOps.td
nvvm $D/LLVMIR/NVVMOps.td $D/LLVMIR/LLVMTypes.td
pdl $D/PDL/IR/PDLOps.td
rocdl $D/LLVMIR/ROCDLOps.td $D/LLVMIR/LLVMTypes.td
scf $D/SCF/IR/SCFOps.td
shape $D/Shape/IR/ShapeOps.td
spirv $D/SPIRV/IR/SPIRVOps.td
tensor $D/Tensor/IR/TensorOps.td
tosa $D/Tosa/IR/TosaOps.td
vector $D/Vector/IR/VectorOps.td
x86 $D/X86/X86.td
xegpu $D/XeGPU/IR/XeGPUOps.td
xevm $D/LLVMIR/XeVMOps.td $D/LLVMIR/LLVMTypes.td
EOF
