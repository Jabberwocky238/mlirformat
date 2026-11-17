"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<35xf32> loc("<stdin>":3:10)
    %1 = "memref.cast"(%0) : (memref<35xf32>) -> memref<?xf32> loc("<stdin>":4:10)
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":5:10)
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":6:10)
    %4 = "memref.dim"(%1, %3) : (memref<?xf32>, index) -> index loc("<stdin>":7:10)
    %5 = "memref.cast"(%1) : (memref<?xf32>) -> memref<*xf32> loc("<stdin>":8:10)
    "gpu.host_register"(%5) : (memref<*xf32>) -> () loc("<stdin>":9:5)
    "gpu.launch"(%2, %2, %2, %4, %2, %2) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg0: index loc("<stdin>":11:10), %arg1: index loc("<stdin>":11:24), %arg2: index loc("<stdin>":11:38), %arg3: index loc("<stdin>":11:52), %arg4: index loc("<stdin>":11:66), %arg5: index loc("<stdin>":11:80), %arg6: index loc("<stdin>":11:94), %arg7: index loc("<stdin>":11:108), %arg8: index loc("<stdin>":11:122), %arg9: index loc("<stdin>":11:136), %arg10: index loc("<stdin>":11:150), %arg11: index loc("<stdin>":11:165)):
      %6 = "arith.index_cast"(%arg3) : (index) -> i32 loc("<stdin>":12:12)
      %7 = "gpu.all_reduce"(%6) <{uniform}> ({
      ^bb0(%arg12: i32 loc("<stdin>":14:12), %arg13: i32 loc("<stdin>":14:25)):
        %9 = "arith.xori"(%arg12, %arg13) : (i32, i32) -> i32 loc("<stdin>":15:14)
        "gpu.yield"(%9) : (i32) -> () loc("<stdin>":16:9)
      }) : (i32) -> i32 loc("<stdin>":13:12)
      %8 = "arith.sitofp"(%7) : (i32) -> f32 loc("<stdin>":18:12)
      "memref.store"(%8, %1, %arg3) : (f32, memref<?xf32>, index) -> () loc("<stdin>":19:7)
      "gpu.terminator"() : () -> () loc("<stdin>":20:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":10:5)
    "func.call"(%5) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":22:5)
    "func.return"() : () -> () loc("<stdin>":23:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":25:3)
}) : () -> () loc("<stdin>":1:1)
