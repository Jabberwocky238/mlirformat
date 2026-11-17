"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, memref<f32>) -> (), sym_name = "external", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (memref<?x?xf32>, memref<f32>), sym_name = "returner", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":4:3)
  "func.func"() <{function_type = () -> (), sym_name = "caller"}> ({
    %7:2 = "func.call"() <{callee = @returner}> : () -> (memref<?x?xf32>, memref<f32>) loc("<stdin>":7:12)
    "func.call"(%7#0, %7#1) <{callee = @external}> : (memref<?x?xf32>, memref<f32>) -> () loc("<stdin>":8:5)
    "func.return"() : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = (memref<?xf32>, index) -> (), sym_name = "callee"}> ({
  ^bb0(%arg14: memref<?xf32> loc("<stdin>":12:8), %arg15: index loc("<stdin>":12:31)):
    %6 = "memref.load"(%arg14, %arg15) : (memref<?xf32>, index) -> f32 loc("<stdin>":13:10)
    "func.return"() : () -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":11:3)
  "func.func"() <{function_type = (memref<?xf32>, index) -> (), sym_name = "other_callee"}> ({
  ^bb0(%arg12: memref<?xf32> loc("<stdin>":17:8), %arg13: index loc("<stdin>":17:31)):
    %5 = "memref.load"(%arg12, %arg13) : (memref<?xf32>, index) -> f32 loc("<stdin>":18:10)
    "func.return"() : () -> () loc("<stdin>":19:5)
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":16:3)
  "func.func"() <{function_type = (memref<4x3xf32>) -> (), sym_name = "return_var_memref_caller"}> ({
  ^bb0(%arg11: memref<4x3xf32> loc("<stdin>":22:8)):
    %4 = "func.call"(%arg11) <{callee = @return_var_memref}> : (memref<4x3xf32>) -> memref<*xf32> loc("<stdin>":23:10)
    "func.return"() : () -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":21:3)
  "func.func"() <{function_type = (memref<4x3xf32>) -> memref<*xf32>, sym_name = "return_var_memref"}> ({
  ^bb0(%arg10: memref<4x3xf32> loc("<stdin>":27:8)):
    %3 = "memref.cast"(%arg10) : (memref<4x3xf32>) -> memref<*xf32> loc("<stdin>":28:10)
    "func.return"(%3) : (memref<*xf32>) -> () loc("<stdin>":29:5)
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":26:3)
  "func.func"() <{function_type = (memref<4x3xf32>) -> (), sym_name = "return_two_var_memref_caller"}> ({
  ^bb0(%arg9: memref<4x3xf32> loc("<stdin>":32:8)):
    %2:2 = "func.call"(%arg9) <{callee = @return_two_var_memref}> : (memref<4x3xf32>) -> (memref<*xf32>, memref<*xf32>) loc("<stdin>":33:12)
    "func.return"() : () -> () loc("<stdin>":34:5)
  }) : () -> () loc("<stdin>":31:3)
  "func.func"() <{function_type = (memref<4x3xf32>) -> (memref<*xf32>, memref<*xf32>), sym_name = "return_two_var_memref"}> ({
  ^bb0(%arg8: memref<4x3xf32> loc("<stdin>":37:8)):
    %1 = "memref.cast"(%arg8) : (memref<4x3xf32>) -> memref<*xf32> loc("<stdin>":38:10)
    "func.return"(%1, %1) : (memref<*xf32>, memref<*xf32>) -> () loc("<stdin>":39:5)
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":36:3)
  "func.func"() <{function_type = (memref<4x3xf32>, index, index, f32) -> memref<4x3xf32>, sym_name = "bare_ptr_calling_conv"}> ({
  ^bb0(%arg4: memref<4x3xf32> loc("<stdin>":42:8), %arg5: index loc("<stdin>":42:32), %arg6: index loc("<stdin>":42:46), %arg7: f32 loc("<stdin>":42:60)):
    "memref.store"(%arg7, %arg4, %arg5, %arg6) : (f32, memref<4x3xf32>, index, index) -> () loc("<stdin>":43:5)
    "func.return"(%arg4) : (memref<4x3xf32>) -> () loc("<stdin>":44:5)
  }) {llvm.bareptr} : () -> () loc("<stdin>":41:3)
  "func.func"() <{function_type = (memref<4x3xf32>, index, index, f32) -> (f32, memref<4x3xf32>), sym_name = "bare_ptr_calling_conv_multiresult"}> ({
  ^bb0(%arg0: memref<4x3xf32> loc("<stdin>":47:8), %arg1: index loc("<stdin>":47:32), %arg2: index loc("<stdin>":47:46), %arg3: f32 loc("<stdin>":47:60)):
    "memref.store"(%arg3, %arg0, %arg1, %arg2) : (f32, memref<4x3xf32>, index, index) -> () loc("<stdin>":48:5)
    %0 = "memref.load"(%arg0, %arg1, %arg2) : (memref<4x3xf32>, index, index) -> f32 loc("<stdin>":49:10)
    "func.return"(%0, %arg0) : (f32, memref<4x3xf32>) -> () loc("<stdin>":50:5)
  }) {llvm.bareptr} : () -> () loc("<stdin>":46:3)
}) : () -> () loc("<stdin>":1:1)
