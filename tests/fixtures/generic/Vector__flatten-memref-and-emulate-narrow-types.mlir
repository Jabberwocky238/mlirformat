"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<8xi4>, sym_name = "vector_load_2d_i4"}> ({
  ^bb0(%arg0: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x8xi4>
    %1 = "vector.load"(%0, %arg0, %arg0) : (memref<4x8xi4>, index, index) -> vector<8xi4>
    "func.return"(%1) : (vector<8xi4>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, vector<8xi4>) -> vector<8xi4>, sym_name = "vector_maskedload_2d_i4"}> ({
  ^bb0(%arg0: index, %arg1: vector<8xi4>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x8xi4>
    %1 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 6>}> : () -> vector<8xi1>
    %2 = "vector.maskedload"(%0, %arg0, %arg0, %1, %arg1) : (memref<4x8xi4>, index, index, vector<8xi1>, vector<8xi4>) -> vector<8xi4>
    "func.return"(%2) : (vector<8xi4>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, vector<8xi4>) -> (), sym_name = "vector_maskedstore_2d_i4"}> ({
  ^bb0(%arg0: index, %arg1: vector<8xi4>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x8xi4>
    %1 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 5>}> : () -> vector<8xi1>
    "vector.maskedstore"(%0, %arg0, %arg0, %1, %arg1) : (memref<4x8xi4>, index, index, vector<8xi1>, vector<8xi4>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, vector<8xi4>) -> (), sym_name = "vector_store_2d_i4"}> ({
  ^bb0(%arg0: index, %arg1: vector<8xi4>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x8xi4>
    "vector.store"(%arg1, %0, %arg0, %arg0) : (vector<8xi4>, memref<4x8xi4>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, i4) -> vector<8xi4>, sym_name = "vector_transfer_read_2d_i4"}> ({
  ^bb0(%arg0: index, %arg1: i4):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x8xi4>
    %1 = "vector.transfer_read"(%0, %arg0, %arg0, %arg1) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x8xi4>, index, index, i4) -> vector<8xi4>
    "func.return"(%1) : (vector<8xi4>) -> ()
  }) : () -> ()
}) : () -> ()

