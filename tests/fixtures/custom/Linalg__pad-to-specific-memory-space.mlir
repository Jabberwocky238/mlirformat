#map = affine_map<()[s0] -> (-s0 + 12, 7)>
module {
  func.func @pad_to_memory_space(%arg0: tensor<24x12xf32>, %arg1: tensor<12x25xf32>, %arg2: tensor<24x25xf32>, %arg3: index, %arg4: index, %arg5: index) -> tensor<24x25xf32> {
    %0 = affine.min #map()[%arg5]
    %extracted_slice = tensor.extract_slice %arg0[%arg3, %arg5] [4, %0] [1, 1] : tensor<24x12xf32> to tensor<4x?xf32>
    %extracted_slice_0 = tensor.extract_slice %arg1[%arg5, %arg4] [%0, 5] [1, 1] : tensor<12x25xf32> to tensor<?x5xf32>
    %extracted_slice_1 = tensor.extract_slice %arg2[%arg3, %arg4] [4, 5] [1, 1] : tensor<24x25xf32> to tensor<4x5xf32>
    %1 = linalg.matmul ins(%extracted_slice, %extracted_slice_0 : tensor<4x?xf32>, tensor<?x5xf32>) outs(%extracted_slice_1 : tensor<4x5xf32>) -> tensor<4x5xf32>
    %inserted_slice = tensor.insert_slice %1 into %arg2[%arg3, %arg4] [4, 5] [1, 1] : tensor<4x5xf32> into tensor<24x25xf32>
    return %inserted_slice : tensor<24x25xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.consumed}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %padded, %pad, %copy = transform.structured.pad %0 {nofold_flags = [1, 1, 1], padding_dimensions = [0, 1, 2], padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32]} : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %allocated_buffer, %new_ops = transform.structured.bufferize_to_allocation %pad {emit_dealloc, memory_space = 3 : i64} : !transform.any_op
      %1 = transform.bufferization.one_shot_bufferize %arg0 {bufferize_function_boundaries = true} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<()[s0] -> (-s0 + 12, 7)>
module {
  func.func @vectorize_and_bufferize_pad(%arg0: tensor<24x12xf32>, %arg1: tensor<12x25xf32>, %arg2: tensor<24x25xf32>, %arg3: index, %arg4: index, %arg5: index) -> tensor<24x25xf32> {
    %0 = affine.min #map()[%arg5]
    %extracted_slice = tensor.extract_slice %arg0[%arg3, %arg5] [4, %0] [1, 1] : tensor<24x12xf32> to tensor<4x?xf32>
    %extracted_slice_0 = tensor.extract_slice %arg1[%arg5, %arg4] [%0, 5] [1, 1] : tensor<12x25xf32> to tensor<?x5xf32>
    %extracted_slice_1 = tensor.extract_slice %arg2[%arg3, %arg4] [4, 5] [1, 1] : tensor<24x25xf32> to tensor<4x5xf32>
    %1 = linalg.matmul ins(%extracted_slice, %extracted_slice_0 : tensor<4x?xf32>, tensor<?x5xf32>) outs(%extracted_slice_1 : tensor<4x5xf32>) -> tensor<4x5xf32>
    %inserted_slice = tensor.insert_slice %1 into %arg2[%arg3, %arg4] [4, 5] [1, 1] : tensor<4x5xf32> into tensor<24x25xf32>
    return %inserted_slice : tensor<24x25xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.consumed}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %padded, %pad, %copy = transform.structured.pad %0 {nofold_flags = [1, 1, 1], padding_dimensions = [0, 1, 2], padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32]} : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.structured.vectorize %pad vector_sizes [10, 12] : !transform.any_op
      %1 = transform.structured.match ops{["vector.transfer_write"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %2 = transform.get_parent_op %1 {op_name = "vector.mask"} : (!transform.any_op) -> !transform.any_op
      %allocated_buffer, %new_ops = transform.structured.bufferize_to_allocation %2 {emit_dealloc, memory_space = 3 : i64} : !transform.any_op
      %3 = transform.bufferization.one_shot_bufferize %arg0 {bufferize_function_boundaries = true} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

