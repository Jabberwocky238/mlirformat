#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : dense, d0 : compressed, d1 : compressed) }>
module {
  func.func @sparse_convert_1d(%arg0: tensor<?xi32>) -> tensor<?xi32, #sparse> {
    %0 = sparse_tensor.convert %arg0 : tensor<?xi32> to tensor<?xi32, #sparse>
    return %0 : tensor<?xi32, #sparse>
  }
  func.func @sparse_convert_complex(%arg0: tensor<100xcomplex<f64>>) -> tensor<100xcomplex<f64>, #sparse> {
    %0 = sparse_tensor.convert %arg0 : tensor<100xcomplex<f64>> to tensor<100xcomplex<f64>, #sparse>
    return %0 : tensor<100xcomplex<f64>, #sparse>
  }
  func.func @sparse_convert_2d(%arg0: tensor<2x4xf64>) -> tensor<2x4xf64, #sparse1> {
    %0 = sparse_tensor.convert %arg0 : tensor<2x4xf64> to tensor<2x4xf64, #sparse1>
    return %0 : tensor<2x4xf64, #sparse1>
  }
  func.func @sparse_constant() -> tensor<8x7xf32, #sparse1> {
    %cst = arith.constant sparse<[[0, 0], [1, 6]], [1.000000e+00, 5.000000e+00]> : tensor<8x7xf32>
    %0 = sparse_tensor.convert %cst : tensor<8x7xf32> to tensor<8x7xf32, #sparse1>
    return %0 : tensor<8x7xf32, #sparse1>
  }
  func.func @sparse_constant_csc() -> tensor<8x7xf32, #sparse2> {
    %cst = arith.constant sparse<[[0, 0], [1, 6]], [1.000000e+00, 5.000000e+00]> : tensor<8x7xf32>
    %0 = sparse_tensor.convert %cst : tensor<8x7xf32> to tensor<8x7xf32, #sparse2>
    return %0 : tensor<8x7xf32, #sparse2>
  }
  func.func @sparse_convert_3d(%arg0: tensor<?x?x?xf64>) -> tensor<?x?x?xf64, #sparse3> {
    %0 = sparse_tensor.convert %arg0 : tensor<?x?x?xf64> to tensor<?x?x?xf64, #sparse3>
    return %0 : tensor<?x?x?xf64, #sparse3>
  }
}

