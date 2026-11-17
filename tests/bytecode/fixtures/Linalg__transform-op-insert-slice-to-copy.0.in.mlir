"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x3xf32>, tensor<?x?xf32>, index, index, index, index, index, index) -> tensor<?x?xf32>, sym_name = "insert_slice_to_copy"}> ({
  ^bb0(%arg1: tensor<2x3xf32> loc("<stdin>":3:8), %arg2: tensor<?x?xf32> loc("<stdin>":3:32), %arg3: index loc("<stdin>":3:56), %arg4: index loc("<stdin>":3:70), %arg5: index loc("<stdin>":3:84), %arg6: index loc("<stdin>":3:98), %arg7: index loc("<stdin>":3:112), %arg8: index loc("<stdin>":3:126)):
    %3 = "tensor.insert_slice"(%arg1, %arg2, %arg3, %arg4, %arg7, %arg8) <{operandSegmentSizes = array<i32: 1, 1, 2, 0, 2>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 2, 3>, static_strides = array<i64: -9223372036854775808, -9223372036854775808>}> : (tensor<2x3xf32>, tensor<?x?xf32>, index, index, index, index) -> tensor<?x?xf32> loc("<stdin>":4:10)
    "func.return"(%3) : (tensor<?x?xf32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":9:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.insert_slice"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":10:12)
      %1 = "transform.structured.insert_slice_to_copy"(%0) : (!transform.any_op) -> !transform.any_op loc("<stdin>":11:12)
      %2 = "transform.cast"(%1) : (!transform.any_op) -> !transform.op<"linalg.copy"> loc("<stdin>":12:12)
      "transform.yield"() : () -> () loc("<stdin>":13:7)
    }) : () -> () loc("<stdin>":8:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":7:3)
}) : () -> () loc("<stdin>":1:1)
