module {
  func.func @depthwise_conv1d_nwc_wc_1x8x3xi8_tensor(%arg0: tensor<1x8x?xi8>, %arg1: tensor<1x?xi8>, %arg2: tensor<1x8x?xi8>) -> tensor<1x8x?xi8> {
    %0 = linalg.depthwise_conv_1d_nwc_wc {dilations = dense<1> : vector<1xi64>, strides = dense<1> : vector<1xi64>} ins(%arg0, %arg1 : tensor<1x8x?xi8>, tensor<1x?xi8>) outs(%arg2 : tensor<1x8x?xi8>) -> tensor<1x8x?xi8>
    return %0 : tensor<1x8x?xi8>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.depthwise_conv_1d_nwc_wc"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [1, 8, 4, 1] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @depthwise_conv1d_nwc_wc_1x8x3xi8_tensor_scalable(%arg0: tensor<1x8x?xi8>, %arg1: tensor<1x?xi8>, %arg2: tensor<1x8x?xi8>) -> tensor<1x8x?xi8> {
    %0 = linalg.depthwise_conv_1d_nwc_wc {dilations = dense<1> : vector<1xi64>, strides = dense<1> : vector<1xi64>} ins(%arg0, %arg1 : tensor<1x8x?xi8>, tensor<1x?xi8>) outs(%arg2 : tensor<1x8x?xi8>) -> tensor<1x8x?xi8>
    return %0 : tensor<1x8x?xi8>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.depthwise_conv_1d_nwc_wc"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [1, 8, [4], 1] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @depthwise_conv1d_nwc_wc_3x5x4xf32_memref_dilation_2(%arg0: memref<3x5x?xf32>, %arg1: memref<2x?xf32>, %arg2: memref<3x2x?xf32>) {
    linalg.depthwise_conv_1d_nwc_wc {dilations = dense<2> : tensor<1xi64>, strides = dense<1> : tensor<1xi64>} ins(%arg0, %arg1 : memref<3x5x?xf32>, memref<2x?xf32>) outs(%arg2 : memref<3x2x?xf32>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.depthwise_conv_1d_nwc_wc"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [3, 2, [4], 2] : !transform.any_op
      transform.yield 
    }
  }
}

