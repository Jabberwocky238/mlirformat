"builtin.module"() ({
  "func.func"() <{function_type = (f32, memref<?xf32>) -> (), sym_name = "other_func"}> ({
  ^bb0(%arg0: f32 loc("<stdin>":3:8), %arg1: memref<?xf32> loc("<stdin>":3:20)):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:10)
    %2 = "memref.dim"(%arg1, %1) : (memref<?xf32>, index) -> index loc("<stdin>":6:10)
    "gpu.launch"(%0, %0, %0, %2, %0, %0) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg2: index loc("<stdin>":8:10), %arg3: index loc("<stdin>":8:24), %arg4: index loc("<stdin>":8:38), %arg5: index loc("<stdin>":8:52), %arg6: index loc("<stdin>":8:66), %arg7: index loc("<stdin>":8:80), %arg8: index loc("<stdin>":8:94), %arg9: index loc("<stdin>":8:108), %arg10: index loc("<stdin>":8:122), %arg11: index loc("<stdin>":8:137), %arg12: index loc("<stdin>":8:152), %arg13: index loc("<stdin>":8:167)):
      "memref.store"(%arg0, %arg1, %arg5) : (f32, memref<?xf32>, index) -> () loc("<stdin>":9:7)
      "gpu.terminator"() : () -> () loc("<stdin>":10:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":7:5)
    "func.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
