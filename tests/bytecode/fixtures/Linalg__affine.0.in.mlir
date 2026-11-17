"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xi8>, index, index, index) -> (), sym_name = "matmul"}> ({
  ^bb0(%arg6: memref<?xi8> loc("<stdin>":9:8), %arg7: index loc("<stdin>":9:29), %arg8: index loc("<stdin>":9:43), %arg9: index loc("<stdin>":9:57)):
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":10:10)
    %3 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":11:10)
    %4 = "memref.view"(%arg6, %2, %arg7, %arg9) : (memref<?xi8>, index, index, index) -> memref<?x?xf32> loc("<stdin>":12:10)
    %5 = "memref.view"(%arg6, %2, %arg9, %arg8) : (memref<?xi8>, index, index, index) -> memref<?x?xf32> loc("<stdin>":13:10)
    %6 = "memref.view"(%arg6, %2, %arg7, %arg8) : (memref<?xi8>, index, index, index) -> memref<?x?xf32> loc("<stdin>":14:10)
    "linalg.matmul"(%4, %5, %6) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg10: f32 loc("<stdin>":16:10), %arg11: f32 loc("<stdin>":16:23), %arg12: f32 loc("<stdin>":16:36)):
      %7 = "arith.mulf"(%arg10, %arg11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":17:12)
      %8 = "arith.addf"(%arg12, %7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":18:12)
      "linalg.yield"(%8) : (f32) -> () loc("<stdin>":19:7)
    }) : (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> () loc("<stdin>":15:5)
    "func.return"() : () -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = (memref<?x?x?xf32>, memref<?x?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "named_batch_matmul"}> ({
  ^bb0(%arg0: memref<?x?x?xf32> loc("<stdin>":24:8), %arg1: memref<?x?x?xf32> loc("<stdin>":24:34), %arg2: memref<?x?x?xf32> loc("<stdin>":24:60)):
    "linalg.batch_matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":26:10), %arg4: f32 loc("<stdin>":26:22), %arg5: f32 loc("<stdin>":26:34)):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":27:12)
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":28:12)
      "linalg.yield"(%1) : (f32) -> () loc("<stdin>":29:7)
    }) : (memref<?x?x?xf32>, memref<?x?x?xf32>, memref<?x?x?xf32>) -> () loc("<stdin>":25:5)
    "func.return"() : () -> () loc("<stdin>":31:5)
  }) : () -> () loc("<stdin>":23:3)
}) : () -> () loc("<stdin>":7:1)
