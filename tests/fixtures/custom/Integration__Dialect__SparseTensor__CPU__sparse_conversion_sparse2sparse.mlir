#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : dense, d2 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d2 : dense, d1 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : compressed(nonunique), d2 : singleton) }>
module {
  func.func @dump(%arg0: tensor<2x3x4xf64>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant -1.000000e+00 : f64
    %0 = vector.transfer_read %arg0[%c0, %c0, %c0], %cst : tensor<2x3x4xf64>, vector<2x3x4xf64>
    vector.print %0 : vector<2x3x4xf64>
    return
  }
  func.func @testNonSingleton() {
    %cst = arith.constant dense<[[[1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00], [5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00], [9.000000e+00, 1.000000e+01, 1.100000e+01, 1.200000e+01]], [[1.300000e+01, 1.400000e+01, 1.500000e+01, 1.600000e+01], [1.700000e+01, 1.800000e+01, 1.900000e+01, 2.000000e+01], [2.100000e+01, 2.200000e+01, 2.300000e+01, 2.400000e+01]]]> : tensor<2x3x4xf64>
    %0 = sparse_tensor.convert %cst : tensor<2x3x4xf64> to tensor<2x3x4xf64, #sparse>
    %1 = sparse_tensor.convert %cst : tensor<2x3x4xf64> to tensor<2x3x4xf64, #sparse1>
    %2 = sparse_tensor.convert %0 : tensor<2x3x4xf64, #sparse> to tensor<2x3x4xf64, #sparse1>
    %3 = sparse_tensor.convert %1 : tensor<2x3x4xf64, #sparse1> to tensor<2x3x4xf64, #sparse>
    %4 = sparse_tensor.convert %2 : tensor<2x3x4xf64, #sparse1> to tensor<2x3x4xf64>
    %5 = sparse_tensor.convert %3 : tensor<2x3x4xf64, #sparse> to tensor<2x3x4xf64>
    call @dump(%cst) : (tensor<2x3x4xf64>) -> ()
    call @dump(%4) : (tensor<2x3x4xf64>) -> ()
    call @dump(%5) : (tensor<2x3x4xf64>) -> ()
    bufferization.dealloc_tensor %2 : tensor<2x3x4xf64, #sparse1>
    bufferization.dealloc_tensor %3 : tensor<2x3x4xf64, #sparse>
    bufferization.dealloc_tensor %0 : tensor<2x3x4xf64, #sparse>
    bufferization.dealloc_tensor %1 : tensor<2x3x4xf64, #sparse1>
    bufferization.dealloc_tensor %4 : tensor<2x3x4xf64>
    bufferization.dealloc_tensor %5 : tensor<2x3x4xf64>
    return
  }
  func.func @testSingleton() {
    %cst = arith.constant dense<[[[1.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 6.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 1.100000e+01, 0.000000e+00]], [[0.000000e+00, 1.400000e+01, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 2.000000e+01], [2.100000e+01, 0.000000e+00, 0.000000e+00, 0.000000e+00]]]> : tensor<2x3x4xf64>
    %0 = sparse_tensor.convert %cst : tensor<2x3x4xf64> to tensor<2x3x4xf64, #sparse2>
    %1 = sparse_tensor.convert %cst : tensor<2x3x4xf64> to tensor<2x3x4xf64, #sparse>
    %2 = sparse_tensor.convert %0 : tensor<2x3x4xf64, #sparse2> to tensor<2x3x4xf64, #sparse>
    %3 = sparse_tensor.convert %1 : tensor<2x3x4xf64, #sparse> to tensor<2x3x4xf64, #sparse2>
    %4 = sparse_tensor.convert %2 : tensor<2x3x4xf64, #sparse> to tensor<2x3x4xf64>
    %5 = sparse_tensor.convert %3 : tensor<2x3x4xf64, #sparse2> to tensor<2x3x4xf64>
    call @dump(%cst) : (tensor<2x3x4xf64>) -> ()
    call @dump(%4) : (tensor<2x3x4xf64>) -> ()
    call @dump(%5) : (tensor<2x3x4xf64>) -> ()
    bufferization.dealloc_tensor %2 : tensor<2x3x4xf64, #sparse>
    bufferization.dealloc_tensor %3 : tensor<2x3x4xf64, #sparse2>
    bufferization.dealloc_tensor %0 : tensor<2x3x4xf64, #sparse2>
    bufferization.dealloc_tensor %1 : tensor<2x3x4xf64, #sparse>
    bufferization.dealloc_tensor %4 : tensor<2x3x4xf64>
    bufferization.dealloc_tensor %5 : tensor<2x3x4xf64>
    return
  }
  func.func @main() {
    call @testNonSingleton() : () -> ()
    call @testSingleton() : () -> ()
    return
  }
}

