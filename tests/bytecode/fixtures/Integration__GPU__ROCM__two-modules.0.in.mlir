"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<13xi32> loc("<stdin>":3:10)
    %1 = "memref.cast"(%0) : (memref<13xi32>) -> memref<?xi32> loc("<stdin>":4:10)
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:10)
    %3 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":6:10)
    %4 = "memref.dim"(%1, %2) : (memref<?xi32>, index) -> index loc("<stdin>":7:10)
    %5 = "memref.cast"(%1) : (memref<?xi32>) -> memref<*xi32> loc("<stdin>":8:10)
    "gpu.host_register"(%5) : (memref<*xi32>) -> () loc("<stdin>":9:5)
    %6 = "func.call"(%1) <{callee = @mgpuMemGetDeviceMemRef1dInt32}> : (memref<?xi32>) -> memref<?xi32> loc("<stdin>":10:10)
    "gpu.launch"(%3, %3, %3, %4, %3, %3) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg12: index loc("<stdin>":12:10), %arg13: index loc("<stdin>":12:25), %arg14: index loc("<stdin>":12:40), %arg15: index loc("<stdin>":12:55), %arg16: index loc("<stdin>":12:70), %arg17: index loc("<stdin>":12:85), %arg18: index loc("<stdin>":12:100), %arg19: index loc("<stdin>":12:115), %arg20: index loc("<stdin>":12:130), %arg21: index loc("<stdin>":12:145), %arg22: index loc("<stdin>":12:160), %arg23: index loc("<stdin>":12:175)):
      %8 = "arith.index_cast"(%arg15) : (index) -> i32 loc("<stdin>":13:12)
      "memref.store"(%8, %6, %arg15) : (i32, memref<?xi32>, index) -> () loc("<stdin>":14:7)
      "gpu.terminator"() : () -> () loc("<stdin>":15:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":11:5)
    "gpu.launch"(%3, %3, %3, %4, %3, %3) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg0: index loc("<stdin>":18:10), %arg1: index loc("<stdin>":18:24), %arg2: index loc("<stdin>":18:38), %arg3: index loc("<stdin>":18:52), %arg4: index loc("<stdin>":18:66), %arg5: index loc("<stdin>":18:80), %arg6: index loc("<stdin>":18:94), %arg7: index loc("<stdin>":18:108), %arg8: index loc("<stdin>":18:122), %arg9: index loc("<stdin>":18:136), %arg10: index loc("<stdin>":18:150), %arg11: index loc("<stdin>":18:165)):
      %7 = "arith.index_cast"(%arg3) : (index) -> i32 loc("<stdin>":19:12)
      "memref.store"(%7, %6, %arg3) : (i32, memref<?xi32>, index) -> () loc("<stdin>":20:7)
      "gpu.terminator"() : () -> () loc("<stdin>":21:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":17:5)
    "func.call"(%5) <{callee = @printMemrefI32}> : (memref<*xi32>) -> () loc("<stdin>":23:5)
    "func.return"() : () -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<?xi32>) -> memref<?xi32>, sym_name = "mgpuMemGetDeviceMemRef1dInt32", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":26:3)
  "func.func"() <{function_type = (memref<*xi32>) -> (), sym_name = "printMemrefI32", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":28:3)
}) : () -> () loc("<stdin>":1:1)
