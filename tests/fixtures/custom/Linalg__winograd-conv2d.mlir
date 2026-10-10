module {
  func.func @conv2d_4x4_3x3(%arg0: tensor<2x6x6x5xf32>, %arg1: tensor<2x3x3x5xf32>, %arg2: tensor<1xf32>, %arg3: tensor<2x4x4x2xf32>) -> tensor<2x4x4x2xf32> {
    %0 = linalg.conv_2d_nhwc_fhwc {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<2x6x6x5xf32>, tensor<2x3x3x5xf32>) outs(%arg3 : tensor<2x4x4x2xf32>) -> tensor<2x4x4x2xf32>
    return %0 : tensor<2x4x4x2xf32>
  }
}

// -----
module {
  func.func @conv2d_2x2_5x5(%arg0: tensor<2x6x6x5xf32>, %arg1: tensor<2x5x5x5xf32>, %arg2: tensor<1xf32>, %arg3: tensor<2x2x2x2xf32>) -> tensor<2x2x2x2xf32> {
    %0 = linalg.conv_2d_nhwc_fhwc {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<2x6x6x5xf32>, tensor<2x5x5x5xf32>) outs(%arg3 : tensor<2x2x2x2xf32>) -> tensor<2x2x2x2xf32>
    return %0 : tensor<2x2x2x2xf32>
  }
}

// -----
module {
  func.func @conv2d_1x4_1x3(%arg0: tensor<2x1x6x5xf32>, %arg1: tensor<2x1x3x5xf32>, %arg2: tensor<1xf32>, %arg3: tensor<2x1x4x2xf32>) -> tensor<2x1x4x2xf32> {
    %0 = linalg.conv_2d_nhwc_fhwc {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<2x1x6x5xf32>, tensor<2x1x3x5xf32>) outs(%arg3 : tensor<2x1x4x2xf32>) -> tensor<2x1x4x2xf32>
    return %0 : tensor<2x1x4x2xf32>
  }
}

// -----
module {
  func.func @conv2d_4x1_3x1(%arg0: tensor<2x6x1x5xf32>, %arg1: tensor<2x3x1x5xf32>, %arg2: tensor<1xf32>, %arg3: tensor<2x4x1x2xf32>) -> tensor<2x4x1x2xf32> {
    %0 = linalg.conv_2d_nhwc_fhwc {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<2x6x1x5xf32>, tensor<2x3x1x5xf32>) outs(%arg3 : tensor<2x4x1x2xf32>) -> tensor<2x4x1x2xf32>
    return %0 : tensor<2x4x1x2xf32>
  }
}

// -----
module {
  func.func @conv2d_aligned(%arg0: tensor<2x10x10x5xf32>, %arg1: tensor<2x3x3x5xf32>, %arg2: tensor<1xf32>, %arg3: tensor<2x8x8x2xf32>) -> tensor<2x8x8x2xf32> {
    %0 = linalg.conv_2d_nhwc_fhwc {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<2x10x10x5xf32>, tensor<2x3x3x5xf32>) outs(%arg3 : tensor<2x8x8x2xf32>) -> tensor<2x8x8x2xf32>
    return %0 : tensor<2x8x8x2xf32>
  }
}

// -----
module {
  func.func @conv2d_unaligned(%arg0: tensor<2x11x11x5xf32>, %arg1: tensor<2x3x3x5xf32>, %arg2: tensor<1xf32>, %arg3: tensor<2x9x9x2xf32>) -> tensor<2x9x9x2xf32> {
    %0 = linalg.conv_2d_nhwc_fhwc {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<2x11x11x5xf32>, tensor<2x3x3x5xf32>) outs(%arg3 : tensor<2x9x9x2xf32>) -> tensor<2x9x9x2xf32>
    return %0 : tensor<2x9x9x2xf32>
  }
}

// -----
module {
  func.func @conv2d_type_promotion(%arg0: tensor<2x6x6x5xf16>, %arg1: tensor<2x3x3x5xf16>, %arg2: tensor<1xf32>, %arg3: tensor<2x4x4x2xf32>) -> tensor<2x4x4x2xf32> {
    %0 = linalg.conv_2d_nhwc_fhwc {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<2x6x6x5xf16>, tensor<2x3x3x5xf16>) outs(%arg3 : tensor<2x4x4x2xf32>) -> tensor<2x4x4x2xf32>
    return %0 : tensor<2x4x4x2xf32>
  }
}

// -----
module {
  func.func @conv2d_unsupported_1(%arg0: tensor<2x6x5x5xf32>, %arg1: tensor<2x3x2x5xf32>, %arg2: tensor<1xf32>, %arg3: tensor<2x4x4x2xf32>) -> tensor<2x4x4x2xf32> {
    %0 = linalg.conv_2d_nhwc_fhwc {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<2x6x5x5xf32>, tensor<2x3x2x5xf32>) outs(%arg3 : tensor<2x4x4x2xf32>) -> tensor<2x4x4x2xf32>
    return %0 : tensor<2x4x4x2xf32>
  }
}

// -----
module {
  func.func @conv2d_unsupported_2(%arg0: tensor<2x7x7x5xf32>, %arg1: tensor<2x4x4x5xf32>, %arg2: tensor<1xf32>, %arg3: tensor<2x4x4x2xf32>) -> tensor<2x4x4x2xf32> {
    %0 = linalg.conv_2d_nhwc_fhwc {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<2x7x7x5xf32>, tensor<2x4x4x5xf32>) outs(%arg3 : tensor<2x4x4x2xf32>) -> tensor<2x4x4x2xf32>
    return %0 : tensor<2x4x4x2xf32>
  }
}

// -----
module {
  func.func @conv2d_unsupported_3(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<2x3x3x5xf32>, %arg2: tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> {
    %0 = linalg.conv_2d_nhwc_fhwc {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<?x?x?x?xf32>, tensor<2x3x3x5xf32>) outs(%arg2 : tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    return %0 : tensor<?x?x?x?xf32>
  }
}

