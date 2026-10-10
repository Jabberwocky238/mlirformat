"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<3x3xi2>, sym_name = "vector_load_i2"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x3xi2>
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "arith.constant"() <{value = dense<0> : vector<3x3xi2>}> : () -> vector<3x3xi2>
    %4 = "vector.load"(%0, %2, %1) : (memref<3x3xi2>, index, index) -> vector<3xi2>
    %5 = "vector.insert"(%4, %3) <{static_position = array<i64: 0>}> : (vector<3xi2>, vector<3x3xi2>) -> vector<3x3xi2>
    "func.return"(%5) : (vector<3x3xi2>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<3xi2>, sym_name = "vector_transfer_read_i2"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x3xi2>
    %1 = "arith.constant"() <{value = 0 : i2}> : () -> i2
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 2 : index}> : () -> index
    %4 = "vector.transfer_read"(%0, %3, %2, %1) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<3x3xi2>, index, index, i2) -> vector<3xi2>
    "func.return"(%4) : (vector<3xi2>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<5xi2>) -> vector<5xi2>, sym_name = "vector_constant_mask_maskedload_i2"}> ({
  ^bb0(%arg0: vector<5xi2>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x5xi2>
    %1 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 3>}> : () -> vector<5xi1>
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 2 : index}> : () -> index
    %4 = "vector.maskedload"(%0, %3, %2, %1, %arg0) : (memref<3x5xi2>, index, index, vector<5xi1>, vector<5xi2>) -> vector<5xi2>
    "func.return"(%4) : (vector<5xi2>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, vector<5xi2>) -> vector<5xi2>, sym_name = "unaligned_create_mask_dynamic_i2"}> ({
  ^bb0(%arg0: index, %arg1: vector<5xi2>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x5xi2>
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "vector.create_mask"(%arg0) : (index) -> vector<5xi1>
    %4 = "vector.maskedload"(%0, %2, %1, %3, %arg1) : (memref<3x5xi2>, index, index, vector<5xi1>, vector<5xi2>) -> vector<5xi2>
    "func.return"(%4) : (vector<5xi2>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<7xi2>) -> vector<7xi2>, sym_name = "check_unaligned_create_mask_static_i2"}> ({
  ^bb0(%arg0: vector<7xi2>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x7xi2>
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 3 : index}> : () -> index
    %4 = "vector.create_mask"(%3) : (index) -> vector<7xi1>
    %5 = "vector.maskedload"(%0, %2, %1, %4, %arg0) : (memref<3x7xi2>, index, index, vector<7xi1>, vector<7xi2>) -> vector<7xi2>
    "func.return"(%5) : (vector<7xi2>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<5xi2>) -> vector<5xi2>, sym_name = "vector_constant_mask_maskedload_i2_multidim"}> ({
  ^bb0(%arg0: vector<5xi2>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x3x5xi2>
    %1 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 2, 2>}> : () -> vector<3x5xi1>
    %2 = "vector.extract"(%1) <{static_position = array<i64: 1>}> : (vector<3x5xi1>) -> vector<5xi1>
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 2 : index}> : () -> index
    %5 = "vector.maskedload"(%0, %4, %3, %3, %2, %arg0) : (memref<4x3x5xi2>, index, index, index, vector<5xi1>, vector<5xi2>) -> vector<5xi2>
    "func.return"(%5) : (vector<5xi2>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> vector<3xi2>, sym_name = "vector_load_i2_dynamic_indexing"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x3xi2>
    %1 = "arith.constant"() <{value = dense<0> : vector<3x3xi2>}> : () -> vector<3x3xi2>
    %2 = "vector.load"(%0, %arg0, %arg1) : (memref<3x3xi2>, index, index) -> vector<3xi2>
    "func.return"(%2) : (vector<3xi2>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<3xi2>, sym_name = "vector_load_i2_dynamic_indexing_mixed"}> ({
  ^bb0(%arg0: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x3xi2>
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index
    %2 = "arith.constant"() <{value = dense<1> : vector<3x3xi2>}> : () -> vector<3x3xi2>
    %3 = "vector.load"(%0, %arg0, %1) : (memref<3x3xi2>, index, index) -> vector<3xi2>
    "func.return"(%3) : (vector<3xi2>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> vector<3xi2>, sym_name = "vector_transfer_read_i2_dynamic_indexing"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x3xi2>
    %1 = "arith.constant"() <{value = 0 : i2}> : () -> i2
    %2 = "vector.transfer_read"(%0, %arg0, %arg1, %1) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<3x3xi2>, index, index, i2) -> vector<3xi2>
    "func.return"(%2) : (vector<3xi2>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<3xi2>, sym_name = "vector_transfer_read_i2_dynamic_indexing_mixed"}> ({
  ^bb0(%arg0: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x3xi2>
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index
    %2 = "arith.constant"() <{value = 0 : i2}> : () -> i2
    %3 = "vector.transfer_read"(%0, %arg0, %1, %2) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<3x3xi2>, index, index, i2) -> vector<3xi2>
    "func.return"(%3) : (vector<3xi2>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<3xi2>, index) -> vector<3xi2>, sym_name = "vector_maskedload_i2_dynamic_indexing_mixed"}> ({
  ^bb0(%arg0: vector<3xi2>, %arg1: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x3xi2>
    %1 = "arith.constant"() <{value = dense<0> : vector<3x3xi2>}> : () -> vector<3x3xi2>
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 3>}> : () -> vector<3xi1>
    %4 = "vector.maskedload"(%0, %arg1, %2, %3, %arg0) : (memref<3x3xi2>, index, index, vector<3xi1>, vector<3xi2>) -> vector<3xi2>
    "func.return"(%4) : (vector<3xi2>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<5xi2>) -> vector<5xi2>, sym_name = "vector_maskedload_i2_constant_mask_unaligned"}> ({
  ^bb0(%arg0: vector<5xi2>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x5xi2>
    %1 = "arith.constant"() <{value = dense<[false, true, true, true, false]> : vector<5xi1>}> : () -> vector<5xi1>
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1 : index}> : () -> index
    %4 = "vector.maskedload"(%0, %3, %2, %1, %arg0) : (memref<3x5xi2>, index, index, vector<5xi1>, vector<5xi2>) -> vector<5xi2>
    "func.return"(%4) : (vector<5xi2>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xi2>) -> (), sym_name = "vector_store_i2_const_index_no_partial_store"}> ({
  ^bb0(%arg0: vector<4xi2>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<13xi2>
    %1 = "arith.constant"() <{value = 4 : index}> : () -> index
    "vector.store"(%arg0, %0, %1) : (vector<4xi2>, memref<13xi2>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xi2>) -> (), sym_name = "vector_store_i2_const_index_two_partial_stores"}> ({
  ^bb0(%arg0: vector<4xi2>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<13xi2>
    %1 = "arith.constant"() <{value = 3 : index}> : () -> index
    "vector.store"(%arg0, %0, %1) : (vector<4xi2>, memref<13xi2>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
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

