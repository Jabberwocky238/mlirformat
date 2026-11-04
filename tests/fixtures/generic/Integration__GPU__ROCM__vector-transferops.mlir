"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, memref<?xf32>) -> (), sym_name = "vectransferx2"}> ({
  ^bb0(%arg15: memref<?xf32>, %arg16: memref<?xf32>):
    %18 = "arith.constant"() <{value = 1 : index}> : () -> index
    "gpu.launch"(%18, %18, %18, %18, %18, %18) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg17: index, %arg18: index, %arg19: index, %arg20: index, %arg21: index, %arg22: index, %arg23: index, %arg24: index, %arg25: index, %arg26: index, %arg27: index, %arg28: index):
      %19 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
      %20 = "arith.constant"() <{value = 0 : i32}> : () -> i32
      %21 = "amdgpu.raw_buffer_load"(%arg15, %20) <{boundsCheck = true, operandSegmentSizes = array<i32: 1, 1, 0>}> : (memref<?xf32>, i32) -> vector<2xf32>
      %22 = "arith.addf"(%21, %21) <{fastmath = #arith.fastmath<none>}> : (vector<2xf32>, vector<2xf32>) -> vector<2xf32>
      %23 = "arith.constant"() <{value = 1 : i32}> : () -> i32
      "amdgpu.raw_buffer_store"(%22, %arg16, %23) <{boundsCheck = false, operandSegmentSizes = array<i32: 1, 1, 1, 0>}> : (vector<2xf32>, memref<?xf32>, i32) -> ()
      "gpu.terminator"() : () -> ()
    }) {workgroup_attributions = 0 : i64} : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>, memref<?xf32>) -> (), sym_name = "vectransferx4"}> ({
  ^bb0(%arg1: memref<?xf32>, %arg2: memref<?xf32>):
    %13 = "arith.constant"() <{value = 1 : index}> : () -> index
    "gpu.launch"(%13, %13, %13, %13, %13, %13) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index, %arg12: index, %arg13: index, %arg14: index):
      %14 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
      %15 = "arith.constant"() <{value = 0 : i32}> : () -> i32
      %16 = "amdgpu.raw_buffer_load"(%arg1, %15) <{boundsCheck = false, operandSegmentSizes = array<i32: 1, 1, 0>}> : (memref<?xf32>, i32) -> vector<4xf32>
      %17 = "arith.addf"(%16, %16) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
      "amdgpu.raw_buffer_store"(%17, %arg2, %15) <{boundsCheck = false, operandSegmentSizes = array<i32: 1, 1, 1, 0>}> : (vector<4xf32>, memref<?xf32>, i32) -> ()
      "gpu.terminator"() : () -> ()
    }) {workgroup_attributions = 0 : i64} : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %4 = "arith.constant"() <{value = 1.230000e+00 : f32}> : () -> f32
    %5 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4xf32>
    %6 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4xf32>
    %7 = "memref.cast"(%5) : (memref<4xf32>) -> memref<?xf32>
    %8 = "memref.cast"(%6) : (memref<4xf32>) -> memref<?xf32>
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg0: index):
      "memref.store"(%4, %7, %arg0) : (f32, memref<?xf32>, index) -> ()
      "memref.store"(%4, %8, %arg0) : (f32, memref<?xf32>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %9 = "memref.cast"(%7) : (memref<?xf32>) -> memref<*xf32>
    %10 = "memref.cast"(%8) : (memref<?xf32>) -> memref<*xf32>
    "gpu.host_register"(%9) : (memref<*xf32>) -> ()
    "gpu.host_register"(%10) : (memref<*xf32>) -> ()
    %11 = "func.call"(%7) <{callee = @mgpuMemGetDeviceMemRef1dFloat}> : (memref<?xf32>) -> memref<?xf32>
    %12 = "func.call"(%8) <{callee = @mgpuMemGetDeviceMemRef1dFloat}> : (memref<?xf32>) -> memref<?xf32>
    "func.call"(%11, %12) <{callee = @vectransferx2}> : (memref<?xf32>, memref<?xf32>) -> ()
    "func.call"(%10) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "func.call"(%11, %12) <{callee = @vectransferx4}> : (memref<?xf32>, memref<?xf32>) -> ()
    "func.call"(%10) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>) -> memref<?xf32>, sym_name = "mgpuMemGetDeviceMemRef1dFloat", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

