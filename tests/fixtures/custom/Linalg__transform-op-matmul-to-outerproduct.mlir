module {
  func.func @matmul_to_outerproduct(%arg0: memref<3x4xf32>, %arg1: memref<4x3xf32>, %arg2: memref<3x3xf32>) {
    linalg.matmul ins(%arg0, %arg1 : memref<3x4xf32>, memref<4x3xf32>) outs(%arg2 : memref<3x3xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["linalg.matmul"]} in %0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %1 : !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.reduction_to_contract
        transform.apply_patterns.vector.transfer_permutation_patterns
      } : !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.lower_contraction
      } : !transform.any_op
      transform.yield 
    }
  }
}

