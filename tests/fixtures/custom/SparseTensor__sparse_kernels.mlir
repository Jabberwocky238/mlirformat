#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @matmul1(%arg0: tensor<10x20xf32, #sparse>, %arg1: tensor<20x30xf32>, %arg2: tensor<10x30xf32>) -> tensor<10x30xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<10x20xf32, #sparse>, tensor<20x30xf32>) outs(%arg2 : tensor<10x30xf32>) -> tensor<10x30xf32>
    return %0 : tensor<10x30xf32>
  }
  func.func @matmul_sparse_rhs(%arg0: tensor<10x20xf32>, %arg1: tensor<20x30xf32, #sparse>, %arg2: tensor<10x30xf32>) -> tensor<10x30xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<10x20xf32>, tensor<20x30xf32, #sparse>) outs(%arg2 : tensor<10x30xf32>) -> tensor<10x30xf32>
    return %0 : tensor<10x30xf32>
  }
  func.func @matmul2(%arg0: tensor<4x8xf64, #sparse>, %arg1: tensor<8x4xf64, #sparse>) -> tensor<4x4xf64, #sparse> {
    %c4 = arith.constant 4 : index
    %0 = tensor.empty() : tensor<4x4xf64, #sparse>
    %1 = linalg.matmul ins(%arg0, %arg1 : tensor<4x8xf64, #sparse>, tensor<8x4xf64, #sparse>) outs(%0 : tensor<4x4xf64, #sparse>) -> tensor<4x4xf64, #sparse>
    return %1 : tensor<4x4xf64, #sparse>
  }
  func.func @conv2d(%arg0: tensor<8x8xi32>, %arg1: tensor<3x3xi32, #sparse>, %arg2: tensor<6x6xi32>) -> tensor<6x6xi32> {
    %0 = linalg.conv_2d ins(%arg0, %arg1 : tensor<8x8xi32>, tensor<3x3xi32, #sparse>) outs(%arg2 : tensor<6x6xi32>) -> tensor<6x6xi32>
    return %0 : tensor<6x6xi32>
  }
  func.func @quantized_matmul(%arg0: tensor<5x3xi8>, %arg1: tensor<3x6xi8, #sparse>, %arg2: tensor<5x6xi64>) -> tensor<5x6xi64> {
    %c0_i32 = arith.constant 0 : i32
    %c2_i32 = arith.constant 2 : i32
    %0 = linalg.quantized_matmul ins(%arg0, %arg1, %c2_i32, %c0_i32 : tensor<5x3xi8>, tensor<3x6xi8, #sparse>, i32, i32) outs(%arg2 : tensor<5x6xi64>) -> tensor<5x6xi64>
    return %0 : tensor<5x6xi64>
  }
  func.func @sparse_dot(%arg0: tensor<1024xf32, #sparse1>, %arg1: tensor<1024xf32, #sparse1>, %arg2: tensor<f32>) -> tensor<f32> {
    %0 = linalg.dot ins(%arg0, %arg1 : tensor<1024xf32, #sparse1>, tensor<1024xf32, #sparse1>) outs(%arg2 : tensor<f32>) -> tensor<f32>
    return %0 : tensor<f32>
  }
}

