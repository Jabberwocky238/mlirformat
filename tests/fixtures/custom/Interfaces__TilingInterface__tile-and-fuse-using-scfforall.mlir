module {
  func.func @gemm_fill_fusion(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 0.000000e+00 : f32
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %arg1, %c1 : tensor<?x?xf32>
    %0 = tensor.empty(%dim, %dim_0) : tensor<?x?xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %2 = linalg.matmul ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%1 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %2 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_ops, %loops = transform.test.fuse_using_forall %0 [10, 20] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
module {
  func.func @gemm_generic_fusion(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?xf32>) -> tensor<?x?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 0.000000e+00 : f32
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %arg1, %c1 : tensor<?x?xf32>
    %0 = tensor.empty(%dim, %dim_0) : tensor<?x?xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %2 = linalg.matmul ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%1 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %3 = linalg.generic {indexing_maps = [#map, #map1, #map], iterator_types = ["parallel", "parallel"]} ins(%2, %arg2 : tensor<?x?xf32>, tensor<?xf32>) outs(%0 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_1: f32, %out: f32):
      %4 = arith.addf %in, %in_1 : f32
      linalg.yield %4 : f32
    } -> tensor<?x?xf32>
    return %3 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_ops, %loops = transform.test.fuse_using_forall %0 [10, 20] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
module {
  func.func @reduction_sequence(%arg0: tensor<30x3xf32>) -> tensor<30x3xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 0xFF800000 : f32
    %0 = tensor.empty() : tensor<30xf32>
    %1 = linalg.fill ins(%cst_0 : f32) outs(%0 : tensor<30xf32>) -> tensor<30xf32>
    %2 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "reduction"]} ins(%arg0 : tensor<30x3xf32>) outs(%1 : tensor<30xf32>) {
    ^bb0(%in: f32, %out: f32):
      %7 = arith.maximumf %out, %in : f32
      linalg.yield %7 : f32
    } -> tensor<30xf32>
    %3 = tensor.empty() : tensor<30x3xf32>
    %4 = linalg.fill ins(%cst : f32) outs(%0 : tensor<30xf32>) -> tensor<30xf32>
    %5:2 = linalg.generic {indexing_maps = [#map, #map1, #map1, #map], iterator_types = ["parallel", "reduction"]} ins(%arg0, %2 : tensor<30x3xf32>, tensor<30xf32>) outs(%4, %3 : tensor<30xf32>, tensor<30x3xf32>) {
    ^bb0(%in: f32, %in_1: f32, %out: f32, %out_2: f32):
      %7 = arith.subf %in, %in_1 : f32
      %8 = math.exp %7 : f32
      %9 = arith.addf %out, %8 : f32
      linalg.yield %9, %8 : f32, f32
    } -> (tensor<30xf32>, tensor<30x3xf32>)
    %6 = linalg.generic {indexing_maps = [#map, #map1, #map], iterator_types = ["parallel", "parallel"]} ins(%5#1, %5#0 : tensor<30x3xf32>, tensor<30xf32>) outs(%3 : tensor<30x3xf32>) {
    ^bb0(%in: f32, %in_1: f32, %out: f32):
      %7 = arith.divf %in, %in_1 : f32
      linalg.yield %7 : f32
    } -> tensor<30x3xf32>
    return %6 : tensor<30x3xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1:3 = transform.split_handle %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %tiled_ops, %loops = transform.test.fuse_using_forall %1#2 [10] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

