module {
  func.func @generalize_pad_tensor_static_shape(%arg0: tensor<1x28x28x1xf32>) -> tensor<1x32x32x1xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %padded = tensor.pad %arg0 low[0, 2, 2, 0] high[0, 2, 2, 0] {
    ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: index):
      tensor.yield %cst : f32
    } : tensor<1x28x28x1xf32> to tensor<1x32x32x1xf32>
    return %padded : tensor<1x32x32x1xf32>
  }
  func.func @generalize_pad_tensor_dynamic_shape(%arg0: tensor<4x?x2x?xf32>, %arg1: index) -> tensor<4x?x?x?xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %padded = tensor.pad %arg0 low[%c0, %c0, %arg1, %c0] high[%c0, %c0, %c0, %arg1] {
    ^bb0(%arg2: index, %arg3: index, %arg4: index, %arg5: index):
      tensor.yield %cst : f32
    } : tensor<4x?x2x?xf32> to tensor<4x?x?x?xf32>
    return %padded : tensor<4x?x?x?xf32>
  }
}

