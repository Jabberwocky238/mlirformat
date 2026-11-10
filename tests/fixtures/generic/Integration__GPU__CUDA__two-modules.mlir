"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<13xi32>
    %1 = "memref.cast"(%0) : (memref<13xi32>) -> memref<?xi32>
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "memref.dim"(%1, %3) : (memref<?xi32>, index) -> index
    %5 = "memref.cast"(%1) : (memref<?xi32>) -> memref<*xi32>
    "gpu.host_register"(%5) : (memref<*xi32>) -> ()
    "gpu.launch"(%2, %2, %2, %4, %2, %2) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg12: index, %arg13: index, %arg14: index, %arg15: index, %arg16: index, %arg17: index, %arg18: index, %arg19: index, %arg20: index, %arg21: index, %arg22: index, %arg23: index):
      %7 = "arith.index_cast"(%arg15) : (index) -> i32
      "memref.store"(%7, %1, %arg15) : (i32, memref<?xi32>, index) -> ()
      "gpu.terminator"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "gpu.launch"(%2, %2, %2, %4, %2, %2) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index):
      %6 = "arith.index_cast"(%arg3) : (index) -> i32
      "memref.store"(%6, %1, %arg3) : (i32, memref<?xi32>, index) -> ()
      "gpu.terminator"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "func.call"(%5) <{callee = @printMemrefI32}> : (memref<*xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<*xi32>) -> (), sym_name = "printMemrefI32", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

