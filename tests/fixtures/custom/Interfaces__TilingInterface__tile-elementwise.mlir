module {
  func.func @tile_elementwise(%arg0: tensor<128x256xf32>, %arg1: tensor<128x256xf32>, %arg2: tensor<128x256xf32>) -> tensor<128x256xf32> {
    %0 = linalg.elementwise kind=#linalg.elementwise_kind<add> ins(%arg0, %arg1 : tensor<128x256xf32>, tensor<128x256xf32>) outs(%arg2 : tensor<128x256xf32>) -> tensor<128x256xf32>
    return %0 : tensor<128x256xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.elementwise"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:2 = transform.structured.tile_using_for %0 tile_sizes [32, 64] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @tile_elementwise_dynamic(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.elementwise kind=#linalg.elementwise_kind<add> ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.elementwise"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:2 = transform.structured.tile_using_for %0 tile_sizes [10, 20] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @tile_elementwise_memref(%arg0: memref<128x256xf32>, %arg1: memref<128x256xf32>) {
    linalg.elementwise kind=#linalg.elementwise_kind<negf> ins(%arg0 : memref<128x256xf32>) outs(%arg1 : memref<128x256xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.elementwise"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:2 = transform.structured.tile_using_for %0 tile_sizes [32, 64] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @tile_elementwise_forall(%arg0: tensor<128x256xf32>, %arg1: tensor<128x256xf32>, %arg2: tensor<128x256xf32>) -> tensor<128x256xf32> {
    %0 = linalg.elementwise kind=#linalg.elementwise_kind<add> ins(%arg0, %arg1 : tensor<128x256xf32>, tensor<128x256xf32>) outs(%arg2 : tensor<128x256xf32>) -> tensor<128x256xf32>
    return %0 : tensor<128x256xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.elementwise"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_op, %forall_op = transform.structured.tile_using_forall %0 tile_sizes [32, 64] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @tile_elementwise_broadcast(%arg0: tensor<256xf32>, %arg1: tensor<128x256xf32>) -> tensor<128x256xf32> {
    %0 = linalg.elementwise kind=#linalg.elementwise_kind<exp> indexing_maps = [#map, #map1] ins(%arg0 : tensor<256xf32>) outs(%arg1 : tensor<128x256xf32>) -> tensor<128x256xf32>
    return %0 : tensor<128x256xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.elementwise"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:2 = transform.structured.tile_using_for %0 tile_sizes [32, 64] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @tile_and_fuse_elementwise(%arg0: tensor<128x256xf32>, %arg1: tensor<128x256xf32>) -> tensor<128x256xf32> {
    %0 = tensor.empty() : tensor<128x256xf32>
    %1 = linalg.elementwise kind=#linalg.elementwise_kind<exp> ins(%arg0 : tensor<128x256xf32>) outs(%0 : tensor<128x256xf32>) -> tensor<128x256xf32>
    %2 = tensor.empty() : tensor<128x256xf32>
    %3 = linalg.elementwise kind=#linalg.elementwise_kind<add> ins(%1, %arg1 : tensor<128x256xf32>, tensor<128x256xf32>) outs(%2 : tensor<128x256xf32>) -> tensor<128x256xf32>
    return %3 : tensor<128x256xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.elementwise"]} attributes {kind = #linalg.elementwise_kind<add>} in %arg0 : (!transform.any_op) -> !transform.any_op
      %transformed, %loops:2 = transform.structured.fuse %0 tile_sizes [32, 64] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

