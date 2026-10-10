module {
  func.func @conv_non_static(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<3x3x4x16xf32>, %arg2: tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32> {
    %0 = linalg.conv_2d_nhwc_hwcf {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<?x?x?x?xf32>, tensor<3x3x4x16xf32>) outs(%arg2 : tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    return %0 : tensor<?x?x?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.conv_2d_nhwc_hwcf"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %img2col_tensor, %transformed = transform.structured.convert_conv2d_to_img2col %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @negative_conv_memref(%arg0: memref<1x16x16x4xf32>, %arg1: memref<16x3x3x4xf32>, %arg2: memref<1x14x14x16xf32>) {
    linalg.conv_2d_nhwc_fhwc {dilations = dense<1> : memref<2xi64>, strides = dense<1> : memref<2xi64>} ins(%arg0, %arg1 : memref<1x16x16x4xf32>, memref<16x3x3x4xf32>) outs(%arg2 : memref<1x14x14x16xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.conv_2d_nhwc_fhwc"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %img2col_tensor, %transformed = transform.structured.convert_conv2d_to_img2col %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @conv_16433136(%arg0: tensor<1x16x16x4xf32>, %arg1: tensor<3x3x4x16xf32>, %arg2: tensor<1x14x14x16xf32>) -> tensor<1x14x14x16xf32> {
    %0 = linalg.conv_2d_nhwc_hwcf {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<1x16x16x4xf32>, tensor<3x3x4x16xf32>) outs(%arg2 : tensor<1x14x14x16xf32>) -> tensor<1x14x14x16xf32>
    return %0 : tensor<1x14x14x16xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.conv_2d_nhwc_hwcf"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %img2col_tensor, %transformed = transform.structured.convert_conv2d_to_img2col %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.print %img2col_tensor {name = "tensor_producer"} : !transform.any_op
      transform.print %transformed {name = "transformed"} : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @depthwise_conv_hwc_114x16x3(%arg0: tensor<1x114x114x16xf32>, %arg1: tensor<3x3x16xf32>, %arg2: tensor<1x112x112x16xf32>) -> tensor<1x112x112x16xf32> {
    %0 = linalg.depthwise_conv_2d_nhwc_hwc {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<1x114x114x16xf32>, tensor<3x3x16xf32>) outs(%arg2 : tensor<1x112x112x16xf32>) -> tensor<1x112x112x16xf32>
    return %0 : tensor<1x112x112x16xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.depthwise_conv_2d_nhwc_hwc"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %img2col_tensor, %transformed = transform.structured.convert_conv2d_to_img2col %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @batch_nhwc_conv(%arg0: tensor<8x16x16x4xf32>, %arg1: tensor<3x3x4x16xf32>, %arg2: tensor<8x14x14x16xf32>) -> tensor<8x14x14x16xf32> {
    %0 = linalg.conv_2d_nhwc_hwcf {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<8x16x16x4xf32>, tensor<3x3x4x16xf32>) outs(%arg2 : tensor<8x14x14x16xf32>) -> tensor<8x14x14x16xf32>
    return %0 : tensor<8x14x14x16xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.conv_2d_nhwc_hwcf"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %img2col_tensor, %transformed = transform.structured.convert_conv2d_to_img2col %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @batch_nchw_conv(%arg0: tensor<8x4x16x16xf32>, %arg1: tensor<16x4x3x3xf32>, %arg2: tensor<8x16x14x14xf32>) -> tensor<8x16x14x14xf32> {
    %0 = linalg.conv_2d_nchw_fchw {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<8x4x16x16xf32>, tensor<16x4x3x3xf32>) outs(%arg2 : tensor<8x16x14x14xf32>) -> tensor<8x16x14x14xf32>
    return %0 : tensor<8x16x14x14xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.conv_2d_nchw_fchw"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %img2col_tensor, %transformed = transform.structured.convert_conv2d_to_img2col %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @batch_nchw_conv_with_filter_encoding(%arg0: tensor<8x4x16x16xf32>, %arg1: tensor<16x4x3x3xf32, 42 : i32>, %arg2: tensor<8x16x14x14xf32>) -> tensor<8x16x14x14xf32> {
    %0 = linalg.conv_2d_nchw_fchw {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<8x4x16x16xf32>, tensor<16x4x3x3xf32, 42 : i32>) outs(%arg2 : tensor<8x16x14x14xf32>) -> tensor<8x16x14x14xf32>
    return %0 : tensor<8x16x14x14xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.conv_2d_nchw_fchw"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %img2col_tensor, %transformed = transform.structured.convert_conv2d_to_img2col %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @conv_2d_nhwc_fhwc(%arg0: tensor<1x16x16x4xf32>, %arg1: tensor<16x3x3x4xf32>, %arg2: tensor<1x14x14x16xf32>) -> tensor<1x14x14x16xf32> {
    %0 = linalg.conv_2d_nhwc_fhwc {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<1x16x16x4xf32>, tensor<16x3x3x4xf32>) outs(%arg2 : tensor<1x14x14x16xf32>) -> tensor<1x14x14x16xf32>
    return %0 : tensor<1x14x14x16xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.conv_2d_nhwc_fhwc"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %img2col_tensor, %transformed = transform.structured.convert_conv2d_to_img2col %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.print %img2col_tensor {name = "tensor_producer"} : !transform.any_op
      transform.print %transformed {name = "transformed"} : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @conv_2d_nhwc_fhwc_with_filter_encoding(%arg0: tensor<1x16x16x4xf32>, %arg1: tensor<16x3x3x4xf32, 42 : i32>, %arg2: tensor<1x14x14x16xf32>) -> tensor<1x14x14x16xf32> {
    %0 = linalg.conv_2d_nhwc_fhwc {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<1x16x16x4xf32>, tensor<16x3x3x4xf32, 42 : i32>) outs(%arg2 : tensor<1x14x14x16xf32>) -> tensor<1x14x14x16xf32>
    return %0 : tensor<1x14x14x16xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.conv_2d_nhwc_fhwc"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %img2col_tensor, %transformed = transform.structured.convert_conv2d_to_img2col %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @conv_integer_extend(%arg0: tensor<1x16x16x4xi8>, %arg1: tensor<3x3x4x16xi8>, %arg2: tensor<1x14x14x16xi32>) -> tensor<1x14x14x16xi32> {
    %0 = linalg.conv_2d_nhwc_hwcf {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<1x16x16x4xi8>, tensor<3x3x4x16xi8>) outs(%arg2 : tensor<1x14x14x16xi32>) -> tensor<1x14x14x16xi32>
    return %0 : tensor<1x14x14x16xi32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.conv_2d_nhwc_hwcf"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %img2col_tensor, %transformed = transform.structured.convert_conv2d_to_img2col %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.print %img2col_tensor {name = "tensor_producer"} : !transform.any_op
      transform.print %transformed {name = "transformed"} : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @conv_complex(%arg0: tensor<1x16x16x4xcomplex<f32>>, %arg1: tensor<3x3x4x16xcomplex<f32>>, %arg2: tensor<1x14x14x16xcomplex<f32>>) -> tensor<1x14x14x16xcomplex<f32>> {
    %0 = linalg.conv_2d_nhwc_hwcf {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<1x16x16x4xcomplex<f32>>, tensor<3x3x4x16xcomplex<f32>>) outs(%arg2 : tensor<1x14x14x16xcomplex<f32>>) -> tensor<1x14x14x16xcomplex<f32>>
    return %0 : tensor<1x14x14x16xcomplex<f32>>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.conv_2d_nhwc_hwcf"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %img2col_tensor, %transformed = transform.structured.convert_conv2d_to_img2col %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.print %img2col_tensor {name = "tensor_producer"} : !transform.any_op
      transform.print %transformed {name = "transformed"} : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @conv_complex_extended(%arg0: tensor<1x16x16x4xcomplex<f32>>, %arg1: tensor<3x3x4x16xcomplex<f16>>, %arg2: tensor<1x14x14x16xcomplex<f32>>) -> tensor<1x14x14x16xcomplex<f32>> {
    %0 = linalg.conv_2d_nhwc_hwcf {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<1x16x16x4xcomplex<f32>>, tensor<3x3x4x16xcomplex<f16>>) outs(%arg2 : tensor<1x14x14x16xcomplex<f32>>) -> tensor<1x14x14x16xcomplex<f32>>
    return %0 : tensor<1x14x14x16xcomplex<f32>>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.conv_2d_nhwc_hwcf"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %img2col_tensor, %transformed = transform.structured.convert_conv2d_to_img2col %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.print %img2col_tensor {name = "tensor_producer"} : !transform.any_op
      transform.print %transformed {name = "transformed"} : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @conv_complex_f16_extended(%arg0: tensor<1x16x16x4xcomplex<f32>>, %arg1: tensor<3x3x4x16xf16>, %arg2: tensor<1x14x14x16xcomplex<f32>>) -> tensor<1x14x14x16xcomplex<f32>> {
    %0 = linalg.conv_2d_nhwc_hwcf {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<1x16x16x4xcomplex<f32>>, tensor<3x3x4x16xf16>) outs(%arg2 : tensor<1x14x14x16xcomplex<f32>>) -> tensor<1x14x14x16xcomplex<f32>>
    return %0 : tensor<1x14x14x16xcomplex<f32>>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.conv_2d_nhwc_hwcf"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %img2col_tensor, %transformed = transform.structured.convert_conv2d_to_img2col %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.print %img2col_tensor {name = "tensor_producer"} : !transform.any_op
      transform.print %transformed {name = "transformed"} : !transform.any_op
      transform.yield 
    }
  }
}

