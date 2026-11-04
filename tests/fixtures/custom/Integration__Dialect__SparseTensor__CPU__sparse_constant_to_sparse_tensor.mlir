#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
module {
  func.func @main() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %cst = arith.constant 0.000000e+00 : f64
    %cst_0 = arith.constant sparse<[[0, 0], [0, 7], [1, 2], [4, 2], [5, 3], [6, 4], [6, 6], [9, 7]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00]> : tensor<10x8xf64>
    %0 = sparse_tensor.convert %cst_0 : tensor<10x8xf64> to tensor<10x8xf64, #sparse>
    sparse_tensor.print %0 : tensor<10x8xf64, #sparse>
    bufferization.dealloc_tensor %0 : tensor<10x8xf64, #sparse>
    return
  }
}

