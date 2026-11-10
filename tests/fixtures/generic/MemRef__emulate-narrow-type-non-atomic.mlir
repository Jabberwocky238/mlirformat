"builtin.module"() ({
  "func.func"() <{function_type = (index, i4) -> (), sym_name = "memref_store_i4"}> ({
  ^bb0(%arg0: index, %arg1: i4):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<5xi4>
    "memref.store"(%arg1, %0, %arg0) : (i4, memref<5xi4>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, i4) -> (), sym_name = "memref_store_i4_rank2"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: i4):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x125xi4>
    "memref.store"(%arg2, %0, %arg0, %arg1) : (i4, memref<3x125xi4>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index, i4) -> (), sym_name = "memref_store_i4_dynamic"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: i4):
    %0 = "memref.alloc"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xi4>
    "memref.store"(%arg4, %0, %arg2, %arg3) : (i4, memref<?x?xi4>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f4E2M1FN) -> (), sym_name = "memref_store_f4"}> ({
  ^bb0(%arg0: f4E2M1FN):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f4E2M1FN>
    "memref.store"(%arg0, %0) : (f4E2M1FN, memref<f4E2M1FN>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i4) -> (), sym_name = "rank_zero_memref_store"}> ({
  ^bb0(%arg0: i4):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i4>
    "memref.store"(%arg0, %0) : (i4, memref<i4>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

