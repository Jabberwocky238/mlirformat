module {
  func.func @conv_2d_nhwc_hwcf(%arg0: tensor<?x1x?x?xf32>, %arg1: tensor<1x?x?x?xf32>, %arg2: tensor<?x1x?x?xf32>) -> tensor<?x1x?x?xf32> {
    %0 = linalg.conv_2d_nhwc_hwcf {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<?x1x?x?xf32>, tensor<1x?x?x?xf32>) outs(%arg2 : tensor<?x1x?x?xf32>) -> tensor<?x1x?x?xf32>
    return %0 : tensor<?x1x?x?xf32>
  }
  func.func @conv_2d_nchw_fchw(%arg0: tensor<?x?x1x?xf32>, %arg1: tensor<?x?x1x?xf32>, %arg2: tensor<?x?x1x?xf32>) -> tensor<?x?x1x?xf32> {
    %0 = linalg.conv_2d_nchw_fchw {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<?x?x1x?xf32>, tensor<?x?x1x?xf32>) outs(%arg2 : tensor<?x?x1x?xf32>) -> tensor<?x?x1x?xf32>
    return %0 : tensor<?x?x1x?xf32>
  }
  func.func @depthwise_conv_2d_nhwc_hwc(%arg0: tensor<1x1x113x96xf32>, %arg1: tensor<1x3x96xf32>) -> tensor<1x1x56x96xf32> {
    %0 = tensor.empty() : tensor<1x1x56x96xf32>
    %1 = linalg.depthwise_conv_2d_nhwc_hwc {dilations = dense<1> : vector<2xi64>, strides = dense<2> : vector<2xi64>} ins(%arg0, %arg1 : tensor<1x1x113x96xf32>, tensor<1x3x96xf32>) outs(%0 : tensor<1x1x56x96xf32>) -> tensor<1x1x56x96xf32>
    return %1 : tensor<1x1x56x96xf32>
  }
  func.func @conv_2d(%arg0: tensor<1x?xf32>, %arg1: tensor<1x?xf32>, %arg2: tensor<1x?xf32>) -> tensor<1x?xf32> {
    %0 = linalg.conv_2d ins(%arg0, %arg1 : tensor<1x?xf32>, tensor<1x?xf32>) outs(%arg2 : tensor<1x?xf32>) -> tensor<1x?xf32>
    return %0 : tensor<1x?xf32>
  }
  func.func @pooling_nhwc_sum(%arg0: tensor<?x1x?x?xf32>, %arg1: tensor<1x?xf32>, %arg2: tensor<?x1x?x?xf32>) -> tensor<?x1x?x?xf32> {
    %0 = linalg.pooling_nhwc_sum {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<?x1x?x?xf32>, tensor<1x?xf32>) outs(%arg2 : tensor<?x1x?x?xf32>) -> tensor<?x1x?x?xf32>
    return %0 : tensor<?x1x?x?xf32>
  }
  func.func @pooling_nchw_sum(%arg0: tensor<?x?x1x?xf32>, %arg1: tensor<1x?xf32>, %arg2: tensor<?x?x1x?xf32>) -> tensor<?x?x1x?xf32> {
    %0 = linalg.pooling_nchw_sum {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<?x?x1x?xf32>, tensor<1x?xf32>) outs(%arg2 : tensor<?x?x1x?xf32>) -> tensor<?x?x1x?xf32>
    return %0 : tensor<?x?x1x?xf32>
  }
  func.func @pooling_nhwc_max(%arg0: tensor<?x1x?x?xf32>, %arg1: tensor<1x?xf32>, %arg2: tensor<?x1x?x?xf32>) -> tensor<?x1x?x?xf32> {
    %0 = linalg.pooling_nhwc_max {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<?x1x?x?xf32>, tensor<1x?xf32>) outs(%arg2 : tensor<?x1x?x?xf32>) -> tensor<?x1x?x?xf32>
    return %0 : tensor<?x1x?x?xf32>
  }
  func.func @pooling_nhwc_max_unsigned(%arg0: tensor<?x1x?x?xi32>, %arg1: tensor<1x?xi32>, %arg2: tensor<?x1x?x?xi32>) -> tensor<?x1x?x?xi32> {
    %0 = linalg.pooling_nhwc_max_unsigned {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<?x1x?x?xi32>, tensor<1x?xi32>) outs(%arg2 : tensor<?x1x?x?xi32>) -> tensor<?x1x?x?xi32>
    return %0 : tensor<?x1x?x?xi32>
  }
  func.func @pooling_nhwc_min(%arg0: tensor<?x1x?x?xf32>, %arg1: tensor<1x?xf32>, %arg2: tensor<?x1x?x?xf32>) -> tensor<?x1x?x?xf32> {
    %0 = linalg.pooling_nhwc_min {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<?x1x?x?xf32>, tensor<1x?xf32>) outs(%arg2 : tensor<?x1x?x?xf32>) -> tensor<?x1x?x?xf32>
    return %0 : tensor<?x1x?x?xf32>
  }
  func.func @pooling_nhwc_min_unsigned(%arg0: tensor<?x1x?x?xi32>, %arg1: tensor<1x?xi32>, %arg2: tensor<?x1x?x?xi32>) -> tensor<?x1x?x?xi32> {
    %0 = linalg.pooling_nhwc_min_unsigned {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<?x1x?x?xi32>, tensor<1x?xi32>) outs(%arg2 : tensor<?x1x?x?xi32>) -> tensor<?x1x?x?xi32>
    return %0 : tensor<?x1x?x?xi32>
  }
  func.func @pooling_nchw_max(%arg0: tensor<?x?x1x?xf32>, %arg1: tensor<1x?xf32>, %arg2: tensor<?x?x1x?xf32>) -> tensor<?x?x1x?xf32> {
    %0 = linalg.pooling_nchw_max {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<?x?x1x?xf32>, tensor<1x?xf32>) outs(%arg2 : tensor<?x?x1x?xf32>) -> tensor<?x?x1x?xf32>
    return %0 : tensor<?x?x1x?xf32>
  }
  func.func @softmax(%arg0: tensor<2x16x32xf32>, %arg1: tensor<2x16x32xf32>) -> tensor<2x16x32xf32> {
    %0 = linalg.softmax dimension(2) ins(%arg0 : tensor<2x16x32xf32>) outs(%arg1 : tensor<2x16x32xf32>) -> tensor<2x16x32xf32>
    return %0 : tensor<2x16x32xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match interface{LinalgOp} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.decompose %0 : (!transform.any_op) -> !transform.any_op
      %2 = transform.structured.match ops{["linalg.softmax"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %3 = transform.structured.decompose_interface %2 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

