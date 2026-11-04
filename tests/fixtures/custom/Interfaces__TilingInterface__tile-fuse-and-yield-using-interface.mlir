module {
  func.func @gemm_gemm_fusion_yield_both(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>, %arg3: tensor<?x?xf32>, %arg4: tensor<?x?xf32>) -> (tensor<?x?xf32>, tensor<?x?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 0.000000e+00 : f32
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %arg1, %c1 : tensor<?x?xf32>
    %0 = linalg.fill ins(%cst : f32) outs(%arg3 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %1 = linalg.matmul ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%0 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %dim_1 = tensor.dim %arg2, %c1 : tensor<?x?xf32>
    %2 = linalg.fill ins(%cst : f32) outs(%arg4 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %3 = linalg.matmul ins(%1, %arg2 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %1, %3 : tensor<?x?xf32>, tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1:2 = transform.split_handle %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %transfomed, %loops = transform.test.fuse_and_yield %1#1 [10] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
module {
  func.func @multiple_outputs_fusion_yield_all(%arg0: tensor<32x32xf32>, %arg1: tensor<32x32xf32>, %arg2: tensor<32x32xf32>, %arg3: tensor<32x32xf32>, %arg4: tensor<32x32xf32>, %arg5: tensor<32x32xf32>) -> (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) {
    %0:2 = linalg.generic {indexing_maps = [#map, #map, #map, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<32x32xf32>, tensor<32x32xf32>) outs(%arg2, %arg3 : tensor<32x32xf32>, tensor<32x32xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32, %out_1: f32):
      %2 = arith.mulf %in, %in_0 : f32
      %3 = arith.addf %in, %in_0 : f32
      linalg.yield %2, %3 : f32, f32
    } -> (tensor<32x32xf32>, tensor<32x32xf32>)
    %1 = linalg.add ins(%0#0, %arg4 : tensor<32x32xf32>, tensor<32x32xf32>) outs(%arg5 : tensor<32x32xf32>) -> tensor<32x32xf32>
    return %0#0, %0#1, %1 : tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.add"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %transfomed, %loops = transform.test.fuse_and_yield %0 [16] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

