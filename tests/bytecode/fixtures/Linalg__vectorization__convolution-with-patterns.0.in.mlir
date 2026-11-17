"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x6x3xf32>, memref<1x3x8xf32>, memref<4x2x8xf32>) -> (), sym_name = "conv1d_nwc_4x2x8_memref"}> ({
  ^bb0(%arg1: memref<4x6x3xf32> loc("<stdin>":6:8), %arg2: memref<1x3x8xf32> loc("<stdin>":6:34), %arg3: memref<4x2x8xf32> loc("<stdin>":6:60)):
    "linalg.conv_1d_nwc_wcf"(%arg1, %arg2, %arg3) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<3> : tensor<1xi64>}> ({
    ^bb0(%arg4: f32 loc("<stdin>":8:10), %arg5: f32 loc("<stdin>":8:22), %arg6: f32 loc("<stdin>":8:34)):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":9:12)
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":10:12)
      "linalg.yield"(%4) : (f32) -> () loc("<stdin>":11:7)
    }) {linalg.memoized_indexing_maps = [affine_map<(d0, d1, d2, d3, d4) -> (d0, d1 * 3 + d3, d4)>, affine_map<(d0, d1, d2, d3, d4) -> (d3, d4, d2)>, affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2)>]} : (memref<4x6x3xf32>, memref<1x3x8xf32>, memref<4x2x8xf32>) -> () loc("<stdin>":7:5)
    "func.return"() : () -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":5:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":17:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.conv_1d_nwc_wcf", "linalg.generic"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":18:12)
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":19:12)
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op loc("<stdin>":20:12)
      "transform.yield"() : () -> () loc("<stdin>":21:7)
    }) : () -> () loc("<stdin>":16:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":15:3)
}) : () -> () loc("<stdin>":4:1)
