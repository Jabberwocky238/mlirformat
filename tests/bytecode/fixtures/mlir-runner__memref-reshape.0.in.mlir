"builtin.module"() ({
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %10 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:11)
    %11 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":6:11)
    %12 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x3xf32> loc("<stdin>":7:11)
    %13 = "memref.dim"(%12, %10) : (memref<2x3xf32>, index) -> index loc("<stdin>":8:11)
    %14 = "memref.dim"(%12, %11) : (memref<2x3xf32>, index) -> index loc("<stdin>":9:11)
    "scf.parallel"(%10, %10, %13, %14, %11, %11) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg8: index loc("<stdin>":11:10), %arg9: index loc("<stdin>":11:24)):
      %19 = "arith.muli"(%arg8, %14) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":12:13)
      %20 = "arith.addi"(%19, %arg9) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":13:13)
      %21 = "arith.index_cast"(%20) : (index) -> i64 loc("<stdin>":14:13)
      %22 = "arith.sitofp"(%21) : (i64) -> f32 loc("<stdin>":15:13)
      "memref.store"(%22, %12, %arg8, %arg9) : (f32, memref<2x3xf32>, index, index) -> () loc("<stdin>":16:7)
      "scf.reduce"() : () -> () loc("<stdin>":17:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":10:5)
    %15 = "memref.cast"(%12) : (memref<2x3xf32>) -> memref<*xf32> loc("<stdin>":19:11)
    "func.call"(%15) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":20:5)
    %16 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xindex> loc("<stdin>":21:11)
    %17 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":22:11)
    %18 = "arith.constant"() <{value = 3 : index}> : () -> index loc("<stdin>":23:11)
    "memref.store"(%18, %16, %10) : (index, memref<2xindex>, index) -> () loc("<stdin>":24:5)
    "memref.store"(%17, %16, %11) : (index, memref<2xindex>, index) -> () loc("<stdin>":25:5)
    "func.call"(%12, %16) <{callee = @reshape_ranked_memref_to_ranked}> : (memref<2x3xf32>, memref<2xindex>) -> () loc("<stdin>":26:5)
    "func.call"(%12, %16) <{callee = @reshape_unranked_memref_to_ranked}> : (memref<2x3xf32>, memref<2xindex>) -> () loc("<stdin>":27:5)
    "func.call"(%12, %16) <{callee = @reshape_ranked_memref_to_unranked}> : (memref<2x3xf32>, memref<2xindex>) -> () loc("<stdin>":28:5)
    "func.call"(%12, %16) <{callee = @reshape_unranked_memref_to_unranked}> : (memref<2x3xf32>, memref<2xindex>) -> () loc("<stdin>":29:5)
    "memref.dealloc"(%12) : (memref<2x3xf32>) -> () loc("<stdin>":30:5)
    "memref.dealloc"(%16) : (memref<2xindex>) -> () loc("<stdin>":31:5)
    "func.return"() : () -> () loc("<stdin>":32:5)
  }) : () -> () loc("<stdin>":4:3)
  "func.func"() <{function_type = (memref<2x3xf32>, memref<2xindex>) -> (), sym_name = "reshape_ranked_memref_to_ranked"}> ({
  ^bb0(%arg6: memref<2x3xf32> loc("<stdin>":35:8), %arg7: memref<2xindex> loc("<stdin>":35:32)):
    %8 = "memref.reshape"(%arg6, %arg7) : (memref<2x3xf32>, memref<2xindex>) -> memref<?x?xf32> loc("<stdin>":36:10)
    %9 = "memref.cast"(%8) : (memref<?x?xf32>) -> memref<*xf32> loc("<stdin>":37:10)
    "func.call"(%9) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":38:5)
    "func.return"() : () -> () loc("<stdin>":39:5)
  }) : () -> () loc("<stdin>":34:3)
  "func.func"() <{function_type = (memref<2x3xf32>, memref<2xindex>) -> (), sym_name = "reshape_unranked_memref_to_ranked"}> ({
  ^bb0(%arg4: memref<2x3xf32> loc("<stdin>":42:8), %arg5: memref<2xindex> loc("<stdin>":42:32)):
    %5 = "memref.cast"(%arg4) : (memref<2x3xf32>) -> memref<*xf32> loc("<stdin>":43:10)
    %6 = "memref.reshape"(%5, %arg5) : (memref<*xf32>, memref<2xindex>) -> memref<?x?xf32> loc("<stdin>":44:10)
    %7 = "memref.cast"(%6) : (memref<?x?xf32>) -> memref<*xf32> loc("<stdin>":45:10)
    "func.call"(%7) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":46:5)
    "func.return"() : () -> () loc("<stdin>":47:5)
  }) : () -> () loc("<stdin>":41:3)
  "func.func"() <{function_type = (memref<2x3xf32>, memref<2xindex>) -> (), sym_name = "reshape_ranked_memref_to_unranked"}> ({
  ^bb0(%arg2: memref<2x3xf32> loc("<stdin>":50:8), %arg3: memref<2xindex> loc("<stdin>":50:32)):
    %3 = "memref.cast"(%arg3) : (memref<2xindex>) -> memref<?xindex> loc("<stdin>":51:10)
    %4 = "memref.reshape"(%arg2, %3) : (memref<2x3xf32>, memref<?xindex>) -> memref<*xf32> loc("<stdin>":52:10)
    "func.call"(%4) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":53:5)
    "func.return"() : () -> () loc("<stdin>":54:5)
  }) : () -> () loc("<stdin>":49:3)
  "func.func"() <{function_type = (memref<2x3xf32>, memref<2xindex>) -> (), sym_name = "reshape_unranked_memref_to_unranked"}> ({
  ^bb0(%arg0: memref<2x3xf32> loc("<stdin>":57:8), %arg1: memref<2xindex> loc("<stdin>":57:32)):
    %0 = "memref.cast"(%arg0) : (memref<2x3xf32>) -> memref<*xf32> loc("<stdin>":58:10)
    %1 = "memref.cast"(%arg1) : (memref<2xindex>) -> memref<?xindex> loc("<stdin>":59:10)
    %2 = "memref.reshape"(%0, %1) : (memref<*xf32>, memref<?xindex>) -> memref<*xf32> loc("<stdin>":60:10)
    "func.call"(%2) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":61:5)
    "func.return"() : () -> () loc("<stdin>":62:5)
  }) : () -> () loc("<stdin>":56:3)
}) : () -> () loc("<stdin>":1:1)
