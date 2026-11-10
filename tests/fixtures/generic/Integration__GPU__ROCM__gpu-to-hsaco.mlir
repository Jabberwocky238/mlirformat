"builtin.module"() ({
  "func.func"() <{function_type = (f32, memref<?xf32>) -> (), sym_name = "other_func"}> ({
  ^bb0(%arg0: f32, %arg1: memref<?xf32>):
    %7 = "arith.constant"() <{value = 0 : index}> : () -> index
    %8 = "arith.constant"() <{value = 1 : index}> : () -> index
    %9 = "memref.dim"(%arg1, %7) : (memref<?xf32>, index) -> index
    "gpu.launch"(%8, %8, %8, %9, %8, %8) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index, %arg12: index, %arg13: index):
      "memref.store"(%arg0, %arg1, %arg5) : (f32, memref<?xf32>, index) -> ()
      "gpu.terminator"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<5xf32>
    %1 = "arith.constant"() <{value = 5 : i32}> : () -> i32
    %2 = "memref.cast"(%0) : (memref<5xf32>) -> memref<?xf32>
    %3 = "memref.cast"(%2) : (memref<?xf32>) -> memref<*xf32>
    "gpu.host_register"(%3) : (memref<*xf32>) -> ()
    %4 = "memref.cast"(%2) : (memref<?xf32>) -> memref<*xf32>
    "func.call"(%4) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    %5 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %6 = "func.call"(%2) <{callee = @mgpuMemGetDeviceMemRef1dFloat}> : (memref<?xf32>) -> memref<?xf32>
    "func.call"(%5, %6) <{callee = @other_func}> : (f32, memref<?xf32>) -> ()
    "func.call"(%4) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>) -> memref<?xf32>, sym_name = "mgpuMemGetDeviceMemRef1dFloat", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

