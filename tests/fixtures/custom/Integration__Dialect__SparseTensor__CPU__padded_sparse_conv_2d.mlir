#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed, d1 : dense, d2 : compressed, d3 : compressed) }>
module {
  func.func @alloc_4d_filled_f32(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: f32) -> tensor<?x?x?x?xf32> {
    %0 = tensor.empty(%arg0, %arg1, %arg2, %arg3) : tensor<?x?x?x?xf32>
    %1 = linalg.fill ins(%arg4 : f32) outs(%0 : tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    return %1 : tensor<?x?x?x?xf32>
  }
  func.func @conv_2d_nhwc_hwcf(%arg0: tensor<3x8x8x3xf32>, %arg1: tensor<5x5x3x1xf32>, %arg2: tensor<3x8x8x1xf32>) -> tensor<3x8x8x1xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %padded = tensor.pad %arg0 low[0, 2, 2, 0] high[0, 2, 2, 0] {
    ^bb0(%arg3: index, %arg4: index, %arg5: index, %arg6: index):
      tensor.yield %cst : f32
    } : tensor<3x8x8x3xf32> to tensor<3x12x12x3xf32>
    %0 = linalg.conv_2d_nhwc_hwcf {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%padded, %arg1 : tensor<3x12x12x3xf32>, tensor<5x5x3x1xf32>) outs(%arg2 : tensor<3x8x8x1xf32>) -> tensor<3x8x8x1xf32>
    bufferization.dealloc_tensor %padded : tensor<3x12x12x3xf32>
    return %0 : tensor<3x8x8x1xf32>
  }
  func.func @conv_2d_nhwc_hwcf_CDCC_NHWC(%arg0: tensor<3x8x8x3xf32, #sparse>, %arg1: tensor<5x5x3x1xf32>) -> tensor<3x8x8x1xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<3x8x8x1xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<3x8x8x1xf32>) -> tensor<3x8x8x1xf32>
    %padded = tensor.pad %arg0 low[0, 2, 2, 0] high[0, 2, 2, 0] {
    ^bb0(%arg2: index, %arg3: index, %arg4: index, %arg5: index):
      tensor.yield %cst : f32
    } : tensor<3x8x8x3xf32, #sparse> to tensor<3x12x12x3xf32, #sparse>
    %2 = linalg.conv_2d_nhwc_hwcf {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%padded, %arg1 : tensor<3x12x12x3xf32, #sparse>, tensor<5x5x3x1xf32>) outs(%1 : tensor<3x8x8x1xf32>) -> tensor<3x8x8x1xf32>
    return %2 : tensor<3x8x8x1xf32>
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %c5 = arith.constant 5 : index
    %c6 = arith.constant 6 : index
    %c8 = arith.constant 8 : index
    %cst = arith.constant 1.000000e+01 : f32
    %cst_0 = arith.constant 2.000000e+00 : f32
    %cst_1 = arith.constant 0.000000e+00 : f32
    %0 = call @alloc_4d_filled_f32(%c5, %c5, %c3, %c1, %cst_0) : (index, index, index, index, f32) -> tensor<?x?x?x?xf32>
    %1 = call @alloc_4d_filled_f32(%c3, %c8, %c8, %c3, %cst_0) : (index, index, index, index, f32) -> tensor<?x?x?x?xf32>
    %inserted = tensor.insert %cst into %1[%c0, %c0, %c3, %c0] : tensor<?x?x?x?xf32>
    %2 = call @alloc_4d_filled_f32(%c3, %c8, %c8, %c1, %cst_1) : (index, index, index, index, f32) -> tensor<?x?x?x?xf32>
    %cast = tensor.cast %0 : tensor<?x?x?x?xf32> to tensor<5x5x3x1xf32>
    %cast_2 = tensor.cast %inserted : tensor<?x?x?x?xf32> to tensor<3x8x8x3xf32>
    %cast_3 = tensor.cast %2 : tensor<?x?x?x?xf32> to tensor<3x8x8x1xf32>
    %3 = call @conv_2d_nhwc_hwcf(%cast_2, %cast, %cast_3) : (tensor<3x8x8x3xf32>, tensor<5x5x3x1xf32>, tensor<3x8x8x1xf32>) -> tensor<3x8x8x1xf32>
    %4 = sparse_tensor.convert %cast_2 : tensor<3x8x8x3xf32> to tensor<3x8x8x3xf32, #sparse>
    %5 = call @conv_2d_nhwc_hwcf_CDCC_NHWC(%4, %cast) : (tensor<3x8x8x3xf32, #sparse>, tensor<5x5x3x1xf32>) -> tensor<3x8x8x1xf32>
    %6 = vector.transfer_read %3[%c0, %c0, %c0, %c0], %cst_1 : tensor<3x8x8x1xf32>, vector<3x8x8x1xf32>
    vector.print %6 : vector<3x8x8x1xf32>
    %7 = vector.transfer_read %5[%c0, %c0, %c0, %c0], %cst_1 : tensor<3x8x8x1xf32>, vector<3x8x8x1xf32>
    vector.print %7 : vector<3x8x8x1xf32>
    bufferization.dealloc_tensor %cast : tensor<5x5x3x1xf32>
    bufferization.dealloc_tensor %cast_2 : tensor<3x8x8x3xf32>
    bufferization.dealloc_tensor %cast_3 : tensor<3x8x8x1xf32>
    bufferization.dealloc_tensor %5 : tensor<3x8x8x1xf32>
    bufferization.dealloc_tensor %4 : tensor<3x8x8x3xf32, #sparse>
    return
  }
}

