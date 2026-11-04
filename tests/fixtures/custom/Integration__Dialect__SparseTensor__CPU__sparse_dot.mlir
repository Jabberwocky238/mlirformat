#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @sparse_dot(%arg0: tensor<1024xf32, #sparse>, %arg1: tensor<1024xf32, #sparse>, %arg2: tensor<f32>) -> tensor<f32> {
    %0 = linalg.dot ins(%arg0, %arg1 : tensor<1024xf32, #sparse>, tensor<1024xf32, #sparse>) outs(%arg2 : tensor<f32>) -> tensor<f32>
    return %0 : tensor<f32>
  }
  func.func @main() {
    %cst = arith.constant sparse<[[0], [1], [22], [23], [1022]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00]> : tensor<1024xf32>
    %cst_0 = arith.constant sparse<[[22], [1022], [1023]], [6.000000e+00, 7.000000e+00, 8.000000e+00]> : tensor<1024xf32>
    %0 = sparse_tensor.convert %cst : tensor<1024xf32> to tensor<1024xf32, #sparse>
    %1 = sparse_tensor.convert %cst_0 : tensor<1024xf32> to tensor<1024xf32, #sparse>
    sparse_tensor.print %0 : tensor<1024xf32, #sparse>
    sparse_tensor.print %1 : tensor<1024xf32, #sparse>
    %2 = tensor.empty() : tensor<f32>
    %cst_1 = arith.constant 0.000000e+00 : f32
    %inserted = tensor.insert %cst_1 into %2[] : tensor<f32>
    %3 = call @sparse_dot(%0, %1, %inserted) : (tensor<1024xf32, #sparse>, tensor<1024xf32, #sparse>, tensor<f32>) -> tensor<f32>
    %extracted = tensor.extract %3[] : tensor<f32>
    vector.print %extracted : f32
    bufferization.dealloc_tensor %3 : tensor<f32>
    bufferization.dealloc_tensor %0 : tensor<1024xf32, #sparse>
    bufferization.dealloc_tensor %1 : tensor<1024xf32, #sparse>
    return
  }
}

