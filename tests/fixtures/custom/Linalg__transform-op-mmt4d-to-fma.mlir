module {
  func.func @mmt4d_to_fma(%arg0: tensor<16x16x8x1xf32>, %arg1: tensor<16x16x8x1xf32>, %arg2: tensor<16x16x8x8xf32>) -> tensor<16x16x8x8xf32> {
    %0 = linalg.mmt4d ins(%arg0, %arg1 : tensor<16x16x8x1xf32>, tensor<16x16x8x1xf32>) outs(%arg2 : tensor<16x16x8x8xf32>) -> tensor<16x16x8x8xf32>
    return %0 : tensor<16x16x8x8xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      %1 = transform.structured.match ops{["linalg.mmt4d"]} in %0 : (!transform.op<"func.func">) -> !transform.any_op
      %tiled_linalg_op, %loops:4 = transform.structured.tile_using_for %1 tile_sizes [1, 1, 0, 8, 8, 0] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      %tiled_linalg_op_0, %loops_1:2 = transform.structured.tile_using_for %tiled_linalg_op tile_sizes [0, 0, 1, 0, 0, 1] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.structured.vectorize %tiled_linalg_op_0 : !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.reduction_to_contract
        transform.apply_patterns.vector.transfer_permutation_patterns
      } : !transform.op<"func.func">
      %2 = transform.structured.hoist_redundant_vector_transfers %0 : (!transform.op<"func.func">) -> !transform.op<"func.func">
      %3 = transform.structured.match interface{LoopLikeInterface} in %2 : (!transform.op<"func.func">) -> !transform.any_op
      transform.apply_licm to %3 : !transform.any_op
      transform.loop.hoist_loop_invariant_subsets %3 : !transform.any_op
      transform.apply_patterns to %2 {
        transform.apply_patterns.vector.reduction_to_contract
        transform.apply_patterns.vector.cast_away_vector_leading_one_dim
        transform.apply_patterns.canonicalization
      } : !transform.op<"func.func">
      transform.apply_patterns to %2 {
        transform.apply_patterns.vector.lower_contraction
        transform.apply_patterns.vector.lower_outerproduct
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
}

