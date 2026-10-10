module {
  func.func @dynamic_pad_tensor_3_4(%arg0: tensor<?x?xf32>, %arg1: f32) -> tensor<?x?xf32> {
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
  func.func @dynamic_pad_tensor_0_3(%arg0: tensor<?x?xf32>, %arg1: f32) -> tensor<?x?xf32> {
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
  func.func @static_pad_tensor_3_4(%arg0: tensor<7x9xf32>, %arg1: f32) -> tensor<15x16xf32> {
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
  func.func @fuse_static_pad_tensor_3_4(%arg0: tensor<7x9xf32>, %arg1: f32) -> tensor<15x16xf32> {
    %padded = tensor.pad %arg0 low[3, 4] high[5, 3] {
    ^bb0(%arg2: index, %arg3: index):
      tensor.yield %arg1 : f32
    } : tensor<7x9xf32> to tensor<15x16xf32>
    %0 = tensor.empty() : tensor<15x16xf32>
    %1 = linalg.copy ins(%padded : tensor<15x16xf32>) outs(%0 : tensor<15x16xf32>) -> tensor<15x16xf32>
    return %1 : tensor<15x16xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.copy"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %transformed, %loops:2 = transform.structured.fuse %0 tile_sizes [2, 3] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @static_pad_tensor_0_3(%arg0: tensor<7x9xf32>, %arg1: f32) -> tensor<15x16xf32> {
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
  func.func @static_pad_tile_evenly_0_3(%arg0: tensor<7x9xf32>, %arg1: tensor<14x15xf32>, %arg2: f32) -> tensor<14x15xf32> {
    %padded = tensor.pad %arg0 low[0, 0] high[7, 6] {
    ^bb0(%arg3: index, %arg4: index):
      tensor.yield %arg2 : f32
    } : tensor<7x9xf32> to tensor<14x15xf32>
    return %padded : tensor<14x15xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.pad"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops = transform.structured.tile_using_for %0 tile_sizes [0, 3] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

