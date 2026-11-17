"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1024x512xf32>, tensor<512x2000xf32>, tensor<1024x2000xf32>) -> tensor<1024x2000xf32>, sym_name = "matmul"}> ({
  ^bb0(%arg1: tensor<1024x512xf32> loc("<stdin>":6:8), %arg2: tensor<512x2000xf32> loc("<stdin>":6:37), %arg3: tensor<1024x2000xf32> loc("<stdin>":6:66)):
    %5 = "linalg.matmul"(%arg1, %arg2, %arg3) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32 loc("<stdin>":8:10), %arg5: f32 loc("<stdin>":8:22), %arg6: f32 loc("<stdin>":8:34)):
      %6 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":9:12)
      %7 = "arith.addf"(%arg6, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":10:12)
      "linalg.yield"(%7) : (f32) -> () loc("<stdin>":11:7)
    }) : (tensor<1024x512xf32>, tensor<512x2000xf32>, tensor<1024x2000xf32>) -> tensor<1024x2000xf32> loc("<stdin>":7:10)
    "func.return"(%5) : (tensor<1024x2000xf32>) -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":5:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":17:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":18:12)
      %1:4 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, true, false>, static_sizes = array<i64: 8, 16, 1>}> : (!transform.any_op) -> (!transform.any_op, !transform.op<"scf.for">, !transform.op<"scf.for">, !transform.op<"scf.for">) loc("<stdin>":19:14)
      %2:2 = "transform.loop.peel"(%1#2) <{fail_if_already_divisible = false, peel_front = false}> : (!transform.op<"scf.for">) -> (!transform.op<"scf.for">, !transform.op<"scf.for">) loc("<stdin>":20:14)
      %3 = "transform.structured.match"(%2#0) <{ops = ["linalg.matmul"]}> : (!transform.op<"scf.for">) -> !transform.any_op loc("<stdin>":21:12)
      "transform.structured.vectorize"(%3) <{scalable_sizes = array<i1: false, true, false>, static_vector_sizes = array<i64: 8, 16, 1>}> : (!transform.any_op) -> () loc("<stdin>":22:7)
      %4 = "transform.structured.match"(%2#1) <{ops = ["linalg.matmul"]}> : (!transform.op<"scf.for">) -> !transform.any_op loc("<stdin>":23:12)
      "transform.structured.vectorize"(%4) <{scalable_sizes = array<i1: false, true, false>, static_vector_sizes = array<i64: 8, 16, 1>}> : (!transform.any_op) -> () loc("<stdin>":24:7)
      "transform.yield"() : () -> () loc("<stdin>":25:7)
    }) : () -> () loc("<stdin>":16:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":15:3)
}) : () -> () loc("<stdin>":4:1)
