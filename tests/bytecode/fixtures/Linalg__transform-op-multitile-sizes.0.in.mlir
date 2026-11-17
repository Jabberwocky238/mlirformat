"builtin.module"() ({
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg6: !transform.any_op loc("<stdin>":7:10)):
      %3 = "transform.structured.match"(%arg6) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":8:12)
      %4:3 = "transform.structured.multitile_sizes"(%3) <{dimension = 0 : i64, divisor = 1 : i64, target_size = 3 : i64}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":9:14)
      "transform.yield"() : () -> () loc("<stdin>":10:7)
    }) : () -> () loc("<stdin>":6:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = (tensor<13x34xf32>, tensor<34x42xf32>, tensor<13x42xf32>) -> tensor<13x42xf32>, sym_name = "multitile_sizes_static"}> ({
  ^bb0(%arg0: tensor<13x34xf32> loc("<stdin>":14:8), %arg1: tensor<34x42xf32> loc("<stdin>":14:34), %arg2: tensor<13x42xf32> loc("<stdin>":14:60)):
    %0 = "linalg.matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":16:10), %arg4: f32 loc("<stdin>":16:22), %arg5: f32 loc("<stdin>":16:34)):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":17:12)
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":18:12)
      "linalg.yield"(%2) : (f32) -> () loc("<stdin>":19:7)
    }) : (tensor<13x34xf32>, tensor<34x42xf32>, tensor<13x42xf32>) -> tensor<13x42xf32> loc("<stdin>":15:10)
    "func.return"(%0) : (tensor<13x42xf32>) -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":13:3)
}) : () -> () loc("<stdin>":4:1)
