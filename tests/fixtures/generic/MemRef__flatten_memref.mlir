"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x8xf32, strided<[8, 1], offset: 100>>) -> f32, sym_name = "load_scalar_from_memref"}> ({
  ^bb0(%arg0: memref<4x8xf32, strided<[8, 1], offset: 100>>):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index
    %2 = "memref.load"(%arg0, %0, %1) : (memref<4x8xf32, strided<[8, 1], offset: 100>>, index, index) -> f32
    "func.return"(%2) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32, strided<[?, ?], offset: ?>>, index, index) -> f32, sym_name = "load_scalar_from_memref_dynamic_dim"}> ({
  ^bb0(%arg0: memref<?x?xf32, strided<[?, ?], offset: ?>>, %arg1: index, %arg2: index):
    %0 = "memref.load"(%arg0, %arg2, %arg1) : (memref<?x?xf32, strided<[?, ?], offset: ?>>, index, index) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8x12xf32, strided<[24, 2], offset: 100>>) -> f32, sym_name = "load_scalar_from_memref_static_dim"}> ({
  ^bb0(%arg0: memref<8x12xf32, strided<[24, 2], offset: 100>>):
    %0 = "arith.constant"() <{value = 7 : index}> : () -> index
    %1 = "arith.constant"() <{value = 10 : index}> : () -> index
    %2 = "memref.load"(%arg0, %0, %1) : (memref<8x12xf32, strided<[24, 2], offset: 100>>, index, index) -> f32
    "func.return"(%2) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x8xf32, strided<[18, 2], offset: 100>>, index, index, f32) -> (), sym_name = "store_scalar_from_memref_padded"}> ({
  ^bb0(%arg0: memref<4x8xf32, strided<[18, 2], offset: 100>>, %arg1: index, %arg2: index, %arg3: f32):
    "memref.store"(%arg3, %arg0, %arg2, %arg1) : (f32, memref<4x8xf32, strided<[18, 2], offset: 100>>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32, strided<[?, ?], offset: ?>>, index, index, f32) -> (), sym_name = "store_scalar_from_memref_dynamic_dim"}> ({
  ^bb0(%arg0: memref<?x?xf32, strided<[?, ?], offset: ?>>, %arg1: index, %arg2: index, %arg3: f32):
    "memref.store"(%arg3, %arg0, %arg2, %arg1) : (f32, memref<?x?xf32, strided<[?, ?], offset: ?>>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x8xf32>) -> vector<8xf32>, sym_name = "load_vector_from_memref"}> ({
  ^bb0(%arg0: memref<4x8xf32>):
    %0 = "arith.constant"() <{value = 3 : index}> : () -> index
    %1 = "arith.constant"() <{value = 6 : index}> : () -> index
    %2 = "vector.load"(%arg0, %0, %1) : (memref<4x8xf32>, index, index) -> vector<8xf32>
    "func.return"(%2) : (vector<8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<3x7xi2>) -> vector<3xi2>, sym_name = "load_vector_from_memref_odd"}> ({
  ^bb0(%arg0: memref<3x7xi2>):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 3 : index}> : () -> index
    %2 = "vector.load"(%arg0, %0, %1) : (memref<3x7xi2>, index, index) -> vector<3xi2>
    "func.return"(%2) : (vector<3xi2>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<3x7xi2>, index, index) -> vector<3xi2>, sym_name = "load_vector_from_memref_dynamic"}> ({
  ^bb0(%arg0: memref<3x7xi2>, %arg1: index, %arg2: index):
    %0 = "vector.load"(%arg0, %arg2, %arg1) : (memref<3x7xi2>, index, index) -> vector<3xi2>
    "func.return"(%0) : (vector<3xi2>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<3x7xi2>, vector<3xi2>) -> (), sym_name = "store_vector_to_memref_odd"}> ({
  ^bb0(%arg0: memref<3x7xi2>, %arg1: vector<3xi2>):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 3 : index}> : () -> index
    "vector.store"(%arg1, %arg0, %0, %1) : (vector<3xi2>, memref<3x7xi2>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<3x7xi2>, vector<3xi2>, index, index) -> (), sym_name = "store_vector_to_memref_dynamic"}> ({
  ^bb0(%arg0: memref<3x7xi2>, %arg1: vector<3xi2>, %arg2: index, %arg3: index):
    "vector.store"(%arg1, %arg0, %arg3, %arg2) : (vector<3xi2>, memref<3x7xi2>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<3x7xi2>, vector<3xi2>, vector<3xi1>) -> (), sym_name = "mask_store_vector_to_memref_odd"}> ({
  ^bb0(%arg0: memref<3x7xi2>, %arg1: vector<3xi2>, %arg2: vector<3xi1>):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 3 : index}> : () -> index
    "vector.maskedstore"(%arg0, %0, %1, %arg2, %arg1) : (memref<3x7xi2>, index, index, vector<3xi1>, vector<3xi2>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<3x7xi2>, vector<3xi2>, index, index, vector<3xi1>) -> (), sym_name = "mask_store_vector_to_memref_dynamic"}> ({
  ^bb0(%arg0: memref<3x7xi2>, %arg1: vector<3xi2>, %arg2: index, %arg3: index, %arg4: vector<3xi1>):
    "vector.maskedstore"(%arg0, %arg3, %arg2, %arg4, %arg1) : (memref<3x7xi2>, index, index, vector<3xi1>, vector<3xi2>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<3x7xi2>, vector<3xi1>, vector<3xi2>) -> vector<3xi2>, sym_name = "mask_load_vector_from_memref_odd"}> ({
  ^bb0(%arg0: memref<3x7xi2>, %arg1: vector<3xi1>, %arg2: vector<3xi2>):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = 3 : index}> : () -> index
    %2 = "vector.maskedload"(%arg0, %0, %1, %arg1, %arg2) : (memref<3x7xi2>, index, index, vector<3xi1>, vector<3xi2>) -> vector<3xi2>
    "func.return"(%2) : (vector<3xi2>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<3x7xi2>, index, index, vector<3xi1>, vector<3xi2>) -> vector<3xi2>, sym_name = "mask_load_vector_from_memref_dynamic"}> ({
  ^bb0(%arg0: memref<3x7xi2>, %arg1: index, %arg2: index, %arg3: vector<3xi1>, %arg4: vector<3xi2>):
    %0 = "vector.maskedload"(%arg0, %arg2, %arg1, %arg3, %arg4) : (memref<3x7xi2>, index, index, vector<3xi1>, vector<3xi2>) -> vector<3xi2>
    "func.return"(%0) : (vector<3xi2>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x8xi2>, vector<8xi2>, index, index) -> vector<8xi2>, sym_name = "transfer_read_memref"}> ({
  ^bb0(%arg0: memref<4x8xi2>, %arg1: vector<8xi2>, %arg2: index, %arg3: index):
    %0 = "arith.constant"() <{value = 0 : i2}> : () -> i2
    %1 = "vector.transfer_read"(%arg0, %arg3, %arg2, %0) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x8xi2>, index, index, i2) -> vector<8xi2>
    "func.return"(%1) : (vector<8xi2>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x8xi2>, vector<8xi2>, index, index) -> vector<8xi2>, sym_name = "transfer_read_memref_not_inbound"}> ({
  ^bb0(%arg0: memref<4x8xi2>, %arg1: vector<8xi2>, %arg2: index, %arg3: index):
    %0 = "arith.constant"() <{value = 0 : i2}> : () -> i2
    %1 = "vector.transfer_read"(%arg0, %arg3, %arg2, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x8xi2>, index, index, i2) -> vector<8xi2>
    "func.return"(%1) : (vector<8xi2>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x8xi2>, vector<8xi2>, index, index) -> vector<8xi2>, sym_name = "transfer_read_memref_non_id"}> ({
  ^bb0(%arg0: memref<4x8xi2>, %arg1: vector<8xi2>, %arg2: index, %arg3: index):
    %0 = "arith.constant"() <{value = 0 : i2}> : () -> i2
    %1 = "vector.transfer_read"(%arg0, %arg3, %arg2, %0) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x8xi2>, index, index, i2) -> vector<8xi2>
    "func.return"(%1) : (vector<8xi2>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x8xi2>, vector<8xi2>, index, index) -> (), sym_name = "transfer_write_memref"}> ({
  ^bb0(%arg0: memref<4x8xi2>, %arg1: vector<8xi2>, %arg2: index, %arg3: index):
    "vector.transfer_write"(%arg1, %arg0, %arg3, %arg2) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<8xi2>, memref<4x8xi2>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> memref<4x8xf32>, sym_name = "alloc"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x8xf32>
    "func.return"(%0) : (memref<4x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> memref<4x8xf32>, sym_name = "alloca"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x8xf32>
    "func.return"(%0) : (memref<4x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<8xf32>, sym_name = "chained_alloc_load"}> ({
    %0 = "arith.constant"() <{value = 3 : index}> : () -> index
    %1 = "arith.constant"() <{value = 6 : index}> : () -> index
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x8xf32>
    %3 = "vector.load"(%2, %0, %1) : (memref<4x8xf32>, index, index) -> vector<8xf32>
    "func.return"(%3) : (vector<8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x8xf32, strided<[1, 4], offset: 100>>, index, index) -> f32, sym_name = "load_scalar_from_memref_static_dim_col_major"}> ({
  ^bb0(%arg0: memref<4x8xf32, strided<[1, 4], offset: 100>>, %arg1: index, %arg2: index):
    %0 = "memref.load"(%arg0, %arg2, %arg1) : (memref<4x8xf32, strided<[1, 4], offset: 100>>, index, index) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

