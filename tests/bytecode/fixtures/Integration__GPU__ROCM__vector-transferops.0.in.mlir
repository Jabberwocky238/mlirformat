"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, memref<?xf32>) -> (), sym_name = "vectransferx2"}> ({
  ^bb0(%arg15: memref<?xf32> loc("<stdin>":3:8), %arg16: memref<?xf32> loc("<stdin>":3:31)):
    %18 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":4:11)
    "gpu.launch"(%18, %18, %18, %18, %18, %18) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg17: index loc("<stdin>":6:10), %arg18: index loc("<stdin>":6:25), %arg19: index loc("<stdin>":6:40), %arg20: index loc("<stdin>":6:55), %arg21: index loc("<stdin>":6:70), %arg22: index loc("<stdin>":6:85), %arg23: index loc("<stdin>":6:100), %arg24: index loc("<stdin>":6:115), %arg25: index loc("<stdin>":6:130), %arg26: index loc("<stdin>":6:145), %arg27: index loc("<stdin>":6:160), %arg28: index loc("<stdin>":6:175)):
      %19 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":7:13)
      %20 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":8:13)
      %21 = "amdgpu.raw_buffer_load"(%arg15, %20) <{boundsCheck = true, operandSegmentSizes = array<i32: 1, 1, 0>}> : (memref<?xf32>, i32) -> vector<2xf32> loc("<stdin>":9:13)
      %22 = "arith.addf"(%21, %21) <{fastmath = #arith.fastmath<none>}> : (vector<2xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":10:13)
      %23 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":11:13)
      "amdgpu.raw_buffer_store"(%22, %arg16, %23) <{boundsCheck = false, operandSegmentSizes = array<i32: 1, 1, 1, 0>}> : (vector<2xf32>, memref<?xf32>, i32) -> () loc("<stdin>":12:7)
      "gpu.terminator"() : () -> () loc("<stdin>":13:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":5:5)
    "func.return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<?xf32>, memref<?xf32>) -> (), sym_name = "vectransferx4"}> ({
  ^bb0(%arg1: memref<?xf32> loc("<stdin>":18:8), %arg2: memref<?xf32> loc("<stdin>":18:30)):
    %13 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":19:11)
    "gpu.launch"(%13, %13, %13, %13, %13, %13) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg3: index loc("<stdin>":21:10), %arg4: index loc("<stdin>":21:24), %arg5: index loc("<stdin>":21:38), %arg6: index loc("<stdin>":21:52), %arg7: index loc("<stdin>":21:66), %arg8: index loc("<stdin>":21:80), %arg9: index loc("<stdin>":21:94), %arg10: index loc("<stdin>":21:108), %arg11: index loc("<stdin>":21:123), %arg12: index loc("<stdin>":21:138), %arg13: index loc("<stdin>":21:153), %arg14: index loc("<stdin>":21:168)):
      %14 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":22:13)
      %15 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":23:13)
      %16 = "amdgpu.raw_buffer_load"(%arg1, %15) <{boundsCheck = false, operandSegmentSizes = array<i32: 1, 1, 0>}> : (memref<?xf32>, i32) -> vector<4xf32> loc("<stdin>":24:13)
      %17 = "arith.addf"(%16, %16) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32> loc("<stdin>":25:13)
      "amdgpu.raw_buffer_store"(%17, %arg2, %15) <{boundsCheck = false, operandSegmentSizes = array<i32: 1, 1, 1, 0>}> : (vector<4xf32>, memref<?xf32>, i32) -> () loc("<stdin>":26:7)
      "gpu.terminator"() : () -> () loc("<stdin>":27:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":20:5)
    "func.return"() : () -> () loc("<stdin>":29:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":32:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":33:10)
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":34:10)
    %3 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":35:10)
    %4 = "arith.constant"() <{value = 1.230000e+00 : f32}> : () -> f32 loc("<stdin>":36:10)
    %5 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4xf32> loc("<stdin>":37:10)
    %6 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4xf32> loc("<stdin>":38:10)
    %7 = "memref.cast"(%5) : (memref<4xf32>) -> memref<?xf32> loc("<stdin>":39:10)
    %8 = "memref.cast"(%6) : (memref<4xf32>) -> memref<?xf32> loc("<stdin>":40:10)
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg0: index loc("<stdin>":42:10)):
      "memref.store"(%4, %7, %arg0) : (f32, memref<?xf32>, index) -> () loc("<stdin>":43:7)
      "memref.store"(%4, %8, %arg0) : (f32, memref<?xf32>, index) -> () loc("<stdin>":44:7)
      "scf.yield"() : () -> () loc("<stdin>":45:7)
    }) : (index, index, index) -> () loc("<stdin>":41:5)
    %9 = "memref.cast"(%7) : (memref<?xf32>) -> memref<*xf32> loc("<stdin>":47:10)
    %10 = "memref.cast"(%8) : (memref<?xf32>) -> memref<*xf32> loc("<stdin>":48:11)
    "gpu.host_register"(%9) : (memref<*xf32>) -> () loc("<stdin>":49:5)
    "gpu.host_register"(%10) : (memref<*xf32>) -> () loc("<stdin>":50:5)
    %11 = "func.call"(%7) <{callee = @mgpuMemGetDeviceMemRef1dFloat}> : (memref<?xf32>) -> memref<?xf32> loc("<stdin>":51:11)
    %12 = "func.call"(%8) <{callee = @mgpuMemGetDeviceMemRef1dFloat}> : (memref<?xf32>) -> memref<?xf32> loc("<stdin>":52:11)
    "func.call"(%11, %12) <{callee = @vectransferx2}> : (memref<?xf32>, memref<?xf32>) -> () loc("<stdin>":53:5)
    "func.call"(%10) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":54:5)
    "func.call"(%11, %12) <{callee = @vectransferx4}> : (memref<?xf32>, memref<?xf32>) -> () loc("<stdin>":55:5)
    "func.call"(%10) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":56:5)
    "func.return"() : () -> () loc("<stdin>":57:5)
  }) : () -> () loc("<stdin>":31:3)
  "func.func"() <{function_type = (memref<?xf32>) -> memref<?xf32>, sym_name = "mgpuMemGetDeviceMemRef1dFloat", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":59:3)
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":61:3)
}) : () -> () loc("<stdin>":1:1)
