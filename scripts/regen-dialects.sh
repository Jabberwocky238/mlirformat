#!/bin/sh
# Regenerates every tblgen dialect in src/dialects from LLVM 22.1.8's ODS.
#   LLVM=<llvm-project> LLVM_BUILD=<its build dir> scripts/regen-dialects.sh [out dir]
# LLVM_BUILD only provides the generated `LinalgNamedStructuredOps.yamlgen.td`.
set -e
: "${LLVM:?set LLVM to the llvm-project checkout}"
: "${LLVM_BUILD:?set LLVM_BUILD to its build directory}"
cd "$(dirname "$0")/.."
D=$LLVM/mlir/include/mlir/Dialect
I="-I $LLVM/mlir/include -I $LLVM_BUILD/tools/mlir/include"
OUT=${1:-src/dialects}
cargo run -q -- tblgen $I -o "$OUT" \
    $D/Affine/IR/AffineOps.td $D/Async/IR/AsyncOps.td $D/Bufferization/IR/BufferizationOps.td \
    $D/EmitC/IR/EmitC.td $D/GPU/IR/GPUOps.td $D/MemRef/IR/MemRefOps.td $D/PDL/IR/PDLOps.td \
    $D/SCF/IR/SCFOps.td $D/Shape/IR/ShapeOps.td $D/Tensor/IR/TensorOps.td $D/Tosa/IR/TosaOps.td \
    $D/Vector/IR/VectorOps.td
cargo run -q -- tblgen --dialect llvm $I -o "$OUT" scripts/td/LLVM.td
cargo run -q -- tblgen --dialect linalg $I -o "$OUT" scripts/td/Linalg.td
