"builtin.module"() ({
  "func.func"() <{function_type = (memref<3x4xf32>, memref<4x3xf32>, memref<3x3xf32>) -> (), sym_name = "matmul_to_outerproduct"}> ({
  ^bb0(%arg1: memref<3x4xf32> loc("<stdin>":6:8), %arg2: memref<4x3xf32> loc("<stdin>":6:32), %arg3: memref<3x3xf32> loc("<stdin>":6:56)):
    "linalg.matmul"(%arg1, %arg2, %arg3) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32 loc("<stdin>":8:10), %arg5: f32 loc("<stdin>":8:22), %arg6: f32 loc("<stdin>":8:34)):
      %2 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":9:12)
      %3 = "arith.addf"(%arg6, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":10:12)
      "linalg.yield"(%3) : (f32) -> () loc("<stdin>":11:7)
    }) : (memref<3x4xf32>, memref<4x3xf32>, memref<3x3xf32>) -> () loc("<stdin>":7:5)
    "func.return"() : () -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":5:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":17:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":18:12)
      %1 = "transform.structured.match"(%0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":19:12)
      "transform.structured.vectorize"(%1) : (!transform.any_op) -> () loc("<stdin>":20:7)
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.reduction_to_contract"() : () -> () loc("<stdin>":22:9)
        "transform.apply_patterns.vector.transfer_permutation_patterns"() : () -> () loc("<stdin>":23:9)
      }) : (!transform.any_op) -> () loc("<stdin>":21:7)
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_contraction"() <{lowering_strategy = 2 : i32}> : () -> () loc("<stdin>":26:9)
      }) : (!transform.any_op) -> () loc("<stdin>":25:7)
      "transform.yield"() : () -> () loc("<stdin>":28:7)
    }) : () -> () loc("<stdin>":16:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":15:3)
}) : () -> () loc("<stdin>":4:1)
