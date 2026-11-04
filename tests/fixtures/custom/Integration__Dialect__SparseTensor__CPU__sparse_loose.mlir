#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : loose_compressed) }>
module {
  func.func @main() {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f64
    %cst_0 = arith.constant dense<[[1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00], [5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00], [0.000000e+00, 0.000000e+00, 5.500000e+00, 0.000000e+00], [9.000000e+00, 1.000000e+01, 1.100000e+01, 1.200000e+01], [1.300000e+01, 1.400000e+01, 1.500000e+01, 1.600000e+01]]> : tensor<5x4xf64>
    %0 = sparse_tensor.convert %cst_0 : tensor<5x4xf64> to tensor<5x4xf64, #sparse>
    sparse_tensor.print %0 : tensor<5x4xf64, #sparse>
    bufferization.dealloc_tensor %0 : tensor<5x4xf64, #sparse>
    return
  }
}

