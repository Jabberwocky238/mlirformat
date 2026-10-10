#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1 + d4, d2 + d5, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5, d3)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1080x1962x48xi32>, tensor<1x43x48xi32>) -> tensor<1x1080x1920x48xi32>, sym_name = "conv"}> ({
  ^bb0(%arg1: tensor<1x1080x1962x48xi32>, %arg2: tensor<1x43x48xi32>):
    %8 = "tensor.empty"() : () -> tensor<1x1080x1920x48xi32>
    %9 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %10 = "linalg.fill"(%9, %8) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: i32, %arg7: i32):
      "linalg.yield"(%arg6) : (i32) -> ()
    }) : (i32, tensor<1x1080x1920x48xi32>) -> tensor<1x1080x1920x48xi32>
    %11 = "linalg.depthwise_conv_2d_nhwc_hwc"(%arg1, %arg2, %10) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg3: i32, %arg4: i32, %arg5: i32):
      %12 = "arith.muli"(%arg3, %arg4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %13 = "arith.addi"(%arg5, %12) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%13) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x1080x1962x48xi32>, tensor<1x43x48xi32>, tensor<1x1080x1920x48xi32>) -> tensor<1x1080x1920x48xi32>
    "func.return"(%11) : (tensor<1x1080x1920x48xi32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.consume}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.depthwise_conv_2d_nhwc_hwc"]}> : (!transform.any_op) -> !transform.any_op
      %1:5 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false, false, true, false, false>, static_sizes = array<i64: 1, 1, 4, 4, 0, 0>}> : (!transform.any_op) -> (!transform.any_op, !transform.op<"scf.for">, !transform.op<"scf.for">, !transform.op<"scf.for">, !transform.op<"scf.for">)
      %2 = "transform.structured.match"(%1#4) <{ops = ["linalg.depthwise_conv_2d_nhwc_hwc"]}> : (!transform.op<"scf.for">) -> !transform.any_op
      %3:3 = "transform.structured.tile_using_for"(%2) <{scalable_sizes = array<i1: false, false, false, false, false, false>, static_sizes = array<i64: 0, 0, 0, 0, 1, 1>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %4 = "transform.structured.match"(%1#4) <{ops = ["linalg.depthwise_conv_2d_nhwc_hwc"]}> : (!transform.op<"scf.for">) -> !transform.any_op
      %5 = "transform.structured.decompose"(%4) : (!transform.any_op) -> !transform.any_op
      %6:2 = "transform.loop.peel"(%1#4) <{fail_if_already_divisible = false, peel_front = false}> : (!transform.op<"scf.for">) -> (!transform.op<"scf.for">, !transform.op<"scf.for">)
      %7 = "transform.structured.match"(%6#0) <{ops = ["linalg.depthwise_conv_1d_nwc_wc"]}> : (!transform.op<"scf.for">) -> !transform.any_op
      "transform.structured.vectorize"(%7) <{scalable_sizes = array<i1: false, false, true, false>, static_vector_sizes = array<i64: 2, 4, 4, 16>}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

