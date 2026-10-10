"builtin.module"() ({
  "func.func"() <{function_type = (vector<3xi2>) -> (), sym_name = "vector_store_i2_const_index_two_partial_stores"}> ({
  ^bb0(%arg0: vector<3xi2>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x3xi2>
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    "vector.store"(%arg0, %0, %2, %1) : (vector<3xi2>, memref<3x3xi2>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<7xi2>) -> (), sym_name = "vector_store_i2_two_partial_one_full_stores"}> ({
  ^bb0(%arg0: vector<7xi2>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x7xi2>
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    "vector.store"(%arg0, %0, %2, %1) : (vector<7xi2>, memref<3x7xi2>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1xi2>) -> (), sym_name = "vector_store_i2_const_index_one_partial_store"}> ({
  ^bb0(%arg0: vector<1xi2>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x1xi2>
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    "vector.store"(%arg0, %0, %2, %1) : (vector<1xi2>, memref<4x1xi2>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

