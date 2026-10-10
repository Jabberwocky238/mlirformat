module {
  func.func @conv2d(%arg0: tensor<2x10x10x5xf32>, %arg1: tensor<2x3x3x5xf32>, %arg2: tensor<1xf32>, %arg3: tensor<2x8x8x2xf32>) -> tensor<2x8x8x2xf32> {
    %0 = linalg.conv_2d_nhwc_fhwc {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<2x10x10x5xf32>, tensor<2x3x3x5xf32>) outs(%arg3 : tensor<2x8x8x2xf32>) -> tensor<2x8x8x2xf32>
    return %0 : tensor<2x8x8x2xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.conv_2d_nhwc_fhwc"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.winograd_conv2d %0 {fmr = 1 : i32} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @conv2d_unaligned(%arg0: tensor<2x11x11x5xf32>, %arg1: tensor<2x3x3x5xf32>, %arg2: tensor<1xf32>, %arg3: tensor<2x9x9x2xf32>) -> tensor<2x9x9x2xf32> {
    %0 = linalg.conv_2d_nhwc_fhwc {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<2x11x11x5xf32>, tensor<2x3x3x5xf32>) outs(%arg3 : tensor<2x9x9x2xf32>) -> tensor<2x9x9x2xf32>
    return %0 : tensor<2x9x9x2xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.conv_2d_nhwc_fhwc"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.winograd_conv2d %0 {fmr = 1 : i32} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @conv2d_unsupported(%arg0: tensor<2x10x10x5xf32>, %arg1: tensor<3x3x5x2xf32>, %arg2: tensor<1xf32>, %arg3: tensor<2x8x8x2xf32>) -> tensor<2x8x8x2xf32> {
    %0 = linalg.conv_2d_nhwc_hwcf {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<2x10x10x5xf32>, tensor<3x3x5x2xf32>) outs(%arg3 : tensor<2x8x8x2xf32>) -> tensor<2x8x8x2xf32>
    return %0 : tensor<2x8x8x2xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.conv_2d_nhwc_hwcf"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.winograd_conv2d %0 {fmr = 1 : i32} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @conv2d_unsupported_type(%arg0: memref<2x10x10x5xf32>, %arg1: memref<2x3x3x5xf32>, %arg2: memref<2x8x8x2xf32>) {
    linalg.conv_2d_nhwc_fhwc {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : memref<2x10x10x5xf32>, memref<2x3x3x5xf32>) outs(%arg2 : memref<2x8x8x2xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.conv_2d_nhwc_fhwc"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.winograd_conv2d %0 {fmr = 1 : i32} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @conv2d(%arg0: tensor<2x?x?x5xf32>, %arg1: tensor<2x3x3x5xf32>, %arg2: tensor<1xf32>, %arg3: tensor<2x?x?x2xf32>) -> tensor<2x?x?x2xf32> {
    %0 = linalg.conv_2d_nhwc_fhwc {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<2x?x?x5xf32>, tensor<2x3x3x5xf32>) outs(%arg3 : tensor<2x?x?x2xf32>) -> tensor<2x?x?x2xf32>
    return %0 : tensor<2x?x?x2xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.conv_2d_nhwc_fhwc"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.winograd_conv2d %0 {fmr = 1 : i32} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

