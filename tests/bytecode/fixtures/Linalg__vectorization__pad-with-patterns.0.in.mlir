"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x?x2xf32>, f32) -> tensor<2x3x4xf32>, sym_name = "pad_static"}> ({
  ^bb0(%arg1: tensor<2x?x2xf32> loc("<stdin>":3:8), %arg2: f32 loc("<stdin>":3:34)):
    %3 = "tensor.pad"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 0, 1, 0>, static_low = array<i64: 0, 0, 2>}> ({
    ^bb0(%arg3: index loc("<stdin>":5:10), %arg4: index loc("<stdin>":5:24), %arg5: index loc("<stdin>":5:38)):
      "tensor.yield"(%arg2) : (f32) -> () loc("<stdin>":6:7)
    }) : (tensor<2x?x2xf32>) -> tensor<2x3x4xf32> loc("<stdin>":4:10)
    "func.return"(%3) : (tensor<2x3x4xf32>) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":12:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.pad"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":13:12)
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":14:12)
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) <{vectorize_padding}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":15:12)
      "transform.yield"() : () -> () loc("<stdin>":16:7)
    }) : () -> () loc("<stdin>":11:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":10:3)
}) : () -> () loc("<stdin>":1:1)
