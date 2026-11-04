"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<35xf32>
    %1 = "memref.cast"(%0) : (memref<35xf32>) -> memref<?xf32>
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "memref.dim"(%1, %3) : (memref<?xf32>, index) -> index
    %5 = "memref.cast"(%1) : (memref<?xf32>) -> memref<*xf32>
    "gpu.host_register"(%5) : (memref<*xf32>) -> ()
    "gpu.launch"(%2, %2, %2, %4, %2, %2) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index):
      %6 = "arith.index_cast"(%arg3) : (index) -> i32
      %7 = "gpu.all_reduce"(%6) <{uniform}> ({
      ^bb0(%arg12: i32, %arg13: i32):
        %9 = "arith.xori"(%arg12, %arg13) : (i32, i32) -> i32
        "gpu.yield"(%9) : (i32) -> ()
      }) : (i32) -> i32
      %8 = "arith.sitofp"(%7) : (i32) -> f32
      "memref.store"(%8, %1, %arg3) : (f32, memref<?xf32>, index) -> ()
      "gpu.terminator"() : () -> ()
    }) {workgroup_attributions = 0 : i64} : (index, index, index, index, index, index) -> ()
    "func.call"(%5) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

