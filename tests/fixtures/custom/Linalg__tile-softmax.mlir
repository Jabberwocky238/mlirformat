module {
  func.func @softmax(%arg0: tensor<16x64x256xf32>) -> tensor<16x64x256xf32> {
    %0 = tensor.empty() : tensor<16x64x256xf32>
    %1 = linalg.softmax dimension(1) ins(%arg0 : tensor<16x64x256xf32>) outs(%0 : tensor<16x64x256xf32>) -> tensor<16x64x256xf32>
    return %1 : tensor<16x64x256xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.softmax"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:2 = transform.structured.tile_using_for %0 tile_sizes [2, 3] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
module {
  func.func @softmax_tile_n_fuse(%arg0: tensor<16x64x256xf32>) -> tensor<16x64x256xf32> {
    %0 = tensor.empty() : tensor<16x64x256xf32>
    %cst = arith.constant 1.000000e+00 : f32
    %1 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0 : tensor<16x64x256xf32>) outs(%0 : tensor<16x64x256xf32>) {
    ^bb0(%in: f32, %out: f32):
      %4 = arith.addf %out, %cst : f32
      linalg.yield %4 : f32
    } -> tensor<16x64x256xf32>
    %2 = tensor.empty() : tensor<16x64x256xf32>
    %3 = linalg.softmax dimension(1) ins(%1 : tensor<16x64x256xf32>) outs(%2 : tensor<16x64x256xf32>) -> tensor<16x64x256xf32>
    return %3 : tensor<16x64x256xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.softmax"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_op, %forall_op = transform.structured.tile_using_forall %0 num_threads [8, 16] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %1 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %fused_op, %new_containing_op = transform.structured.fuse_into_containing_op %1 into %forall_op : (!transform.any_op, !transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @softmax_memref(%arg0: memref<16x64x256xf32>, %arg1: memref<16x64x256xf32>) {
    linalg.softmax dimension(1) ins(%arg0 : memref<16x64x256xf32>) outs(%arg1 : memref<16x64x256xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.softmax"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:2 = transform.structured.tile_using_for %0 tile_sizes [2, 3] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

