#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : compressed), posWidth = 32, crdWidth = 32 }>
module {
  func.func @pooling_nhwc_sum_CCCC(%arg0: tensor<1x4x4x1xf32, #sparse>, %arg1: tensor<2x2xf32>) -> tensor<1x3x3x1xf32, #sparse> {
    %0 = tensor.empty() : tensor<1x3x3x1xf32, #sparse>
    %1 = linalg.pooling_nhwc_sum {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<1x4x4x1xf32, #sparse>, tensor<2x2xf32>) outs(%0 : tensor<1x3x3x1xf32, #sparse>) -> tensor<1x3x3x1xf32, #sparse>
    return %1 : tensor<1x3x3x1xf32, #sparse>
  }
  func.func @pooling_nhwc_sum(%arg0: tensor<1x4x4x1xf32>, %arg1: tensor<2x2xf32>) -> tensor<1x3x3x1xf32> {
    %cst = arith.constant dense<0.000000e+00> : tensor<1x3x3x1xf32>
    %0 = linalg.pooling_nhwc_sum {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<1x4x4x1xf32>, tensor<2x2xf32>) outs(%cst : tensor<1x3x3x1xf32>) -> tensor<1x3x3x1xf32>
    return %0 : tensor<1x3x3x1xf32>
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant dense<[[1.000000e+00, 0.000000e+00], [0.000000e+00, 1.000000e+00]]> : tensor<2x2xf32>
    %cst_1 = arith.constant dense<[[[[1.000000e+00], [2.000000e+00], [1.000000e+00], [2.000000e+00]], [[1.000000e+00], [2.000000e+00], [1.000000e+00], [2.000000e+00]], [[1.000000e+00], [2.000000e+00], [1.000000e+00], [2.000000e+00]], [[1.000000e+00], [2.000000e+00], [1.000000e+00], [2.000000e+00]]]]> : tensor<1x4x4x1xf32>
    %0 = sparse_tensor.convert %cst_1 : tensor<1x4x4x1xf32> to tensor<1x4x4x1xf32, #sparse>
    %1 = call @pooling_nhwc_sum(%cst_1, %cst_0) : (tensor<1x4x4x1xf32>, tensor<2x2xf32>) -> tensor<1x3x3x1xf32>
    %2 = call @pooling_nhwc_sum_CCCC(%0, %cst_0) : (tensor<1x4x4x1xf32, #sparse>, tensor<2x2xf32>) -> tensor<1x3x3x1xf32, #sparse>
    %3 = vector.transfer_read %1[%c0, %c0, %c0, %c0], %cst : tensor<1x3x3x1xf32>, vector<1x3x3x1xf32>
    vector.print %3 : vector<1x3x3x1xf32>
    sparse_tensor.print %2 : tensor<1x3x3x1xf32, #sparse>
    bufferization.dealloc_tensor %0 : tensor<1x4x4x1xf32, #sparse>
    bufferization.dealloc_tensor %2 : tensor<1x3x3x1xf32, #sparse>
    bufferization.dealloc_tensor %1 : tensor<1x3x3x1xf32>
    return
  }
}

