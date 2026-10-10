"builtin.module"() ({
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg13: !transform.any_op):
      %19 = "transform.structured.match"(%arg13) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%19) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.tensor.rewrite_as_constant"() : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
  "func.func"() <{function_type = () -> tensor<2x3x5xf32>, sym_name = "tensor_generate_constant"}> ({
    %17 = "arith.constant"() <{value = 5.000000e+00 : f32}> : () -> f32
    %18 = "tensor.generate"() ({
    ^bb0(%arg10: index, %arg11: index, %arg12: index):
      "tensor.yield"(%17) : (f32) -> ()
    }) : () -> tensor<2x3x5xf32>
    "func.return"(%18) : (tensor<2x3x5xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> tensor<?x?xi32>, sym_name = "pad_of_ints"}> ({
    %13 = "arith.constant"() <{value = dense<[[6, 7], [8, 9]]> : tensor<2x2xi32>}> : () -> tensor<2x2xi32>
    %14 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %15 = "arith.constant"() <{value = 1 : index}> : () -> index
    %16 = "tensor.pad"(%13, %15, %15, %15, %15) <{operandSegmentSizes = array<i32: 1, 2, 2>, static_high = array<i64: -9223372036854775808, -9223372036854775808>, static_low = array<i64: -9223372036854775808, -9223372036854775808>}> ({
    ^bb0(%arg8: index, %arg9: index):
      "tensor.yield"(%14) : (i32) -> ()
    }) : (tensor<2x2xi32>, index, index, index, index) -> tensor<?x?xi32>
    "func.return"(%16) : (tensor<?x?xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> tensor<4x4xf32>, sym_name = "pad_of_floats"}> ({
    %10 = "arith.constant"() <{value = dense<[[6.000000e+00, 7.000000e+00], [8.000000e+00, 9.000000e+00]]> : tensor<2x2xf32>}> : () -> tensor<2x2xf32>
    %11 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %12 = "tensor.pad"(%10) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 1, 1>, static_low = array<i64: 1, 1>}> ({
    ^bb0(%arg6: index, %arg7: index):
      "tensor.yield"(%11) : (f32) -> ()
    }) : (tensor<2x2xf32>) -> tensor<4x4xf32>
    "func.return"(%12) : (tensor<4x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> tensor<3x3xi32>, sym_name = "pad_of_ints_no_low_dims"}> ({
    %7 = "arith.constant"() <{value = dense<[[6, 7], [8, 9]]> : tensor<2x2xi32>}> : () -> tensor<2x2xi32>
    %8 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %9 = "tensor.pad"(%7) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 1, 1>, static_low = array<i64: 0, 0>}> ({
    ^bb0(%arg4: index, %arg5: index):
      "tensor.yield"(%8) : (i32) -> ()
    }) : (tensor<2x2xi32>) -> tensor<3x3xi32>
    "func.return"(%9) : (tensor<3x3xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> tensor<3x3xi32>, sym_name = "pad_of_ints_no_high_dims"}> ({
    %4 = "arith.constant"() <{value = dense<[[6, 7], [8, 9]]> : tensor<2x2xi32>}> : () -> tensor<2x2xi32>
    %5 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %6 = "tensor.pad"(%4) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 0, 0>, static_low = array<i64: 1, 1>}> ({
    ^bb0(%arg2: index, %arg3: index):
      "tensor.yield"(%5) : (i32) -> ()
    }) : (tensor<2x2xi32>) -> tensor<3x3xi32>
    "func.return"(%6) : (tensor<3x3xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (tensor<?x?xi32>, tensor<2x2xi32>), sym_name = "pad_multi_use_do_not_fold"}> ({
    %0 = "arith.constant"() <{value = dense<[[6, 7], [8, 9]]> : tensor<2x2xi32>}> : () -> tensor<2x2xi32>
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "tensor.pad"(%0, %2, %2, %2, %2) <{operandSegmentSizes = array<i32: 1, 2, 2>, static_high = array<i64: -9223372036854775808, -9223372036854775808>, static_low = array<i64: -9223372036854775808, -9223372036854775808>}> ({
    ^bb0(%arg0: index, %arg1: index):
      "tensor.yield"(%1) : (i32) -> ()
    }) : (tensor<2x2xi32>, index, index, index, index) -> tensor<?x?xi32>
    "func.return"(%3, %0) : (tensor<?x?xi32>, tensor<2x2xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg2: !transform.any_op):
      %4 = "transform.structured.match"(%arg2) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%4) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.tensor.rewrite_as_constant"() <{aggressive}> : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
  "func.func"() <{function_type = () -> (tensor<?x?xi32>, tensor<2x2xi32>), sym_name = "pad_aggressive_fold"}> ({
    %0 = "arith.constant"() <{value = dense<7> : tensor<2x2xi32>}> : () -> tensor<2x2xi32>
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "tensor.pad"(%0, %2, %2, %2, %2) <{operandSegmentSizes = array<i32: 1, 2, 2>, static_high = array<i64: -9223372036854775808, -9223372036854775808>, static_low = array<i64: -9223372036854775808, -9223372036854775808>}> ({
    ^bb0(%arg0: index, %arg1: index):
      "tensor.yield"(%1) : (i32) -> ()
    }) : (tensor<2x2xi32>, index, index, index, index) -> tensor<?x?xi32>
    "func.return"(%3, %0) : (tensor<?x?xi32>, tensor<2x2xi32>) -> ()
  }) : () -> ()
}) : () -> ()

