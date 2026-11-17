"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2048x2048xf32>, tensor<2048x2048xf32>) -> tensor<2048x2048xf32>, sym_name = "fold_add_on_two_matmuls"}> ({
  ^bb0(%arg1: tensor<2048x2048xf32> loc("<stdin>":6:8), %arg2: tensor<2048x2048xf32> loc("<stdin>":6:38)):
    %1 = "arith.constant"() <{value = dense<1.11111104> : tensor<2048x2048xf32>}> : () -> tensor<2048x2048xf32> loc("<stdin>":7:10)
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":8:10)
    %3 = "tensor.empty"() : () -> tensor<2048x2048xf32> loc("<stdin>":9:10)
    %4 = "linalg.fill"(%2, %3) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg14: f32 loc("<stdin>":11:10), %arg15: f32 loc("<stdin>":11:23)):
      "linalg.yield"(%arg14) : (f32) -> () loc("<stdin>":12:7)
    }) : (f32, tensor<2048x2048xf32>) -> tensor<2048x2048xf32> loc("<stdin>":10:10)
    %5 = "linalg.matmul"(%arg1, %1, %4) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg11: f32 loc("<stdin>":15:10), %arg12: f32 loc("<stdin>":15:23), %arg13: f32 loc("<stdin>":15:36)):
      %13 = "arith.mulf"(%arg11, %arg12) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":16:13)
      %14 = "arith.addf"(%arg13, %13) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":17:13)
      "linalg.yield"(%14) : (f32) -> () loc("<stdin>":18:7)
    }) : (tensor<2048x2048xf32>, tensor<2048x2048xf32>, tensor<2048x2048xf32>) -> tensor<2048x2048xf32> loc("<stdin>":14:10)
    %6 = "tensor.empty"() : () -> tensor<2048x2048xf32> loc("<stdin>":20:10)
    %7 = "linalg.fill"(%2, %3) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg9: f32 loc("<stdin>":22:10), %arg10: f32 loc("<stdin>":22:22)):
      "linalg.yield"(%arg9) : (f32) -> () loc("<stdin>":23:7)
    }) : (f32, tensor<2048x2048xf32>) -> tensor<2048x2048xf32> loc("<stdin>":21:10)
    %8 = "linalg.matmul"(%arg2, %1, %7) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: f32 loc("<stdin>":26:10), %arg7: f32 loc("<stdin>":26:22), %arg8: f32 loc("<stdin>":26:34)):
      %11 = "arith.mulf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":27:13)
      %12 = "arith.addf"(%arg8, %11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":28:13)
      "linalg.yield"(%12) : (f32) -> () loc("<stdin>":29:7)
    }) : (tensor<2048x2048xf32>, tensor<2048x2048xf32>, tensor<2048x2048xf32>) -> tensor<2048x2048xf32> loc("<stdin>":25:10)
    %9 = "linalg.add"(%5, %8, %3) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":32:10), %arg4: f32 loc("<stdin>":32:22), %arg5: f32 loc("<stdin>":32:34)):
      %10 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":33:13)
      "linalg.yield"(%10) : (f32) -> () loc("<stdin>":34:7)
    }) : (tensor<2048x2048xf32>, tensor<2048x2048xf32>, tensor<2048x2048xf32>) -> tensor<2048x2048xf32> loc("<stdin>":31:10)
    "func.return"(%9) : (tensor<2048x2048xf32>) -> () loc("<stdin>":36:5)
  }) : () -> () loc("<stdin>":5:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":40:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":41:12)
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.linalg.fold_add_into_dest"() : () -> () loc("<stdin>":43:9)
      }) : (!transform.any_op) -> () loc("<stdin>":42:7)
      "transform.yield"() : () -> () loc("<stdin>":45:7)
    }) : () -> () loc("<stdin>":39:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":38:3)
}) : () -> () loc("<stdin>":4:1)
