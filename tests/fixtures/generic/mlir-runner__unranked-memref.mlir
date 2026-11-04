"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %14 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10x3xf32>
    %15 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %16 = "arith.constant"() <{value = 5.000000e+00 : f32}> : () -> f32
    %17 = "arith.constant"() <{value = 1.000000e+01 : f32}> : () -> f32
    %18 = "memref.cast"(%14) : (memref<10x3xf32>) -> memref<?x?xf32>
    "linalg.fill"(%17, %18) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg10: f32, %arg11: f32):
      "linalg.yield"(%arg10) : (f32) -> ()
    }) : (f32, memref<?x?xf32>) -> ()
    %19 = "memref.cast"(%14) : (memref<10x3xf32>) -> memref<*xf32>
    "func.call"(%19) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    %20 = "memref.cast"(%19) : (memref<*xf32>) -> memref<?x?xf32>
    "linalg.fill"(%16, %20) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg8: f32, %arg9: f32):
      "linalg.yield"(%arg8) : (f32) -> ()
    }) : (f32, memref<?x?xf32>) -> ()
    %21 = "memref.cast"(%20) : (memref<?x?xf32>) -> memref<*xf32>
    "func.call"(%21) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    %22 = "memref.cast"(%20) : (memref<?x?xf32>) -> memref<*xf32>
    %23 = "memref.cast"(%22) : (memref<*xf32>) -> memref<?x?xf32>
    "linalg.fill"(%15, %23) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32):
      "linalg.yield"(%arg6) : (f32) -> ()
    }) : (f32, memref<?x?xf32>) -> ()
    %24 = "memref.cast"(%20) : (memref<?x?xf32>) -> memref<*xf32>
    "func.call"(%24) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    %25 = "arith.constant"() <{value = 122 : i8}> : () -> i8
    %26 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i8>
    "memref.store"(%25, %26) : (i8, memref<i8>) -> ()
    %27 = "memref.cast"(%26) : (memref<i8>) -> memref<*xi8>
    "func.call"(%27) <{callee = @printMemrefI8}> : (memref<*xi8>) -> ()
    "memref.dealloc"(%27) : (memref<*xi8>) -> ()
    "memref.dealloc"(%14) : (memref<10x3xf32>) -> ()
    "func.call"() <{callee = @return_var_memref_caller}> : () -> ()
    "func.call"() <{callee = @return_two_var_memref_caller}> : () -> ()
    "func.call"() <{callee = @dim_op_of_unranked}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<*xi8>) -> (), sym_name = "printMemrefI8", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "return_two_var_memref_caller"}> ({
    %11 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x3xf32>
    %12 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "linalg.fill"(%12, %11) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      "linalg.yield"(%arg4) : (f32) -> ()
    }) : (f32, memref<4x3xf32>) -> ()
    %13:2 = "func.call"(%11) <{callee = @return_two_var_memref}> : (memref<4x3xf32>) -> (memref<*xf32>, memref<*xf32>)
    "func.call"(%13#0) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "func.call"(%13#1) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<4x3xf32>) -> (memref<*xf32>, memref<*xf32>), sym_name = "return_two_var_memref"}> ({
  ^bb0(%arg3: memref<4x3xf32>):
    %10 = "memref.cast"(%arg3) : (memref<4x3xf32>) -> memref<*xf32>
    "func.return"(%10, %10) : (memref<*xf32>, memref<*xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "return_var_memref_caller"}> ({
    %7 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x3xf32>
    %8 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "linalg.fill"(%8, %7) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      "linalg.yield"(%arg1) : (f32) -> ()
    }) : (f32, memref<4x3xf32>) -> ()
    %9 = "func.call"(%7) <{callee = @return_var_memref}> : (memref<4x3xf32>) -> memref<*xf32>
    "func.call"(%9) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<4x3xf32>) -> memref<*xf32>, sym_name = "return_var_memref"}> ({
  ^bb0(%arg0: memref<4x3xf32>):
    %6 = "memref.cast"(%arg0) : (memref<4x3xf32>) -> memref<*xf32>
    "func.return"(%6) : (memref<*xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "printU64", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "printNewline", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "dim_op_of_unranked"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x3xf32>
    %1 = "memref.cast"(%0) : (memref<4x3xf32>) -> memref<*xf32>
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "memref.dim"(%1, %2) : (memref<*xf32>, index) -> index
    "func.call"(%3) <{callee = @printU64}> : (index) -> ()
    "func.call"() <{callee = @printNewline}> : () -> ()
    %4 = "arith.constant"() <{value = 1 : index}> : () -> index
    %5 = "memref.dim"(%1, %4) : (memref<*xf32>, index) -> index
    "func.call"(%5) <{callee = @printU64}> : (index) -> ()
    "func.call"() <{callee = @printNewline}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

