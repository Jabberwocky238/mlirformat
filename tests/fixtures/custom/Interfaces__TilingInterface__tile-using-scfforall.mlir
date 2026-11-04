module {
  func.func @simple_matmul(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_op, %loops = transform.test.tile_using_forall %0 [10, 20] mapping = [#gpu.block<y>, #gpu.block<x>] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @simple_matmul_memref(%arg0: memref<?x?xf32>, %arg1: memref<?x?xf32>, %arg2: memref<?x?xf32>) {
    linalg.matmul ins(%arg0, %arg1 : memref<?x?xf32>, memref<?x?xf32>) outs(%arg2 : memref<?x?xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_op, %loops = transform.test.tile_using_forall %0 [10, 20] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d2, d0, d1)>
module {
  func.func @multi_result(%arg0: tensor<128x200x300xf32>) -> (tensor<128x300x200xf32>, tensor<300x128x200xf32>) {
    %0 = tensor.empty() : tensor<128x300x200xf32>
    %1 = tensor.empty() : tensor<300x128x200xf32>
    %2:2 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0 : tensor<128x200x300xf32>) outs(%0, %1 : tensor<128x300x200xf32>, tensor<300x128x200xf32>) {
    ^bb0(%in: f32, %out: f32, %out_0: f32):
      linalg.yield %in, %in : f32, f32
    } -> (tensor<128x300x200xf32>, tensor<300x128x200xf32>)
    return %2#0, %2#1 : tensor<128x300x200xf32>, tensor<300x128x200xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_op, %loops = transform.test.tile_using_forall %0 [10, 0, 20] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @conv2D(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> {
    %0 = linalg.conv_2d_nhwc_hwcf {dilation = dense<[4, 5]> : tensor<2xi64>, strides = dense<[2, 3]> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) outs(%arg2 : tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    return %0 : tensor<?x?x?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.conv_2d_nhwc_hwcf"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_op, %loops = transform.test.tile_using_forall %0 [0, 0, 0, 0, 10, 20, 30] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @indexed_semantics(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0 : tensor<?x?xf32>) outs(%arg1 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = linalg.index 0 : index
      %2 = linalg.index 1 : index
      %3 = arith.addi %1, %2 : index
      %4 = arith.index_cast %3 : index to i64
      %5 = arith.uitofp %4 : i64 to f32
      %6 = arith.addf %5, %in : f32
      linalg.yield %6 : f32
    } -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_op, %loops = transform.test.tile_using_forall %0 [10, 20] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @interchange_matmul(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_op, %loops = transform.test.tile_using_forall %0 [10, 20] interchange = [1, 0] mapping = [#gpu.block<y>, #gpu.block<x>] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<() -> ()>
module {
  func.func @check_scalar_operation(%arg0: tensor<f32>) -> tensor<f32> {
    %0 = tensor.empty() : tensor<f32>
    %1 = linalg.generic {indexing_maps = [#map, #map], iterator_types = []} ins(%arg0 : tensor<f32>) outs(%0 : tensor<f32>) {
    ^bb0(%in: f32, %out: f32):
      %2 = arith.mulf %in, %in : f32
      linalg.yield %2 : f32
    } -> tensor<f32>
    return %1 : tensor<f32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_op = transform.test.tile_using_forall %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<() -> ()>
module {
  func.func @check_scalar_memref_operation(%arg0: memref<f32>, %arg1: memref<f32>) {
    linalg.generic {indexing_maps = [#map, #map], iterator_types = []} ins(%arg0 : memref<f32>) outs(%arg1 : memref<f32>) {
    ^bb0(%in: f32, %out: f32):
      %0 = arith.mulf %in, %in : f32
      linalg.yield %0 : f32
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_op = transform.test.tile_using_forall %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

