"builtin.module"() ({
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?xf32>) -> memref<?x?xf32>, sym_name = "matmul"}> ({
  ^bb0(%arg0: memref<?x?xf32> loc("<stdin>":8:8), %arg1: memref<?x?xf32> loc("<stdin>":8:32)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":9:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":10:10)
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":11:10)
    %3 = "memref.dim"(%arg0, %0) : (memref<?x?xf32>, index) -> index loc("<stdin>":12:10)
    %4 = "memref.dim"(%arg1, %1) : (memref<?x?xf32>, index) -> index loc("<stdin>":13:10)
    %5 = "memref.alloc"(%3, %4) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32> loc("<stdin>":14:10)
    "linalg.fill"(%2, %5) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg5: f32 loc("<stdin>":16:10), %arg6: f32 loc("<stdin>":16:22)):
      "linalg.yield"(%arg5) : (f32) -> () loc("<stdin>":17:7)
    }) : (f32, memref<?x?xf32>) -> () loc("<stdin>":15:5)
    "linalg.matmul"(%arg0, %arg1, %5) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":20:10), %arg3: f32 loc("<stdin>":20:22), %arg4: f32 loc("<stdin>":20:34)):
      %6 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":21:12)
      %7 = "arith.addf"(%arg4, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":22:12)
      "linalg.yield"(%7) : (f32) -> () loc("<stdin>":23:7)
    }) : (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> () loc("<stdin>":19:5)
    "func.return"(%5) : (memref<?x?xf32>) -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":7:3)
}) : () -> () loc("<stdin>":4:1)
