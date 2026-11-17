"builtin.module"() ({
  "func.func"() <{function_type = (tensor<10x13xf32>, tensor<3x13xf32>) -> tensor<13x13xf32>, sym_name = "cast_to_dynamic"}> ({
  ^bb0(%arg1: tensor<10x13xf32> loc("<stdin>":3:8), %arg2: tensor<3x13xf32> loc("<stdin>":3:34)):
    %6 = "tensor.concat"(%arg1, %arg2) <{dim = 0 : i64}> : (tensor<10x13xf32>, tensor<3x13xf32>) -> tensor<13x13xf32> loc("<stdin>":4:10)
    "func.return"(%6) : (tensor<13x13xf32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "concat_replacement", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":7:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":11:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":12:12)
      %1:2 = "transform.split_handle"(%0) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":13:14)
      %2 = "transform.structured.match"(%1#0) <{ops = ["tensor.concat"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":14:12)
      %3 = "transform.get_operand"(%2) <{is_all, raw_position_list = array<i64>}> : (!transform.any_op) -> !transform.any_value loc("<stdin>":15:12)
      %4 = "transform.get_result"(%2) <{is_all, raw_position_list = array<i64>}> : (!transform.any_op) -> !transform.any_value loc("<stdin>":16:12)
      %5 = "transform.func.cast_and_call"(%2, %3, %4, %1#1) <{operandSegmentSizes = array<i32: 1, 1, 1, 1>}> ({
        "transform.type_conversion.tensor.cast_shape_dynamic_dims"() : () -> () loc("<stdin>":18:9)
      }) : (!transform.any_op, !transform.any_value, !transform.any_value, !transform.any_op) -> !transform.any_op loc("<stdin>":17:12)
      "transform.apply_dce"(%1#0) : (!transform.any_op) -> () loc("<stdin>":20:7)
      "transform.yield"() : () -> () loc("<stdin>":21:7)
    }) : () -> () loc("<stdin>":10:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":9:3)
}) : () -> () loc("<stdin>":1:1)
