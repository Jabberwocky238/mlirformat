"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x3x3x5xf32>, tensor<6x6x5x2xf32>) -> tensor<6x6x5x2xf32>, sym_name = "tile_winograd_filter"}> ({
  ^bb0(%arg1: tensor<2x3x3x5xf32> loc("<stdin>":3:8), %arg2: tensor<6x6x5x2xf32> loc("<stdin>":3:36)):
    %2 = "linalg.winograd_filter_transform"(%arg1, %arg2) <{fmr = 1 : i32}> : (tensor<2x3x3x5xf32>, tensor<6x6x5x2xf32>) -> tensor<6x6x5x2xf32> loc("<stdin>":4:10)
    "func.return"(%2) : (tensor<6x6x5x2xf32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":9:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.winograd_filter_transform"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":10:12)
      %1:3 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false, false, false>, static_sizes = array<i64: 1, 0, 0, 1>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":11:14)
      "transform.yield"() : () -> () loc("<stdin>":12:7)
    }) : () -> () loc("<stdin>":8:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":7:3)
}) : () -> () loc("<stdin>":1:1)
