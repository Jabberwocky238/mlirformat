// Every linalg op, for `mlirformat tblgen --dialect linalg`: upstream splits them over four files
// (the named ops' file is generated from YAML in the LLVM build tree: `-I $LLVM_BUILD/tools/mlir/include`).
include "mlir/Dialect/Linalg/IR/LinalgOps.td"
include "mlir/Dialect/Linalg/IR/LinalgStructuredOps.td"
include "mlir/Dialect/Linalg/IR/LinalgRelayoutOps.td"
