module {
  module attributes {test.dlti = #dlti.target_system_spec<"CPU" = #dlti.target_device_spec<"inner_most_tile_size" = 42 : i32>>} {
    func.func @matmul_tensors(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
      %0 = linalg.matmul ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
      return %0 : tensor<?x?xf32>
    }
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.dlti.query ["CPU", "inner_most_tile_size"] at %0 : (!transform.any_op) -> !transform.param<i32>
      %tiled_linalg_op, %loops = transform.structured.tile_using_for %0 tile_sizes [%1] : (!transform.any_op, !transform.param<i32>) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

