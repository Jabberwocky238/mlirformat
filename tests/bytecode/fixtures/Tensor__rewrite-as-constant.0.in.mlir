"builtin.module"() ({
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg13: !transform.any_op loc("<stdin>":4:10)):
      %19 = "transform.structured.match"(%arg13) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func"> loc("<stdin>":5:13)
      "transform.apply_patterns"(%19) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.tensor.rewrite_as_constant"() : () -> () loc("<stdin>":7:9)
      }) : (!transform.op<"func.func">) -> () loc("<stdin>":6:7)
      "transform.yield"() : () -> () loc("<stdin>":9:7)
    }) : () -> () loc("<stdin>":3:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> tensor<2x3x5xf32>, sym_name = "tensor_generate_constant"}> ({
    %17 = "arith.constant"() <{value = 5.000000e+00 : f32}> : () -> f32 loc("<stdin>":13:11)
    %18 = "tensor.generate"() ({
    ^bb0(%arg10: index loc("<stdin>":15:10), %arg11: index loc("<stdin>":15:25), %arg12: index loc("<stdin>":15:40)):
      "tensor.yield"(%17) : (f32) -> () loc("<stdin>":16:7)
    }) : () -> tensor<2x3x5xf32> loc("<stdin>":14:11)
    "func.return"(%18) : (tensor<2x3x5xf32>) -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = () -> tensor<?x?xi32>, sym_name = "pad_of_ints"}> ({
    %13 = "arith.constant"() <{value = dense<[[6, 7], [8, 9]]> : tensor<2x2xi32>}> : () -> tensor<2x2xi32> loc("<stdin>":21:11)
    %14 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":22:11)
    %15 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":23:11)
    %16 = "tensor.pad"(%13, %15, %15, %15, %15) <{operandSegmentSizes = array<i32: 1, 2, 2>, static_high = array<i64: -9223372036854775808, -9223372036854775808>, static_low = array<i64: -9223372036854775808, -9223372036854775808>}> ({
    ^bb0(%arg8: index loc("<stdin>":25:10), %arg9: index loc("<stdin>":25:24)):
      "tensor.yield"(%14) : (i32) -> () loc("<stdin>":26:7)
    }) : (tensor<2x2xi32>, index, index, index, index) -> tensor<?x?xi32> loc("<stdin>":24:11)
    "func.return"(%16) : (tensor<?x?xi32>) -> () loc("<stdin>":28:5)
  }) : () -> () loc("<stdin>":20:3)
  "func.func"() <{function_type = () -> tensor<4x4xf32>, sym_name = "pad_of_floats"}> ({
    %10 = "arith.constant"() <{value = dense<[[6.000000e+00, 7.000000e+00], [8.000000e+00, 9.000000e+00]]> : tensor<2x2xf32>}> : () -> tensor<2x2xf32> loc("<stdin>":31:11)
    %11 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":32:11)
    %12 = "tensor.pad"(%10) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 1, 1>, static_low = array<i64: 1, 1>}> ({
    ^bb0(%arg6: index loc("<stdin>":34:10), %arg7: index loc("<stdin>":34:24)):
      "tensor.yield"(%11) : (f32) -> () loc("<stdin>":35:7)
    }) : (tensor<2x2xf32>) -> tensor<4x4xf32> loc("<stdin>":33:11)
    "func.return"(%12) : (tensor<4x4xf32>) -> () loc("<stdin>":37:5)
  }) : () -> () loc("<stdin>":30:3)
  "func.func"() <{function_type = () -> tensor<3x3xi32>, sym_name = "pad_of_ints_no_low_dims"}> ({
    %7 = "arith.constant"() <{value = dense<[[6, 7], [8, 9]]> : tensor<2x2xi32>}> : () -> tensor<2x2xi32> loc("<stdin>":40:10)
    %8 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":41:10)
    %9 = "tensor.pad"(%7) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 1, 1>, static_low = array<i64: 0, 0>}> ({
    ^bb0(%arg4: index loc("<stdin>":43:10), %arg5: index loc("<stdin>":43:24)):
      "tensor.yield"(%8) : (i32) -> () loc("<stdin>":44:7)
    }) : (tensor<2x2xi32>) -> tensor<3x3xi32> loc("<stdin>":42:10)
    "func.return"(%9) : (tensor<3x3xi32>) -> () loc("<stdin>":46:5)
  }) : () -> () loc("<stdin>":39:3)
  "func.func"() <{function_type = () -> tensor<3x3xi32>, sym_name = "pad_of_ints_no_high_dims"}> ({
    %4 = "arith.constant"() <{value = dense<[[6, 7], [8, 9]]> : tensor<2x2xi32>}> : () -> tensor<2x2xi32> loc("<stdin>":49:10)
    %5 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":50:10)
    %6 = "tensor.pad"(%4) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 0, 0>, static_low = array<i64: 1, 1>}> ({
    ^bb0(%arg2: index loc("<stdin>":52:10), %arg3: index loc("<stdin>":52:24)):
      "tensor.yield"(%5) : (i32) -> () loc("<stdin>":53:7)
    }) : (tensor<2x2xi32>) -> tensor<3x3xi32> loc("<stdin>":51:10)
    "func.return"(%6) : (tensor<3x3xi32>) -> () loc("<stdin>":55:5)
  }) : () -> () loc("<stdin>":48:3)
  "func.func"() <{function_type = () -> (tensor<?x?xi32>, tensor<2x2xi32>), sym_name = "pad_multi_use_do_not_fold"}> ({
    %0 = "arith.constant"() <{value = dense<[[6, 7], [8, 9]]> : tensor<2x2xi32>}> : () -> tensor<2x2xi32> loc("<stdin>":58:10)
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":59:10)
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":60:10)
    %3 = "tensor.pad"(%0, %2, %2, %2, %2) <{operandSegmentSizes = array<i32: 1, 2, 2>, static_high = array<i64: -9223372036854775808, -9223372036854775808>, static_low = array<i64: -9223372036854775808, -9223372036854775808>}> ({
    ^bb0(%arg0: index loc("<stdin>":62:10), %arg1: index loc("<stdin>":62:24)):
      "tensor.yield"(%1) : (i32) -> () loc("<stdin>":63:7)
    }) : (tensor<2x2xi32>, index, index, index, index) -> tensor<?x?xi32> loc("<stdin>":61:10)
    "func.return"(%3, %0) : (tensor<?x?xi32>, tensor<2x2xi32>) -> () loc("<stdin>":65:5)
  }) : () -> () loc("<stdin>":57:3)
}) : () -> () loc("<stdin>":1:1)
