#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d6, d4, d5, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
#map3 = affine_map<(d0, d1, d2, d3) -> ()>
#map4 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
module {
  func.func @conv(%arg0: tensor<5x82x102x128xf32> {bufferization.access = "read", bufferization.buffer_layout = #map4, bufferization.writable = false}, %arg1: tensor<128x3x3x128xf32> {bufferization.access = "read", bufferization.buffer_layout = #map4, bufferization.writable = false}, %arg2: tensor<128xf32> {bufferization.access = "read", bufferization.buffer_layout = affine_map<(d0) -> (d0)>, bufferization.writable = false}, %arg3: tensor<5x80x100x128xf32> {bufferization.access = "write", bufferization.buffer_layout = #map4, bufferization.writable = true}) -> tensor<5x80x100x128xf32> attributes {llvm.emit_c_interface} {
    %0 = tensor.empty() : tensor<5x80x100x128xf32>
    %broadcasted = linalg.broadcast ins(%arg2 : tensor<128xf32>) outs(%0 : tensor<5x80x100x128xf32>) dimensions = [0, 1, 2] 
    %1 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "parallel", "parallel", "reduction", "reduction", "reduction"]} ins(%arg1, %arg0 : tensor<128x3x3x128xf32>, tensor<5x82x102x128xf32>) outs(%broadcasted : tensor<5x80x100x128xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %3 = arith.mulf %in, %in_0 fastmath<fast> : f32
      %4 = arith.addf %out, %3 fastmath<fast> : f32
      linalg.yield %4 : f32
    } -> tensor<5x80x100x128xf32>
    %cst = arith.constant 0.000000e+00 : f32
    %2 = linalg.generic {indexing_maps = [#map3, #map4, #map4], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%cst, %1 : f32, tensor<5x80x100x128xf32>) outs(%arg3 : tensor<5x80x100x128xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %3 = llvm.intr.maxnum(%in, %in_0) : (f32, f32) -> f32
      linalg.yield %3 : f32
    } -> tensor<5x80x100x128xf32>
    return %2 : tensor<5x80x100x128xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %0 = transform.structured.match ops{["linalg.broadcast"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %2:2 = transform.split_handle %1 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %tiled_op, %forall_op = transform.structured.tile_using_forall %2#1 tile_sizes [0, 0, 0, 64] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %tiled_op_0, %forall_op_1 = transform.structured.tile_using_forall %tiled_op tile_sizes [1, 1, 5, 0] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %fused_op, %new_containing_op = transform.structured.fuse_into_containing_op %2#0 into %forall_op : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      %fused_op_2, %new_containing_op_3 = transform.structured.fuse_into_containing_op %fused_op into %forall_op_1 : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      %fused_op_4, %new_containing_op_5 = transform.structured.fuse_into_containing_op %0 into %new_containing_op : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      %fused_op_6, %new_containing_op_7 = transform.structured.fuse_into_containing_op %fused_op_4 into %new_containing_op_3 : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      %3 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %3 {
      } : !transform.any_op
      %fill_op, %split_op, %combining_op, %for_op = transform.structured.tile_reduction_using_for %fused_op_2 by tile_sizes = [0, 0, 0, 0, 1, 1, 1] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      %4 = transform.structured.generalize %fused_op_6 : (!transform.any_op) -> !transform.any_op
      transform.include @lower failures(propagate) (%arg0) : (!transform.any_op) -> ()
      transform.yield 
    }
    transform.named_sequence @lower(%arg0: !transform.any_op {transform.consumed}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.canonicalization
        transform.apply_patterns.linalg.tiling_canonicalization
      } : !transform.any_op
      transform.apply_cse to %0 : !transform.any_op
      %1 = transform.structured.match interface{LoopLikeInterface} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_licm to %1 : !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.linalg.fold_unit_extent_dims_via_reshapes
      } : !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %2 {
        transform.apply_patterns.canonicalization
        transform.apply_patterns.tensor.fold_tensor_subset_ops_into_vector_transfers
      } : !transform.any_op
      transform.apply_cse to %2 : !transform.any_op
      %3 = transform.structured.hoist_redundant_vector_transfers %2 : (!transform.any_op) -> !transform.any_op
      %4 = transform.bufferization.one_shot_bufferize layout{IdentityLayoutMap} %arg0 {bufferize_function_boundaries = true} : (!transform.any_op) -> !transform.any_op
      %5 = transform.structured.match ops{["func.func"]} in %4 : (!transform.any_op) -> !transform.any_op
      %6 = transform.apply_registered_pass "buffer-deallocation-pipeline" to %5 : (!transform.any_op) -> !transform.any_op
      %7 = transform.structured.match ops{["func.func"]} in %4 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %7 {
        transform.apply_patterns.canonicalization
      } : !transform.any_op
      transform.apply_cse to %7 : !transform.any_op
      transform.apply_patterns to %7 {
        transform.apply_patterns.vector.lower_contraction lowering_strategy = parallelarith
        transform.apply_patterns.vector.lower_transfer
        transform.apply_patterns.vector.lower_transpose
        transform.apply_patterns.vector.lower_shape_cast
      } : !transform.any_op
      transform.apply_patterns to %7 {
        transform.apply_patterns.vector.transfer_to_scf
        transform.apply_patterns.memref.alloc_to_alloca
      } : !transform.any_op
      transform.bufferization.buffer_loop_hoisting %7 : !transform.any_op
      transform.apply_patterns to %7 {
        transform.apply_patterns.memref.fold_memref_alias_ops
        transform.apply_patterns.canonicalization
      } : !transform.any_op
      transform.apply_cse to %7 : !transform.any_op
      transform.yield 
    }
  }
}

