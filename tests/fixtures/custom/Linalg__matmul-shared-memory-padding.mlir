module {
  func.func @matmul_divisible(%arg0: tensor<1024x1024xf32>, %arg1: tensor<1024x1024xf32>, %arg2: tensor<1024x1024xf32>) -> tensor<1024x1024xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = linalg.fill ins(%cst : f32) outs(%arg2 : tensor<1024x1024xf32>) -> tensor<1024x1024xf32>
    %1 = linalg.matmul ins(%arg0, %arg1 : tensor<1024x1024xf32>, tensor<1024x1024xf32>) outs(%0 : tensor<1024x1024xf32>) -> tensor<1024x1024xf32>
    return %1 : tensor<1024x1024xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.consumed}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["linalg.fill"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_op, %forall_op = transform.structured.tile_using_forall %0 tile_sizes [128, 128](mapping = [#gpu.block<y>, #gpu.block<x>]) : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %fused_op, %new_containing_op = transform.structured.fuse_into_containing_op %1 into %forall_op : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      %tiled_linalg_op, %loops = transform.structured.tile_using_for %tiled_op tile_sizes [0, 0, 16] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %padded, %pad, %copy = transform.structured.pad %tiled_linalg_op {copy_back_op = "linalg.copy", nofold_flags = [1, 1, 1], padding_dimensions = [0, 1, 2], padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32]} : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %forall_op_0, %tiled_op_1 = transform.structured.gpu.map_copy_to_threads %pad total_num_threads = 32 desired_bit_alignment = 128 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.foreach %forall_op_0 : !transform.any_op {
      ^bb0(%arg1: !transform.any_op):
        %6 = transform.structured.match ops{["scf.if"]} in %arg1 : (!transform.any_op) -> !transform.any_op
        transform.scf.take_assumed_branch %6 take_else_branch : (!transform.any_op) -> ()
      }
      %forall_op_2, %tiled_op_3 = transform.structured.gpu.map_copy_to_threads %copy total_num_threads = 32 desired_bit_alignment = 128 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.structured.vectorize %tiled_op_1 vector_sizes [128, 4] : !transform.any_op
      %allocated_buffer, %new_ops = transform.structured.bufferize_to_allocation %forall_op_0 {bufferize_destination_only, emit_dealloc, memory_space = 3 : i64} : !transform.any_op
      %2 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.bufferization.eliminate_empty_tensors %2 : !transform.any_op
      transform.apply_dce to %2 : !transform.any_op
      transform.apply_cse to %2 : !transform.any_op
      %3 = transform.bufferization.one_shot_bufferize layout{IdentityLayoutMap} %arg0 {bufferize_function_boundaries = true} : (!transform.any_op) -> !transform.any_op
      %4 = transform.structured.match ops{["func.func"]} in %3 : (!transform.any_op) -> !transform.any_op
      %5 = transform.structured.match ops{["linalg.copy"]} in %4 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %5 vector_sizes [128, 4] : !transform.any_op
      transform.apply_patterns to %4 {
        transform.apply_patterns.canonicalization
        transform.apply_patterns.vector.lower_masked_transfers
      } {apply_cse} : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @matmul_not_divisible(%arg0: tensor<1023x1023xf32>, %arg1: tensor<1023x1023xf32>, %arg2: tensor<1023x1023xf32>) -> tensor<1023x1023xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = linalg.fill ins(%cst : f32) outs(%arg2 : tensor<1023x1023xf32>) -> tensor<1023x1023xf32>
    %1 = linalg.matmul ins(%arg0, %arg1 : tensor<1023x1023xf32>, tensor<1023x1023xf32>) outs(%0 : tensor<1023x1023xf32>) -> tensor<1023x1023xf32>
    return %1 : tensor<1023x1023xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.consumed}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["linalg.fill"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_op, %forall_op = transform.structured.tile_using_forall %0 tile_sizes [128, 128](mapping = [#gpu.block<y>, #gpu.block<x>]) : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %fused_op, %new_containing_op = transform.structured.fuse_into_containing_op %1 into %forall_op : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      %tiled_linalg_op, %loops = transform.structured.tile_using_for %tiled_op tile_sizes [0, 0, 16] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %padded, %pad, %copy = transform.structured.pad %tiled_linalg_op {copy_back_op = "linalg.copy", nofold_flags = [1, 1, 1], padding_dimensions = [0, 1, 2], padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32]} : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %forall_op_0, %tiled_op_1 = transform.structured.gpu.map_copy_to_threads %pad total_num_threads = 32 desired_bit_alignment = 128 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.foreach %forall_op_0 : !transform.any_op {
      ^bb0(%arg1: !transform.any_op):
        %6 = transform.structured.match ops{["scf.if"]} in %arg1 : (!transform.any_op) -> !transform.any_op
        transform.scf.take_assumed_branch %6 take_else_branch : (!transform.any_op) -> ()
      }
      transform.structured.vectorize %tiled_op_1 vector_sizes [128, 4] : !transform.any_op
      %allocated_buffer, %new_ops = transform.structured.bufferize_to_allocation %forall_op_0 {bufferize_destination_only, emit_dealloc, memory_space = 3 : i64} : !transform.any_op
      %2 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.bufferization.eliminate_empty_tensors %2 : !transform.any_op
      transform.apply_dce to %2 : !transform.any_op
      transform.apply_cse to %2 : !transform.any_op
      %3 = transform.bufferization.one_shot_bufferize layout{IdentityLayoutMap} %arg0 {bufferize_function_boundaries = true} : (!transform.any_op) -> !transform.any_op
      %4 = transform.structured.match ops{["func.func"]} in %3 : (!transform.any_op) -> !transform.any_op
      %5 = transform.structured.match ops{["linalg.copy"]} in %4 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %5 vector_sizes [128, 4] : !transform.any_op
      transform.apply_patterns to %4 {
        transform.apply_patterns.canonicalization
        transform.apply_patterns.vector.lower_masked_transfers
      } {apply_cse} : !transform.any_op
      transform.yield 
    }
  }
}

