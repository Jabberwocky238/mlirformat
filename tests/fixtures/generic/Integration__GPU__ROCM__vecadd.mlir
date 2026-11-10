"builtin.module"() ({
  "func.func"() <{function_type = (memref<5xf32>, memref<5xf32>, memref<5xf32>) -> (), sym_name = "vecadd"}> ({
  ^bb0(%arg1: memref<5xf32>, %arg2: memref<5xf32>, %arg3: memref<5xf32>):
    %19 = "arith.constant"() <{value = 0 : index}> : () -> index
    %20 = "arith.constant"() <{value = 1 : index}> : () -> index
    %21 = "arith.constant"() <{value = 5 : index}> : () -> index
    "gpu.launch"(%20, %20, %20, %21, %20, %20) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index, %arg12: index, %arg13: index, %arg14: index, %arg15: index):
      %22 = "memref.load"(%arg1, %arg7) : (memref<5xf32>, index) -> f32
      %23 = "memref.load"(%arg2, %arg7) : (memref<5xf32>, index) -> f32
      %24 = "arith.addf"(%22, %23) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "memref.store"(%24, %arg3, %arg7) : (f32, memref<5xf32>, index) -> ()
      "gpu.terminator"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 5 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1.230000e+00 : f32}> : () -> f32
    %4 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<5xf32>
    %5 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<5xf32>
    %6 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<5xf32>
    %7 = "memref.cast"(%4) : (memref<5xf32>) -> memref<?xf32>
    %8 = "memref.cast"(%5) : (memref<5xf32>) -> memref<?xf32>
    %9 = "memref.cast"(%6) : (memref<5xf32>) -> memref<?xf32>
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg0: index):
      "memref.store"(%3, %7, %arg0) : (f32, memref<?xf32>, index) -> ()
      "memref.store"(%3, %8, %arg0) : (f32, memref<?xf32>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %10 = "memref.cast"(%7) : (memref<?xf32>) -> memref<*xf32>
    %11 = "memref.cast"(%8) : (memref<?xf32>) -> memref<*xf32>
    %12 = "memref.cast"(%9) : (memref<?xf32>) -> memref<*xf32>
    "gpu.host_register"(%10) : (memref<*xf32>) -> ()
    "gpu.host_register"(%11) : (memref<*xf32>) -> ()
    "gpu.host_register"(%12) : (memref<*xf32>) -> ()
    %13 = "func.call"(%7) <{callee = @mgpuMemGetDeviceMemRef1dFloat}> : (memref<?xf32>) -> memref<?xf32>
    %14 = "func.call"(%8) <{callee = @mgpuMemGetDeviceMemRef1dFloat}> : (memref<?xf32>) -> memref<?xf32>
    %15 = "func.call"(%9) <{callee = @mgpuMemGetDeviceMemRef1dFloat}> : (memref<?xf32>) -> memref<?xf32>
    %16 = "memref.cast"(%13) : (memref<?xf32>) -> memref<5xf32>
    %17 = "memref.cast"(%14) : (memref<?xf32>) -> memref<5xf32>
    %18 = "memref.cast"(%15) : (memref<?xf32>) -> memref<5xf32>
    "func.call"(%16, %17, %18) <{callee = @vecadd}> : (memref<5xf32>, memref<5xf32>, memref<5xf32>) -> ()
    "func.call"(%12) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>) -> memref<?xf32>, sym_name = "mgpuMemGetDeviceMemRef1dFloat", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

