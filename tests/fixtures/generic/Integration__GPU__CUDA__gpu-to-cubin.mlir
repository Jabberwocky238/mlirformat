#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (f32, memref<?xf32>) -> (), sym_name = "other_func"}> ({
  ^bb0(%arg0: f32, %arg1: memref<?xf32>):
    %8 = "arith.constant"() <{value = 1 : index}> : () -> index
    %9 = "arith.constant"() <{value = 0 : index}> : () -> index
    %10 = "memref.dim"(%arg1, %9) : (memref<?xf32>, index) -> index
    "gpu.launch"(%8, %8, %8, %10, %8, %8) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index, %arg12: index, %arg13: index):
      "memref.store"(%arg0, %arg1, %arg5) : (f32, memref<?xf32>, index) -> ()
      "gpu.terminator"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<5xf32>
    %3 = "arith.constant"() <{value = 5 : i32}> : () -> i32
    %4 = "memref.cast"(%2) : (memref<5xf32>) -> memref<?xf32>
    %5 = "memref.cast"(%4) : (memref<?xf32>) -> memref<*xf32>
    "gpu.host_register"(%5) : (memref<*xf32>) -> ()
    "func.call"(%5) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    %6 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "func.call"(%6, %4) <{callee = @other_func}> : (f32, memref<?xf32>) -> ()
    "func.call"(%5) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    %7 = "vector.transfer_read"(%2, %1, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<5xf32>, index, f32) -> vector<2xf32>
    "vector.print"(%7) <{punctuation = #vector.punctuation<newline>}> : (vector<2xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

