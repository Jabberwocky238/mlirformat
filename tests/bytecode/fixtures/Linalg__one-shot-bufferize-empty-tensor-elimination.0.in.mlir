"builtin.module"() ({
  "func.func"() <{function_type = (tensor<50x91xf32>, tensor<91xf32>, tensor<50x1280xf32>, tensor<1280x91xf32>) -> tensor<50x91xf32>, sym_name = "eliminate_tensor_empty"}> ({
  ^bb0(%arg1: tensor<50x91xf32> loc("<stdin>":8:8), %arg2: tensor<91xf32> loc("<stdin>":8:34), %arg3: tensor<50x1280xf32> loc("<stdin>":8:57), %arg4: tensor<1280x91xf32> loc("<stdin>":8:85)):
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":9:10)
    %2 = "tensor.empty"() : () -> tensor<50x91xf32> loc("<stdin>":10:10)
    %3 = "linalg.fill"(%1, %2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg11: f32 loc("<stdin>":12:10), %arg12: f32 loc("<stdin>":12:23)):
      "linalg.yield"(%arg11) : (f32) -> () loc("<stdin>":13:7)
    }) : (f32, tensor<50x91xf32>) -> tensor<50x91xf32> loc("<stdin>":11:10)
    %4 = "linalg.matmul"(%arg3, %arg4, %3) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg8: f32 loc("<stdin>":16:10), %arg9: f32 loc("<stdin>":16:22), %arg10: f32 loc("<stdin>":16:34)):
      %7 = "arith.mulf"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":17:12)
      %8 = "arith.addf"(%arg10, %7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":18:12)
      "linalg.yield"(%8) : (f32) -> () loc("<stdin>":19:7)
    }) : (tensor<50x1280xf32>, tensor<1280x91xf32>, tensor<50x91xf32>) -> tensor<50x91xf32> loc("<stdin>":15:10)
    %5 = "linalg.generic"(%arg2, %4, %arg1) <{indexing_maps = [affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg5: f32 loc("<stdin>":22:10), %arg6: f32 loc("<stdin>":22:22), %arg7: f32 loc("<stdin>":22:34)):
      %6 = "arith.addf"(%arg5, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":23:12)
      "linalg.yield"(%6) : (f32) -> () loc("<stdin>":24:7)
    }) : (tensor<91xf32>, tensor<50x91xf32>, tensor<50x91xf32>) -> tensor<50x91xf32> loc("<stdin>":21:10)
    "func.return"(%5) : (tensor<50x91xf32>) -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":7:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":30:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":31:12)
      "transform.structured.eliminate_empty_tensors"(%0) : (!transform.any_op) -> () loc("<stdin>":32:7)
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.linalg.erase_unnecessary_inputs"() : () -> () loc("<stdin>":34:9)
      }) : (!transform.any_op) -> () loc("<stdin>":33:7)
      "transform.yield"() : () -> () loc("<stdin>":36:7)
    }) : () -> () loc("<stdin>":29:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":28:3)
}) : () -> () loc("<stdin>":6:1)
