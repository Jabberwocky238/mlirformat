"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, index, index) -> (), sym_name = "expand_shape_dynamic"}> ({
  ^bb0(%arg5: memref<?xf32>, %arg6: index, %arg7: index):
    %10 = "memref.expand_shape"(%arg5, %arg6, %arg7) <{reassociation = [[0, 1]], static_output_shape = array<i64: -9223372036854775808, -9223372036854775808>}> : (memref<?xf32>, index, index) -> memref<?x?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>, index) -> (), sym_name = "expand_shape_mixed"}> ({
  ^bb0(%arg3: memref<?xf32>, %arg4: index):
    %9 = "memref.expand_shape"(%arg3, %arg4) <{reassociation = [[0, 1]], static_output_shape = array<i64: -9223372036854775808, 5>}> : (memref<?xf32>, index) -> memref<?x5xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "expand_shape_multi_group"}> ({
  ^bb0(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index):
    %8 = "memref.expand_shape"(%arg0, %arg1, %arg2) <{reassociation = [[0], [1, 2]], static_output_shape = array<i64: -9223372036854775808, -9223372036854775808, 4>}> : (memref<?x?xf32>, index, index) -> memref<?x?x4xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    %1 = "memref.cast"(%0) : (memref<10xf32>) -> memref<?xf32>
    %2 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x20xf32>
    %3 = "memref.cast"(%2) : (memref<3x20xf32>) -> memref<?x?xf32>
    %4 = "arith.constant"() <{value = 2 : index}> : () -> index
    %5 = "arith.constant"() <{value = 3 : index}> : () -> index
    %6 = "arith.constant"() <{value = 4 : index}> : () -> index
    %7 = "arith.constant"() <{value = 5 : index}> : () -> index
    "func.call"(%1, %5, %7) <{callee = @expand_shape_dynamic}> : (memref<?xf32>, index, index) -> ()
    "func.call"(%1, %6) <{callee = @expand_shape_mixed}> : (memref<?xf32>, index) -> ()
    "func.call"(%1, %4, %7) <{callee = @expand_shape_dynamic}> : (memref<?xf32>, index, index) -> ()
    "func.call"(%1, %4) <{callee = @expand_shape_mixed}> : (memref<?xf32>, index) -> ()
    "func.call"(%3, %5, %7) <{callee = @expand_shape_multi_group}> : (memref<?x?xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

