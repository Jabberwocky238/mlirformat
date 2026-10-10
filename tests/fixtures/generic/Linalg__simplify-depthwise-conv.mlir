#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 * 2 + d5, d2 * 2 + d6, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d5, d6, d3, d4)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, tensor<?x?x?x1xf32>, tensor<?x?x?x?x1xf32>) -> tensor<?x?x?x?x1xf32>, sym_name = "depthwise_conv"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?x?x1xf32>, %arg2: tensor<?x?x?x?x1xf32>):
    %0 = "linalg.depthwise_conv_2d_nhwc_hwcm"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<2> : tensor<2xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {_someattr, linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?xf32>, tensor<?x?x?x1xf32>, tensor<?x?x?x?x1xf32>) -> tensor<?x?x?x?x1xf32>
    "func.return"(%0) : (tensor<?x?x?x?x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 * 2 + d5, d2 * 2 + d6, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d5, d6, d3, d4)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> ()>
#map3 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xi8>, tensor<?x?x?x1xi8>, tensor<?x?x?x?x1xi32>, i32, i32) -> tensor<?x?x?x?x1xi32>, sym_name = "depthwise_conv_q"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xi8>, %arg1: tensor<?x?x?x1xi8>, %arg2: tensor<?x?x?x?x1xi32>, %arg3: i32, %arg4: i32):
    %0 = "linalg.depthwise_conv_2d_nhwc_hwcm_q"(%arg0, %arg1, %arg3, %arg4, %arg2) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 4, 1>, strides = dense<2> : tensor<2xi64>}> ({
    ^bb0(%arg5: i8, %arg6: i8, %arg7: i32, %arg8: i32, %arg9: i32):
      %1 = "arith.extsi"(%arg5) : (i8) -> i32
      %2 = "arith.subi"(%1, %arg7) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %3 = "arith.extsi"(%arg6) : (i8) -> i32
      %4 = "arith.subi"(%3, %arg8) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %5 = "arith.muli"(%2, %4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %6 = "arith.addi"(%arg9, %5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%6) : (i32) -> ()
    }) {_someattr, linalg.memoized_indexing_maps = [#map, #map1, #map2, #map2, #map3]} : (tensor<?x?x?x?xi8>, tensor<?x?x?x1xi8>, i32, i32, tensor<?x?x?x?x1xi32>) -> tensor<?x?x?x?x1xi32>
    "func.return"(%0) : (tensor<?x?x?x?x1xi32>) -> ()
  }) : () -> ()
}) : () -> ()

