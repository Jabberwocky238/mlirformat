"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %1 = "arith.constant"() <{value = dense<[[[1.000000e+00, 2.000000e+00, 3.000000e+00], [2.000000e+00, 3.000000e+00, 4.000000e+00]]]> : tensor<1x2x3xf32>}> : () -> tensor<1x2x3xf32> loc("<stdin>":3:10)
    %2 = "tensor.cast"(%1) : (tensor<1x2x3xf32>) -> tensor<1x?x3xf32> loc("<stdin>":4:10)
    %3 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":5:10)
    %4 = "arith.constant"() <{value = 2.300000e+00 : f32}> : () -> f32 loc("<stdin>":6:10)
    %5 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":7:10)
    %6 = "tensor.pad"(%2, %5, %3, %5, %5, %5, %3) <{operandSegmentSizes = array<i32: 1, 3, 3>, static_high = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_low = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>}> ({
    ^bb0(%arg1: index loc("<stdin>":9:10), %arg2: index loc("<stdin>":9:24), %arg3: index loc("<stdin>":9:38)):
      "tensor.yield"(%4) : (f32) -> () loc("<stdin>":10:7)
    }) : (tensor<1x?x3xf32>, index, index, index, index, index, index) -> tensor<1x?x?xf32> loc("<stdin>":8:10)
    %7 = "tensor.cast"(%6) : (tensor<1x?x?xf32>) -> tensor<*xf32> loc("<stdin>":12:10)
    "func.call"(%7) <{callee = @printMemrefF32}> : (tensor<*xf32>) -> () loc("<stdin>":13:5)
    "func.return"() : () -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":2:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":18:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func"> loc("<stdin>":19:12)
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.linalg.pad_vectorization"() : () -> () loc("<stdin>":21:9)
      }) : (!transform.op<"func.func">) -> () loc("<stdin>":20:7)
      "transform.yield"() : () -> () loc("<stdin>":23:7)
    }) : () -> () loc("<stdin>":17:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":16:3)
  "func.func"() <{function_type = (tensor<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":26:3)
}) : () -> () loc("<stdin>":1:1)
