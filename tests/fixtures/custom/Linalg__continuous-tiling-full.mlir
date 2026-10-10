module {
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tile_sizes, %chunk_sizes = transform.structured.continuous_tile_sizes %0 {dimension = 0 : i64, target_size = 9 : i64} : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.split %0 after %chunk_sizes  {dimension = 0 : i64, multiway} : !transform.any_op, !transform.any_op
      transform.foreach %1, %tile_sizes : !transform.any_op, !transform.any_op {
      ^bb0(%arg1: !transform.any_op, %arg2: !transform.any_op):
        %tiled_linalg_op, %loops = transform.structured.tile_using_for %arg1 tile_sizes [%arg2] : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      }
      transform.yield 
    }
  }
  func.func @continuous_tile_linalg_matmul(%arg0: tensor<25x34xf32>, %arg1: tensor<34x25xf32>, %arg2: tensor<25x25xf32>) -> tensor<25x25xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<25x34xf32>, tensor<34x25xf32>) outs(%arg2 : tensor<25x25xf32>) -> tensor<25x25xf32>
    return %0 : tensor<25x25xf32>
  }
}

// -----
module {
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tile_sizes, %chunk_sizes = transform.structured.continuous_tile_sizes %0 {dimension = 0 : i64, target_size = 9 : i64} : (!transform.any_op) -> !transform.param<i64>
      %1 = transform.structured.split %0 after %chunk_sizes  {dimension = 0 : i64, multiway} : !transform.any_op, !transform.param<i64>
      transform.foreach %1, %tile_sizes : !transform.any_op, !transform.param<i64> {
      ^bb0(%arg1: !transform.any_op, %arg2: !transform.param<i64>):
        %tiled_linalg_op, %loops = transform.structured.tile_using_for %arg1 tile_sizes [%arg2] : (!transform.any_op, !transform.param<i64>) -> (!transform.any_op, !transform.any_op)
      }
      transform.yield 
    }
  }
  func.func @continuous_tile_static_linalg_matmul(%arg0: tensor<25x34xf32>, %arg1: tensor<34x25xf32>, %arg2: tensor<25x25xf32>) -> tensor<25x25xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<25x34xf32>, tensor<34x25xf32>) outs(%arg2 : tensor<25x25xf32>) -> tensor<25x25xf32>
    return %0 : tensor<25x25xf32>
  }
}

// -----
module {
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tile_sizes, %chunk_sizes = transform.structured.continuous_tile_sizes %0 {dimension = 0 : i64, target_size = 9 : i64} : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.split %0 after %chunk_sizes  {dimension = 0 : i64, multiway} : !transform.any_op, !transform.any_op
      transform.foreach %1, %tile_sizes with_zip_shortest : !transform.any_op, !transform.any_op {
      ^bb0(%arg1: !transform.any_op, %arg2: !transform.any_op):
        %tiled_linalg_op, %loops = transform.structured.tile_using_for %arg1 tile_sizes [%arg2] : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      }
      transform.yield 
    }
  }
  func.func @continuous_tile_dynamic_linalg_matmul(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
}

