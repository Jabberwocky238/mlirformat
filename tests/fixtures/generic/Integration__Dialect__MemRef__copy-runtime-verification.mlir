"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, memref<?xf32>) -> (), sym_name = "memcpy_helper"}> ({
  ^bb0(%arg0: memref<?xf32>, %arg1: memref<?xf32>):
    "memref.copy"(%arg0, %arg1) : (memref<?xf32>, memref<?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4xf32>
    %1 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<5xf32>
    %2 = "memref.cast"(%0) : (memref<4xf32>) -> memref<?xf32>
    %3 = "memref.cast"(%1) : (memref<5xf32>) -> memref<?xf32>
    "func.call"(%2, %3) <{callee = @memcpy_helper}> : (memref<?xf32>, memref<?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

