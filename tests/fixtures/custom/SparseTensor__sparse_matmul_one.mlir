#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), explicitVal = #complex.number<:f32 1.000000e+00, 0.000000e+00> : complex<f32>, implicitVal = #complex.number<:f32 0.000000e+00, 0.000000e+00> : complex<f32> }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), explicitVal = 1.000000e+00 : f32, implicitVal = 0.000000e+00 : f32 }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), explicitVal = 1 : i32, implicitVal = 0 : i32 }>
module {
  func.func @matmul_complex(%arg0: tensor<10x20xcomplex<f32>>, %arg1: tensor<20x30xcomplex<f32>, #sparse>, %arg2: tensor<10x30xcomplex<f32>>) -> tensor<10x30xcomplex<f32>> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<10x20xcomplex<f32>>, tensor<20x30xcomplex<f32>, #sparse>) outs(%arg2 : tensor<10x30xcomplex<f32>>) -> tensor<10x30xcomplex<f32>>
    return %0 : tensor<10x30xcomplex<f32>>
  }
  func.func @matmul_fp(%arg0: tensor<10x20xf32>, %arg1: tensor<20x30xf32, #sparse1>, %arg2: tensor<10x30xf32>) -> tensor<10x30xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<10x20xf32>, tensor<20x30xf32, #sparse1>) outs(%arg2 : tensor<10x30xf32>) -> tensor<10x30xf32>
    return %0 : tensor<10x30xf32>
  }
  func.func @matmul_int(%arg0: tensor<10x20xi32>, %arg1: tensor<20x30xi32, #sparse2>, %arg2: tensor<10x30xi32>) -> tensor<10x30xi32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<10x20xi32>, tensor<20x30xi32, #sparse2>) outs(%arg2 : tensor<10x30xi32>) -> tensor<10x30xi32>
    return %0 : tensor<10x30xi32>
  }
}

