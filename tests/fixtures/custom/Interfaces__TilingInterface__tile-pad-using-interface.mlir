module {
  func.func @dynamic_2d_pad_tensor(%arg0: tensor<?x?xf32>, %arg1: f32) -> tensor<?x?xf32> {
    %padded = tensor.pad %arg0 low[3, 4] high[5, 3] {
    ^bb0(%arg2: index, %arg3: index):
      tensor.yield %arg1 : f32
    } : tensor<?x?xf32> to tensor<?x?xf32>
    return %padded : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.pad"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:2 = transform.structured.tile_using_for %0 tile_sizes [2, 3] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @dynamic_2d_pad_tensor_inner_tiling(%arg0: tensor<?x?xf32>, %arg1: f32) -> tensor<?x?xf32> {
    %padded = tensor.pad %arg0 low[3, 4] high[5, 3] {
    ^bb0(%arg2: index, %arg3: index):
      tensor.yield %arg1 : f32
    } : tensor<?x?xf32> to tensor<?x?xf32>
    return %padded : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.pad"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops = transform.structured.tile_using_for %0 tile_sizes [0, 3] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @static_pad_tensor(%arg0: tensor<7x9xf32>, %arg1: f32) -> tensor<15x16xf32> {
    %padded = tensor.pad %arg0 low[3, 4] high[5, 3] {
    ^bb0(%arg2: index, %arg3: index):
      tensor.yield %arg1 : f32
    } : tensor<7x9xf32> to tensor<15x16xf32>
    return %padded : tensor<15x16xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.pad"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:2 = transform.structured.tile_using_for %0 tile_sizes [2, 3] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @static_pad_tensor_inner_tiling(%arg0: tensor<7x9xf32>, %arg1: f32) -> tensor<15x16xf32> {
    %padded = tensor.pad %arg0 low[3, 4] high[5, 3] {
    ^bb0(%arg2: index, %arg3: index):
      tensor.yield %arg1 : f32
    } : tensor<7x9xf32> to tensor<15x16xf32>
    return %padded : tensor<15x16xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.pad"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops = transform.structured.tile_using_for %0 tile_sizes [0, 3] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @dynamic_2d_pad_tensor_outer_tiling(%arg0: tensor<?x?xf32>, %arg1: f32) -> tensor<?x?xf32> {
    %padded = tensor.pad %arg0 low[3, 4] high[5, 3] {
    ^bb0(%arg2: index, %arg3: index):
      tensor.yield %arg1 : f32
    } : tensor<?x?xf32> to tensor<?x?xf32>
    return %padded : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.pad"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:2 = transform.structured.tile_using_for %0 tile_sizes [2, 3] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @static_pad_tensor_outer_tiling(%arg0: tensor<7x9xf32>, %arg1: f32) -> tensor<15x16xf32> {
    %padded = tensor.pad %arg0 low[3, 4] high[5, 3] {
    ^bb0(%arg2: index, %arg3: index):
      tensor.yield %arg1 : f32
    } : tensor<7x9xf32> to tensor<15x16xf32>
    return %padded : tensor<15x16xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.pad"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops = transform.structured.tile_using_for %0 tile_sizes [0, 3] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

