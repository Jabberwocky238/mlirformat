module {
  func.func @pad_and_hoist_rhs(%arg0: tensor<24x12xf32>, %arg1: tensor<12x25xf32>, %arg2: tensor<24x25xf32>) -> tensor<24x25xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<24x12xf32>, tensor<12x25xf32>) outs(%arg2 : tensor<24x25xf32>) -> tensor<24x25xf32>
    return %0 : tensor<24x25xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops = transform.structured.tile_using_for %0 tile_sizes [5] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %padded, %pad, %copy = transform.structured.pad %tiled_linalg_op {padding_dimensions = [0, 1, 2], padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32]} : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %1 = transform.get_producer_of_operand %padded[1] : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.hoist_pad.build_packing_loop_nest %1 above %loops : (!transform.any_op, !transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pad_and_hoist_init(%arg0: tensor<24x12xf32>, %arg1: tensor<12x25xf32>, %arg2: tensor<24x25xf32>) -> tensor<24x25xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<24x12xf32>, tensor<12x25xf32>) outs(%arg2 : tensor<24x25xf32>) -> tensor<24x25xf32>
    return %0 : tensor<24x25xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops = transform.structured.tile_using_for %0 tile_sizes [5] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %padded, %pad, %copy = transform.structured.pad %tiled_linalg_op {padding_dimensions = [0, 1, 2], padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32]} : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %1 = transform.get_producer_of_operand %padded[2] : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.hoist_pad.build_packing_loop_nest %1 above %loops : (!transform.any_op, !transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pad_and_hoist_lhs(%arg0: tensor<24x12xf32>, %arg1: tensor<12x25xf32>, %arg2: tensor<24x25xf32>) -> tensor<24x25xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<24x12xf32>, tensor<12x25xf32>) outs(%arg2 : tensor<24x25xf32>) -> tensor<24x25xf32>
    return %0 : tensor<24x25xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops = transform.structured.tile_using_for %0 tile_sizes [5] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %padded, %pad, %copy = transform.structured.pad %tiled_linalg_op {padding_dimensions = [0, 1, 2], padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32]} : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %1 = transform.get_producer_of_operand %padded[0] : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.hoist_pad.build_packing_loop_nest %1 above %loops : (!transform.any_op, !transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pad_and_hoist_lhs_transpose(%arg0: tensor<24x12xf32>, %arg1: tensor<12x25xf32>, %arg2: tensor<24x25xf32>) -> tensor<24x25xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<24x12xf32>, tensor<12x25xf32>) outs(%arg2 : tensor<24x25xf32>) -> tensor<24x25xf32>
    return %0 : tensor<24x25xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops = transform.structured.tile_using_for %0 tile_sizes [5] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %padded, %pad, %copy = transform.structured.pad %tiled_linalg_op {padding_dimensions = [0, 1, 2], padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32]} : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %1 = transform.get_producer_of_operand %padded[0] : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.hoist_pad.build_packing_loop_nest %1 above %loops, transpose by [1, 0] : (!transform.any_op, !transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pad_and_hoist_init(%arg0: tensor<24x12xf32>, %arg1: tensor<12x25xf32>, %arg2: tensor<24x25xf32>) -> tensor<24x25xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<24x12xf32>, tensor<12x25xf32>) outs(%arg2 : tensor<24x25xf32>) -> tensor<24x25xf32>
    return %0 : tensor<24x25xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:2 = transform.structured.tile_using_for %0 tile_sizes [5, 0, 7] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %padded, %pad, %copy = transform.structured.pad %tiled_linalg_op {padding_dimensions = [0, 1, 2], padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32]} : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %1 = transform.get_producer_of_operand %padded[2] : (!transform.any_op) -> !transform.any_op
      transform.apply_licm to %loops#1 : !transform.any_op
      %2 = transform.structured.hoist_pad.build_packing_loop_nest %1 above %loops#1 : (!transform.any_op, !transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

