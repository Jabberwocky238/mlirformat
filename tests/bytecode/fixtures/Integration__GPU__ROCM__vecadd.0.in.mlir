"builtin.module"() ({
  "func.func"() <{function_type = (memref<5xf32>, memref<5xf32>, memref<5xf32>) -> (), sym_name = "vecadd"}> ({
  ^bb0(%arg1: memref<5xf32> loc("<stdin>":3:8), %arg2: memref<5xf32> loc("<stdin>":3:30), %arg3: memref<5xf32> loc("<stdin>":3:52)):
    %19 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:11)
    %20 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":5:11)
    %21 = "arith.constant"() <{value = 5 : index}> : () -> index loc("<stdin>":6:11)
    "gpu.launch"(%20, %20, %20, %21, %20, %20) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg4: index loc("<stdin>":8:10), %arg5: index loc("<stdin>":8:24), %arg6: index loc("<stdin>":8:38), %arg7: index loc("<stdin>":8:52), %arg8: index loc("<stdin>":8:66), %arg9: index loc("<stdin>":8:80), %arg10: index loc("<stdin>":8:94), %arg11: index loc("<stdin>":8:109), %arg12: index loc("<stdin>":8:124), %arg13: index loc("<stdin>":8:139), %arg14: index loc("<stdin>":8:154), %arg15: index loc("<stdin>":8:169)):
      %22 = "memref.load"(%arg1, %arg7) : (memref<5xf32>, index) -> f32 loc("<stdin>":9:13)
      %23 = "memref.load"(%arg2, %arg7) : (memref<5xf32>, index) -> f32 loc("<stdin>":10:13)
      %24 = "arith.addf"(%22, %23) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":11:13)
      "memref.store"(%24, %arg3, %arg7) : (f32, memref<5xf32>, index) -> () loc("<stdin>":12:7)
      "gpu.terminator"() : () -> () loc("<stdin>":13:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":7:5)
    "func.return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":18:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":19:10)
    %2 = "arith.constant"() <{value = 5 : index}> : () -> index loc("<stdin>":20:10)
    %3 = "arith.constant"() <{value = 1.230000e+00 : f32}> : () -> f32 loc("<stdin>":21:10)
    %4 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<5xf32> loc("<stdin>":22:10)
    %5 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<5xf32> loc("<stdin>":23:10)
    %6 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<5xf32> loc("<stdin>":24:10)
    %7 = "memref.cast"(%4) : (memref<5xf32>) -> memref<?xf32> loc("<stdin>":25:10)
    %8 = "memref.cast"(%5) : (memref<5xf32>) -> memref<?xf32> loc("<stdin>":26:10)
    %9 = "memref.cast"(%6) : (memref<5xf32>) -> memref<?xf32> loc("<stdin>":27:10)
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg0: index loc("<stdin>":29:10)):
      "memref.store"(%3, %7, %arg0) : (f32, memref<?xf32>, index) -> () loc("<stdin>":30:7)
      "memref.store"(%3, %8, %arg0) : (f32, memref<?xf32>, index) -> () loc("<stdin>":31:7)
      "scf.yield"() : () -> () loc("<stdin>":32:7)
    }) : (index, index, index) -> () loc("<stdin>":28:5)
    %10 = "memref.cast"(%7) : (memref<?xf32>) -> memref<*xf32> loc("<stdin>":34:11)
    %11 = "memref.cast"(%8) : (memref<?xf32>) -> memref<*xf32> loc("<stdin>":35:11)
    %12 = "memref.cast"(%9) : (memref<?xf32>) -> memref<*xf32> loc("<stdin>":36:11)
    "gpu.host_register"(%10) : (memref<*xf32>) -> () loc("<stdin>":37:5)
    "gpu.host_register"(%11) : (memref<*xf32>) -> () loc("<stdin>":38:5)
    "gpu.host_register"(%12) : (memref<*xf32>) -> () loc("<stdin>":39:5)
    %13 = "func.call"(%7) <{callee = @mgpuMemGetDeviceMemRef1dFloat}> : (memref<?xf32>) -> memref<?xf32> loc("<stdin>":40:11)
    %14 = "func.call"(%8) <{callee = @mgpuMemGetDeviceMemRef1dFloat}> : (memref<?xf32>) -> memref<?xf32> loc("<stdin>":41:11)
    %15 = "func.call"(%9) <{callee = @mgpuMemGetDeviceMemRef1dFloat}> : (memref<?xf32>) -> memref<?xf32> loc("<stdin>":42:11)
    %16 = "memref.cast"(%13) : (memref<?xf32>) -> memref<5xf32> loc("<stdin>":43:11)
    %17 = "memref.cast"(%14) : (memref<?xf32>) -> memref<5xf32> loc("<stdin>":44:11)
    %18 = "memref.cast"(%15) : (memref<?xf32>) -> memref<5xf32> loc("<stdin>":45:11)
    "func.call"(%16, %17, %18) <{callee = @vecadd}> : (memref<5xf32>, memref<5xf32>, memref<5xf32>) -> () loc("<stdin>":46:5)
    "func.call"(%12) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":47:5)
    "func.return"() : () -> () loc("<stdin>":48:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (memref<?xf32>) -> memref<?xf32>, sym_name = "mgpuMemGetDeviceMemRef1dFloat", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":50:3)
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":52:3)
}) : () -> () loc("<stdin>":1:1)
