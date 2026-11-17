"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "slicing_linalg_op"}> ({
  ^bb0(%arg0: index loc("<stdin>":6:8), %arg1: index loc("<stdin>":6:22), %arg2: index loc("<stdin>":6:36)):
    %0 = "memref.alloc"(%arg0, %arg2) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32> loc("<stdin>":7:10)
    %1 = "memref.alloc"(%arg2, %arg1) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32> loc("<stdin>":8:10)
    %2 = "memref.alloc"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32> loc("<stdin>":9:10)
    %3 = "memref.alloc"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32> loc("<stdin>":10:10)
    "linalg.matmul"(%0, %1, %2) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: f32 loc("<stdin>":12:10), %arg7: f32 loc("<stdin>":12:22), %arg8: f32 loc("<stdin>":12:34)):
      %6 = "arith.mulf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":13:12)
      %7 = "arith.addf"(%arg8, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":14:12)
      "linalg.yield"(%7) : (f32) -> () loc("<stdin>":15:7)
    }) : (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> () loc("<stdin>":11:5)
    "linalg.matmul"(%0, %1, %3) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":18:10), %arg4: f32 loc("<stdin>":18:22), %arg5: f32 loc("<stdin>":18:34)):
      %4 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":19:12)
      %5 = "arith.addf"(%arg5, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":20:12)
      "linalg.yield"(%5) : (f32) -> () loc("<stdin>":21:7)
    }) : (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> () loc("<stdin>":17:5)
    "memref.dealloc"(%2) : (memref<?x?xf32>) -> () loc("<stdin>":23:5)
    "memref.dealloc"(%1) : (memref<?x?xf32>) -> () loc("<stdin>":24:5)
    "memref.dealloc"(%0) : (memref<?x?xf32>) -> () loc("<stdin>":25:5)
    "memref.dealloc"(%3) : (memref<?x?xf32>) -> () loc("<stdin>":26:5)
    "func.return"() : () -> () loc("<stdin>":27:5)
  }) : () -> () loc("<stdin>":5:3)
}) : () -> () loc("<stdin>":4:1)
