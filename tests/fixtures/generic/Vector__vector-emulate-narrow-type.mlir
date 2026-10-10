"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> vector<4xi8>, sym_name = "vector_load_i8"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x4xi8>
    %1 = "vector.load"(%0, %arg0, %arg1) : (memref<3x4xi8>, index, index) -> vector<4xi8>
    "func.return"(%1) : (vector<4xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> vector<3x8xi4>, sym_name = "vector_load_i4"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x8xi4>
    %1 = "arith.constant"() <{value = dense<0> : vector<3x8xi4>}> : () -> vector<3x8xi4>
    %2 = "vector.load"(%0, %arg0, %arg1) : (memref<3x8xi4>, index, index) -> vector<8xi4>
    %3 = "vector.insert"(%2, %1) <{static_position = array<i64: 0>}> : (vector<8xi4>, vector<3x8xi4>) -> vector<3x8xi4>
    "func.return"(%3) : (vector<3x8xi4>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> vector<3x8xf4E2M1FN>, sym_name = "vector_load_f4"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x8xf4E2M1FN>
    %1 = "arith.constant"() <{value = dense<0.000000e+00> : vector<3x8xf4E2M1FN>}> : () -> vector<3x8xf4E2M1FN>
    %2 = "vector.load"(%0, %arg0, %arg1) : (memref<3x8xf4E2M1FN>, index, index) -> vector<8xf4E2M1FN>
    %3 = "vector.insert"(%2, %1) <{static_position = array<i64: 0>}> : (vector<8xf4E2M1FN>, vector<3x8xf4E2M1FN>) -> vector<3x8xf4E2M1FN>
    "func.return"(%3) : (vector<3x8xf4E2M1FN>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index) -> vector<8xi4>, sym_name = "vector_load_i4_dynamic"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index):
    %0 = "memref.alloc"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xi4>
    %1 = "vector.load"(%0, %arg2, %arg3) : (memref<?x?xi4>, index, index) -> vector<8xi4>
    "func.return"(%1) : (vector<8xi4>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> vector<8xi4>, sym_name = "vector_transfer_read_i4"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "arith.constant"() <{value = 0 : i4}> : () -> i4
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x8xi4>
    %2 = "vector.transfer_read"(%1, %arg0, %arg1, %0) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<3x8xi4>, index, index, i4) -> vector<8xi4>
    "func.return"(%2) : (vector<8xi4>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> vector<8xf4E2M1FN>, sym_name = "vector_transfer_read_f4"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f4E2M1FN}> : () -> f4E2M1FN
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x8xf4E2M1FN>
    %2 = "vector.transfer_read"(%1, %arg0, %arg1, %0) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<3x8xf4E2M1FN>, index, index, f4E2M1FN) -> vector<8xf4E2M1FN>
    "func.return"(%2) : (vector<8xf4E2M1FN>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, vector<4xi8>) -> vector<4xi8>, sym_name = "vector_maskedload_i8"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: vector<4xi8>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x4xi8>
    %1 = "vector.create_mask"(%arg2) : (index) -> vector<4xi1>
    %2 = "vector.maskedload"(%0, %arg0, %arg1, %1, %arg3) : (memref<3x4xi8>, index, index, vector<4xi1>, vector<4xi8>) -> vector<4xi8>
    "func.return"(%2) : (vector<4xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, vector<8xi4>) -> vector<3x8xi4>, sym_name = "vector_maskedload_i4"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: vector<8xi4>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x8xi4>
    %1 = "arith.constant"() <{value = dense<0> : vector<3x8xi4>}> : () -> vector<3x8xi4>
    %2 = "vector.create_mask"(%arg2) : (index) -> vector<8xi1>
    %3 = "vector.maskedload"(%0, %arg0, %arg1, %2, %arg3) : (memref<3x8xi4>, index, index, vector<8xi1>, vector<8xi4>) -> vector<8xi4>
    %4 = "vector.insert"(%3, %1) <{static_position = array<i64: 0>}> : (vector<8xi4>, vector<3x8xi4>) -> vector<3x8xi4>
    "func.return"(%4) : (vector<3x8xi4>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, vector<4xi8>) -> vector<4xi8>, sym_name = "vector_maskedload_i8_constant_mask"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: vector<4xi8>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x4xi8>
    %1 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 2>}> : () -> vector<4xi1>
    %2 = "vector.maskedload"(%0, %arg0, %arg1, %1, %arg2) : (memref<3x4xi8>, index, index, vector<4xi1>, vector<4xi8>) -> vector<4xi8>
    "func.return"(%2) : (vector<4xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, vector<8xi4>) -> vector<3x8xi4>, sym_name = "vector_maskedload_i4_constant_mask"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: vector<8xi4>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x8xi4>
    %1 = "arith.constant"() <{value = dense<0> : vector<3x8xi4>}> : () -> vector<3x8xi4>
    %2 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 4>}> : () -> vector<8xi1>
    %3 = "vector.maskedload"(%0, %arg0, %arg1, %2, %arg2) : (memref<3x8xi4>, index, index, vector<8xi1>, vector<8xi4>) -> vector<8xi4>
    %4 = "vector.insert"(%3, %1) <{static_position = array<i64: 0>}> : (vector<8xi4>, vector<3x8xi4>) -> vector<3x8xi4>
    "func.return"(%4) : (vector<3x8xi4>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xi4>) -> vector<8xi4>, sym_name = "vector_maskedload_i4_arith_constant"}> ({
  ^bb0(%arg1: vector<8xi4>):
    %11 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x8xi4>
    %12 = "arith.constant"() <{value = dense<0> : vector<8xi4>}> : () -> vector<8xi4>
    %13 = "arith.constant"() <{value = dense<[false, true, true, true, true, false, false, false]> : vector<8xi1>}> : () -> vector<8xi1>
    %14 = "arith.constant"() <{value = 0 : index}> : () -> index
    %15 = "vector.maskedload"(%11, %14, %14, %13, %arg1) : (memref<3x8xi4>, index, index, vector<8xi1>, vector<8xi4>) -> vector<8xi4>
    "func.return"(%15) : (vector<8xi4>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> vector<8x8x16xi4>, sym_name = "vector_extract_maskedload_i4"}> ({
  ^bb0(%arg0: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x8x16xi4>
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 16 : index}> : () -> index
    %3 = "arith.constant"() <{value = 8 : index}> : () -> index
    %4 = "arith.constant"() <{value = dense<0> : vector<8x8x16xi4>}> : () -> vector<8x8x16xi4>
    %5 = "arith.constant"() <{value = dense<0> : vector<16xi4>}> : () -> vector<16xi4>
    %6 = "vector.create_mask"(%3, %arg0, %2) : (index, index, index) -> vector<8x8x16xi1>
    %7 = "vector.extract"(%6) <{static_position = array<i64: 0>}> : (vector<8x8x16xi1>) -> vector<8x16xi1>
    %8 = "vector.extract"(%7) <{static_position = array<i64: 0>}> : (vector<8x16xi1>) -> vector<16xi1>
    %9 = "vector.maskedload"(%0, %1, %1, %1, %8, %5) : (memref<8x8x16xi4>, index, index, index, vector<16xi1>, vector<16xi4>) -> vector<16xi4>
    %10 = "vector.insert"(%9, %4) <{static_position = array<i64: 0, 0>}> : (vector<16xi4>, vector<8x8x16xi4>) -> vector<8x8x16xi4>
    "func.return"(%10) : (vector<8x8x16xi4>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<8x8x16xi4>, sym_name = "vector_extract_cst_maskedload_i4"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x8x16xi4>
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = dense<0> : vector<8x8x16xi4>}> : () -> vector<8x8x16xi4>
    %3 = "arith.constant"() <{value = dense<0> : vector<16xi4>}> : () -> vector<16xi4>
    %4 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 8, 4, 16>}> : () -> vector<8x8x16xi1>
    %5 = "vector.extract"(%4) <{static_position = array<i64: 0>}> : (vector<8x8x16xi1>) -> vector<8x16xi1>
    %6 = "vector.extract"(%5) <{static_position = array<i64: 0>}> : (vector<8x16xi1>) -> vector<16xi1>
    %7 = "vector.maskedload"(%0, %1, %1, %1, %6, %3) : (memref<8x8x16xi4>, index, index, index, vector<16xi1>, vector<16xi4>) -> vector<16xi4>
    %8 = "vector.insert"(%7, %2) <{static_position = array<i64: 0, 0>}> : (vector<16xi4>, vector<8x8x16xi4>) -> vector<8x8x16xi4>
    "func.return"(%8) : (vector<8x8x16xi4>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xi8>, index, index) -> (), sym_name = "vector_store_i8"}> ({
  ^bb0(%arg0: vector<8xi8>, %arg1: index, %arg2: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x8xi8>
    "vector.store"(%arg0, %0, %arg1, %arg2) : (vector<8xi8>, memref<4x8xi8>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xi4>, index, index) -> (), sym_name = "vector_store_i4"}> ({
  ^bb0(%arg0: vector<8xi4>, %arg1: index, %arg2: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x8xi4>
    "vector.store"(%arg0, %0, %arg1, %arg2) : (vector<8xi4>, memref<4x8xi4>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xf4E2M1FN>, index, index) -> (), sym_name = "vector_store_f4"}> ({
  ^bb0(%arg0: vector<8xf4E2M1FN>, %arg1: index, %arg2: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x8xf4E2M1FN>
    "vector.store"(%arg0, %0, %arg1, %arg2) : (vector<8xf4E2M1FN>, memref<4x8xf4E2M1FN>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xi4>, index, index, index, index) -> (), sym_name = "vector_store_i4_dynamic"}> ({
  ^bb0(%arg0: vector<8xi4>, %arg1: index, %arg2: index, %arg3: index, %arg4: index):
    %0 = "memref.alloc"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xi4>
    "vector.store"(%arg0, %0, %arg3, %arg4) : (vector<8xi4>, memref<?x?xi4>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, vector<8xi8>) -> (), sym_name = "vector_maskedstore_i8"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: vector<8xi8>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x8xi8>
    %1 = "vector.create_mask"(%arg2) : (index) -> vector<8xi1>
    "vector.maskedstore"(%0, %arg0, %arg1, %1, %arg3) : (memref<3x8xi8>, index, index, vector<8xi1>, vector<8xi8>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, vector<8xi4>) -> (), sym_name = "vector_maskedstore_i4"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: vector<8xi4>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x8xi4>
    %1 = "vector.create_mask"(%arg2) : (index) -> vector<8xi1>
    "vector.maskedstore"(%0, %arg0, %arg1, %1, %arg3) : (memref<3x8xi4>, index, index, vector<8xi1>, vector<8xi4>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, vector<8xi8>) -> (), sym_name = "vector_maskedstore_i8_constant_mask"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: vector<8xi8>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x8xi8>
    %1 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 4>}> : () -> vector<8xi1>
    "vector.maskedstore"(%0, %arg0, %arg1, %1, %arg2) : (memref<3x8xi8>, index, index, vector<8xi1>, vector<8xi8>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, vector<8xi4>) -> (), sym_name = "vector_maskedstore_i4_constant_mask"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: vector<8xi4>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x8xi4>
    %1 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 4>}> : () -> vector<8xi1>
    "vector.maskedstore"(%0, %arg0, %arg1, %1, %arg2) : (memref<3x8xi4>, index, index, vector<8xi1>, vector<8xi4>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xi4>) -> (), sym_name = "vector_maskedstore_i4_arith_constant"}> ({
  ^bb0(%arg0: vector<8xi4>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<5x8xi4>
    %1 = "arith.constant"() <{value = dense<0> : vector<8xi4>}> : () -> vector<8xi4>
    %2 = "arith.constant"() <{value = dense<[false, true, true, true, true, true, false, false]> : vector<8xi1>}> : () -> vector<8xi1>
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 3 : index}> : () -> index
    "vector.maskedstore"(%0, %4, %3, %2, %arg0) : (memref<5x8xi4>, index, index, vector<8xi1>, vector<8xi4>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

