"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> memref<?x?xf32>, sym_name = "memref_cast"}> ({
  ^bb0(%arg0: index loc("<stdin>":6:8), %arg1: index loc("<stdin>":6:22)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":7:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":8:10)
    %2 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":9:10)
    %3 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":10:10)
    %4 = "memref.alloc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xi8> loc("<stdin>":11:10)
    %5 = "memref.view"(%4, %0) : (memref<?xi8>, index) -> memref<16x16xf32> loc("<stdin>":12:10)
    %6 = "memref.cast"(%5) : (memref<16x16xf32>) -> memref<?x?xf32> loc("<stdin>":13:10)
    "linalg.matmul"(%6, %6, %6) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":15:10), %arg3: f32 loc("<stdin>":15:22), %arg4: f32 loc("<stdin>":15:34)):
      %7 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":16:12)
      %8 = "arith.addf"(%arg4, %7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":17:12)
      "linalg.yield"(%8) : (f32) -> () loc("<stdin>":18:7)
    }) : (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> () loc("<stdin>":14:5)
    "func.return"(%6) : (memref<?x?xf32>) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":5:3)
}) : () -> () loc("<stdin>":4:1)
