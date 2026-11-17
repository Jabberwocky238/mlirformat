"builtin.module"() ({
  "func.func"() <{function_type = (f32, tensor<24x25xf32>) -> tensor<24x25xf32>, sym_name = "pad_fill"}> ({
  ^bb0(%arg1: f32 loc("<stdin>":3:8), %arg2: tensor<24x25xf32> loc("<stdin>":3:20)):
    %3 = "linalg.fill"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":5:10), %arg4: f32 loc("<stdin>":5:22)):
      "linalg.yield"(%arg3) : (f32) -> () loc("<stdin>":6:7)
    }) : (f32, tensor<24x25xf32>) -> tensor<24x25xf32> loc("<stdin>":4:10)
    "func.return"(%3) : (tensor<24x25xf32>) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":12:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.fill"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":13:12)
      %1:2 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false>, static_sizes = array<i64: 5>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":14:14)
      %2:2 = "transform.structured.pad_tiling_interface"(%1#0) <{padding_values = [#ub.poison, 0.000000e+00 : f32], static_padding_sizes = array<i64: 8>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":15:14)
      "transform.yield"() : () -> () loc("<stdin>":16:7)
    }) : () -> () loc("<stdin>":11:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":10:3)
}) : () -> () loc("<stdin>":1:1)
