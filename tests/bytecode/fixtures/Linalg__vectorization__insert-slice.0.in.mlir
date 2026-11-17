"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x3x?x1xi32>) -> tensor<5x3xi32>, sym_name = "insert_slice_static_sizes", sym_visibility = "private"}> ({
  ^bb0(%arg1: tensor<?x3x?x1xi32> loc("<stdin>":3:8)):
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":4:10)
    %2 = "tensor.empty"() : () -> tensor<5x3xi32> loc("<stdin>":5:10)
    %3 = "tensor.extract_slice"(%arg1, %1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: 0, -9223372036854775808, 0, 0>, static_sizes = array<i64: 1, 1, 5, 1>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<?x3x?x1xi32>, index) -> tensor<5x1xi32> loc("<stdin>":6:10)
    %4 = "tensor.insert_slice"(%3, %2, %1) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0>, static_offsets = array<i64: 0, -9223372036854775808>, static_sizes = array<i64: 5, 1>, static_strides = array<i64: 1, 1>}> : (tensor<5x1xi32>, tensor<5x3xi32>, index) -> tensor<5x3xi32> loc("<stdin>":7:10)
    "func.return"(%4) : (tensor<5x3xi32>) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":12:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.insert_slice"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":13:12)
      "transform.structured.vectorize"(%0) <{scalable_sizes = array<i1: false, false>, static_vector_sizes = array<i64: 8, 1>}> : (!transform.any_op) -> () loc("<stdin>":14:7)
      "transform.yield"() : () -> () loc("<stdin>":15:7)
    }) : () -> () loc("<stdin>":11:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":10:3)
}) : () -> () loc("<stdin>":1:1)
