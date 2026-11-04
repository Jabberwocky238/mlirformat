module {
  func.func @mmt4d() {
    %0 = tensor.empty() : tensor<2x2x3x1xi32>
    %1 = tensor.empty() : tensor<2x2x3x1xi32>
    %2 = tensor.empty() : tensor<2x2x3x3xi32>
    %cst = arith.constant dense<[[[[1, 2, 3], [4, 5, 6], [7, 8, 9]], [[11, 12, 13], [14, 15, 16], [17, 18, 19]]], [[[21, 22, 23], [24, 25, 26], [27, 28, 29]], [[31, 32, 33], [34, 35, 36], [37, 38, 39]]]]> : tensor<2x2x3x3xi32>
    %c3_i32 = arith.constant 3 : i32
    %c4_i32 = arith.constant 4 : i32
    %3 = linalg.fill ins(%c3_i32 : i32) outs(%0 : tensor<2x2x3x1xi32>) -> tensor<2x2x3x1xi32>
    %4 = linalg.fill ins(%c4_i32 : i32) outs(%1 : tensor<2x2x3x1xi32>) -> tensor<2x2x3x1xi32>
    %5 = linalg.mmt4d ins(%3, %4 : tensor<2x2x3x1xi32>, tensor<2x2x3x1xi32>) outs(%cst : tensor<2x2x3x3xi32>) -> tensor<2x2x3x3xi32>
    %cast = tensor.cast %5 : tensor<2x2x3x3xi32> to tensor<*xi32>
    call @printMemrefI32(%cast) : (tensor<*xi32>) -> ()
    return
  }
  module @transforms attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.collect_matching @match_mmt4d in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.op<"func.func">
      %tiled_linalg_op, %loops:4 = transform.structured.tile_using_for %0 tile_sizes [1, 1, 0, 3, 3, 0] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      %tiled_linalg_op_0, %loops_1:2 = transform.structured.tile_using_for %tiled_linalg_op tile_sizes [0, 0, 1, 0, 0, 1] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.structured.vectorize %tiled_linalg_op_0 : !transform.any_op
      transform.apply_patterns to %1 {
        transform.apply_patterns.vector.reduction_to_contract
        transform.apply_patterns.vector.transfer_permutation_patterns
      } : !transform.op<"func.func">
      %2 = transform.structured.hoist_redundant_vector_transfers %1 : (!transform.op<"func.func">) -> !transform.op<"func.func">
      %3 = transform.structured.match interface{LoopLikeInterface} in %2 : (!transform.op<"func.func">) -> !transform.any_op
      transform.apply_licm to %3 : !transform.any_op
      transform.loop.hoist_loop_invariant_subsets %3 : !transform.any_op
      transform.apply_patterns to %2 {
        transform.apply_patterns.vector.reduction_to_contract
        transform.apply_patterns.vector.cast_away_vector_leading_one_dim
        transform.apply_patterns.canonicalization
      } : !transform.op<"func.func">
      transform.yield 
    }
    transform.named_sequence @match_mmt4d(%arg0: !transform.any_op {transform.readonly}) -> !transform.any_op {
      transform.match.operation_name %arg0 ["linalg.mmt4d"] : !transform.any_op
      transform.yield %arg0 : !transform.any_op
    }
  }
  func.func private @printMemrefI32(tensor<*xi32>)
}

