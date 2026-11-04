#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>
module {
  func.func @matmul(%arg0: tensor<8x2xf64, #sparse>, %arg1: tensor<2x4xf64, #sparse>) -> tensor<8x4xf64, #sparse> {
    %0 = tensor.empty() : tensor<8x4xf64, #sparse>
    %1 = linalg.matmul ins(%arg0, %arg1 : tensor<8x2xf64, #sparse>, tensor<2x4xf64, #sparse>) outs(%0 : tensor<8x4xf64, #sparse>) -> tensor<8x4xf64, #sparse>
    return %1 : tensor<8x4xf64, #sparse>
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %cst = arith.constant -1.000000e+00 : f64
    %cst_0 = arith.constant dense<[[1.100000e+00, 2.100000e+00], [1.200000e+00, 2.200000e+00], [1.300000e+00, 2.300000e+00], [1.400000e+00, 2.400000e+00], [1.500000e+00, 2.500000e+00], [1.600000e+00, 2.600000e+00], [1.700000e+00, 2.700000e+00], [1.800000e+00, 2.800000e+00]]> : tensor<8x2xf64>
    %cst_1 = arith.constant dense<[[1.010000e+01, 1.110000e+01, 1.210000e+01, 1.310000e+01], [1.020000e+01, 1.120000e+01, 1.220000e+01, 1.320000e+01]]> : tensor<2x4xf64>
    %0 = sparse_tensor.convert %cst_0 : tensor<8x2xf64> to tensor<8x2xf64, #sparse>
    %1 = sparse_tensor.convert %cst_1 : tensor<2x4xf64> to tensor<2x4xf64, #sparse>
    %2 = call @matmul(%0, %1) : (tensor<8x2xf64, #sparse>, tensor<2x4xf64, #sparse>) -> tensor<8x4xf64, #sparse>
    sparse_tensor.print %2 : tensor<8x4xf64, #sparse>
    bufferization.dealloc_tensor %0 : tensor<8x2xf64, #sparse>
    bufferization.dealloc_tensor %1 : tensor<2x4xf64, #sparse>
    bufferization.dealloc_tensor %2 : tensor<8x4xf64, #sparse>
    return
  }
}

