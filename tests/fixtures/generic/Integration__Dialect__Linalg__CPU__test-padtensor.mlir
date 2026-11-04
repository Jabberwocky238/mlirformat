"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %1 = "arith.constant"() <{value = dense<[[[1.000000e+00, 2.000000e+00, 3.000000e+00], [2.000000e+00, 3.000000e+00, 4.000000e+00]]]> : tensor<1x2x3xf32>}> : () -> tensor<1x2x3xf32>
    %2 = "tensor.cast"(%1) : (tensor<1x2x3xf32>) -> tensor<1x?x3xf32>
    %3 = "arith.constant"() <{value = 2 : index}> : () -> index
    %4 = "arith.constant"() <{value = 2.300000e+00 : f32}> : () -> f32
    %5 = "arith.constant"() <{value = 0 : index}> : () -> index
    %6 = "tensor.pad"(%2, %5, %3, %5, %5, %5, %3) <{operandSegmentSizes = array<i32: 1, 3, 3>, static_high = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_low = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>}> ({
    ^bb0(%arg1: index, %arg2: index, %arg3: index):
      "tensor.yield"(%4) : (f32) -> ()
    }) : (tensor<1x?x3xf32>, index, index, index, index, index, index) -> tensor<1x?x?xf32>
    %7 = "tensor.cast"(%6) : (tensor<1x?x?xf32>) -> tensor<*xf32>
    "func.call"(%7) <{callee = @printMemrefF32}> : (tensor<*xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.linalg.pad_vectorization"() : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
  "func.func"() <{function_type = (tensor<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

