"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "arith.constant"() <{value = 3 : index}> : () -> index
    %4 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %5 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %6 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %7 = "arith.constant"() <{value = 3.000000e+00 : f32}> : () -> f32
    %8 = "arith.constant"() <{value = 4.000000e+00 : f32}> : () -> f32
    %9 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4xf32>
    "linalg.fill"(%4, %9) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg0: f32, %arg1: f32):
      "linalg.yield"(%arg0) : (f32) -> ()
    }) : (f32, memref<4xf32>) -> ()
    %10 = "memref.cast"(%9) : (memref<4xf32>) -> memref<*xf32>
    "func.call"(%10) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "memref.store"(%5, %9, %0) : (f32, memref<4xf32>, index) -> ()
    "func.call"() <{callee = @mlirAsyncRuntimePrintCurrentThreadId}> : () -> ()
    "func.call"(%10) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    %11 = "async.execute"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
      "memref.store"(%6, %9, %1) : (f32, memref<4xf32>, index) -> ()
      "func.call"() <{callee = @mlirAsyncRuntimePrintCurrentThreadId}> : () -> ()
      "func.call"(%10) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
      %12 = "async.execute"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
        "func.call"() <{callee = @mlirAsyncRuntimePrintCurrentThreadId}> : () -> ()
        "async.yield"() : () -> ()
      }) : () -> !async.token
      %13 = "async.execute"(%12) <{operandSegmentSizes = array<i32: 1, 0>}> ({
        "memref.store"(%7, %9, %2) : (f32, memref<4xf32>, index) -> ()
        "func.call"() <{callee = @mlirAsyncRuntimePrintCurrentThreadId}> : () -> ()
        "func.call"(%10) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
        "async.yield"() : () -> ()
      }) : (!async.token) -> !async.token
      "async.await"(%13) : (!async.token) -> ()
      "memref.store"(%8, %9, %3) : (f32, memref<4xf32>, index) -> ()
      "func.call"() <{callee = @mlirAsyncRuntimePrintCurrentThreadId}> : () -> ()
      "func.call"(%10) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
      "async.yield"() : () -> ()
    }) : () -> !async.token
    "async.await"(%11) : (!async.token) -> ()
    "func.call"() <{callee = @mlirAsyncRuntimePrintCurrentThreadId}> : () -> ()
    "func.call"(%10) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "memref.dealloc"(%9) : (memref<4xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "mlirAsyncRuntimePrintCurrentThreadId", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
}) : () -> ()

