module {
  func.func @matmul_static(%arg0: tensor<16x8xf32>, %arg1: tensor<8x16xf32>) -> tensor<16x16xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<16x16xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<16x16xf32>) -> tensor<16x16xf32>
    %2 = linalg.matmul ins(%arg0, %arg1 : tensor<16x8xf32>, tensor<8x16xf32>) outs(%1 : tensor<16x16xf32>) -> tensor<16x16xf32>
    return %2 : tensor<16x16xf32>
  }
  func.func @matmul_dynamic(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %arg1, %c1 : tensor<?x?xf32>
    %0 = tensor.empty(%dim, %dim_0) : tensor<?x?xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %2 = linalg.matmul ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%1 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %2 : tensor<?x?xf32>
  }
  func.func @matmul_mixed(%arg0: tensor<?x8xf32>, %arg1: tensor<8x16xf32>) -> tensor<?x16xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x8xf32>
    %0 = tensor.empty(%dim) : tensor<?x16xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<?x16xf32>) -> tensor<?x16xf32>
    %2 = linalg.matmul ins(%arg0, %arg1 : tensor<?x8xf32>, tensor<8x16xf32>) outs(%1 : tensor<?x16xf32>) -> tensor<?x16xf32>
    return %2 : tensor<?x16xf32>
  }
  func.func @batch_matmul_static(%arg0: tensor<2x16x8xf32>, %arg1: tensor<2x8x16xf32>) -> tensor<2x16x16xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<2x16x16xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<2x16x16xf32>) -> tensor<2x16x16xf32>
    %2 = linalg.batch_matmul ins(%arg0, %arg1 : tensor<2x16x8xf32>, tensor<2x8x16xf32>) outs(%1 : tensor<2x16x16xf32>) -> tensor<2x16x16xf32>
    return %2 : tensor<2x16x16xf32>
  }
  func.func @batch_matmul_dynamic(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?x?x?xf32>) -> tensor<?x?x?xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?x?xf32>
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?x?xf32>
    %dim_1 = tensor.dim %arg1, %c2 : tensor<?x?x?xf32>
    %0 = tensor.empty(%dim, %dim_0, %dim_1) : tensor<?x?x?xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    %2 = linalg.batch_matmul ins(%arg0, %arg1 : tensor<?x?x?xf32>, tensor<?x?x?xf32>) outs(%1 : tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    return %2 : tensor<?x?x?xf32>
  }
  func.func @batch_matmul_mixed(%arg0: tensor<2x?x8xf32>, %arg1: tensor<2x8x16xf32>) -> tensor<2x?x16xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c1 : tensor<2x?x8xf32>
    %0 = tensor.empty(%dim) : tensor<2x?x16xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<2x?x16xf32>) -> tensor<2x?x16xf32>
    %2 = linalg.batch_matmul ins(%arg0, %arg1 : tensor<2x?x8xf32>, tensor<2x8x16xf32>) outs(%1 : tensor<2x?x16xf32>) -> tensor<2x?x16xf32>
    return %2 : tensor<2x?x16xf32>
  }
}

