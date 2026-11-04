"builtin.module"() ({
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %10 = "arith.constant"() <{value = 0 : index}> : () -> index
    %11 = "arith.constant"() <{value = 1 : index}> : () -> index
    %12 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x3xf32>
    %13 = "memref.dim"(%12, %10) : (memref<2x3xf32>, index) -> index
    %14 = "memref.dim"(%12, %11) : (memref<2x3xf32>, index) -> index
    "scf.parallel"(%10, %10, %13, %14, %11, %11) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg8: index, %arg9: index):
      %19 = "arith.muli"(%arg8, %14) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %20 = "arith.addi"(%19, %arg9) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %21 = "arith.index_cast"(%20) : (index) -> i64
      %22 = "arith.sitofp"(%21) : (i64) -> f32
      "memref.store"(%22, %12, %arg8, %arg9) : (f32, memref<2x3xf32>, index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    %15 = "memref.cast"(%12) : (memref<2x3xf32>) -> memref<*xf32>
    "func.call"(%15) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    %16 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xindex>
    %17 = "arith.constant"() <{value = 2 : index}> : () -> index
    %18 = "arith.constant"() <{value = 3 : index}> : () -> index
    "memref.store"(%18, %16, %10) : (index, memref<2xindex>, index) -> ()
    "memref.store"(%17, %16, %11) : (index, memref<2xindex>, index) -> ()
    "func.call"(%12, %16) <{callee = @reshape_ranked_memref_to_ranked}> : (memref<2x3xf32>, memref<2xindex>) -> ()
    "func.call"(%12, %16) <{callee = @reshape_unranked_memref_to_ranked}> : (memref<2x3xf32>, memref<2xindex>) -> ()
    "func.call"(%12, %16) <{callee = @reshape_ranked_memref_to_unranked}> : (memref<2x3xf32>, memref<2xindex>) -> ()
    "func.call"(%12, %16) <{callee = @reshape_unranked_memref_to_unranked}> : (memref<2x3xf32>, memref<2xindex>) -> ()
    "memref.dealloc"(%12) : (memref<2x3xf32>) -> ()
    "memref.dealloc"(%16) : (memref<2xindex>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<2x3xf32>, memref<2xindex>) -> (), sym_name = "reshape_ranked_memref_to_ranked"}> ({
  ^bb0(%arg6: memref<2x3xf32>, %arg7: memref<2xindex>):
    %8 = "memref.reshape"(%arg6, %arg7) : (memref<2x3xf32>, memref<2xindex>) -> memref<?x?xf32>
    %9 = "memref.cast"(%8) : (memref<?x?xf32>) -> memref<*xf32>
    "func.call"(%9) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<2x3xf32>, memref<2xindex>) -> (), sym_name = "reshape_unranked_memref_to_ranked"}> ({
  ^bb0(%arg4: memref<2x3xf32>, %arg5: memref<2xindex>):
    %5 = "memref.cast"(%arg4) : (memref<2x3xf32>) -> memref<*xf32>
    %6 = "memref.reshape"(%5, %arg5) : (memref<*xf32>, memref<2xindex>) -> memref<?x?xf32>
    %7 = "memref.cast"(%6) : (memref<?x?xf32>) -> memref<*xf32>
    "func.call"(%7) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<2x3xf32>, memref<2xindex>) -> (), sym_name = "reshape_ranked_memref_to_unranked"}> ({
  ^bb0(%arg2: memref<2x3xf32>, %arg3: memref<2xindex>):
    %3 = "memref.cast"(%arg3) : (memref<2xindex>) -> memref<?xindex>
    %4 = "memref.reshape"(%arg2, %3) : (memref<2x3xf32>, memref<?xindex>) -> memref<*xf32>
    "func.call"(%4) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<2x3xf32>, memref<2xindex>) -> (), sym_name = "reshape_unranked_memref_to_unranked"}> ({
  ^bb0(%arg0: memref<2x3xf32>, %arg1: memref<2xindex>):
    %0 = "memref.cast"(%arg0) : (memref<2x3xf32>) -> memref<*xf32>
    %1 = "memref.cast"(%arg1) : (memref<2xindex>) -> memref<?xindex>
    %2 = "memref.reshape"(%0, %1) : (memref<*xf32>, memref<?xindex>) -> memref<*xf32>
    "func.call"(%2) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

