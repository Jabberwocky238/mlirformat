"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<13xi32> loc("<stdin>":3:10)
    %1 = "memref.cast"(%0) : (memref<13xi32>) -> memref<?xi32> loc("<stdin>":4:10)
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":5:10)
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":6:10)
    %4 = "memref.dim"(%1, %3) : (memref<?xi32>, index) -> index loc("<stdin>":7:10)
    %5 = "memref.cast"(%1) : (memref<?xi32>) -> memref<*xi32> loc("<stdin>":8:10)
    "gpu.host_register"(%5) : (memref<*xi32>) -> () loc("<stdin>":9:5)
    "gpu.launch"(%2, %2, %2, %4, %2, %2) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg12: index loc("<stdin>":11:10), %arg13: index loc("<stdin>":11:25), %arg14: index loc("<stdin>":11:40), %arg15: index loc("<stdin>":11:55), %arg16: index loc("<stdin>":11:70), %arg17: index loc("<stdin>":11:85), %arg18: index loc("<stdin>":11:100), %arg19: index loc("<stdin>":11:115), %arg20: index loc("<stdin>":11:130), %arg21: index loc("<stdin>":11:145), %arg22: index loc("<stdin>":11:160), %arg23: index loc("<stdin>":11:175)):
      %7 = "arith.index_cast"(%arg15) : (index) -> i32 loc("<stdin>":12:12)
      "memref.store"(%7, %1, %arg15) : (i32, memref<?xi32>, index) -> () loc("<stdin>":13:7)
      "gpu.terminator"() : () -> () loc("<stdin>":14:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":10:5)
    "gpu.launch"(%2, %2, %2, %4, %2, %2) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg0: index loc("<stdin>":17:10), %arg1: index loc("<stdin>":17:24), %arg2: index loc("<stdin>":17:38), %arg3: index loc("<stdin>":17:52), %arg4: index loc("<stdin>":17:66), %arg5: index loc("<stdin>":17:80), %arg6: index loc("<stdin>":17:94), %arg7: index loc("<stdin>":17:108), %arg8: index loc("<stdin>":17:122), %arg9: index loc("<stdin>":17:136), %arg10: index loc("<stdin>":17:150), %arg11: index loc("<stdin>":17:165)):
      %6 = "arith.index_cast"(%arg3) : (index) -> i32 loc("<stdin>":18:12)
      "memref.store"(%6, %1, %arg3) : (i32, memref<?xi32>, index) -> () loc("<stdin>":19:7)
      "gpu.terminator"() : () -> () loc("<stdin>":20:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":16:5)
    "func.call"(%5) <{callee = @printMemrefI32}> : (memref<*xi32>) -> () loc("<stdin>":22:5)
    "func.return"() : () -> () loc("<stdin>":23:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<*xi32>) -> (), sym_name = "printMemrefI32", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":25:3)
}) : () -> () loc("<stdin>":1:1)
