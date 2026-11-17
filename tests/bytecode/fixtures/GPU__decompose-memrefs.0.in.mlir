"builtin.module"() ({
  "func.func"() <{function_type = (f32, memref<?x?x?xf32>) -> (), sym_name = "decompose_store"}> ({
  ^bb0(%arg0: f32 loc("<stdin>":3:8), %arg1: memref<?x?x?xf32> loc("<stdin>":3:20)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":5:10)
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":6:10)
    %3 = "memref.dim"(%arg1, %0) : (memref<?x?x?xf32>, index) -> index loc("<stdin>":7:10)
    %4 = "memref.dim"(%arg1, %1) : (memref<?x?x?xf32>, index) -> index loc("<stdin>":8:10)
    %5 = "memref.dim"(%arg1, %2) : (memref<?x?x?xf32>, index) -> index loc("<stdin>":9:10)
    "gpu.launch"(%1, %1, %1, %3, %4, %5) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg2: index loc("<stdin>":11:10), %arg3: index loc("<stdin>":11:24), %arg4: index loc("<stdin>":11:38), %arg5: index loc("<stdin>":11:52), %arg6: index loc("<stdin>":11:66), %arg7: index loc("<stdin>":11:80), %arg8: index loc("<stdin>":11:94), %arg9: index loc("<stdin>":11:108), %arg10: index loc("<stdin>":11:122), %arg11: index loc("<stdin>":11:137), %arg12: index loc("<stdin>":11:152), %arg13: index loc("<stdin>":11:167)):
      "memref.store"(%arg0, %arg1, %arg5, %arg6, %arg7) : (f32, memref<?x?x?xf32>, index, index, index) -> () loc("<stdin>":12:7)
      "gpu.terminator"() : () -> () loc("<stdin>":13:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":10:5)
    "func.return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
