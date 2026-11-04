module @transforms attributes {transform.with_named_sequence} {
  transform.named_sequence @__transform_main_basic(%arg0: !transform.any_op {transform.consume}) {
    %0 = transform.structured.match ops{["linalg.pack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
    %1 = transform.structured.match ops{["linalg.unpack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
    %tiled_linalg_op, %loops:2 = transform.structured.tile_using_for %0 tile_sizes [1, 1] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
    %tiled_linalg_op_0, %loops_1:2 = transform.structured.tile_using_for %1 tile_sizes [4, 1] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
    %2 = transform.get_parent_op %tiled_linalg_op {isolated_from_above} : (!transform.any_op) -> !transform.op<"func.func">
    transform.apply_patterns to %2 {
      transform.apply_patterns.linalg.decompose_pack_unpack
      transform.apply_patterns.linalg.decompose_pad
    } : !transform.op<"func.func">
    transform.apply_patterns to %2 {
      transform.apply_patterns.tensor.fold_tensor_subset_ops
      transform.apply_patterns.canonicalization
    } : !transform.op<"func.func">
    %3 = transform.get_parent_op %tiled_linalg_op_0 {isolated_from_above} : (!transform.any_op) -> !transform.op<"func.func">
    transform.apply_patterns to %3 {
      transform.apply_patterns.linalg.decompose_pack_unpack
    } : !transform.op<"func.func">
    transform.apply_patterns to %3 {
      transform.apply_patterns.tensor.fold_tensor_subset_ops
      transform.apply_patterns.canonicalization
    } : !transform.op<"func.func">
    %4 = transform.bufferization.one_shot_bufferize %arg0 {bufferize_function_boundaries = true} : (!transform.any_op) -> !transform.any_op
    %5 = transform.structured.match ops{["func.func"]} in %4 : (!transform.any_op) -> !transform.op<"func.func">
    transform.apply_patterns to %5 {
      transform.apply_patterns.canonicalization
    } : !transform.op<"func.func">
    transform.yield 
  }
  transform.named_sequence @__transform_main_vectorized(%arg0: !transform.any_op {transform.consume}) {
    %0 = transform.structured.match ops{["linalg.pack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
    %1 = transform.structured.match ops{["linalg.unpack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
    %tiled_linalg_op, %loops:2 = transform.structured.tile_using_for %0 tile_sizes [1, 1] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
    %tiled_linalg_op_0, %loops_1:2 = transform.structured.tile_using_for %1 tile_sizes [1, 1] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
    %2 = transform.get_parent_op %tiled_linalg_op {isolated_from_above} : (!transform.any_op) -> !transform.op<"func.func">
    transform.apply_patterns to %2 {
      transform.apply_patterns.linalg.decompose_pack_unpack
      transform.apply_patterns.linalg.decompose_pad
    } : !transform.op<"func.func">
    transform.apply_patterns to %2 {
      transform.apply_patterns.tensor.fold_tensor_subset_ops
      transform.apply_patterns.canonicalization
    } : !transform.op<"func.func">
    %3 = transform.get_parent_op %tiled_linalg_op_0 {isolated_from_above} : (!transform.any_op) -> !transform.op<"func.func">
    transform.structured.vectorize %tiled_linalg_op_0 vector_sizes [1, 1, 4, [4]] {assume_dynamic_dims_match_vec_sizes} : !transform.any_op
    transform.apply_patterns to %3 {
      transform.apply_patterns.vector.transfer_permutation_patterns
      transform.apply_patterns.vector.lower_masked_transfers
      transform.apply_patterns.vector.sink_ops
    } : !transform.op<"func.func">
    %4 = transform.bufferization.one_shot_bufferize %arg0 {bufferize_function_boundaries = true} : (!transform.any_op) -> !transform.any_op
    %5 = transform.structured.match ops{["func.func"]} in %4 : (!transform.any_op) -> !transform.op<"func.func">
    transform.apply_patterns to %5 {
      transform.apply_patterns.canonicalization
    } : !transform.op<"func.func">
    transform.yield 
  }
}

