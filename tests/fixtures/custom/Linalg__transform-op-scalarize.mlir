module {
  func.func @scalarize(%arg0: tensor<24x12xf32>, %arg1: tensor<12x25xf32>, %arg2: tensor<24x25xf32>) -> tensor<24x25xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<24x12xf32>, tensor<12x25xf32>) outs(%arg2 : tensor<24x25xf32>) -> tensor<24x25xf32>
    return %0 : tensor<24x25xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops = transform.structured.tile_using_for %0 tile_sizes [10, 0, 0] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %1 = transform.structured.scalarize %tiled_linalg_op : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

