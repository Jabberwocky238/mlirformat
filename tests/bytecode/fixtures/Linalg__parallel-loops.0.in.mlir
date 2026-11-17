"builtin.module"() ({
  "func.func"() <{function_type = (memref<2x2xf32>, memref<2x2xf32>, memref<2x2xf32>) -> (), sym_name = "linalg_generic_sum"}> ({
  ^bb0(%arg0: memref<2x2xf32> loc("<stdin>":4:8), %arg1: memref<2x2xf32> loc("<stdin>":4:32), %arg2: memref<2x2xf32> loc("<stdin>":4:56)):
    "linalg.generic"(%arg0, %arg1, %arg2) <{indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":6:10), %arg4: f32 loc("<stdin>":6:22), %arg5: f32 loc("<stdin>":6:34)):
      %0 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":7:12)
      "linalg.yield"(%0) : (f32) -> () loc("<stdin>":8:7)
    }) : (memref<2x2xf32>, memref<2x2xf32>, memref<2x2xf32>) -> () loc("<stdin>":5:5)
    "func.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
