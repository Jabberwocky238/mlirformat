module {
  func.func @conv(%arg0: tensor<1x1080x1962x48xi32>, %arg1: tensor<1x43x48xi32>) -> tensor<1x1080x1920x48xi32> {
    %0 = tensor.empty() : tensor<1x1080x1920x48xi32>
    %c0_i32 = arith.constant 0 : i32
    %1 = linalg.fill ins(%c0_i32 : i32) outs(%0 : tensor<1x1080x1920x48xi32>) -> tensor<1x1080x1920x48xi32>
    %2 = linalg.depthwise_conv_2d_nhwc_hwc {dilations = dense<1> : tensor<2xi64>, strides = dense<1> : tensor<2xi64>} ins(%arg0, %arg1 : tensor<1x1080x1962x48xi32>, tensor<1x43x48xi32>) outs(%1 : tensor<1x1080x1920x48xi32>) -> tensor<1x1080x1920x48xi32>
    return %2 : tensor<1x1080x1920x48xi32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.consume}) {
      %0 = transform.structured.match ops{["linalg.depthwise_conv_2d_nhwc_hwc"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %tiled_linalg_op, %loops:4 = transform.structured.tile_using_for %0 tile_sizes [1, 1, 4, [4], 0, 0] : (!transform.any_op) -> (!transform.any_op, !transform.op<"scf.for">, !transform.op<"scf.for">, !transform.op<"scf.for">, !transform.op<"scf.for">)
      %1 = transform.structured.match ops{["linalg.depthwise_conv_2d_nhwc_hwc"]} in %loops#3 : (!transform.op<"scf.for">) -> !transform.any_op
      %tiled_linalg_op_0, %loops_1:2 = transform.structured.tile_using_for %1 tile_sizes [0, 0, 0, 0, 1, 1] : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %2 = transform.structured.match ops{["linalg.depthwise_conv_2d_nhwc_hwc"]} in %loops#3 : (!transform.op<"scf.for">) -> !transform.any_op
      %3 = transform.structured.decompose %2 : (!transform.any_op) -> !transform.any_op
      %peeled_loop, %remainder_loop = transform.loop.peel %loops#3 : (!transform.op<"scf.for">) -> (!transform.op<"scf.for">, !transform.op<"scf.for">)
      %4 = transform.structured.match ops{["linalg.depthwise_conv_1d_nwc_wc"]} in %peeled_loop : (!transform.op<"scf.for">) -> !transform.any_op
      transform.structured.vectorize %4 vector_sizes [2, 4, [4], 16] : !transform.any_op
      transform.yield 
    }
  }
}

