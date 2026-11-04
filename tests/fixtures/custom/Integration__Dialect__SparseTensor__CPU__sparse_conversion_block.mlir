#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>
module {
  func.func @main() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %cst = arith.constant sparse<[[0, 0], [0, 1], [0, 2], [0, 3], [1, 0], [1, 1], [1, 2], [1, 3]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00]> : tensor<2x4xf64>
    %cst_0 = arith.constant dense<[[1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00], [5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00]]> : tensor<2x4xf64>
    %0 = sparse_tensor.convert %cst : tensor<2x4xf64> to tensor<2x4xf64, #sparse>
    %1 = sparse_tensor.convert %cst_0 : tensor<2x4xf64> to tensor<2x4xf64, #sparse>
    %2 = sparse_tensor.convert %0 : tensor<2x4xf64, #sparse> to tensor<2x4xf64, #sparse1>
    %3 = sparse_tensor.convert %0 : tensor<2x4xf64, #sparse> to tensor<2x4xf64, #sparse2>
    sparse_tensor.print %0 : tensor<2x4xf64, #sparse>
    sparse_tensor.print %1 : tensor<2x4xf64, #sparse>
    sparse_tensor.print %2 : tensor<2x4xf64, #sparse1>
    sparse_tensor.print %3 : tensor<2x4xf64, #sparse2>
    bufferization.dealloc_tensor %0 : tensor<2x4xf64, #sparse>
    bufferization.dealloc_tensor %1 : tensor<2x4xf64, #sparse>
    bufferization.dealloc_tensor %2 : tensor<2x4xf64, #sparse1>
    bufferization.dealloc_tensor %3 : tensor<2x4xf64, #sparse2>
    return
  }
}

