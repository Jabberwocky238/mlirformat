#map = affine_map<()[s0] -> (-s0 + 12, 7)>
module {
  func.func @static_sizes_output_divisible(%arg0: tensor<24x12xf32>, %arg1: tensor<12x25xf32>, %arg2: tensor<24x25xf32>, %arg3: index, %arg4: index, %arg5: index) -> tensor<24x25xf32> {
    %0 = affine.min #map()[%arg5]
    %extracted_slice = tensor.extract_slice %arg0[%arg3, %arg5] [4, %0] [1, 1] : tensor<24x12xf32> to tensor<4x?xf32>
    %extracted_slice_0 = tensor.extract_slice %arg1[%arg5, %arg4] [%0, 5] [1, 1] : tensor<12x25xf32> to tensor<?x5xf32>
    %extracted_slice_1 = tensor.extract_slice %arg2[%arg3, %arg4] [4, 5] [1, 1] : tensor<24x25xf32> to tensor<4x5xf32>
    %1 = linalg.matmul ins(%extracted_slice, %extracted_slice_0 : tensor<4x?xf32>, tensor<?x5xf32>) outs(%extracted_slice_1 : tensor<4x5xf32>) -> tensor<4x5xf32>
    %inserted_slice = tensor.insert_slice %1 into %arg2[%arg3, %arg4] [4, 5] [1, 1] : tensor<4x5xf32> into tensor<24x25xf32>
    return %inserted_slice : tensor<24x25xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %padded, %pad, %copy = transform.structured.pad %0 {nofold_flags = [1, 1, 0], padding_dimensions = [0, 1, 2], padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32]} : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.op<"bufferization.materialize_in_destination">)
      %1 = transform.num_associations %copy : (!transform.op<"bufferization.materialize_in_destination">) -> !transform.param<i64>
      transform.debug.emit_param_as_remark %1 : !transform.param<i64>
      transform.yield 
    }
  }
}

// -----
#map = affine_map<()[s0] -> (-s0 + 12, 7)>
module {
  func.func @pad_to_multiple(%arg0: tensor<24x12xf32>, %arg1: tensor<12x25xf32>, %arg2: tensor<24x25xf32>, %arg3: index, %arg4: index, %arg5: index) -> tensor<24x25xf32> {
    %0 = affine.min #map()[%arg5]
    %extracted_slice = tensor.extract_slice %arg0[%arg3, %arg5] [4, %0] [1, 1] : tensor<24x12xf32> to tensor<4x?xf32>
    %extracted_slice_0 = tensor.extract_slice %arg1[%arg5, %arg4] [%0, 5] [1, 1] : tensor<12x25xf32> to tensor<?x5xf32>
    %extracted_slice_1 = tensor.extract_slice %arg2[%arg3, %arg4] [4, 5] [1, 1] : tensor<24x25xf32> to tensor<4x5xf32>
    %1 = linalg.matmul ins(%extracted_slice, %extracted_slice_0 : tensor<4x?xf32>, tensor<?x5xf32>) outs(%extracted_slice_1 : tensor<4x5xf32>) -> tensor<4x5xf32>
    %inserted_slice = tensor.insert_slice %1 into %arg2[%arg3, %arg4] [4, 5] [1, 1] : tensor<4x5xf32> into tensor<24x25xf32>
    return %inserted_slice : tensor<24x25xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %padded, %pad, %copy = transform.structured.pad %0 pad_to_multiple_of [2, 2, 1] {nofold_flags = [1, 1, 0], padding_dimensions = [0, 1, 2], padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32]} : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<()[s0] -> (-s0 + 12, 7)>
module {
  func.func @parametrized_pad_to_multiple(%arg0: tensor<24x12xf32>, %arg1: tensor<12x25xf32>, %arg2: tensor<24x25xf32>, %arg3: index, %arg4: index, %arg5: index) -> tensor<24x25xf32> {
    %0 = affine.min #map()[%arg5]
    %extracted_slice = tensor.extract_slice %arg0[%arg3, %arg5] [4, %0] [1, 1] : tensor<24x12xf32> to tensor<4x?xf32>
    %extracted_slice_0 = tensor.extract_slice %arg1[%arg5, %arg4] [%0, 5] [1, 1] : tensor<12x25xf32> to tensor<?x5xf32>
    %extracted_slice_1 = tensor.extract_slice %arg2[%arg3, %arg4] [4, 5] [1, 1] : tensor<24x25xf32> to tensor<4x5xf32>
    %1 = linalg.matmul ins(%extracted_slice, %extracted_slice_0 : tensor<4x?xf32>, tensor<?x5xf32>) outs(%extracted_slice_1 : tensor<4x5xf32>) -> tensor<4x5xf32>
    %inserted_slice = tensor.insert_slice %1 into %arg2[%arg3, %arg4] [4, 5] [1, 1] : tensor<4x5xf32> into tensor<24x25xf32>
    return %inserted_slice : tensor<24x25xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.param.constant 2 : i64 -> !transform.param<i64>
      %padded, %pad, %copy = transform.structured.pad %0 pad_to_multiple_of [%1, 2, 1] {nofold_flags = [1, 1, 0], padding_dimensions = [0, 1, 2], padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32]} : (!transform.any_op, !transform.param<i64>) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<()[s0] -> (-s0 + 12, 7)>
module {
  func.func @static_sizes_output_divisible_on_empty_op(%arg0: tensor<24x12xf32>, %arg1: tensor<12x25xf32>, %arg2: tensor<24x25xf32>, %arg3: index, %arg4: index, %arg5: index) -> tensor<24x25xf32> {
    %0 = affine.min #map()[%arg5]
    %1 = tensor.empty(%0) : tensor<4x?xf32>
    %2 = tensor.empty(%0) : tensor<?x5xf32>
    %3 = tensor.empty() : tensor<4x5xf32>
    %4 = linalg.matmul ins(%1, %2 : tensor<4x?xf32>, tensor<?x5xf32>) outs(%3 : tensor<4x5xf32>) -> tensor<4x5xf32>
    %inserted_slice = tensor.insert_slice %4 into %arg2[%arg3, %arg4] [4, 5] [1, 1] : tensor<4x5xf32> into tensor<24x25xf32>
    return %inserted_slice : tensor<24x25xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %padded, %pad, %copy = transform.structured.pad %0 {nofold_flags = [1, 1, 0], padding_dimensions = [0, 1, 2], padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32]} : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pad(%arg0: tensor<24x12xf32>, %arg1: tensor<12x25xf32>, %arg2: tensor<24x25xf32>) -> tensor<24x25xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<24x12xf32>, tensor<12x25xf32>) outs(%arg2 : tensor<24x25xf32>) -> tensor<24x25xf32>
    return %0 : tensor<24x25xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %padded, %pad, %copy = transform.structured.pad %0 {nofold_flags = [1, 1, 0], padding_dimensions = [0, 1, 2], padding_values = [0 : i32, 0.000000e+00 : f32, 0.000000e+00 : f32]} : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pad(%arg0: tensor<24x12xf32>, %arg1: tensor<12x25xf32>, %arg2: tensor<24x25xf32>) -> tensor<24x25xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<24x12xf32>, tensor<12x25xf32>) outs(%arg2 : tensor<24x25xf32>) -> tensor<24x25xf32>
    return %0 : tensor<24x25xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %padded, %pad, %copy = transform.structured.pad %0 {nofold_flags = [1, 1, 0], padding_dimensions = [0, 1, 2], padding_values = ["{foo}", 0.000000e+00 : f32, 0.000000e+00 : f32]} : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @zero_pad_static(%arg0: tensor<24x12xf32>, %arg1: tensor<12x25xf32>, %arg2: tensor<24x25xf32>) -> tensor<24x25xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<24x12xf32>, tensor<12x25xf32>) outs(%arg2 : tensor<24x25xf32>) -> tensor<24x25xf32>
    return %0 : tensor<24x25xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %padded, %pad, %copy = transform.structured.pad %0 {nofold_flags = [1, 1, 0], padding_dimensions = [0, 1, 2], padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32]} : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @zero_pad_dynamic(%arg0: tensor<?x12xf32>, %arg1: tensor<12x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<?x12xf32>, tensor<12x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %padded, %pad, %copy = transform.structured.pad %0 {nofold_flags = [1, 1, 1], padding_dimensions = [2], padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32]} : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @negative_no_ub_estimate(%arg0: tensor<?x12xf32>, %arg1: tensor<12x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<?x12xf32>, tensor<12x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %padded, %pad, %copy = transform.structured.pad %0 {nofold_flags = [1, 1, 1], padding_dimensions = [1], padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32]} : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @use_prescribed_tensor_shapes(%arg0: tensor<?x12xf32>, %arg1: tensor<12x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<?x12xf32>, tensor<12x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %padded, %pad, %copy = transform.structured.pad %0 pad_to_multiple_of [7] use_prescribed_tensor_shapes {padding_dimensions = [1], padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32]} : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %1 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %1 {
        transform.apply_patterns.canonicalization
      } {apply_cse} : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0) -> (-d0 + 2044, 16)>
module {
  func.func @outs_not_produced_by_empty_or_extract_slice(%arg0: tensor<128x2044xf32>, %arg1: tensor<2044x128xf32>) -> tensor<128x128xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<128x128xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<128x128xf32>) -> tensor<128x128xf32>
    %c0 = arith.constant 0 : index
    %c16 = arith.constant 16 : index
    %c2044 = arith.constant 2044 : index
    %2 = scf.for %arg2 = %c0 to %c2044 step %c16 iter_args(%arg3 = %1) -> (tensor<128x128xf32>) {
      %3 = affine.min #map(%arg2)
      %extracted_slice = tensor.extract_slice %arg0[0, %arg2] [128, %3] [1, 1] : tensor<128x2044xf32> to tensor<128x?xf32>
      %extracted_slice_0 = tensor.extract_slice %arg1[%arg2, 0] [%3, 128] [1, 1] : tensor<2044x128xf32> to tensor<?x128xf32>
      %4 = linalg.matmul ins(%extracted_slice, %extracted_slice_0 : tensor<128x?xf32>, tensor<?x128xf32>) outs(%arg3 : tensor<128x128xf32>) -> tensor<128x128xf32>
      scf.yield %4 : tensor<128x128xf32>
    }
    return %2 : tensor<128x128xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %padded, %pad, %copy = transform.structured.pad %0 {nofold_flags = [1, 1, 1], padding_dimensions = [0, 1, 2], padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32]} : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<()[s0] -> (-s0 + 12, 7)>
module {
  func.func @pack_everything(%arg0: tensor<24x12xf32>, %arg1: tensor<12x25xf32>, %arg2: tensor<24x25xf32>, %arg3: index, %arg4: index, %arg5: index) -> tensor<24x25xf32> {
    %0 = affine.min #map()[%arg5]
    %extracted_slice = tensor.extract_slice %arg0[%arg3, %arg5] [4, %0] [1, 1] : tensor<24x12xf32> to tensor<4x?xf32>
    %extracted_slice_0 = tensor.extract_slice %arg1[%arg5, %arg4] [%0, 5] [1, 1] : tensor<12x25xf32> to tensor<?x5xf32>
    %extracted_slice_1 = tensor.extract_slice %arg2[%arg3, %arg4] [4, 5] [1, 1] : tensor<24x25xf32> to tensor<4x5xf32>
    %1 = linalg.matmul ins(%extracted_slice, %extracted_slice_0 : tensor<4x?xf32>, tensor<?x5xf32>) outs(%extracted_slice_1 : tensor<4x5xf32>) -> tensor<4x5xf32>
    %inserted_slice = tensor.insert_slice %1 into %arg2[%arg3, %arg4] [4, 5] [1, 1] : tensor<4x5xf32> into tensor<24x25xf32>
    return %inserted_slice : tensor<24x25xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %padded, %pad, %copy = transform.structured.pad %0 {nofold_flags = [1, 1, 1], padding_dimensions = [0, 1, 2], padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32]} : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @dyn_pad_tiling(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %padded, %pad, %copy = transform.structured.pad %0 pad_to_multiple_of [32] use_prescribed_tensor_shapes {padding_dimensions = [2], padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32]} : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %tiled_linalg_op, %loops = transform.structured.tile_using_for %padded tile_sizes [0, 0, 32] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %1 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %2 = transform.apply_registered_pass "resolve-shaped-type-result-dims" to %1 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %2 {
        transform.apply_patterns.canonicalization
      } {apply_cse} : !transform.any_op
      %3 = transform.structured.match ops{["affine.min", "affine.max"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.affine.simplify_min_max_affine_ops %3 : !transform.any_op
      transform.apply_patterns to %2 {
        transform.apply_patterns.canonicalization
      } {apply_cse} : !transform.any_op
      transform.yield 
    }
  }
}

