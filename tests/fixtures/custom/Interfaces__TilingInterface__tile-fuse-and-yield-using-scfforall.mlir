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
      %transfomed, %loops = transform.test.fuse_and_yield %1#1 [10] use_forall true : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @fuse_pack_consumer_into_multi_output_generic(%arg0: tensor<32x1024xf32>) -> (tensor<32x1024xf32>, tensor<2x512x16x2xi8>) {
    %c0_i8 = arith.constant 0 : i8
    %0 = tensor.empty() : tensor<32x1024xf32>
    %1 = tensor.empty() : tensor<32x1024xi8>
    %2 = tensor.empty() : tensor<2x512x16x2xi8>
    %3:2 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0 : tensor<32x1024xf32>) outs(%0, %1 : tensor<32x1024xf32>, tensor<32x1024xi8>) {
    ^bb0(%in: f32, %out: f32, %out_0: i8):
      %4 = arith.fptoui %in : f32 to i8
      linalg.yield %in, %4 : f32, i8
    } -> (tensor<32x1024xf32>, tensor<32x1024xi8>)
    %pack = linalg.pack %3#1 padding_value(%c0_i8 : i8) inner_dims_pos = [0, 1] inner_tiles = [16, 2] into %2 : tensor<32x1024xi8> -> tensor<2x512x16x2xi8>
    return %3#0, %pack : tensor<32x1024xf32>, tensor<2x512x16x2xi8>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.pack"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %transfomed, %loops = transform.test.fuse_and_yield %0 [1] use_forall true : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

