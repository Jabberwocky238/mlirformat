#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed, d1 : dense, d2 : compressed, d3 : dense) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed, d1 : compressed, d2 : compressed, d3 : compressed) }>
module {
  func.func @alloc_4d_filled_f32(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: f32) -> tensor<?x?x?x?xf32> {
    %0 = tensor.empty(%arg0, %arg1, %arg2, %arg3) : tensor<?x?x?x?xf32>
    %1 = linalg.fill ins(%arg4 : f32) outs(%0 : tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    return %1 : tensor<?x?x?x?xf32>
  }
  func.func @conv_2d_nchw_fchw(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> {
    %0 = linalg.conv_2d_nchw_fchw {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) outs(%arg2 : tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    return %0 : tensor<?x?x?x?xf32>
  }
  func.func @conv_2d_nchw_fchw_CDCD(%arg0: tensor<?x?x?x?xf32, #sparse>, %arg1: tensor<?x?x?x?xf32>, %arg2: tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> {
    %0 = linalg.conv_2d_nchw_fchw {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<?x?x?x?xf32, #sparse>, tensor<?x?x?x?xf32>) outs(%arg2 : tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    return %0 : tensor<?x?x?x?xf32>
  }
  func.func @conv_2d_nchw_fchw_CCCC(%arg0: tensor<?x?x?x?xf32, #sparse1>, %arg1: tensor<?x?x?x?xf32>, %arg2: tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> {
    %0 = linalg.conv_2d_nchw_fchw {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<?x?x?x?xf32, #sparse1>, tensor<?x?x?x?xf32>) outs(%arg2 : tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    return %0 : tensor<?x?x?x?xf32>
  }
  func.func @conv_2d_nchw_fchw_CCCC_CCCC(%arg0: tensor<?x?x?x?xf32, #sparse1>, %arg1: tensor<?x?x?x?xf32, #sparse1>, %arg2: tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> {
    %0 = linalg.conv_2d_nchw_fchw {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<?x?x?x?xf32, #sparse1>, tensor<?x?x?x?xf32, #sparse1>) outs(%arg2 : tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    return %0 : tensor<?x?x?x?xf32>
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
    %0 = call @alloc_4d_filled_f32(%c1, %c3, %c3, %c3, %cst_0) : (index, index, index, index, f32) -> tensor<?x?x?x?xf32>
    %1 = call @alloc_4d_filled_f32(%c3, %c3, %c8, %c8, %cst_0) : (index, index, index, index, f32) -> tensor<?x?x?x?xf32>
    %inserted = tensor.insert %cst into %1[%c0, %c0, %c0, %c3] : tensor<?x?x?x?xf32>
    %2 = call @alloc_4d_filled_f32(%c3, %c1, %c6, %c6, %cst_1) : (index, index, index, index, f32) -> tensor<?x?x?x?xf32>
    %3 = call @alloc_4d_filled_f32(%c3, %c1, %c6, %c6, %cst_1) : (index, index, index, index, f32) -> tensor<?x?x?x?xf32>
    %4 = call @alloc_4d_filled_f32(%c3, %c1, %c6, %c6, %cst_1) : (index, index, index, index, f32) -> tensor<?x?x?x?xf32>
    %5 = sparse_tensor.convert %inserted : tensor<?x?x?x?xf32> to tensor<?x?x?x?xf32, #sparse>
    %6 = sparse_tensor.convert %inserted : tensor<?x?x?x?xf32> to tensor<?x?x?x?xf32, #sparse1>
    %7 = sparse_tensor.convert %0 : tensor<?x?x?x?xf32> to tensor<?x?x?x?xf32, #sparse1>
    %8 = call @conv_2d_nchw_fchw(%inserted, %0, %2) : (tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    %9 = call @conv_2d_nchw_fchw_CDCD(%5, %0, %3) : (tensor<?x?x?x?xf32, #sparse>, tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    %10 = call @conv_2d_nchw_fchw_CCCC(%6, %0, %4) : (tensor<?x?x?x?xf32, #sparse1>, tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    %11 = call @conv_2d_nchw_fchw_CCCC_CCCC(%6, %7, %2) : (tensor<?x?x?x?xf32, #sparse1>, tensor<?x?x?x?xf32, #sparse1>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    %12 = vector.transfer_read %8[%c0, %c0, %c0, %c0], %cst_1 : tensor<?x?x?x?xf32>, vector<3x1x6x6xf32>
    vector.print %12 : vector<3x1x6x6xf32>
    %13 = vector.transfer_read %9[%c0, %c0, %c0, %c0], %cst_1 : tensor<?x?x?x?xf32>, vector<3x1x6x6xf32>
    vector.print %13 : vector<3x1x6x6xf32>
    %14 = vector.transfer_read %10[%c0, %c0, %c0, %c0], %cst_1 : tensor<?x?x?x?xf32>, vector<3x1x6x6xf32>
    vector.print %14 : vector<3x1x6x6xf32>
    %15 = vector.transfer_read %11[%c0, %c0, %c0, %c0], %cst_1 : tensor<?x?x?x?xf32>, vector<3x1x6x6xf32>
    vector.print %15 : vector<3x1x6x6xf32>
    bufferization.dealloc_tensor %inserted : tensor<?x?x?x?xf32>
    bufferization.dealloc_tensor %0 : tensor<?x?x?x?xf32>
    bufferization.dealloc_tensor %2 : tensor<?x?x?x?xf32>
    bufferization.dealloc_tensor %3 : tensor<?x?x?x?xf32>
    bufferization.dealloc_tensor %4 : tensor<?x?x?x?xf32>
    bufferization.dealloc_tensor %8 : tensor<?x?x?x?xf32>
    bufferization.dealloc_tensor %6 : tensor<?x?x?x?xf32, #sparse1>
    bufferization.dealloc_tensor %5 : tensor<?x?x?x?xf32, #sparse>
    bufferization.dealloc_tensor %7 : tensor<?x?x?x?xf32, #sparse1>
    return
  }
}

