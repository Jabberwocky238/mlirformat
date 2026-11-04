"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> memref<?x?xf32>, sym_name = "dynamic_alloca"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "memref.alloca"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32>
    %1 = "memref.alloca"(%arg0, %arg1) <{alignment = 32 : i64, operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32>
    "func.return"(%0) : (memref<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

