module {
}

// -----
module {
  func.func @depthwise_conv2d_as_mul(%arg0: tensor<4x10x10x2xf32>, %arg1: tensor<1x1x2x3xf32>, %arg2: tensor<6xf32>) -> tensor<4x10x10x6xf32> {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = tosa.depthwise_conv2d %arg0, %arg1, %arg2, %0, %0 {acc_type = f32, dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<4x10x10x2xf32>, tensor<1x1x2x3xf32>, tensor<6xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<4x10x10x6xf32>
    return %1 : tensor<4x10x10x6xf32>
  }
}

// -----
module {
  func.func @depthwise_conv2d_as_mul_q(%arg0: tensor<4x10x10x2xi8>, %arg1: tensor<1x1x2x3xi8>, %arg2: tensor<6xi32>) -> tensor<4x10x10x6xi32> {
    %0 = "tosa.const"() <{values = dense<7> : tensor<1xi8>}> : () -> tensor<1xi8>
    %1 = "tosa.const"() <{values = dense<11> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = tosa.depthwise_conv2d %arg0, %arg1, %arg2, %0, %1 {acc_type = i32, dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<4x10x10x2xi8>, tensor<1x1x2x3xi8>, tensor<6xi32>, tensor<1xi8>, tensor<1xi8>) -> tensor<4x10x10x6xi32>
    return %2 : tensor<4x10x10x6xi32>
  }
}

// -----
module {
  func.func @depthwise_conv2d_as_mul_padded(%arg0: tensor<4x10x10x2xf32>, %arg1: tensor<1x1x2x3xf32>, %arg2: tensor<6xf32>) -> tensor<4x12x12x6xf32> {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = tosa.depthwise_conv2d %arg0, %arg1, %arg2, %0, %0 {acc_type = f32, dilation = array<i64: 1, 1>, pad = array<i64: 1, 1, 1, 1>, stride = array<i64: 1, 1>} : (tensor<4x10x10x2xf32>, tensor<1x1x2x3xf32>, tensor<6xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<4x12x12x6xf32>
    return %1 : tensor<4x12x12x6xf32>
  }
}

// -----
module {
  func.func @depthwise_conv2d_quant_type(%arg0: tensor<4x10x10x2x!quant.uniform<i8:f32, 0.015684768557548523>>, %arg1: tensor<1x1x2x3x!quant.uniform<i8<-127:127>:f32, 0.015680249780416489>>, %arg2: tensor<6xi32>) -> tensor<4x10x10x6x!quant.uniform<i32:f32, 0.078431375324726104>> {
    %0 = "tosa.const"() <{values = dense<7> : tensor<1xi8>}> : () -> tensor<1xi8>
    %1 = "tosa.const"() <{values = dense<11> : tensor<1xi8>}> : () -> tensor<1xi8>
    %2 = tosa.depthwise_conv2d %arg0, %arg1, %arg2, %0, %1 {acc_type = i32, dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<4x10x10x2x!quant.uniform<i8:f32, 0.015684768557548523>>, tensor<1x1x2x3x!quant.uniform<i8<-127:127>:f32, 0.015680249780416489>>, tensor<6xi32>, tensor<1xi8>, tensor<1xi8>) -> tensor<4x10x10x6x!quant.uniform<i32:f32, 0.078431375324726104>>
    return %2 : tensor<4x10x10x6x!quant.uniform<i32:f32, 0.078431375324726104>>
  }
}

// -----
module {
  func.func @depthwise_conv2d_no_const_zero_point(%arg0: tensor<4x10x10x2xi8>, %arg1: tensor<1x1x2x3xi8>, %arg2: tensor<6xi32>, %arg3: tensor<1xi8>, %arg4: tensor<1xi8>) -> tensor<4x10x10x6xi32> {
    %0 = tosa.depthwise_conv2d %arg0, %arg1, %arg2, %arg3, %arg4 {acc_type = i32, dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<4x10x10x2xi8>, tensor<1x1x2x3xi8>, tensor<6xi32>, tensor<1xi8>, tensor<1xi8>) -> tensor<4x10x10x6xi32>
    return %0 : tensor<4x10x10x6xi32>
  }
}

// -----
module {
  func.func @depthwise_conv2d_as_mul_dynamic_batch_bias(%arg0: tensor<?x10x10x2xf32>, %arg1: tensor<1x1x2x3xf32>, %arg2: tensor<?xf32>) -> tensor<?x10x10x6xf32> {
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32>
    %1 = tosa.depthwise_conv2d %arg0, %arg1, %arg2, %0, %0 {acc_type = f32, dilation = array<i64: 1, 1>, pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>} : (tensor<?x10x10x2xf32>, tensor<1x1x2x3xf32>, tensor<?xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<?x10x10x6xf32>
    return %1 : tensor<?x10x10x6xf32>
  }
}

