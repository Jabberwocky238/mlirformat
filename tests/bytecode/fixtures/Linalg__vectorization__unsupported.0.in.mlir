"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x?x3xf32>, tensor<9x8x7x1x2x3xf32>, index) -> tensor<9x8x7x1x2x3xf32>, sym_name = "insert_dynamic_slice_unknown_pad"}> ({
  ^bb0(%arg1: tensor<1x?x3xf32> loc("<stdin>":3:8), %arg2: tensor<9x8x7x1x2x3xf32> loc("<stdin>":3:34), %arg3: index loc("<stdin>":3:66)):
    %3 = "tensor.insert_slice"(%arg1, %arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1, 0, 1, 0>, static_offsets = array<i64: 0, 0, 0, 0, 0, 0>, static_sizes = array<i64: 1, 1, 1, 1, -9223372036854775808, 3>, static_strides = array<i64: 1, 1, 1, 1, 1, 1>}> : (tensor<1x?x3xf32>, tensor<9x8x7x1x2x3xf32>, index) -> tensor<9x8x7x1x2x3xf32> loc("<stdin>":4:10)
    "func.return"(%3) : (tensor<9x8x7x1x2x3xf32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":9:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.insert_slice"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":10:12)
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":11:12)
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op loc("<stdin>":12:12)
      "transform.yield"() : () -> () loc("<stdin>":13:7)
    }) : () -> () loc("<stdin>":8:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":7:3)
}) : () -> () loc("<stdin>":1:1)
