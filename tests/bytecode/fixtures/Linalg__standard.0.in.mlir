"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32, strided<[1], offset: ?>>, memref<?xf32, strided<[1], offset: ?>>, memref<f32>) -> (), sym_name = "dot"}> ({
  ^bb0(%arg0: memref<?xf32, strided<[1], offset: ?>> loc("<stdin>":5:8), %arg1: memref<?xf32, strided<[1], offset: ?>> loc("<stdin>":5:55), %arg2: memref<f32> loc("<stdin>":5:102)):
    "linalg.dot"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":7:10), %arg4: f32 loc("<stdin>":7:22), %arg5: f32 loc("<stdin>":7:34)):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":8:12)
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":9:12)
      "linalg.yield"(%1) : (f32) -> () loc("<stdin>":10:7)
    }) {linalg.memoized_indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>]} : (memref<?xf32, strided<[1], offset: ?>>, memref<?xf32, strided<[1], offset: ?>>, memref<f32>) -> () loc("<stdin>":6:5)
    "func.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":4:3)
}) : () -> () loc("<stdin>":3:1)
