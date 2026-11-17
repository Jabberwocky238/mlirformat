"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index, index, index, memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> (), sym_name = "parallel_loop"}> ({
  ^bb0(%arg0: index loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:22), %arg2: index loc("<stdin>":3:36), %arg3: index loc("<stdin>":3:50), %arg4: index loc("<stdin>":3:64), %arg5: index loc("<stdin>":3:78), %arg6: memref<?x?xf32> loc("<stdin>":3:92), %arg7: memref<?x?xf32> loc("<stdin>":3:116), %arg8: memref<?x?xf32> loc("<stdin>":3:140), %arg9: memref<?x?xf32> loc("<stdin>":3:164)):
    "scf.parallel"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg10: index loc("<stdin>":5:10), %arg11: index loc("<stdin>":5:25)):
      %0 = "memref.load"(%arg7, %arg10, %arg11) : (memref<?x?xf32>, index, index) -> f32 loc("<stdin>":6:12)
      %1 = "memref.load"(%arg8, %arg10, %arg11) : (memref<?x?xf32>, index, index) -> f32 loc("<stdin>":7:12)
      %2 = "arith.addf"(%0, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":8:12)
      "memref.store"(%2, %arg9, %arg10, %arg11) : (f32, memref<?x?xf32>, index, index) -> () loc("<stdin>":9:7)
      "scf.reduce"() : () -> () loc("<stdin>":10:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":4:5)
    "func.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
