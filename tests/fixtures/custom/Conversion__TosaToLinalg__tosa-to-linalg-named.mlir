module {
  func.func @matmul(%arg0: tensor<1x5x3xf32>, %arg1: tensor<1x3x6xf32>) -> tensor<1x5x6xf32> {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %2 = tosa.matmul %arg0, %arg1, %0, %1 : (tensor<1x5x3xf32>, tensor<1x3x6xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x5x6xf32>
    return %2 : tensor<1x5x6xf32>
  }
}

// -----
module {
  func.func @matmul_quantized(%arg0: tensor<1x5x3xi8>, %arg1: tensor<1x3x6xi8>) -> tensor<1x5x6xi32> {
    %0 = "tosa.const"() <{values = dense<1> : tensor<1xi8>}> : () -> tensor<1xi8>
    %1 = "tosa.const"() <{values = dense<2> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = tosa.matmul %arg0, %arg1, %0, %1 : (tensor<1x5x3xi8>, tensor<1x3x6xi8>, tensor<1xi8>, tensor<1xi8>) -> tensor<1x5x6xi32>
    return %2 : tensor<1x5x6xi32>
  }
}

// -----
module {
  func.func @matmul_dyn_batch(%arg0: tensor<?x5x3xf32>, %arg1: tensor<?x3x6xf32>) -> tensor<?x5x6xf32> {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %2 = tosa.matmul %arg0, %arg1, %0, %1 : (tensor<?x5x3xf32>, tensor<?x3x6xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<?x5x6xf32>
    return %2 : tensor<?x5x6xf32>
  }
}

// -----
module {
  func.func @matmul_dyn_independent_dim(%arg0: tensor<1x5x3xf32>, %arg1: tensor<1x3x?xf32>) -> tensor<1x5x?xf32> {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %2 = tosa.matmul %arg0, %arg1, %0, %1 : (tensor<1x5x3xf32>, tensor<1x3x?xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x5x?xf32>
    return %2 : tensor<1x5x?xf32>
  }
}

// -----
module {
  func.func @matmul_dyn_independent_dim(%arg0: tensor<1x5x?xf32>, %arg1: tensor<1x?x6xf32>) -> tensor<1x5x6xf32> {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %2 = tosa.matmul %arg0, %arg1, %0, %1 : (tensor<1x5x?xf32>, tensor<1x?x6xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x5x6xf32>
    return %2 : tensor<1x5x6xf32>
  }
}

// -----
module {
  func.func @matmul_dyn_output(%arg0: tensor<1x1x8xf32>, %arg1: tensor<1x8x1xf32>) -> tensor<?x1x1xf32> {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %2 = tosa.matmul %arg0, %arg1, %0, %1 : (tensor<1x1x8xf32>, tensor<1x8x1xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<?x1x1xf32>
    return %2 : tensor<?x1x1xf32>
  }
}

// -----
module {
  func.func @max_pool(%arg0: tensor<1x6x34x62xf32>) {
    %0 = tosa.max_pool2d %arg0 {kernel = array<i64: 3, 3>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x6x34x62xf32>) -> tensor<1x4x32x62xf32>
    return
  }
  func.func @max_pool_padded(%arg0: tensor<1x6x34x62xf32>) {
    %0 = tosa.max_pool2d %arg0 {kernel = array<i64: 3, 3>, pad = array<i64: 0, 0, 0, 1>, stride = array<i64: 1, 1>} : (tensor<1x6x34x62xf32>) -> tensor<1x4x33x62xf32>
    return
  }
  func.func @max_pool_dyn(%arg0: tensor<?x6x34x62xf32>) {
    %0 = tosa.max_pool2d %arg0 {kernel = array<i64: 3, 3>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<?x6x34x62xf32>) -> tensor<?x4x32x62xf32>
    return
  }
  func.func @max_pool_i8(%arg0: tensor<1x6x34x62xi8>) {
    %0 = tosa.max_pool2d %arg0 {kernel = array<i64: 3, 3>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x6x34x62xi8>) -> tensor<1x4x32x62xi8>
    return
  }
  func.func @max_pool_ui8(%arg0: tensor<1x6x34x62xui8>) -> tensor<1x4x32x62xui8> {
    %0 = tosa.max_pool2d %arg0 {kernel = array<i64: 3, 3>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x6x34x62xui8>) -> tensor<1x4x32x62xui8>
    return %0 : tensor<1x4x32x62xui8>
  }
  func.func @max_pool_i16(%arg0: tensor<1x6x34x62xi16>) {
    %0 = tosa.max_pool2d %arg0 {kernel = array<i64: 3, 3>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x6x34x62xi16>) -> tensor<1x4x32x62xi16>
    return
  }
  func.func @max_pool_i32(%arg0: tensor<1x6x34x62xi32>) {
    %0 = tosa.max_pool2d %arg0 {kernel = array<i64: 3, 3>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x6x34x62xi32>) -> tensor<1x4x32x62xi32>
    return
  }
  func.func @max_pool_all_dynamic(%arg0: tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> {
    %0 = tosa.max_pool2d %arg0 {kernel = array<i64: 2, 5>, pad = array<i64: 0, 0, 2, 2>, stride = array<i64: 1, 1>} : (tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    return %0 : tensor<?x?x?x?xf32>
  }
}

// -----
module {
  func.func @avg_pool_f32(%arg0: tensor<1x6x34x62xf32>) -> tensor<1x5x33x62xf32> {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %2 = tosa.avg_pool2d %arg0, %0, %1 {acc_type = f32, kernel = array<i64: 4, 4>, pad = array<i64: 1, 1, 1, 1>, stride = array<i64: 1, 1>} : (tensor<1x6x34x62xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x5x33x62xf32>
    return %2 : tensor<1x5x33x62xf32>
  }
}

// -----
module {
  func.func @avg_pool_f16_f32acc(%arg0: tensor<1x6x34x62xf16>) -> tensor<1x5x33x62xf16> {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf16>}> : () -> tensor<1xf16>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf16>}> : () -> tensor<1xf16>
    %2 = tosa.avg_pool2d %arg0, %0, %1 {acc_type = f32, kernel = array<i64: 4, 4>, pad = array<i64: 1, 1, 1, 1>, stride = array<i64: 1, 1>} : (tensor<1x6x34x62xf16>, tensor<1xf16>, tensor<1xf16>) -> tensor<1x5x33x62xf16>
    return %2 : tensor<1x5x33x62xf16>
  }
}

// -----
module {
  func.func @avg_pool_i8(%arg0: tensor<1x6x34x62xi8>) -> tensor<1x5x33x62xi8> {
    %0 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %1 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = tosa.avg_pool2d %arg0, %0, %1 {acc_type = i32, kernel = array<i64: 4, 4>, pad = array<i64: 1, 1, 1, 1>, stride = array<i64: 1, 1>} : (tensor<1x6x34x62xi8>, tensor<1xi8>, tensor<1xi8>) -> tensor<1x5x33x62xi8>
    return %2 : tensor<1x5x33x62xi8>
  }
}

// -----
module {
  func.func @avg_pool_dyn(%arg0: tensor<?x6x34x62xf32>) -> tensor<?x5x33x62xf32> {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %2 = tosa.avg_pool2d %arg0, %0, %1 {acc_type = f32, kernel = array<i64: 4, 4>, pad = array<i64: 1, 1, 1, 1>, stride = array<i64: 1, 1>} : (tensor<?x6x34x62xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<?x5x33x62xf32>
    return %2 : tensor<?x5x33x62xf32>
  }
}

// -----
module {
  func.func @conv2d_scalar_bias_f32(%arg0: tensor<1x49x42x27xf32>, %arg1: tensor<28x3x3x27xf32>, %arg2: tensor<1xf32>) {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %2 = tosa.conv2d %arg0, %arg1, %arg2, %0, %1 {acc_type = f32, dilation = array<i64: 2, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x49x42x27xf32>, tensor<28x3x3x27xf32>, tensor<1xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x45x40x28xf32>
    return
  }
}

// -----
module {
  func.func @conv2d_i8(%arg0: tensor<1x49x42x27xi8>, %arg1: tensor<28x1x1x27xi8>, %arg2: tensor<28xi8>) {
    %0 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %1 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = tosa.conv2d %arg0, %arg1, %arg2, %0, %1 {acc_type = i32, dilation = array<i64: 2, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x49x42x27xi8>, tensor<28x1x1x27xi8>, tensor<28xi8>, tensor<1xi8>, tensor<1xi8>) -> tensor<1x49x42x28xi32>
    return
  }
}

// -----
module {
  func.func @conv2d_f32(%arg0: tensor<1x49x42x27xf32>, %arg1: tensor<28x3x3x27xf32>, %arg2: tensor<28xf32>) {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %2 = tosa.conv2d %arg0, %arg1, %arg2, %0, %1 {acc_type = f32, dilation = array<i64: 2, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x49x42x27xf32>, tensor<28x3x3x27xf32>, tensor<28xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x45x40x28xf32>
    return
  }
}

// -----
module {
  func.func @conv2d_dyn(%arg0: tensor<?x49x42x27xf32>, %arg1: tensor<28x3x3x27xf32>, %arg2: tensor<28xf32>) {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %2 = tosa.conv2d %arg0, %arg1, %arg2, %0, %1 {acc_type = f32, dilation = array<i64: 2, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<?x49x42x27xf32>, tensor<28x3x3x27xf32>, tensor<28xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<?x45x40x28xf32>
    return
  }
}

// -----
module {
  func.func @conv2d_dyn_w_h(%arg0: tensor<1x?x?x27xf32>, %arg1: tensor<28x3x3x27xf32>, %arg2: tensor<28xf32>) {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %2 = tosa.conv2d %arg0, %arg1, %arg2, %0, %1 {acc_type = f32, dilation = array<i64: 2, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x?x?x27xf32>, tensor<28x3x3x27xf32>, tensor<28xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x?x?x28xf32>
    return
  }
}

// -----
module {
  func.func @conv2d_dyn_output(%arg0: tensor<2x6x5x4xf32>, %arg1: tensor<4x3x3x4xf32>, %arg2: tensor<4xf32>) {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %2 = tosa.conv2d %arg0, %arg1, %arg2, %0, %1 {acc_type = f32, dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<2x6x5x4xf32>, tensor<4x3x3x4xf32>, tensor<4xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<?x4x3x4xf32>
    return
  }
}

// -----
module {
  func.func @conv2d_padded_f32(%arg0: tensor<1x47x40x28xf32>, %arg1: tensor<28x3x3x28xf32>, %arg2: tensor<28xf32>) {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %2 = tosa.conv2d %arg0, %arg1, %arg2, %0, %1 {acc_type = f32, dilation = array<i64: 2, 1>, pad = array<i64: 1, 1, 1, 1>, stride = array<i64: 1, 1>} : (tensor<1x47x40x28xf32>, tensor<28x3x3x28xf32>, tensor<28xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x45x40x28xf32>
    return
  }
}

// -----
module {
  func.func @conv2d_quant(%arg0: tensor<1x12x12x1xi8>, %arg1: tensor<1024x3x3x1xi8>, %arg2: tensor<1024xi32>) {
    %0 = "tosa.const"() <{values = dense<-22> : tensor<1xi8>}> : () -> tensor<1xi8>
    %1 = "tosa.const"() <{values = dense<42> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = tosa.conv2d %arg0, %arg1, %arg2, %0, %1 {acc_type = i32, dilation = array<i64: 1, 1>, pad = array<i64: 1, 1, 1, 1>, stride = array<i64: 1, 1>} : (tensor<1x12x12x1xi8>, tensor<1024x3x3x1xi8>, tensor<1024xi32>, tensor<1xi8>, tensor<1xi8>) -> tensor<1x12x12x1024xi32>
    return
  }
}

// -----
module {
  func.func @conv2d_f16_f32_acc(%arg0: tensor<1x49x42x27xf16>, %arg1: tensor<28x3x3x27xf16>, %arg2: tensor<28xf16>) {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf16>}> : () -> tensor<1xf16>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf16>}> : () -> tensor<1xf16>
    %2 = tosa.conv2d %arg0, %arg1, %arg2, %0, %1 {acc_type = f32, dilation = array<i64: 2, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x49x42x27xf16>, tensor<28x3x3x27xf16>, tensor<28xf16>, tensor<1xf16>, tensor<1xf16>) -> tensor<1x45x40x28xf16>
    return
  }
}

// -----
module {
  func.func @depthwise_conv(%arg0: tensor<1x7x5x3xf32>, %arg1: tensor<3x1x3x11xf32>, %arg2: tensor<33xf32>) {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %2 = tosa.depthwise_conv2d %arg0, %arg1, %arg2, %0, %1 {acc_type = f32, dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x7x5x3xf32>, tensor<3x1x3x11xf32>, tensor<33xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x5x5x33xf32>
    return
  }
}

// -----
module {
  func.func @depthwise_conv_scalar_bias(%arg0: tensor<1x7x5x3xf32>, %arg1: tensor<3x1x3x11xf32>, %arg2: tensor<1xf32>) {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %2 = tosa.depthwise_conv2d %arg0, %arg1, %arg2, %0, %1 {acc_type = f32, dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x7x5x3xf32>, tensor<3x1x3x11xf32>, tensor<1xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x5x5x33xf32>
    return
  }
}

// -----
module {
  func.func @depthwise_conv_dyn(%arg0: tensor<?x7x5x3xf32>, %arg1: tensor<3x1x3x11xf32>, %arg2: tensor<33xf32>) {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %2 = tosa.depthwise_conv2d %arg0, %arg1, %arg2, %0, %1 {acc_type = f32, dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<?x7x5x3xf32>, tensor<3x1x3x11xf32>, tensor<33xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<?x5x5x33xf32>
    return
  }
}

// -----
module {
  func.func @depthwise_conv_strides(%arg0: tensor<1x11x9x3xf32>, %arg1: tensor<3x1x3x11xf32>, %arg2: tensor<33xf32>) {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %2 = tosa.depthwise_conv2d %arg0, %arg1, %arg2, %0, %1 {acc_type = f32, dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 2, 2>} : (tensor<1x11x9x3xf32>, tensor<3x1x3x11xf32>, tensor<33xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x5x5x33xf32>
    return
  }
}

// -----
module {
  func.func @depthwise_conv_quant(%arg0: tensor<1x12x12x4xi8>, %arg1: tensor<3x3x4x128xi8>, %arg2: tensor<512xi32>) {
    %0 = "tosa.const"() <{values = dense<-128> : tensor<1xi8>}> : () -> tensor<1xi8>
    %1 = "tosa.const"() <{values = dense<42> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = tosa.depthwise_conv2d %arg0, %arg1, %arg2, %0, %1 {acc_type = i32, dilation = array<i64: 1, 1>, pad = array<i64: 1, 1, 1, 1>, stride = array<i64: 1, 1>} : (tensor<1x12x12x4xi8>, tensor<3x3x4x128xi8>, tensor<512xi32>, tensor<1xi8>, tensor<1xi8>) -> tensor<1x12x12x512xi32>
    return
  }
}

// -----
module {
  func.func @depthwise_conv_quant_dilations(%arg0: tensor<1x14x14x4xi8>, %arg1: tensor<3x3x4x128xi8>, %arg2: tensor<512xi32>) {
    %0 = "tosa.const"() <{values = dense<-128> : tensor<1xi8>}> : () -> tensor<1xi8>
    %1 = "tosa.const"() <{values = dense<42> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = tosa.depthwise_conv2d %arg0, %arg1, %arg2, %0, %1 {acc_type = i32, dilation = array<i64: 2, 2>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x14x14x4xi8>, tensor<3x3x4x128xi8>, tensor<512xi32>, tensor<1xi8>, tensor<1xi8>) -> tensor<1x10x10x512xi32>
    return
  }
  func.func @depthwise_conv2d_dyn_w_h(%arg0: tensor<2x?x?x3xf32>, %arg1: tensor<3x6x3x5xf32>, %arg2: tensor<15xf32>) {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %2 = tosa.depthwise_conv2d %arg0, %arg1, %arg2, %0, %1 {acc_type = f32, dilation = array<i64: 2, 1>, pad = array<i64: 1, 2, 3, 4>, stride = array<i64: 1, 2>} : (tensor<2x?x?x3xf32>, tensor<3x6x3x5xf32>, tensor<15xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<2x?x?x15xf32>
    return
  }
}

// -----
module {
  func.func @depthwise_int_conv_zero_zp(%arg0: tensor<1x7x5x3xi8>, %arg1: tensor<3x1x3x11xi8>, %arg2: tensor<33xi32>) {
    %0 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %1 = "tosa.const"() <{values = dense<0> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = tosa.depthwise_conv2d %arg0, %arg1, %arg2, %0, %1 {acc_type = i32, dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x7x5x3xi8>, tensor<3x1x3x11xi8>, tensor<33xi32>, tensor<1xi8>, tensor<1xi8>) -> tensor<1x5x5x33xi32>
    return
  }
}

// -----
module {
  func.func @depthwise_conv2d_f16_f32_acc(%arg0: tensor<1x7x5x3xf16>, %arg1: tensor<3x1x3x11xf16>, %arg2: tensor<33xf16>) {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf16>}> : () -> tensor<1xf16>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf16>}> : () -> tensor<1xf16>
    %2 = tosa.depthwise_conv2d %arg0, %arg1, %arg2, %0, %1 {acc_type = f32, dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x7x5x3xf16>, tensor<3x1x3x11xf16>, tensor<33xf16>, tensor<1xf16>, tensor<1xf16>) -> tensor<1x5x5x33xf16>
    return
  }
}

// -----
module {
  func.func @conv3d_f32(%arg0: tensor<1x49x48x47x27xf32>, %arg1: tensor<43x3x4x5x27xf32>, %arg2: tensor<43xf32>) {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %2 = tosa.conv3d %arg0, %arg1, %arg2, %0, %1 {acc_type = f32, dilation = array<i64: 1, 1, 1>, pad = array<i64: 0, 0, 0, 0, 0, 0>, stride = array<i64: 1, 1, 1>} : (tensor<1x49x48x47x27xf32>, tensor<43x3x4x5x27xf32>, tensor<43xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x47x45x43x43xf32>
    return
  }
}

// -----
module {
  func.func @conv3d_scalar_bias_f32(%arg0: tensor<1x49x48x47x27xf32>, %arg1: tensor<28x3x4x5x27xf32>, %arg2: tensor<1xf32>) {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %2 = tosa.conv3d %arg0, %arg1, %arg2, %0, %1 {acc_type = f32, dilation = array<i64: 1, 1, 1>, pad = array<i64: 0, 0, 0, 0, 0, 0>, stride = array<i64: 1, 1, 1>} : (tensor<1x49x48x47x27xf32>, tensor<28x3x4x5x27xf32>, tensor<1xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x47x45x43x28xf32>
    return
  }
}

// -----
module {
  func.func @conv3d_i8(%arg0: tensor<1x49x48x47x27xi8>, %arg1: tensor<43x3x4x5x27xi8>, %arg2: tensor<43xi32>) {
    %0 = "tosa.const"() <{values = dense<-128> : tensor<1xi8>}> : () -> tensor<1xi8>
    %1 = "tosa.const"() <{values = dense<42> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = tosa.conv3d %arg0, %arg1, %arg2, %0, %1 {acc_type = i32, dilation = array<i64: 1, 1, 1>, pad = array<i64: 0, 0, 0, 0, 0, 0>, stride = array<i64: 1, 1, 1>} : (tensor<1x49x48x47x27xi8>, tensor<43x3x4x5x27xi8>, tensor<43xi32>, tensor<1xi8>, tensor<1xi8>) -> tensor<1x47x45x43x43xi32>
    return
  }
}

// -----
module {
  func.func @conv3d_f16_f32_acc(%arg0: tensor<1x49x48x47x27xf16>, %arg1: tensor<43x3x4x5x27xf16>, %arg2: tensor<43xf16>) {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf16>}> : () -> tensor<1xf16>
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf16>}> : () -> tensor<1xf16>
    %2 = tosa.conv3d %arg0, %arg1, %arg2, %0, %1 {acc_type = f32, dilation = array<i64: 1, 1, 1>, pad = array<i64: 0, 0, 0, 0, 0, 0>, stride = array<i64: 1, 1, 1>} : (tensor<1x49x48x47x27xf16>, tensor<43x3x4x5x27xf16>, tensor<43xf16>, tensor<1xf16>, tensor<1xf16>) -> tensor<1x47x45x43x43xf16>
    return
  }
}

// -----
module {
  func.func @test_transpose(%arg0: tensor<1x2x3xi32>) {
    %0 = tosa.transpose %arg0 {perms = array<i32: 1, 2, 0>} : (tensor<1x2x3xi32>) -> tensor<2x3x1xi32>
    return
  }
}

// -----
module {
  func.func @test_transpose_dyn(%arg0: tensor<1x?x3x4xi32>) {
    %0 = tosa.transpose %arg0 {perms = array<i32: 1, 3, 0, 2>} : (tensor<1x?x3x4xi32>) -> tensor<?x4x1x3xi32>
    return
  }
}

// -----
module {
  func.func @test_transpose_dyn_multiple_2d(%arg0: tensor<?x?xf32>) {
    %0 = tosa.transpose %arg0 {perms = array<i32: 1, 0>} : (tensor<?x?xf32>) -> tensor<?x?xf32>
    return
  }
}

// -----
module {
  func.func @test_transpose_dyn_multiple_3d(%arg0: tensor<?x?x?xf32>) {
    %0 = tosa.transpose %arg0 {perms = array<i32: 2, 0, 1>} : (tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    return
  }
}

// -----
module {
  func.func @max_pool2d_nan_propagate(%arg0: tensor<1x6x34x62xf32>) -> tensor<1x4x32x62xf32> {
    %0 = tosa.max_pool2d %arg0 {kernel = array<i64: 3, 3>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x6x34x62xf32>) -> tensor<1x4x32x62xf32>
    return %0 : tensor<1x4x32x62xf32>
  }
}

// -----
module {
  func.func @max_pool2d_nan_ignore_int(%arg0: tensor<1x6x34x62xi8>) -> tensor<1x4x32x62xi8> {
    %0 = tosa.max_pool2d %arg0 {kernel = array<i64: 3, 3>, nan_mode = IGNORE, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x6x34x62xi8>) -> tensor<1x4x32x62xi8>
    return %0 : tensor<1x4x32x62xi8>
  }
}

// -----
module {
  func.func @max_pool2d_nan_ignore(%arg0: tensor<1x6x34x62xf32>) -> tensor<1x4x32x62xf32> {
    %0 = tosa.max_pool2d %arg0 {kernel = array<i64: 3, 3>, nan_mode = IGNORE, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<1x6x34x62xf32>) -> tensor<1x4x32x62xf32>
    return %0 : tensor<1x4x32x62xf32>
  }
}

