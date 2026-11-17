"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, index, index) -> tensor<2x4xf32>, sym_name = "test_masked_vectorize_pad"}> ({
  ^bb0(%arg1: tensor<?x?xf32> loc("<stdin>":3:8), %arg2: index loc("<stdin>":3:32), %arg3: index loc("<stdin>":3:46)):
    %1 = "arith.constant"() <{value = 4.243000e+01 : f32}> : () -> f32 loc("<stdin>":4:10)
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:10)
    %3 = "tensor.pad"(%arg1, %2, %arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1, 2>, static_high = array<i64: -9223372036854775808, -9223372036854775808>, static_low = array<i64: 0, -9223372036854775808>}> ({
    ^bb0(%arg4: index loc("<stdin>":7:10), %arg5: index loc("<stdin>":7:24)):
      "tensor.yield"(%1) : (f32) -> () loc("<stdin>":8:7)
    }) : (tensor<?x?xf32>, index, index, index) -> tensor<2x4xf32> loc("<stdin>":6:10)
    "func.return"(%3) : (tensor<2x4xf32>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":2:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":14:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["tensor.pad"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":15:12)
      "transform.structured.vectorize"(%0) <{scalable_sizes = array<i1: false, false>, static_vector_sizes = array<i64: 2, 4>}> : (!transform.any_op) -> () loc("<stdin>":16:7)
      "transform.yield"() : () -> () loc("<stdin>":17:7)
    }) : () -> () loc("<stdin>":13:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":12:3)
}) : () -> () loc("<stdin>":1:1)
