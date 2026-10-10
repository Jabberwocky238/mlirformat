"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (index, index, index), sym_name = "delinearize_static_basis"}> ({
  ^bb0(%arg0: index):
    %0:3 = "affine.delinearize_index"(%arg0) <{static_basis = array<i64: 16, 224, 224>}> : (index) -> (index, index, index)
    "func.return"(%0#0, %0#1, %0#2) : (index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<?x?x?xf32>) -> (index, index, index), sym_name = "delinearize_dynamic_basis"}> ({
  ^bb0(%arg0: index, %arg1: memref<?x?x?xf32>):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index
    %2 = "memref.dim"(%arg1, %0) : (memref<?x?x?xf32>, index) -> index
    %3 = "memref.dim"(%arg1, %1) : (memref<?x?x?xf32>, index) -> index
    %4:3 = "affine.delinearize_index"(%arg0, %2, %3) <{static_basis = array<i64: -9223372036854775808, -9223372036854775808>}> : (index, index, index) -> (index, index, index)
    "func.return"(%4#0, %4#1, %4#2) : (index, index, index) -> ()
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

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index, index) -> index, sym_name = "linearize_dynamic_disjoint"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index):
    %0 = "affine.linearize_index"(%arg0, %arg1, %arg2, %arg3, %arg4) <{disjoint, operandSegmentSizes = array<i32: 3, 2>, static_basis = array<i64: -9223372036854775808, -9223372036854775808>}> : (index, index, index, index, index) -> index
    "func.return"(%0) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xi32>, index, index) -> (), sym_name = "linearize_sort_adds"}> ({
  ^bb0(%arg0: memref<?xi32>, %arg1: index, %arg2: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    "scf.for"(%0, %arg2, %1) ({
    ^bb0(%arg3: index):
      "scf.for"(%0, %2, %1) ({
      ^bb0(%arg4: index):
        %4 = "affine.linearize_index"(%arg1, %arg4, %arg3, %arg2) <{disjoint, operandSegmentSizes = array<i32: 3, 1>, static_basis = array<i64: 4, -9223372036854775808>}> : (index, index, index, index) -> index
        "memref.store"(%3, %arg0, %4) : (i32, memref<?xi32>, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

