"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1023x255xf32>, tensor<255x127xf32>, tensor<1023x127xf32>) -> tensor<1023x127xf32>, sym_name = "matmul_mk_kn_mn"}> ({
  ^bb0(%arg1: tensor<1023x255xf32> loc("<stdin>":6:8), %arg2: tensor<255x127xf32> loc("<stdin>":6:37), %arg3: tensor<1023x127xf32> loc("<stdin>":6:65)):
    %2 = "linalg.matmul"(%arg1, %arg2, %arg3) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32 loc("<stdin>":8:10), %arg5: f32 loc("<stdin>":8:22), %arg6: f32 loc("<stdin>":8:34)):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":9:12)
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":10:12)
      "linalg.yield"(%4) : (f32) -> () loc("<stdin>":11:7)
    }) : (tensor<1023x255xf32>, tensor<255x127xf32>, tensor<1023x127xf32>) -> tensor<1023x127xf32> loc("<stdin>":7:10)
    "func.return"(%2) : (tensor<1023x127xf32>) -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":5:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":17:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.op<"linalg.matmul"> loc("<stdin>":18:12)
      %1 = "transform.structured.pack_greedily"(%0) <{matmul_inner_dims_order = array<i64: 1, 2, 0>, matmul_padded_sizes_next_multiple_of = array<i64>, static_matmul_packed_sizes = array<i64: 8, 16, 32>}> : (!transform.op<"linalg.matmul">) -> !transform.op<"linalg.generic"> loc("<stdin>":19:12)
      "transform.yield"() : () -> () loc("<stdin>":20:7)
    }) : () -> () loc("<stdin>":16:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":15:3)
}) : () -> () loc("<stdin>":4:1)
