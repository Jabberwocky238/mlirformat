"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x64x256xf32>) -> tensor<16x64x256xf32>, sym_name = "softmax"}> ({
  ^bb0(%arg1: tensor<16x64x256xf32> loc("<stdin>":3:8)):
    %2 = "tensor.empty"() : () -> tensor<16x64x256xf32> loc("<stdin>":4:10)
    %3 = "linalg.softmax"(%arg1, %2) <{dimension = 1 : i64}> : (tensor<16x64x256xf32>, tensor<16x64x256xf32>) -> tensor<16x64x256xf32> loc("<stdin>":5:10)
    "func.return"(%3) : (tensor<16x64x256xf32>) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":10:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.softmax"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":11:12)
      %1:3 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 2, 3>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":12:14)
      "transform.yield"() : () -> () loc("<stdin>":13:7)
    }) : () -> () loc("<stdin>":9:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":8:3)
}) : () -> () loc("<stdin>":1:1)
