module {
  func.func @matmul_tensors(%arg0: tensor<2x4xf32>, %arg1: tensor<4x6xf32>, %arg2: tensor<2x6xf32>) -> tensor<2x6xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<2x4xf32>, tensor<4x6xf32>) outs(%arg2 : tensor<2x6xf32>) -> tensor<2x6xf32>
    return %0 : tensor<2x6xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.consumed}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:3 = transform.structured.tile_using_for %0 tile_sizes [2, 2, 2] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      %1 = transform.get_parent_op %tiled_linalg_op {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 : (!transform.any_op) -> !transform.any_op
      %3 = transform.bufferization.one_shot_bufferize layout{IdentityLayoutMap} %arg0 {bufferize_function_boundaries = true} : (!transform.any_op) -> !transform.any_op
      %4 = transform.structured.match ops{["func.func"]} in %3 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %4 {
        transform.apply_patterns.vector.lower_contraction
        transform.apply_patterns.vector.transfer_permutation_patterns
        transform.apply_patterns.vector.reorder_multi_reduction_dims
        transform.apply_patterns.vector.multi_reduction_flattening
        transform.apply_patterns.vector.multi_reduction_unrolling
        transform.apply_patterns.vector.split_transfer_full_partial
        transform.apply_patterns.vector.transfer_to_scf full_unroll = true
        transform.apply_patterns.vector.lower_transfer
        transform.apply_patterns.vector.lower_shape_cast
        transform.apply_patterns.vector.lower_transpose lowering_strategy = shuffle_1d
      } : !transform.any_op
      transform.yield 
    }
  }
}

