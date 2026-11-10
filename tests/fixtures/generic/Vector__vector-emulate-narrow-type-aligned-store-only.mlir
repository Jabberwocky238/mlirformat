"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xi4>, index, index) -> (), sym_name = "vector_store_i4_aligned_const"}> ({
  ^bb0(%arg0: vector<8xi4>, %arg1: index, %arg2: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x8xi4>
    "vector.store"(%arg0, %0, %arg1, %arg2) : (vector<8xi4>, memref<4x8xi4>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xi4>, index, index, index, index) -> (), sym_name = "vector_store_i4_aligned_dynamic"}> ({
  ^bb0(%arg0: vector<8xi4>, %arg1: index, %arg2: index, %arg3: index, %arg4: index):
    %0 = "memref.alloc"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xi4>
    "vector.store"(%arg0, %0, %arg3, %arg4) : (vector<8xi4>, memref<?x?xi4>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

