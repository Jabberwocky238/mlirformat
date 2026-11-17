"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x4x13xf32> loc("<stdin>":3:10)
    %1 = "memref.cast"(%0) : (memref<2x4x13xf32>) -> memref<?x?x?xf32> loc("<stdin>":4:10)
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:10)
    %3 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":6:10)
    %4 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":7:10)
    %5 = "memref.dim"(%1, %4) : (memref<?x?x?xf32>, index) -> index loc("<stdin>":8:10)
    %6 = "memref.dim"(%1, %3) : (memref<?x?x?xf32>, index) -> index loc("<stdin>":9:10)
    %7 = "memref.dim"(%1, %2) : (memref<?x?x?xf32>, index) -> index loc("<stdin>":10:10)
    %8 = "memref.cast"(%1) : (memref<?x?x?xf32>) -> memref<*xf32> loc("<stdin>":11:10)
    "gpu.host_register"(%8) : (memref<*xf32>) -> () loc("<stdin>":12:5)
    "gpu.launch"(%3, %3, %3, %5, %6, %7) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg0: index loc("<stdin>":14:10), %arg1: index loc("<stdin>":14:24), %arg2: index loc("<stdin>":14:38), %arg3: index loc("<stdin>":14:52), %arg4: index loc("<stdin>":14:66), %arg5: index loc("<stdin>":14:80), %arg6: index loc("<stdin>":14:94), %arg7: index loc("<stdin>":14:108), %arg8: index loc("<stdin>":14:122), %arg9: index loc("<stdin>":14:136), %arg10: index loc("<stdin>":14:150), %arg11: index loc("<stdin>":14:165)):
      %9 = "arith.muli"(%arg5, %arg10) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":15:12)
      %10 = "arith.addi"(%arg4, %9) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":16:13)
      %11 = "arith.muli"(%10, %arg9) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":17:13)
      %12 = "arith.addi"(%arg3, %11) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":18:13)
      %13 = "arith.index_cast"(%12) : (index) -> i32 loc("<stdin>":19:13)
      %14 = "arith.sitofp"(%13) : (i32) -> f32 loc("<stdin>":20:13)
      %15 = "gpu.all_reduce"(%14) <{op = #gpu<all_reduce_op add>, uniform}> ({
      }) : (f32) -> f32 loc("<stdin>":21:13)
      "memref.store"(%15, %1, %arg5, %arg4, %arg3) : (f32, memref<?x?x?xf32>, index, index, index) -> () loc("<stdin>":23:7)
      "gpu.terminator"() : () -> () loc("<stdin>":24:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":13:5)
    "func.call"(%8) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":26:5)
    "func.return"() : () -> () loc("<stdin>":27:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":29:3)
}) : () -> () loc("<stdin>":1:1)
