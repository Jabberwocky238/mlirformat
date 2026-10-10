module {
  func.func @pad_lhs(%arg0: tensor<24x12xf32>, %arg1: tensor<12x25xf32>, %arg2: tensor<24x25xf32>) -> tensor<24x25xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<24x12xf32>, tensor<12x25xf32>) outs(%arg2 : tensor<24x25xf32>) -> tensor<24x25xf32>
    return %0 : tensor<24x25xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops = transform.structured.tile_using_for %0 tile_sizes [5] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %padded, %pad = transform.structured.pad_tiling_interface %tiled_linalg_op to padding_sizes [8] pad_to_multiple_of {padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32]} : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2, d0 + d1)>
module {
  func.func @generic(%arg0: tensor<7x5xf32>, %arg1: tensor<7x11x11xf32>) -> tensor<7x11x11xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0 : tensor<7x5xf32>) outs(%arg1 : tensor<7x11x11xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<7x11x11xf32>
    return %0 : tensor<7x11x11xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %padded, %pad = transform.structured.pad_tiling_interface %0 to padding_sizes [3, 0, 5] pad_to_multiple_of {padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32]} : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2, d0 + d1)>
module {
  func.func @generic(%arg0: tensor<?x5xf32>, %arg1: tensor<?x11x?xf32>) -> tensor<?x11x?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0 : tensor<?x5xf32>) outs(%arg1 : tensor<?x11x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<?x11x?xf32>
    return %0 : tensor<?x11x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %padded, %pad = transform.structured.pad_tiling_interface %0 to padding_sizes [3, 0, 5] pad_to_multiple_of {padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32]} : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pad_lhs(%arg0: tensor<24x?xf32>, %arg1: tensor<?x25xf32>, %arg2: tensor<24x25xf32>) -> tensor<24x25xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<24x?xf32>, tensor<?x25xf32>) outs(%arg2 : tensor<24x25xf32>) -> tensor<24x25xf32>
    return %0 : tensor<24x25xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %padded, %pad = transform.structured.pad_tiling_interface %0 to padding_sizes [8, 0, 16] pad_to_multiple_of {padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32]} : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %tiled_linalg_op, %loops:2 = transform.structured.tile_using_for %padded tile_sizes [8, 0, 16] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
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

// -----
module {
  func.func @pad_lhs(%arg0: tensor<24x?xf32>, %arg1: tensor<?x25xf32>, %arg2: tensor<24x25xf32>) -> tensor<24x25xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<24x?xf32>, tensor<?x25xf32>) outs(%arg2 : tensor<24x25xf32>) -> tensor<24x25xf32>
    return %0 : tensor<24x25xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:2 = transform.structured.tile_using_for %0 tile_sizes [8, 0, 16] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %padded, %pad = transform.structured.pad_tiling_interface %tiled_linalg_op to padding_sizes [8, 0, 16] pad_to_multiple_of {padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32]} : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pad_lhs(%arg0: tensor<20x?xf32>, %arg1: tensor<?x25xf32>, %arg2: tensor<20x25xf32>) -> tensor<20x25xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<20x?xf32>, tensor<?x25xf32>) outs(%arg2 : tensor<20x25xf32>) -> tensor<20x25xf32>
    return %0 : tensor<20x25xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:2 = transform.structured.tile_using_for %0 tile_sizes [8, 0, 16] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %padded, %pad = transform.structured.pad_tiling_interface %tiled_linalg_op to padding_sizes [8, 0, 16] pad_to_multiple_of {padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32]} : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pad_conv(%arg0: tensor<1x16x16x4xf32>, %arg1: tensor<16x3x3x4xf32>, %arg2: tensor<1x14x14x16xf32>) -> tensor<1x14x14x16xf32> {
    %0 = linalg.conv_2d_nhwc_fhwc {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<1x16x16x4xf32>, tensor<16x3x3x4xf32>) outs(%arg2 : tensor<1x14x14x16xf32>) -> tensor<1x14x14x16xf32>
    return %0 : tensor<1x14x14x16xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.conv_2d_nhwc_fhwc"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %padded, %pad = transform.structured.pad_tiling_interface %0 to padding_sizes [0, 0, 16, 0, 0, 0, 16] pad_to_multiple_of {padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32]} : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pad_conv_dynamic(%arg0: tensor<1x16x?x4xf32>, %arg1: tensor<16x3x3x4xf32>, %arg2: tensor<1x14x?x16xf32>) -> tensor<1x14x?x16xf32> {
    %0 = linalg.conv_2d_nhwc_fhwc {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<1x16x?x4xf32>, tensor<16x3x3x4xf32>) outs(%arg2 : tensor<1x14x?x16xf32>) -> tensor<1x14x?x16xf32>
    return %0 : tensor<1x14x?x16xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.conv_2d_nhwc_fhwc"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %padded, %pad = transform.structured.pad_tiling_interface %0 to padding_sizes [0, 0, 16, 0, 0, 0, 16] pad_to_multiple_of {padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32]} : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pad_conv_strided(%arg0: tensor<1x42x42x4xf32>, %arg1: tensor<16x3x3x4xf32>, %arg2: tensor<1x14x14x16xf32>) -> tensor<1x14x14x16xf32> {
    %0 = linalg.conv_2d_nhwc_fhwc {dilations = dense<1> : tensor<2xi64>, strides = dense<3> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<1x42x42x4xf32>, tensor<16x3x3x4xf32>) outs(%arg2 : tensor<1x14x14x16xf32>) -> tensor<1x14x14x16xf32>
    return %0 : tensor<1x14x14x16xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.conv_2d_nhwc_fhwc"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %padded, %pad = transform.structured.pad_tiling_interface %0 to padding_sizes [0, 0, 16, 0, 0, 0, 16] pad_to_multiple_of {padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32]} : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pad_conv_dilated(%arg0: tensor<1x18x18x4xf32>, %arg1: tensor<16x3x3x4xf32>, %arg2: tensor<1x14x14x16xf32>) -> tensor<1x14x14x16xf32> {
    %0 = linalg.conv_2d_nhwc_fhwc {dilations = dense<2> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<1x18x18x4xf32>, tensor<16x3x3x4xf32>) outs(%arg2 : tensor<1x14x14x16xf32>) -> tensor<1x14x14x16xf32>
    return %0 : tensor<1x14x14x16xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.conv_2d_nhwc_fhwc"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %padded, %pad = transform.structured.pad_tiling_interface %0 to padding_sizes [0, 0, 16, 0, 0, 0, 16] pad_to_multiple_of {padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32]} : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

