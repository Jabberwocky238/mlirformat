"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (index, index, index), sym_name = "static_basis"}> ({
  ^bb0(%arg0: index):
    %0:3 = "affine.delinearize_index"(%arg0) <{static_basis = array<i64: 16, 224, 224>}> : (index) -> (index, index, index)
    "func.return"(%0#0, %0#1, %0#2) : (index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<?x?x?xf32>) -> (index, index, index), sym_name = "dynamic_basis"}> ({
  ^bb0(%arg0: index, %arg1: memref<?x?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "memref.dim"(%arg1, %1) : (memref<?x?x?xf32>, index) -> index
    %4 = "memref.dim"(%arg1, %2) : (memref<?x?x?xf32>, index) -> index
    %5:3 = "affine.delinearize_index"(%arg0, %3, %4) <{static_basis = array<i64: -9223372036854775808, -9223372036854775808>}> : (index, index, index) -> (index, index, index)
    "func.return"(%5#0, %5#1, %5#2) : (index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> index, sym_name = "linearize_static"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index):
    %0 = "affine.linearize_index"(%arg0, %arg1, %arg2) <{disjoint = false, operandSegmentSizes = array<i32: 3, 0>, static_basis = array<i64: 2, 3, 5>}> : (index, index, index) -> index
    "func.return"(%0) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index, index) -> index, sym_name = "linearize_dynamic"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index):
    %0 = "affine.linearize_index"(%arg0, %arg1, %arg2, %arg3, %arg4) <{disjoint = false, operandSegmentSizes = array<i32: 3, 2>, static_basis = array<i64: -9223372036854775808, -9223372036854775808>}> : (index, index, index, index, index) -> index
    "func.return"(%0) : (index) -> ()
  }) : () -> ()
}) : () -> ()

