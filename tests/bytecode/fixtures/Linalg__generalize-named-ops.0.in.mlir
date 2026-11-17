"builtin.module"() ({
  "func.func"() <{function_type = (memref<16x8xf32>, memref<8x32xf32>, memref<16x32xf32>) -> (), sym_name = "generalize_matmul_buffer"}> ({
  ^bb0(%arg0: memref<16x8xf32> loc("<stdin>":6:8), %arg1: memref<8x32xf32> loc("<stdin>":6:33), %arg2: memref<16x32xf32> loc("<stdin>":6:58)):
    "linalg.matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":8:10), %arg4: f32 loc("<stdin>":8:22), %arg5: f32 loc("<stdin>":8:34)):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":9:12)
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":10:12)
      "linalg.yield"(%1) : (f32) -> () loc("<stdin>":11:7)
    }) : (memref<16x8xf32>, memref<8x32xf32>, memref<16x32xf32>) -> () loc("<stdin>":7:5)
    "func.return"() : () -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":5:3)
}) : () -> () loc("<stdin>":4:1)
