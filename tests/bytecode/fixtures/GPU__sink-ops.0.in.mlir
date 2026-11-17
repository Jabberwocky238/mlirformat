"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>) -> (), sym_name = "extra_constants"}> ({
  ^bb0(%arg0: memref<?xf32> loc("<stdin>":3:8)):
    %0 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":5:10)
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":6:10)
    %3 = "memref.dim"(%arg0, %2) : (memref<?xf32>, index) -> index loc("<stdin>":7:10)
    "gpu.launch"(%0, %0, %0, %0, %0, %0) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg1: index loc("<stdin>":9:10), %arg2: index loc("<stdin>":9:24), %arg3: index loc("<stdin>":9:38), %arg4: index loc("<stdin>":9:52), %arg5: index loc("<stdin>":9:66), %arg6: index loc("<stdin>":9:80), %arg7: index loc("<stdin>":9:94), %arg8: index loc("<stdin>":9:108), %arg9: index loc("<stdin>":9:122), %arg10: index loc("<stdin>":9:136), %arg11: index loc("<stdin>":9:151), %arg12: index loc("<stdin>":9:166)):
      "use"(%1, %arg0, %3) : (index, memref<?xf32>, index) -> () loc("<stdin>":10:7)
      "gpu.terminator"() : () -> () loc("<stdin>":11:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":8:5)
    "func.return"() : () -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
