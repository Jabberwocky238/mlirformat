"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %14 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10x3xf32> loc("<stdin>":3:11)
    %15 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32 loc("<stdin>":4:11)
    %16 = "arith.constant"() <{value = 5.000000e+00 : f32}> : () -> f32 loc("<stdin>":5:11)
    %17 = "arith.constant"() <{value = 1.000000e+01 : f32}> : () -> f32 loc("<stdin>":6:11)
    %18 = "memref.cast"(%14) : (memref<10x3xf32>) -> memref<?x?xf32> loc("<stdin>":7:11)
    "linalg.fill"(%17, %18) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg10: f32 loc("<stdin>":9:10), %arg11: f32 loc("<stdin>":9:23)):
      "linalg.yield"(%arg10) : (f32) -> () loc("<stdin>":10:7)
    }) : (f32, memref<?x?xf32>) -> () loc("<stdin>":8:5)
    %19 = "memref.cast"(%14) : (memref<10x3xf32>) -> memref<*xf32> loc("<stdin>":12:11)
    "func.call"(%19) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":13:5)
    %20 = "memref.cast"(%19) : (memref<*xf32>) -> memref<?x?xf32> loc("<stdin>":14:11)
    "linalg.fill"(%16, %20) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg8: f32 loc("<stdin>":16:10), %arg9: f32 loc("<stdin>":16:22)):
      "linalg.yield"(%arg8) : (f32) -> () loc("<stdin>":17:7)
    }) : (f32, memref<?x?xf32>) -> () loc("<stdin>":15:5)
    %21 = "memref.cast"(%20) : (memref<?x?xf32>) -> memref<*xf32> loc("<stdin>":19:11)
    "func.call"(%21) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":20:5)
    %22 = "memref.cast"(%20) : (memref<?x?xf32>) -> memref<*xf32> loc("<stdin>":21:11)
    %23 = "memref.cast"(%22) : (memref<*xf32>) -> memref<?x?xf32> loc("<stdin>":22:11)
    "linalg.fill"(%15, %23) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: f32 loc("<stdin>":24:10), %arg7: f32 loc("<stdin>":24:22)):
      "linalg.yield"(%arg6) : (f32) -> () loc("<stdin>":25:7)
    }) : (f32, memref<?x?xf32>) -> () loc("<stdin>":23:5)
    %24 = "memref.cast"(%20) : (memref<?x?xf32>) -> memref<*xf32> loc("<stdin>":27:11)
    "func.call"(%24) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":28:5)
    %25 = "arith.constant"() <{value = 122 : i8}> : () -> i8 loc("<stdin>":29:11)
    %26 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i8> loc("<stdin>":30:11)
    "memref.store"(%25, %26) : (i8, memref<i8>) -> () loc("<stdin>":31:5)
    %27 = "memref.cast"(%26) : (memref<i8>) -> memref<*xi8> loc("<stdin>":32:11)
    "func.call"(%27) <{callee = @printMemrefI8}> : (memref<*xi8>) -> () loc("<stdin>":33:5)
    "memref.dealloc"(%27) : (memref<*xi8>) -> () loc("<stdin>":34:5)
    "memref.dealloc"(%14) : (memref<10x3xf32>) -> () loc("<stdin>":35:5)
    "func.call"() <{callee = @return_var_memref_caller}> : () -> () loc("<stdin>":36:5)
    "func.call"() <{callee = @return_two_var_memref_caller}> : () -> () loc("<stdin>":37:5)
    "func.call"() <{callee = @dim_op_of_unranked}> : () -> () loc("<stdin>":38:5)
    "func.return"() : () -> () loc("<stdin>":39:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<*xi8>) -> (), sym_name = "printMemrefI8", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":41:3)
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":43:3)
  "func.func"() <{function_type = () -> (), sym_name = "return_two_var_memref_caller"}> ({
    %11 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x3xf32> loc("<stdin>":46:11)
    %12 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":47:11)
    "linalg.fill"(%12, %11) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32 loc("<stdin>":49:10), %arg5: f32 loc("<stdin>":49:22)):
      "linalg.yield"(%arg4) : (f32) -> () loc("<stdin>":50:7)
    }) : (f32, memref<4x3xf32>) -> () loc("<stdin>":48:5)
    %13:2 = "func.call"(%11) <{callee = @return_two_var_memref}> : (memref<4x3xf32>) -> (memref<*xf32>, memref<*xf32>) loc("<stdin>":52:13)
    "func.call"(%13#0) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":53:5)
    "func.call"(%13#1) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":54:5)
    "func.return"() : () -> () loc("<stdin>":55:5)
  }) : () -> () loc("<stdin>":45:3)
  "func.func"() <{function_type = (memref<4x3xf32>) -> (memref<*xf32>, memref<*xf32>), sym_name = "return_two_var_memref"}> ({
  ^bb0(%arg3: memref<4x3xf32> loc("<stdin>":58:8)):
    %10 = "memref.cast"(%arg3) : (memref<4x3xf32>) -> memref<*xf32> loc("<stdin>":59:11)
    "func.return"(%10, %10) : (memref<*xf32>, memref<*xf32>) -> () loc("<stdin>":60:5)
  }) : () -> () loc("<stdin>":57:3)
  "func.func"() <{function_type = () -> (), sym_name = "return_var_memref_caller"}> ({
    %7 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x3xf32> loc("<stdin>":63:10)
    %8 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":64:10)
    "linalg.fill"(%8, %7) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32 loc("<stdin>":66:10), %arg2: f32 loc("<stdin>":66:22)):
      "linalg.yield"(%arg1) : (f32) -> () loc("<stdin>":67:7)
    }) : (f32, memref<4x3xf32>) -> () loc("<stdin>":65:5)
    %9 = "func.call"(%7) <{callee = @return_var_memref}> : (memref<4x3xf32>) -> memref<*xf32> loc("<stdin>":69:10)
    "func.call"(%9) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":70:5)
    "func.return"() : () -> () loc("<stdin>":71:5)
  }) : () -> () loc("<stdin>":62:3)
  "func.func"() <{function_type = (memref<4x3xf32>) -> memref<*xf32>, sym_name = "return_var_memref"}> ({
  ^bb0(%arg0: memref<4x3xf32> loc("<stdin>":74:8)):
    %6 = "memref.cast"(%arg0) : (memref<4x3xf32>) -> memref<*xf32> loc("<stdin>":75:10)
    "func.return"(%6) : (memref<*xf32>) -> () loc("<stdin>":76:5)
  }) : () -> () loc("<stdin>":73:3)
  "func.func"() <{function_type = (index) -> (), sym_name = "printU64", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":78:3)
  "func.func"() <{function_type = () -> (), sym_name = "printNewline", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":80:3)
  "func.func"() <{function_type = () -> (), sym_name = "dim_op_of_unranked"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x3xf32> loc("<stdin>":83:10)
    %1 = "memref.cast"(%0) : (memref<4x3xf32>) -> memref<*xf32> loc("<stdin>":84:10)
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":85:10)
    %3 = "memref.dim"(%1, %2) : (memref<*xf32>, index) -> index loc("<stdin>":86:10)
    "func.call"(%3) <{callee = @printU64}> : (index) -> () loc("<stdin>":87:5)
    "func.call"() <{callee = @printNewline}> : () -> () loc("<stdin>":88:5)
    %4 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":89:10)
    %5 = "memref.dim"(%1, %4) : (memref<*xf32>, index) -> index loc("<stdin>":90:10)
    "func.call"(%5) <{callee = @printU64}> : (index) -> () loc("<stdin>":91:5)
    "func.call"() <{callee = @printNewline}> : () -> () loc("<stdin>":92:5)
    "func.return"() : () -> () loc("<stdin>":93:5)
  }) : () -> () loc("<stdin>":82:3)
}) : () -> () loc("<stdin>":1:1)
