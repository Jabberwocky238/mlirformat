"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x8xf16>, tensor<8x32xf64>, tensor<16x32xf32>) -> tensor<16x32xf32>, sym_name = "generalize_matmul_tensor_f16f64f32"}> ({
  ^bb0(%arg0: tensor<16x8xf16> loc("<stdin>":6:8), %arg1: tensor<8x32xf64> loc("<stdin>":6:33), %arg2: tensor<16x32xf32> loc("<stdin>":6:58)):
    %0 = "linalg.matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f16 loc("<stdin>":8:10), %arg4: f64 loc("<stdin>":8:22), %arg5: f32 loc("<stdin>":8:34)):
      %1 = "arith.extf"(%arg3) : (f16) -> f32 loc("<stdin>":9:12)
      %2 = "arith.truncf"(%arg4) : (f64) -> f32 loc("<stdin>":10:12)
      %3 = "arith.mulf"(%1, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":11:12)
      %4 = "arith.addf"(%arg5, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":12:12)
      "linalg.yield"(%4) : (f32) -> () loc("<stdin>":13:7)
    }) : (tensor<16x8xf16>, tensor<8x32xf64>, tensor<16x32xf32>) -> tensor<16x32xf32> loc("<stdin>":7:10)
    "func.return"(%0) : (tensor<16x32xf32>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":5:3)
}) : () -> () loc("<stdin>":4:1)
