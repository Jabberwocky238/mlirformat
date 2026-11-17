"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x128xf32>, tensor<128x128xf32>, tensor<128x128xf32>) -> tensor<128x128xf32>, sym_name = "block_matmul"}> ({
  ^bb0(%arg0: tensor<128x128xf32> loc("<stdin>":6:8), %arg1: tensor<128x128xf32> loc("<stdin>":6:36), %arg2: tensor<128x128xf32> loc("<stdin>":6:64)):
    %0 = "linalg.matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":8:10), %arg4: f32 loc("<stdin>":8:22), %arg5: f32 loc("<stdin>":8:34)):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":9:12)
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":10:12)
      "linalg.yield"(%2) : (f32) -> () loc("<stdin>":11:7)
    }) : (tensor<128x128xf32>, tensor<128x128xf32>, tensor<128x128xf32>) -> tensor<128x128xf32> loc("<stdin>":7:10)
    "func.return"(%0) : (tensor<128x128xf32>) -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":5:3)
}) : () -> () loc("<stdin>":4:1)
