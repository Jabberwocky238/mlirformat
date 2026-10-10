module {
  func.func @matmul_split(%arg0: tensor<?x256xf32>, %arg1: tensor<256x32xf32>, %arg2: tensor<?x32xf32>) -> tensor<?x32xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<?x256xf32>, tensor<256x32xf32>) outs(%arg2 : tensor<?x32xf32>) -> tensor<?x32xf32>
    return %0 : tensor<?x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %init_or_alloc_op, %fill_op, %split_linalg_op, %combining_linalg_op = transform.structured.split_reduction %0 {insert_split_dimension = 2 : i64, split_factor = 4 : i64, use_alloc, use_scaling_algorithm} : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

