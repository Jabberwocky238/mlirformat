module {
  func.func @conv2d(%arg0: tensor<2x10x10x5xf32>, %arg1: tensor<2x3x3x5xf32>, %arg2: tensor<2x8x8x2xf32>) -> tensor<2x8x8x2xf32> {
    %0 = tensor.empty() : tensor<6x6x5x2xf32>
    %1 = linalg.winograd_filter_transform fmr(F_4_3) ins(%arg1 : tensor<2x3x3x5xf32>) outs(%0 : tensor<6x6x5x2xf32>) -> tensor<6x6x5x2xf32>
    %2 = tensor.empty() : tensor<6x6x2x2x2x5xf32>
    %3 = linalg.winograd_input_transform fmr(F_4_3) ins(%arg0 : tensor<2x10x10x5xf32>) outs(%2 : tensor<6x6x2x2x2x5xf32>) -> tensor<6x6x2x2x2x5xf32>
    %collapsed = tensor.collapse_shape %1 [[0, 1], [2], [3]] : tensor<6x6x5x2xf32> into tensor<36x5x2xf32>
    %collapsed_0 = tensor.collapse_shape %3 [[0, 1], [2, 3, 4], [5]] : tensor<6x6x2x2x2x5xf32> into tensor<36x8x5xf32>
    %4 = tensor.empty() : tensor<36x8x2xf32>
    %5 = linalg.batch_matmul ins(%collapsed_0, %collapsed : tensor<36x8x5xf32>, tensor<36x5x2xf32>) outs(%4 : tensor<36x8x2xf32>) -> tensor<36x8x2xf32>
    %expanded = tensor.expand_shape %5 [[0, 1], [2, 3, 4], [5]] output_shape [6, 6, 2, 2, 2, 2] : tensor<36x8x2xf32> into tensor<6x6x2x2x2x2xf32>
    %6 = linalg.winograd_output_transform fmr(F_4_3) ins(%expanded : tensor<6x6x2x2x2x2xf32>) outs(%arg2 : tensor<2x8x8x2xf32>) -> tensor<2x8x8x2xf32>
    return %6 : tensor<2x8x8x2xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.winograd_filter_transform"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["linalg.winograd_input_transform"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:2 = transform.structured.tile_using_for %1 tile_sizes [0, 0, 1, 1, 0, 0] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %2 = transform.structured.match ops{["linalg.winograd_output_transform"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op_0, %loops_1:2 = transform.structured.tile_using_for %2 tile_sizes [0, 0, 1, 1, 0, 0] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %3 = transform.structured.decompose_winograd_op %0 : (!transform.any_op) -> !transform.any_op
      %4 = transform.structured.match ops{["linalg.winograd_input_transform"]} in %tiled_linalg_op : (!transform.any_op) -> !transform.any_op
      %5 = transform.structured.decompose_winograd_op %4 : (!transform.any_op) -> !transform.any_op
      %6 = transform.structured.match ops{["linalg.winograd_output_transform"]} in %tiled_linalg_op_0 : (!transform.any_op) -> !transform.any_op
      %7 = transform.structured.decompose_winograd_op %6 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @conv2d_unaligned(%arg0: tensor<2x11x11x5xf32>, %arg1: tensor<2x3x3x5xf32>, %arg2: tensor<2x9x9x2xf32>) -> tensor<2x9x9x2xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<6x6x5x2xf32>
    %1 = linalg.winograd_filter_transform fmr(F_4_3) ins(%arg1 : tensor<2x3x3x5xf32>) outs(%0 : tensor<6x6x5x2xf32>) -> tensor<6x6x5x2xf32>
    %padded = tensor.pad %arg0 low[0, 0, 0, 0] high[0, 3, 3, 0] {
    ^bb0(%arg3: index, %arg4: index, %arg5: index, %arg6: index):
      tensor.yield %cst : f32
    } : tensor<2x11x11x5xf32> to tensor<2x14x14x5xf32>
    %2 = tensor.empty() : tensor<6x6x3x3x2x5xf32>
    %3 = linalg.winograd_input_transform fmr(F_4_3) ins(%padded : tensor<2x14x14x5xf32>) outs(%2 : tensor<6x6x3x3x2x5xf32>) -> tensor<6x6x3x3x2x5xf32>
    %collapsed = tensor.collapse_shape %1 [[0, 1], [2], [3]] : tensor<6x6x5x2xf32> into tensor<36x5x2xf32>
    %collapsed_0 = tensor.collapse_shape %3 [[0, 1], [2, 3, 4], [5]] : tensor<6x6x3x3x2x5xf32> into tensor<36x18x5xf32>
    %4 = tensor.empty() : tensor<36x18x2xf32>
    %5 = linalg.fill ins(%cst : f32) outs(%4 : tensor<36x18x2xf32>) -> tensor<36x18x2xf32>
    %6 = linalg.batch_matmul ins(%collapsed_0, %collapsed : tensor<36x18x5xf32>, tensor<36x5x2xf32>) outs(%5 : tensor<36x18x2xf32>) -> tensor<36x18x2xf32>
    %expanded = tensor.expand_shape %6 [[0, 1], [2, 3, 4], [5]] output_shape [6, 6, 3, 3, 2, 2] : tensor<36x18x2xf32> into tensor<6x6x3x3x2x2xf32>
    %padded_1 = tensor.pad %arg2 low[0, 0, 0, 0] high[0, 3, 3, 0] {
    ^bb0(%arg3: index, %arg4: index, %arg5: index, %arg6: index):
      tensor.yield %cst : f32
    } : tensor<2x9x9x2xf32> to tensor<2x12x12x2xf32>
    %7 = linalg.winograd_output_transform fmr(F_4_3) ins(%expanded : tensor<6x6x3x3x2x2xf32>) outs(%padded_1 : tensor<2x12x12x2xf32>) -> tensor<2x12x12x2xf32>
    %extracted_slice = tensor.extract_slice %7[0, 0, 0, 0] [2, 9, 9, 2] [1, 1, 1, 1] : tensor<2x12x12x2xf32> to tensor<2x9x9x2xf32>
    return %extracted_slice : tensor<2x9x9x2xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.winograd_filter_transform"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["linalg.winograd_input_transform"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:2 = transform.structured.tile_using_for %1 tile_sizes [0, 0, 1, 1, 0, 0] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %2 = transform.structured.match ops{["linalg.winograd_output_transform"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op_0, %loops_1:2 = transform.structured.tile_using_for %2 tile_sizes [0, 0, 1, 1, 0, 0] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %3 = transform.structured.decompose_winograd_op %0 : (!transform.any_op) -> !transform.any_op
      %4 = transform.structured.match ops{["linalg.winograd_input_transform"]} in %tiled_linalg_op : (!transform.any_op) -> !transform.any_op
      %5 = transform.structured.decompose_winograd_op %4 : (!transform.any_op) -> !transform.any_op
      %6 = transform.structured.match ops{["linalg.winograd_output_transform"]} in %tiled_linalg_op_0 : (!transform.any_op) -> !transform.any_op
      %7 = transform.structured.decompose_winograd_op %6 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @conv2d_mx1_rx1(%arg0: tensor<2x6x1x5xf32>, %arg1: tensor<2x3x1x5xf32>, %arg2: tensor<2x4x1x2xf32>) -> tensor<2x4x1x2xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<6x1x5x2xf32>
    %1 = linalg.winograd_filter_transform fmr(F_4_3) ins(%arg1 : tensor<2x3x1x5xf32>) outs(%0 : tensor<6x1x5x2xf32>) -> tensor<6x1x5x2xf32>
    %2 = tensor.empty() : tensor<6x1x1x1x2x5xf32>
    %3 = linalg.winograd_input_transform fmr(F_4_3) ins(%arg0 : tensor<2x6x1x5xf32>) outs(%2 : tensor<6x1x1x1x2x5xf32>) -> tensor<6x1x1x1x2x5xf32>
    %collapsed = tensor.collapse_shape %1 [[0, 1], [2], [3]] : tensor<6x1x5x2xf32> into tensor<6x5x2xf32>
    %collapsed_0 = tensor.collapse_shape %3 [[0, 1], [2, 3, 4], [5]] : tensor<6x1x1x1x2x5xf32> into tensor<6x2x5xf32>
    %4 = tensor.empty() : tensor<6x2x2xf32>
    %5 = linalg.fill ins(%cst : f32) outs(%4 : tensor<6x2x2xf32>) -> tensor<6x2x2xf32>
    %6 = linalg.batch_matmul ins(%collapsed_0, %collapsed : tensor<6x2x5xf32>, tensor<6x5x2xf32>) outs(%5 : tensor<6x2x2xf32>) -> tensor<6x2x2xf32>
    %expanded = tensor.expand_shape %6 [[0, 1], [2, 3, 4], [5]] output_shape [6, 1, 1, 1, 2, 2] : tensor<6x2x2xf32> into tensor<6x1x1x1x2x2xf32>
    %7 = linalg.winograd_output_transform fmr(F_4_3) ins(%expanded : tensor<6x1x1x1x2x2xf32>) outs(%arg2 : tensor<2x4x1x2xf32>) -> tensor<2x4x1x2xf32>
    return %7 : tensor<2x4x1x2xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.winograd_filter_transform"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["linalg.winograd_input_transform"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:2 = transform.structured.tile_using_for %1 tile_sizes [0, 0, 1, 1, 0, 0] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %2 = transform.structured.match ops{["linalg.winograd_output_transform"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op_0, %loops_1:2 = transform.structured.tile_using_for %2 tile_sizes [0, 0, 1, 1, 0, 0] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %3 = transform.structured.decompose_winograd_op %0 : (!transform.any_op) -> !transform.any_op
      %4 = transform.structured.match ops{["linalg.winograd_input_transform"]} in %tiled_linalg_op : (!transform.any_op) -> !transform.any_op
      %5 = transform.structured.decompose_winograd_op %4 : (!transform.any_op) -> !transform.any_op
      %6 = transform.structured.match ops{["linalg.winograd_output_transform"]} in %tiled_linalg_op_0 : (!transform.any_op) -> !transform.any_op
      %7 = transform.structured.decompose_winograd_op %6 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @conv2d_mx1_rx1_2(%arg0: tensor<2x6x2x5xf32>, %arg1: tensor<2x3x1x5xf32>, %arg2: tensor<2x4x2x2xf32>) -> tensor<2x4x2x2xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<6x1x5x2xf32>
    %1 = linalg.winograd_filter_transform fmr(F_4_3) ins(%arg1 : tensor<2x3x1x5xf32>) outs(%0 : tensor<6x1x5x2xf32>) -> tensor<6x1x5x2xf32>
    %2 = tensor.empty() : tensor<6x1x1x2x2x5xf32>
    %3 = linalg.winograd_input_transform fmr(F_4_3) ins(%arg0 : tensor<2x6x2x5xf32>) outs(%2 : tensor<6x1x1x2x2x5xf32>) -> tensor<6x1x1x2x2x5xf32>
    %collapsed = tensor.collapse_shape %1 [[0, 1], [2], [3]] : tensor<6x1x5x2xf32> into tensor<6x5x2xf32>
    %collapsed_0 = tensor.collapse_shape %3 [[0, 1], [2, 3, 4], [5]] : tensor<6x1x1x2x2x5xf32> into tensor<6x4x5xf32>
    %4 = tensor.empty() : tensor<6x4x2xf32>
    %5 = linalg.fill ins(%cst : f32) outs(%4 : tensor<6x4x2xf32>) -> tensor<6x4x2xf32>
    %6 = linalg.batch_matmul ins(%collapsed_0, %collapsed : tensor<6x4x5xf32>, tensor<6x5x2xf32>) outs(%5 : tensor<6x4x2xf32>) -> tensor<6x4x2xf32>
    %expanded = tensor.expand_shape %6 [[0, 1], [2, 3, 4], [5]] output_shape [6, 1, 1, 2, 2, 2] : tensor<6x4x2xf32> into tensor<6x1x1x2x2x2xf32>
    %7 = linalg.winograd_output_transform fmr(F_4_3) ins(%expanded : tensor<6x1x1x2x2x2xf32>) outs(%arg2 : tensor<2x4x2x2xf32>) -> tensor<2x4x2x2xf32>
    return %7 : tensor<2x4x2x2xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.winograd_filter_transform"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["linalg.winograd_input_transform"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:2 = transform.structured.tile_using_for %1 tile_sizes [0, 0, 1, 1, 0, 0] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %2 = transform.structured.match ops{["linalg.winograd_output_transform"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op_0, %loops_1:2 = transform.structured.tile_using_for %2 tile_sizes [0, 0, 1, 1, 0, 0] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %3 = transform.structured.decompose_winograd_op %0 : (!transform.any_op) -> !transform.any_op
      %4 = transform.structured.match ops{["linalg.winograd_input_transform"]} in %tiled_linalg_op : (!transform.any_op) -> !transform.any_op
      %5 = transform.structured.decompose_winograd_op %4 : (!transform.any_op) -> !transform.any_op
      %6 = transform.structured.match ops{["linalg.winograd_output_transform"]} in %tiled_linalg_op_0 : (!transform.any_op) -> !transform.any_op
      %7 = transform.structured.decompose_winograd_op %6 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

