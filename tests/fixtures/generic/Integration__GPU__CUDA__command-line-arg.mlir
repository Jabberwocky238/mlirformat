"builtin.module"() ({
  "func.func"() <{function_type = (f32, memref<?xf32>) -> (), sym_name = "host_function"}> ({
  ^bb0(%arg0: f32, %arg1: memref<?xf32>):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "memref.dim"(%arg1, %1) : (memref<?xf32>, index) -> index
    "gpu.launch"(%0, %0, %0, %2, %0, %0) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index, %arg12: index, %arg13: index):
      "memref.store"(%arg0, %arg1, %arg5) : (f32, memref<?xf32>, index) -> ()
      "gpu.terminator"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

