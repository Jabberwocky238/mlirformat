"builtin.module"() ({
  "func.func"() <{function_type = (f32, memref<?xf32>) -> (), sym_name = "other_func"}> ({
  ^bb0(%arg0: f32 loc("<stdin>":4:8), %arg1: memref<?xf32> loc("<stdin>":4:20)):
    %8 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":5:10)
    %9 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":6:10)
    %10 = "memref.dim"(%arg1, %9) : (memref<?xf32>, index) -> index loc("<stdin>":7:11)
    "gpu.launch"(%8, %8, %8, %10, %8, %8) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg2: index loc("<stdin>":9:10), %arg3: index loc("<stdin>":9:24), %arg4: index loc("<stdin>":9:38), %arg5: index loc("<stdin>":9:52), %arg6: index loc("<stdin>":9:66), %arg7: index loc("<stdin>":9:80), %arg8: index loc("<stdin>":9:94), %arg9: index loc("<stdin>":9:108), %arg10: index loc("<stdin>":9:122), %arg11: index loc("<stdin>":9:137), %arg12: index loc("<stdin>":9:152), %arg13: index loc("<stdin>":9:167)):
      "memref.store"(%arg0, %arg1, %arg5) : (f32, memref<?xf32>, index) -> () loc("<stdin>":10:7)
      "gpu.terminator"() : () -> () loc("<stdin>":11:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":8:5)
    "func.return"() : () -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":16:10)
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":17:10)
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<5xf32> loc("<stdin>":18:10)
    %3 = "arith.constant"() <{value = 5 : i32}> : () -> i32 loc("<stdin>":19:10)
    %4 = "memref.cast"(%2) : (memref<5xf32>) -> memref<?xf32> loc("<stdin>":20:10)
    %5 = "memref.cast"(%4) : (memref<?xf32>) -> memref<*xf32> loc("<stdin>":21:10)
    "gpu.host_register"(%5) : (memref<*xf32>) -> () loc("<stdin>":22:5)
    "func.call"(%5) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":23:5)
    %6 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":24:10)
    "func.call"(%6, %4) <{callee = @other_func}> : (f32, memref<?xf32>) -> () loc("<stdin>":25:5)
    "func.call"(%5) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":26:5)
    %7 = "vector.transfer_read"(%2, %1, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (memref<5xf32>, index, f32) -> vector<2xf32> loc("<stdin>":27:10)
    "vector.print"(%7) <{punctuation = #vector.punctuation<newline>}> : (vector<2xf32>) -> () loc("<stdin>":28:5)
    "func.return"() : () -> () loc("<stdin>":29:5)
  }) : () -> () loc("<stdin>":15:3)
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":31:3)
}) : () -> () loc("<stdin>":2:1)
