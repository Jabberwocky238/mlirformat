module {
  func.func @depthwise_conv1d_nwc_wc_1x8x3xi8_tensor(%arg0: tensor<1x8x3xi8>, %arg1: tensor<1x3xi8>, %arg2: tensor<1x8x3xi8>) -> tensor<1x8x3xi8> {
    %0 = linalg.depthwise_conv_1d_nwc_wc {dilations = dense<1> : vector<1xi64>, strides = dense<1> : vector<1xi64>} ins(%arg0, %arg1 : tensor<1x8x3xi8>, tensor<1x3xi8>) outs(%arg2 : tensor<1x8x3xi8>) -> tensor<1x8x3xi8>
    return %0 : tensor<1x8x3xi8>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.depthwise_conv_1d_nwc_wc", "linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 {flatten_1d_depthwise_conv} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
  func.func @depthwise_conv1d_nwc_wc_3x5x4xf32_memref_dillation_2(%arg0: memref<3x5x4xf32>, %arg1: memref<2x4xf32>, %arg2: memref<3x2x4xf32>) {
    linalg.depthwise_conv_1d_nwc_wc {dilations = dense<2> : tensor<1xi64>, strides = dense<1> : tensor<1xi64>} ins(%arg0, %arg1 : memref<3x5x4xf32>, memref<2x4xf32>) outs(%arg2 : memref<3x2x4xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.depthwise_conv_1d_nwc_wc", "linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 {flatten_1d_depthwise_conv} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @depthwise_conv1d_nwc_wc_3x5x4xi8_memref_dilation_2(%arg0: memref<3x5x4xi8>, %arg1: memref<2x4xi8>, %arg2: memref<3x2x4xi32>) {
    linalg.depthwise_conv_1d_nwc_wc {dilations = dense<2> : tensor<1xi64>, strides = dense<1> : tensor<1xi64>} ins(%arg0, %arg1 : memref<3x5x4xi8>, memref<2x4xi8>) outs(%arg2 : memref<3x2x4xi32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.depthwise_conv_1d_nwc_wc", "linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 {flatten_1d_depthwise_conv} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @depthwise_conv1d_nwc_wc_3x9x4xi8_tensor_stride_2(%arg0: tensor<3x9x4xi8>, %arg1: tensor<3x4xi8>, %arg2: tensor<3x3x4xi8>) -> tensor<3x3x4xi8> {
    %0 = linalg.depthwise_conv_1d_nwc_wc {dilations = dense<1> : tensor<1xi64>, strides = dense<2> : tensor<1xi64>} ins(%arg0, %arg1 : tensor<3x9x4xi8>, tensor<3x4xi8>) outs(%arg2 : tensor<3x3x4xi8>) -> tensor<3x3x4xi8>
    return %0 : tensor<3x3x4xi8>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.depthwise_conv_1d_nwc_wc", "linalg.generic"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 {isolated_from_above} : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.vectorize_children_and_apply_patterns %1 {flatten_1d_depthwise_conv} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

