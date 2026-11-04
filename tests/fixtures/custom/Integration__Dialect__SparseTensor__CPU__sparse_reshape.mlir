#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>
module {
  func.func @reshape0(%arg0: tensor<3x4xf64, #sparse>) -> tensor<2x6xf64, #sparse> {
    %cst = arith.constant dense<[2, 6]> : tensor<2xi32>
    %reshape = tensor.reshape %arg0(%cst) : (tensor<3x4xf64, #sparse>, tensor<2xi32>) -> tensor<2x6xf64, #sparse>
    return %reshape : tensor<2x6xf64, #sparse>
  }
  func.func @reshape1(%arg0: tensor<3x4xf64, #sparse>) -> tensor<12xf64, #sparse1> {
    %cst = arith.constant dense<12> : tensor<1xi32>
    %reshape = tensor.reshape %arg0(%cst) : (tensor<3x4xf64, #sparse>, tensor<1xi32>) -> tensor<12xf64, #sparse1>
    return %reshape : tensor<12xf64, #sparse1>
  }
  func.func @reshape2(%arg0: tensor<3x4xf64, #sparse>) -> tensor<2x3x2xf64, #sparse2> {
    %cst = arith.constant dense<[2, 3, 2]> : tensor<3xi32>
    %reshape = tensor.reshape %arg0(%cst) : (tensor<3x4xf64, #sparse>, tensor<3xi32>) -> tensor<2x3x2xf64, #sparse2>
    return %reshape : tensor<2x3x2xf64, #sparse2>
  }
  func.func @main() {
    %cst = arith.constant dense<[[1.100000e+00, 0.000000e+00, 1.300000e+00, 0.000000e+00], [2.100000e+00, 0.000000e+00, 2.300000e+00, 0.000000e+00], [3.100000e+00, 0.000000e+00, 3.300000e+00, 0.000000e+00]]> : tensor<3x4xf64>
    %0 = sparse_tensor.convert %cst : tensor<3x4xf64> to tensor<3x4xf64, #sparse>
    %1 = call @reshape0(%0) : (tensor<3x4xf64, #sparse>) -> tensor<2x6xf64, #sparse>
    %2 = call @reshape1(%0) : (tensor<3x4xf64, #sparse>) -> tensor<12xf64, #sparse1>
    %3 = call @reshape2(%0) : (tensor<3x4xf64, #sparse>) -> tensor<2x3x2xf64, #sparse2>
    %c0 = arith.constant 0 : index
    %cst_0 = arith.constant -1.000000e+00 : f64
    sparse_tensor.print %1 : tensor<2x6xf64, #sparse>
    sparse_tensor.print %2 : tensor<12xf64, #sparse1>
    sparse_tensor.print %3 : tensor<2x3x2xf64, #sparse2>
    bufferization.dealloc_tensor %0 : tensor<3x4xf64, #sparse>
    bufferization.dealloc_tensor %1 : tensor<2x6xf64, #sparse>
    bufferization.dealloc_tensor %2 : tensor<12xf64, #sparse1>
    bufferization.dealloc_tensor %3 : tensor<2x3x2xf64, #sparse2>
    return
  }
}

