#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d1 : compressed, d2 : compressed, d0 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : compressed, d0 : compressed, d1 : compressed) }>
module {
  func.func @main() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %cst = arith.constant dense<[[[1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00], [5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00], [9.000000e+00, 1.000000e+01, 1.100000e+01, 1.200000e+01]], [[1.300000e+01, 1.400000e+01, 1.500000e+01, 1.600000e+01], [1.700000e+01, 1.800000e+01, 1.900000e+01, 2.000000e+01], [2.100000e+01, 2.200000e+01, 2.300000e+01, 2.400000e+01]]]> : tensor<2x3x4xf64>
    %0 = sparse_tensor.convert %cst : tensor<2x3x4xf64> to tensor<2x3x4xf64, #sparse>
    %1 = sparse_tensor.convert %cst : tensor<2x3x4xf64> to tensor<2x3x4xf64, #sparse1>
    %2 = sparse_tensor.convert %cst : tensor<2x3x4xf64> to tensor<2x3x4xf64, #sparse2>
    %3 = sparse_tensor.convert %0 : tensor<2x3x4xf64, #sparse> to tensor<2x3x4xf64, #sparse>
    %4 = sparse_tensor.convert %1 : tensor<2x3x4xf64, #sparse1> to tensor<2x3x4xf64, #sparse>
    %5 = sparse_tensor.convert %2 : tensor<2x3x4xf64, #sparse2> to tensor<2x3x4xf64, #sparse>
    %6 = sparse_tensor.convert %0 : tensor<2x3x4xf64, #sparse> to tensor<2x3x4xf64, #sparse1>
    %7 = sparse_tensor.convert %1 : tensor<2x3x4xf64, #sparse1> to tensor<2x3x4xf64, #sparse1>
    %8 = sparse_tensor.convert %2 : tensor<2x3x4xf64, #sparse2> to tensor<2x3x4xf64, #sparse1>
    %9 = sparse_tensor.convert %0 : tensor<2x3x4xf64, #sparse> to tensor<2x3x4xf64, #sparse2>
    %10 = sparse_tensor.convert %1 : tensor<2x3x4xf64, #sparse1> to tensor<2x3x4xf64, #sparse2>
    %11 = sparse_tensor.convert %2 : tensor<2x3x4xf64, #sparse2> to tensor<2x3x4xf64, #sparse2>
    sparse_tensor.print %0 : tensor<2x3x4xf64, #sparse>
    sparse_tensor.print %1 : tensor<2x3x4xf64, #sparse1>
    sparse_tensor.print %2 : tensor<2x3x4xf64, #sparse2>
    sparse_tensor.print %3 : tensor<2x3x4xf64, #sparse>
    sparse_tensor.print %4 : tensor<2x3x4xf64, #sparse>
    sparse_tensor.print %5 : tensor<2x3x4xf64, #sparse>
    sparse_tensor.print %6 : tensor<2x3x4xf64, #sparse1>
    sparse_tensor.print %7 : tensor<2x3x4xf64, #sparse1>
    sparse_tensor.print %8 : tensor<2x3x4xf64, #sparse1>
    sparse_tensor.print %9 : tensor<2x3x4xf64, #sparse2>
    sparse_tensor.print %10 : tensor<2x3x4xf64, #sparse2>
    sparse_tensor.print %11 : tensor<2x3x4xf64, #sparse2>
    bufferization.dealloc_tensor %0 : tensor<2x3x4xf64, #sparse>
    bufferization.dealloc_tensor %1 : tensor<2x3x4xf64, #sparse1>
    bufferization.dealloc_tensor %2 : tensor<2x3x4xf64, #sparse2>
    bufferization.dealloc_tensor %4 : tensor<2x3x4xf64, #sparse>
    bufferization.dealloc_tensor %5 : tensor<2x3x4xf64, #sparse>
    bufferization.dealloc_tensor %6 : tensor<2x3x4xf64, #sparse1>
    bufferization.dealloc_tensor %8 : tensor<2x3x4xf64, #sparse1>
    bufferization.dealloc_tensor %9 : tensor<2x3x4xf64, #sparse2>
    bufferization.dealloc_tensor %10 : tensor<2x3x4xf64, #sparse2>
    return
  }
}

