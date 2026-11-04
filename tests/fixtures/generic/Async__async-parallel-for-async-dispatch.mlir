"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, memref<?xf32>) -> (), sym_name = "loop_1d"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: memref<?xf32>):
    "scf.parallel"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
    ^bb0(%arg4: index):
      %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
      "memref.store"(%0, %arg3, %arg4) : (f32, memref<?xf32>, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index, index, index, memref<?x?xf32>) -> (), sym_name = "loop_2d"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: memref<?x?xf32>):
    "scf.parallel"(%arg0, %arg3, %arg1, %arg4, %arg2, %arg5) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg7: index, %arg8: index):
      %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
      "memref.store"(%0, %arg6, %arg7, %arg8) : (f32, memref<?x?xf32>, index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

