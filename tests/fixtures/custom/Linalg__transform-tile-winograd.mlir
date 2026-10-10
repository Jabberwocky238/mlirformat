module {
  func.func @tile_winograd_filter(%arg0: tensor<2x3x3x5xf32>, %arg1: tensor<6x6x5x2xf32>) -> tensor<6x6x5x2xf32> {
    %0 = linalg.winograd_filter_transform fmr(F_4_3) ins(%arg0 : tensor<2x3x3x5xf32>) outs(%arg1 : tensor<6x6x5x2xf32>) -> tensor<6x6x5x2xf32>
    return %0 : tensor<6x6x5x2xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.winograd_filter_transform"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:2 = transform.structured.tile_using_for %0 tile_sizes [1, 0, 0, 1] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @tile_winograd_filter(%arg0: tensor<2x3x3x5xf32>, %arg1: tensor<6x6x5x2xf32>) -> tensor<6x6x5x2xf32> {
    %0 = linalg.winograd_filter_transform fmr(F_4_3) ins(%arg0 : tensor<2x3x3x5xf32>) outs(%arg1 : tensor<6x6x5x2xf32>) -> tensor<6x6x5x2xf32>
    return %0 : tensor<6x6x5x2xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.winograd_filter_transform"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:2 = transform.structured.tile_using_for %0 tile_sizes [1, 0, 0, 2] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @tile_winograd_filter(%arg0: tensor<2x3x1x5xf32>, %arg1: tensor<6x1x5x2xf32>) -> tensor<6x1x5x2xf32> {
    %0 = linalg.winograd_filter_transform fmr(F_4_3) ins(%arg0 : tensor<2x3x1x5xf32>) outs(%arg1 : tensor<6x1x5x2xf32>) -> tensor<6x1x5x2xf32>
    return %0 : tensor<6x1x5x2xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.winograd_filter_transform"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:2 = transform.structured.tile_using_for %0 tile_sizes [1, 0, 0, 1] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @tile_winograd_input(%arg0: tensor<2x10x10x5xf32>, %arg1: tensor<6x6x2x2x2x5xf32>) -> tensor<6x6x2x2x2x5xf32> {
    %0 = linalg.winograd_input_transform fmr(F_4_3) ins(%arg0 : tensor<2x10x10x5xf32>) outs(%arg1 : tensor<6x6x2x2x2x5xf32>) -> tensor<6x6x2x2x2x5xf32>
    return %0 : tensor<6x6x2x2x2x5xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.winograd_input_transform"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:2 = transform.structured.tile_using_for %0 tile_sizes [0, 0, 1, 1, 0, 0] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @tile_winograd_input(%arg0: tensor<2x10x10x5xf32>, %arg1: tensor<6x6x2x2x2x5xf32>) -> tensor<6x6x2x2x2x5xf32> {
    %0 = linalg.winograd_input_transform fmr(F_4_3) ins(%arg0 : tensor<2x10x10x5xf32>) outs(%arg1 : tensor<6x6x2x2x2x5xf32>) -> tensor<6x6x2x2x2x5xf32>
    return %0 : tensor<6x6x2x2x2x5xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.winograd_input_transform"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:4 = transform.structured.tile_using_for %0 tile_sizes [0, 0, 1, 1, 1, 1] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @tile_winograd_input(%arg0: tensor<2x10x10x5xf32>, %arg1: tensor<6x6x2x2x2x5xf32>) -> tensor<6x6x2x2x2x5xf32> {
    %0 = linalg.winograd_input_transform fmr(F_4_3) ins(%arg0 : tensor<2x10x10x5xf32>) outs(%arg1 : tensor<6x6x2x2x2x5xf32>) -> tensor<6x6x2x2x2x5xf32>
    return %0 : tensor<6x6x2x2x2x5xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.winograd_input_transform"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:4 = transform.structured.tile_using_for %0 tile_sizes [0, 0, 2, 2, 2, 2] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @tile_winograd_input(%arg0: tensor<2x1x10x5xf32>, %arg1: tensor<1x6x1x2x2x5xf32>) -> tensor<1x6x1x2x2x5xf32> {
    %0 = linalg.winograd_input_transform fmr(F_4_3) ins(%arg0 : tensor<2x1x10x5xf32>) outs(%arg1 : tensor<1x6x1x2x2x5xf32>) -> tensor<1x6x1x2x2x5xf32>
    return %0 : tensor<1x6x1x2x2x5xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.winograd_input_transform"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:4 = transform.structured.tile_using_for %0 tile_sizes [0, 0, 1, 1, 1, 1] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @tile_winograd_output(%arg0: tensor<6x6x2x2x2x2xf32>, %arg1: tensor<2x8x8x2xf32>) -> tensor<2x8x8x2xf32> {
    %0 = linalg.winograd_output_transform fmr(F_4_3) ins(%arg0 : tensor<6x6x2x2x2x2xf32>) outs(%arg1 : tensor<2x8x8x2xf32>) -> tensor<2x8x8x2xf32>
    return %0 : tensor<2x8x8x2xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.winograd_output_transform"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:2 = transform.structured.tile_using_for %0 tile_sizes [0, 0, 1, 1, 0, 0] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @tile_winograd_output(%arg0: tensor<6x6x2x2x3x5xf32>, %arg1: tensor<3x8x8x5xf32>) -> tensor<3x8x8x5xf32> {
    %0 = linalg.winograd_output_transform fmr(F_4_3) ins(%arg0 : tensor<6x6x2x2x3x5xf32>) outs(%arg1 : tensor<3x8x8x5xf32>) -> tensor<3x8x8x5xf32>
    return %0 : tensor<3x8x8x5xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.winograd_output_transform"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:4 = transform.structured.tile_using_for %0 tile_sizes [0, 0, 2, 2, 2, 2] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @tile_winograd_output(%arg0: tensor<6x1x2x1x3x5xf32>, %arg1: tensor<3x8x1x5xf32>) -> tensor<3x8x1x5xf32> {
    %0 = linalg.winograd_output_transform fmr(F_4_3) ins(%arg0 : tensor<6x1x2x1x3x5xf32>) outs(%arg1 : tensor<3x8x1x5xf32>) -> tensor<3x8x1x5xf32>
    return %0 : tensor<3x8x1x5xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.winograd_output_transform"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:4 = transform.structured.tile_using_for %0 tile_sizes [0, 0, 1, 1, 1, 1] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

