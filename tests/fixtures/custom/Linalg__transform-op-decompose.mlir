#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0 + d3, d1 + d4, d5)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d3, d4, d5, d2)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2)>
#map3 = affine_map<(d0, d1, d2, d3, d4) -> (d0 + d3, d1 + d4, d2)>
#map4 = affine_map<(d0, d1, d2, d3, d4) -> (d3, d4, d2)>
#map5 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2)>
#map6 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1 + d3, d2 + d4)>
#map7 = affine_map<(d0, d1, d2, d3, d4) -> (d3, d4)>
#map8 = affine_map<(d0, d1, d2, d3) -> (d0 + d3, d1 + d2)>
#map9 = affine_map<(d0, d1, d2, d3) -> (d2, d3)>
#map10 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
module {
  func.func @conv_2d_nhwc_hwcf(%arg0: tensor<?x1x?x?xf32>, %arg1: tensor<1x?x?x?xf32>, %arg2: tensor<?x1x?x?xf32>) -> tensor<?x1x?x?xf32> {
    %0 = linalg.conv_2d_nhwc_hwcf {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<?x1x?x?xf32>, tensor<1x?x?x?xf32>) outs(%arg2 : tensor<?x1x?x?xf32>) -> tensor<?x1x?x?xf32>
    return %0 : tensor<?x1x?x?xf32>
  }
  func.func @conv_2d_nchw_fchw(%arg0: tensor<?x?x1x?xf32>, %arg1: tensor<?x?x1x?xf32>, %arg2: tensor<?x?x1x?xf32>) -> tensor<?x?x1x?xf32> {
    %0 = linalg.conv_2d_nchw_fchw {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<?x?x1x?xf32>, tensor<?x?x1x?xf32>) outs(%arg2 : tensor<?x?x1x?xf32>) -> tensor<?x?x1x?xf32>
    return %0 : tensor<?x?x1x?xf32>
  }
  func.func @depthwise_conv_2d_nhwc_hwc_height(%arg0: tensor<1x1x113x96xf32>, %arg1: tensor<1x3x96xf32>) -> tensor<1x1x56x96xf32> {
    %0 = tensor.empty() : tensor<1x1x56x96xf32>
    %1 = linalg.depthwise_conv_2d_nhwc_hwc {dilations = dense<1> : vector<2xi64>, strides = dense<2> : vector<2xi64>} ins(%arg0, %arg1 : tensor<1x1x113x96xf32>, tensor<1x3x96xf32>) outs(%0 : tensor<1x1x56x96xf32>) -> tensor<1x1x56x96xf32>
    return %1 : tensor<1x1x56x96xf32>
  }
  func.func @depthwise_conv_2d_nhwc_hwc_width(%arg0: tensor<1x113x1x96xf32>, %arg1: tensor<3x1x96xf32>) -> tensor<1x56x1x96xf32> {
    %0 = tensor.empty() : tensor<1x56x1x96xf32>
    %1 = linalg.depthwise_conv_2d_nhwc_hwc {dilations = dense<1> : vector<2xi64>, strides = dense<2> : vector<2xi64>} ins(%arg0, %arg1 : tensor<1x113x1x96xf32>, tensor<3x1x96xf32>) outs(%0 : tensor<1x56x1x96xf32>) -> tensor<1x56x1x96xf32>
    return %1 : tensor<1x56x1x96xf32>
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
  func.func @batchless_conv_2d_hwc_hwcf(%arg0: tensor<1x14x8xf32>, %arg1: tensor<1x3x8x16xf32>, %arg2: tensor<1x12x16xf32>) -> tensor<1x12x16xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "parallel", "reduction", "reduction", "reduction"]} ins(%arg0, %arg1 : tensor<1x14x8xf32>, tensor<1x3x8x16xf32>) outs(%arg2 : tensor<1x12x16xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<1x12x16xf32>
    return %0 : tensor<1x12x16xf32>
  }
  func.func @batchless_depthwise_conv_2d_hwc_hwc(%arg0: tensor<1x14x8xf32>, %arg1: tensor<1x3x8xf32>, %arg2: tensor<1x12x8xf32>) -> tensor<1x12x8xf32> {
    %0 = linalg.generic {indexing_maps = [#map3, #map4, #map5], iterator_types = ["parallel", "parallel", "parallel", "reduction", "reduction"]} ins(%arg0, %arg1 : tensor<1x14x8xf32>, tensor<1x3x8xf32>) outs(%arg2 : tensor<1x12x8xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<1x12x8xf32>
    return %0 : tensor<1x12x8xf32>
  }
  func.func @batchless_pooling_chw_min(%arg0: tensor<8x1x14xf32>, %arg1: tensor<1x3xf32>, %arg2: tensor<8x1x12xf32>) -> tensor<8x1x12xf32> {
    %0 = linalg.generic {indexing_maps = [#map6, #map7, #map5], iterator_types = ["parallel", "parallel", "parallel", "reduction", "reduction"]} ins(%arg0, %arg1 : tensor<8x1x14xf32>, tensor<1x3xf32>) outs(%arg2 : tensor<8x1x12xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.minimumf %out, %in : f32
      linalg.yield %1 : f32
    } -> tensor<8x1x12xf32>
    return %0 : tensor<8x1x12xf32>
  }
  func.func @cross_conv_nonstandard_loop_order(%arg0: tensor<1x15xf32>, %arg1: tensor<3x1xf32>, %arg2: tensor<1x12xf32>) -> tensor<1x12xf32> {
    %0 = linalg.generic {indexing_maps = [#map8, #map9, #map10], iterator_types = ["parallel", "parallel", "reduction", "reduction"]} ins(%arg0, %arg1 : tensor<1x15xf32>, tensor<3x1xf32>) outs(%arg2 : tensor<1x12xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<1x12xf32>
    return %0 : tensor<1x12xf32>
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

