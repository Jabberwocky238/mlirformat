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

