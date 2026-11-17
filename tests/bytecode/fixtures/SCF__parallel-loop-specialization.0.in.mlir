"builtin.module"() ({
  "func.func"() <{function_type = (index, index, memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> (), sym_name = "parallel_loop"}> ({
  ^bb0(%arg0: index loc("<stdin>":5:8), %arg1: index loc("<stdin>":5:22), %arg2: memref<?x?xf32> loc("<stdin>":5:36), %arg3: memref<?x?xf32> loc("<stdin>":5:60), %arg4: memref<?x?xf32> loc("<stdin>":5:84), %arg5: memref<?x?xf32> loc("<stdin>":5:108)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":6:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":7:10)
    %2 = "memref.dim"(%arg2, %0) : (memref<?x?xf32>, index) -> index loc("<stdin>":8:10)
    %3 = "memref.dim"(%arg2, %1) : (memref<?x?xf32>, index) -> index loc("<stdin>":9:10)
    %4 = "affine.min"(%2, %arg0) <{map = affine_map<()[s0, s1] -> (1024, s0 - s1)>}> : (index, index) -> index loc("<stdin>":10:10)
    %5 = "affine.min"(%3, %arg1) <{map = affine_map<()[s0, s1] -> (64, s0 - s1)>}> : (index, index) -> index loc("<stdin>":11:10)
    "scf.parallel"(%0, %0, %4, %5, %1, %1) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg6: index loc("<stdin>":13:10), %arg7: index loc("<stdin>":13:24)):
      %6 = "memref.load"(%arg3, %arg6, %arg7) : (memref<?x?xf32>, index, index) -> f32 loc("<stdin>":14:12)
      %7 = "memref.load"(%arg4, %arg6, %arg7) : (memref<?x?xf32>, index, index) -> f32 loc("<stdin>":15:12)
      %8 = "arith.addf"(%6, %7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":16:12)
      "memref.store"(%8, %arg5, %arg6, %arg7) : (f32, memref<?x?xf32>, index, index) -> () loc("<stdin>":17:7)
      "scf.reduce"() : () -> () loc("<stdin>":18:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":12:5)
    "func.return"() : () -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":4:3)
}) : () -> () loc("<stdin>":3:1)
