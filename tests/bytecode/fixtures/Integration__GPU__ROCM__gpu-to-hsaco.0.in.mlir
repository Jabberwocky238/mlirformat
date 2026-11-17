"builtin.module"() ({
  "func.func"() <{function_type = (f32, memref<?xf32>) -> (), sym_name = "other_func"}> ({
  ^bb0(%arg0: f32 loc("<stdin>":3:8), %arg1: memref<?xf32> loc("<stdin>":3:20)):
    %7 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:10)
    %8 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":5:10)
    %9 = "memref.dim"(%arg1, %7) : (memref<?xf32>, index) -> index loc("<stdin>":6:10)
    "gpu.launch"(%8, %8, %8, %9, %8, %8) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg2: index loc("<stdin>":8:10), %arg3: index loc("<stdin>":8:24), %arg4: index loc("<stdin>":8:38), %arg5: index loc("<stdin>":8:52), %arg6: index loc("<stdin>":8:66), %arg7: index loc("<stdin>":8:80), %arg8: index loc("<stdin>":8:94), %arg9: index loc("<stdin>":8:108), %arg10: index loc("<stdin>":8:122), %arg11: index loc("<stdin>":8:137), %arg12: index loc("<stdin>":8:152), %arg13: index loc("<stdin>":8:167)):
      "memref.store"(%arg0, %arg1, %arg5) : (f32, memref<?xf32>, index) -> () loc("<stdin>":9:7)
      "gpu.terminator"() : () -> () loc("<stdin>":10:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":7:5)
    "func.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<5xf32> loc("<stdin>":15:10)
    %1 = "arith.constant"() <{value = 5 : i32}> : () -> i32 loc("<stdin>":16:10)
    %2 = "memref.cast"(%0) : (memref<5xf32>) -> memref<?xf32> loc("<stdin>":17:10)
    %3 = "memref.cast"(%2) : (memref<?xf32>) -> memref<*xf32> loc("<stdin>":18:10)
    "gpu.host_register"(%3) : (memref<*xf32>) -> () loc("<stdin>":19:5)
    %4 = "memref.cast"(%2) : (memref<?xf32>) -> memref<*xf32> loc("<stdin>":20:10)
    "func.call"(%4) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":21:5)
    %5 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":22:10)
    %6 = "func.call"(%2) <{callee = @mgpuMemGetDeviceMemRef1dFloat}> : (memref<?xf32>) -> memref<?xf32> loc("<stdin>":23:10)
    "func.call"(%5, %6) <{callee = @other_func}> : (f32, memref<?xf32>) -> () loc("<stdin>":24:5)
    "func.call"(%4) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":25:5)
    "func.return"() : () -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":14:3)
  "func.func"() <{function_type = (memref<?xf32>) -> memref<?xf32>, sym_name = "mgpuMemGetDeviceMemRef1dFloat", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":28:3)
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":30:3)
}) : () -> () loc("<stdin>":1:1)
