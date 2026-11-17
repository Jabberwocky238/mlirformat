"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<index, 1>) -> (), sym_name = "globalId"}> ({
  ^bb0(%arg0: index loc("<stdin>":3:8), %arg1: memref<index, 1> loc("<stdin>":3:22)):
    "gpu.launch"(%arg0, %arg0, %arg0, %arg0, %arg0, %arg0) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg2: index loc("<stdin>":5:10), %arg3: index loc("<stdin>":5:24), %arg4: index loc("<stdin>":5:38), %arg5: index loc("<stdin>":5:52), %arg6: index loc("<stdin>":5:66), %arg7: index loc("<stdin>":5:80), %arg8: index loc("<stdin>":5:94), %arg9: index loc("<stdin>":5:108), %arg10: index loc("<stdin>":5:122), %arg11: index loc("<stdin>":5:137), %arg12: index loc("<stdin>":5:152), %arg13: index loc("<stdin>":5:167)):
      %0 = "gpu.global_id"() <{dimension = #gpu<dim x>}> : () -> index loc("<stdin>":6:12)
      "memref.store"(%0, %arg1) : (index, memref<index, 1>) -> () loc("<stdin>":7:7)
      %1 = "gpu.global_id"() <{dimension = #gpu<dim y>}> : () -> index loc("<stdin>":8:12)
      "memref.store"(%1, %arg1) : (index, memref<index, 1>) -> () loc("<stdin>":9:7)
      %2 = "gpu.global_id"() <{dimension = #gpu<dim z>}> : () -> index loc("<stdin>":10:12)
      "memref.store"(%2, %arg1) : (index, memref<index, 1>) -> () loc("<stdin>":11:7)
      "gpu.terminator"() : () -> () loc("<stdin>":12:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":4:5)
    "func.return"() : () -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
