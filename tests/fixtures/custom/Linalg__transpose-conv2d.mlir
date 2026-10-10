module {
  func.func @conv_2d_nhwc_fhwc_f64(%arg0: tensor<1x4x4x6xf64>, %arg1: tensor<8x2x2x6xf64>, %arg2: tensor<1x2x2x8xf64>) -> tensor<1x2x2x8xf64> {
    %0 = linalg.conv_2d_nhwc_fhwc {dilations = dense<1> : tensor<2xi64>, strides = dense<2> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<1x4x4x6xf64>, tensor<8x2x2x6xf64>) outs(%arg2 : tensor<1x2x2x8xf64>) -> tensor<1x2x2x8xf64>
    return %0 : tensor<1x2x2x8xf64>
  }
  func.func @conv_2d_nhwc_fhwc_f32(%arg0: tensor<1x4x4x6xf32>, %arg1: tensor<8x2x2x6xf32>, %arg2: tensor<1x2x2x8xf32>) -> tensor<1x2x2x8xf32> {
    %0 = linalg.conv_2d_nhwc_fhwc {dilations = dense<1> : tensor<2xi64>, strides = dense<2> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<1x4x4x6xf32>, tensor<8x2x2x6xf32>) outs(%arg2 : tensor<1x2x2x8xf32>) -> tensor<1x2x2x8xf32>
    return %0 : tensor<1x2x2x8xf32>
  }
  func.func @conv_2d_nhwc_fhwc_f16(%arg0: tensor<1x4x4x6xf16>, %arg1: tensor<8x2x2x6xf16>, %arg2: tensor<1x2x2x8xf16>) -> tensor<1x2x2x8xf16> {
    %0 = linalg.conv_2d_nhwc_fhwc {dilations = dense<1> : tensor<2xi64>, strides = dense<2> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<1x4x4x6xf16>, tensor<8x2x2x6xf16>) outs(%arg2 : tensor<1x2x2x8xf16>) -> tensor<1x2x2x8xf16>
    return %0 : tensor<1x2x2x8xf16>
  }
  func.func @conv_2d_nhwc_fhwc_b16(%arg0: tensor<1x4x4x6xbf16>, %arg1: tensor<8x2x2x6xbf16>, %arg2: tensor<1x2x2x8xbf16>) -> tensor<1x2x2x8xbf16> {
    %0 = linalg.conv_2d_nhwc_fhwc {dilations = dense<1> : tensor<2xi64>, strides = dense<2> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<1x4x4x6xbf16>, tensor<8x2x2x6xbf16>) outs(%arg2 : tensor<1x2x2x8xbf16>) -> tensor<1x2x2x8xbf16>
    return %0 : tensor<1x2x2x8xbf16>
  }
  func.func @conv_2d_nhwc_fhwc_i64(%arg0: tensor<1x4x4x6xi64>, %arg1: tensor<8x2x2x6xi64>, %arg2: tensor<1x2x2x8xi64>) -> tensor<1x2x2x8xi64> {
    %0 = linalg.conv_2d_nhwc_fhwc {dilations = dense<1> : tensor<2xi64>, strides = dense<2> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<1x4x4x6xi64>, tensor<8x2x2x6xi64>) outs(%arg2 : tensor<1x2x2x8xi64>) -> tensor<1x2x2x8xi64>
    return %0 : tensor<1x2x2x8xi64>
  }
  func.func @conv_2d_nhwc_fhwc_i32(%arg0: tensor<1x4x4x6xi32>, %arg1: tensor<8x2x2x6xi32>, %arg2: tensor<1x2x2x8xi32>) -> tensor<1x2x2x8xi32> {
    %0 = linalg.conv_2d_nhwc_fhwc {dilations = dense<1> : tensor<2xi64>, strides = dense<2> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<1x4x4x6xi32>, tensor<8x2x2x6xi32>) outs(%arg2 : tensor<1x2x2x8xi32>) -> tensor<1x2x2x8xi32>
    return %0 : tensor<1x2x2x8xi32>
  }
  func.func @conv_2d_nhwc_fhwc_i16(%arg0: tensor<1x4x4x6xi16>, %arg1: tensor<8x2x2x6xi16>, %arg2: tensor<1x2x2x8xi16>) -> tensor<1x2x2x8xi16> {
    %0 = linalg.conv_2d_nhwc_fhwc {dilations = dense<1> : tensor<2xi64>, strides = dense<2> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<1x4x4x6xi16>, tensor<8x2x2x6xi16>) outs(%arg2 : tensor<1x2x2x8xi16>) -> tensor<1x2x2x8xi16>
    return %0 : tensor<1x2x2x8xi16>
  }
  func.func @conv_2d_nhwc_fhwc_i8(%arg0: tensor<1x4x4x6xi8>, %arg1: tensor<8x2x2x6xi8>, %arg2: tensor<1x2x2x8xi8>) -> tensor<1x2x2x8xi8> {
    %0 = linalg.conv_2d_nhwc_fhwc {dilations = dense<1> : tensor<2xi64>, strides = dense<2> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<1x4x4x6xi8>, tensor<8x2x2x6xi8>) outs(%arg2 : tensor<1x2x2x8xi8>) -> tensor<1x2x2x8xi8>
    return %0 : tensor<1x2x2x8xi8>
  }
  func.func @conv_2d_nhwc_fhwc_q(%arg0: tensor<1x4x4x6xf32>, %arg1: tensor<8x2x2x6xf32>, %arg2: tensor<1x2x2x8xf32>, %arg3: i32, %arg4: i32) -> tensor<1x2x2x8xf32> {
    %0 = linalg.conv_2d_nhwc_fhwc_q {dilations = dense<1> : tensor<2xi64>, strides = dense<2> : tensor<2xi64>} ins(%arg0, %arg1, %arg3, %arg4 : tensor<1x4x4x6xf32>, tensor<8x2x2x6xf32>, i32, i32) outs(%arg2 : tensor<1x2x2x8xf32>) -> tensor<1x2x2x8xf32>
    return %0 : tensor<1x2x2x8xf32>
  }
  func.func @conv_2d_nhwc_fhwc_f32_unit_stride(%arg0: tensor<1x4x4x6xf32>, %arg1: tensor<8x2x2x6xf32>, %arg2: tensor<1x3x3x8xf32>) -> tensor<1x3x3x8xf32> {
    %0 = linalg.conv_2d_nhwc_fhwc {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<1x4x4x6xf32>, tensor<8x2x2x6xf32>) outs(%arg2 : tensor<1x3x3x8xf32>) -> tensor<1x3x3x8xf32>
    return %0 : tensor<1x3x3x8xf32>
  }
  func.func @conv_2d_nhwc_fhwc_f32_2_dialation(%arg0: tensor<1x4x4x6xf32>, %arg1: tensor<8x2x2x6xf32>, %arg2: tensor<1x2x2x8xf32>) -> tensor<1x2x2x8xf32> {
    %0 = linalg.conv_2d_nhwc_fhwc {dilations = dense<2> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<1x4x4x6xf32>, tensor<8x2x2x6xf32>) outs(%arg2 : tensor<1x2x2x8xf32>) -> tensor<1x2x2x8xf32>
    return %0 : tensor<1x2x2x8xf32>
  }
  func.func @conv_2d_nhwc_fhwc_memref(%arg0: memref<1x4x4x6xf32>, %arg1: memref<8x2x2x6xf32>, %arg2: memref<1x2x2x8xf32>) -> memref<1x2x2x8xf32> {
    linalg.conv_2d_nhwc_fhwc {dilations = dense<1> : tensor<2xi64>, strides = dense<2> : tensor<2xi64>} ins(%arg0, %arg1 : memref<1x4x4x6xf32>, memref<8x2x2x6xf32>) outs(%arg2 : memref<1x2x2x8xf32>)
    return %arg2 : memref<1x2x2x8xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.conv_2d_nhwc_fhwc", "linalg.conv_2d_nhwc_fhwc_q"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.transpose_conv2d %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

