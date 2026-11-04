#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed), posWidth = 8, crdWidth = 8 }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed), posWidth = 64, crdWidth = 64 }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed), posWidth = 16, crdWidth = 32 }>
module {
  func.func @main() {
    %c1 = arith.constant 1 : index
    %cst = arith.constant sparse<[[0, 0], [0, 1], [0, 63], [1, 0], [1, 1], [31, 0], [31, 63]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00]> : tensor<32x64xf64>
    %cast = tensor.cast %cst : tensor<32x64xf64> to tensor<?x?xf64>
    %0 = sparse_tensor.convert %cst : tensor<32x64xf64> to tensor<32x64xf64, #sparse>
    %1 = sparse_tensor.convert %cst : tensor<32x64xf64> to tensor<32x64xf64, #sparse1>
    %2 = sparse_tensor.convert %cst : tensor<32x64xf64> to tensor<32x64xf64, #sparse2>
    %3 = sparse_tensor.convert %0 : tensor<32x64xf64, #sparse> to tensor<32x64xf64, #sparse1>
    %4 = sparse_tensor.convert %1 : tensor<32x64xf64, #sparse1> to tensor<32x64xf64, #sparse>
    %5 = sparse_tensor.convert %2 : tensor<32x64xf64, #sparse2> to tensor<32x64xf64, #sparse>
    sparse_tensor.print %0 : tensor<32x64xf64, #sparse>
    sparse_tensor.print %1 : tensor<32x64xf64, #sparse1>
    sparse_tensor.print %2 : tensor<32x64xf64, #sparse2>
    sparse_tensor.print %3 : tensor<32x64xf64, #sparse1>
    sparse_tensor.print %4 : tensor<32x64xf64, #sparse>
    sparse_tensor.print %5 : tensor<32x64xf64, #sparse>
    bufferization.dealloc_tensor %0 : tensor<32x64xf64, #sparse>
    bufferization.dealloc_tensor %1 : tensor<32x64xf64, #sparse1>
    bufferization.dealloc_tensor %2 : tensor<32x64xf64, #sparse2>
    bufferization.dealloc_tensor %3 : tensor<32x64xf64, #sparse1>
    bufferization.dealloc_tensor %4 : tensor<32x64xf64, #sparse>
    bufferization.dealloc_tensor %5 : tensor<32x64xf64, #sparse>
    return
  }
}

