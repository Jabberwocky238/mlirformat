"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x4x13xf32>
    %1 = "memref.cast"(%0) : (memref<2x4x13xf32>) -> memref<?x?x?xf32>
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1 : index}> : () -> index
    %4 = "arith.constant"() <{value = 2 : index}> : () -> index
    %5 = "memref.dim"(%1, %4) : (memref<?x?x?xf32>, index) -> index
    %6 = "memref.dim"(%1, %3) : (memref<?x?x?xf32>, index) -> index
    %7 = "memref.dim"(%1, %2) : (memref<?x?x?xf32>, index) -> index
    %8 = "memref.cast"(%1) : (memref<?x?x?xf32>) -> memref<*xf32>
    "gpu.host_register"(%8) : (memref<*xf32>) -> ()
    "gpu.launch"(%3, %3, %3, %5, %6, %7) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index):
      %9 = "arith.muli"(%arg5, %arg10) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %10 = "arith.addi"(%arg4, %9) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %11 = "arith.muli"(%10, %arg9) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %12 = "arith.addi"(%arg3, %11) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %13 = "arith.index_cast"(%12) : (index) -> i32
      %14 = "arith.sitofp"(%13) : (i32) -> f32
      %15 = "gpu.all_reduce"(%14) <{op = #gpu<all_reduce_op add>, uniform}> ({
      }) : (f32) -> f32
      "memref.store"(%15, %1, %arg5, %arg4, %arg3) : (f32, memref<?x?x?xf32>, index, index, index) -> ()
      "gpu.terminator"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "func.call"(%8) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

