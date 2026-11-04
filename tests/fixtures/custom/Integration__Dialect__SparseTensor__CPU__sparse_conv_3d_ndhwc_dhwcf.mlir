#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2, d3, d4) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : compressed, d4 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1, d2, d3, d4) -> (d0 : compressed, d1 : dense, d2 : compressed, d3 : dense, d4 : compressed) }>
module {
  func.func @alloc_5d_filled_f32(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: f32) -> tensor<?x?x?x?x?xf32> {
    %0 = tensor.empty(%arg0, %arg1, %arg2, %arg3, %arg4) : tensor<?x?x?x?x?xf32>
    %1 = linalg.fill ins(%arg5 : f32) outs(%0 : tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>
    return %1 : tensor<?x?x?x?x?xf32>
  }
  func.func @conv_3d_ndhwc_dhwcf(%arg0: tensor<?x?x?x?x?xf32>, %arg1: tensor<?x?x?x?x?xf32>, %arg2: tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32> {
    %0 = linalg.conv_3d_ndhwc_dhwcf {dilations = dense<1> : tensor<3xi64>, strides = dense<1> : tensor<3xi64>} ins(%arg0, %arg1 : tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>) outs(%arg2 : tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>
    return %0 : tensor<?x?x?x?x?xf32>
  }
  func.func @conv_3d_ndhwc_dhwcf_CCCCC(%arg0: tensor<?x?x?x?x?xf32, #sparse>, %arg1: tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32, #sparse> {
    %c1 = arith.constant 1 : index
    %c6 = arith.constant 6 : index
    %0 = tensor.empty(%c1, %c6, %c6, %c6, %c1) : tensor<?x?x?x?x?xf32, #sparse>
    %1 = linalg.conv_3d_ndhwc_dhwcf {dilations = dense<1> : tensor<3xi64>, strides = dense<1> : tensor<3xi64>} ins(%arg0, %arg1 : tensor<?x?x?x?x?xf32, #sparse>, tensor<?x?x?x?x?xf32>) outs(%0 : tensor<?x?x?x?x?xf32, #sparse>) -> tensor<?x?x?x?x?xf32, #sparse>
    return %1 : tensor<?x?x?x?x?xf32, #sparse>
  }
  func.func @conv_3d_ndhwc_dhwcf_CDCDC(%arg0: tensor<?x?x?x?x?xf32, #sparse1>, %arg1: tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32, #sparse1> {
    %c1 = arith.constant 1 : index
    %c6 = arith.constant 6 : index
    %0 = tensor.empty(%c1, %c6, %c6, %c6, %c1) : tensor<?x?x?x?x?xf32, #sparse1>
    %1 = linalg.conv_3d_ndhwc_dhwcf {dilations = dense<1> : tensor<3xi64>, strides = dense<1> : tensor<3xi64>} ins(%arg0, %arg1 : tensor<?x?x?x?x?xf32, #sparse1>, tensor<?x?x?x?x?xf32>) outs(%0 : tensor<?x?x?x?x?xf32, #sparse1>) -> tensor<?x?x?x?x?xf32, #sparse1>
    return %1 : tensor<?x?x?x?x?xf32, #sparse1>
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %c6 = arith.constant 6 : index
    %c8 = arith.constant 8 : index
    %cst = arith.constant 1.000000e+01 : f32
    %cst_0 = arith.constant 2.000000e+00 : f32
    %cst_1 = arith.constant 0.000000e+00 : f32
    %0 = call @alloc_5d_filled_f32(%c1, %c8, %c8, %c8, %c1, %cst_0) : (index, index, index, index, index, f32) -> tensor<?x?x?x?x?xf32>
    %inserted = tensor.insert %cst into %0[%c0, %c0, %c0, %c3, %c0] : tensor<?x?x?x?x?xf32>
    %1 = call @alloc_5d_filled_f32(%c3, %c3, %c3, %c1, %c1, %cst_0) : (index, index, index, index, index, f32) -> tensor<?x?x?x?x?xf32>
    %2 = call @alloc_5d_filled_f32(%c1, %c6, %c6, %c6, %c1, %cst_1) : (index, index, index, index, index, f32) -> tensor<?x?x?x?x?xf32>
    %3 = sparse_tensor.convert %inserted : tensor<?x?x?x?x?xf32> to tensor<?x?x?x?x?xf32, #sparse>
    %4 = sparse_tensor.convert %inserted : tensor<?x?x?x?x?xf32> to tensor<?x?x?x?x?xf32, #sparse1>
    %5 = call @conv_3d_ndhwc_dhwcf(%inserted, %1, %2) : (tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>
    %6 = vector.transfer_read %5[%c0, %c0, %c0, %c0, %c0], %cst_1 : tensor<?x?x?x?x?xf32>, vector<1x6x6x6x1xf32>
    vector.print %6 : vector<1x6x6x6x1xf32>
    %7 = call @conv_3d_ndhwc_dhwcf_CCCCC(%3, %1) : (tensor<?x?x?x?x?xf32, #sparse>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32, #sparse>
    sparse_tensor.print %7 : tensor<?x?x?x?x?xf32, #sparse>
    %8 = call @conv_3d_ndhwc_dhwcf_CDCDC(%4, %1) : (tensor<?x?x?x?x?xf32, #sparse1>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32, #sparse1>
    sparse_tensor.print %8 : tensor<?x?x?x?x?xf32, #sparse1>
    bufferization.dealloc_tensor %inserted : tensor<?x?x?x?x?xf32>
    bufferization.dealloc_tensor %1 : tensor<?x?x?x?x?xf32>
    bufferization.dealloc_tensor %2 : tensor<?x?x?x?x?xf32>
    bufferization.dealloc_tensor %4 : tensor<?x?x?x?x?xf32, #sparse1>
    bufferization.dealloc_tensor %3 : tensor<?x?x?x?x?xf32, #sparse>
    bufferization.dealloc_tensor %7 : tensor<?x?x?x?x?xf32, #sparse>
    bufferization.dealloc_tensor %8 : tensor<?x?x?x?x?xf32, #sparse1>
    return
  }
}

