"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> vector<2x4xi8>, sym_name = "vector_load_2d_i8_negative"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x4xi8>
    %1 = "vector.load"(%0, %arg0, %arg1) : (memref<3x4xi8>, index, index) -> vector<2x4xi8>
    "func.return"(%1) : (vector<2x4xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> vector<2x8xi4>, sym_name = "vector_transfer_read_2d_i4_negative"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "arith.constant"() <{value = 0 : i4}> : () -> i4
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x8xi4>
    %2 = "vector.transfer_read"(%1, %arg0, %arg1, %0) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<3x8xi4>, index, index, i4) -> vector<2x8xi4>
    "func.return"(%2) : (vector<2x8xi4>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, vector<2x4xi8>) -> vector<2x4xi8>, sym_name = "vector_maskedload_2d_i8_negative"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: vector<2x4xi8>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x4xi8>
    %1 = "vector.create_mask"(%arg2, %arg2) : (index, index) -> vector<2x4xi1>
    %2 = "vector.maskedload"(%0, %arg0, %arg1, %1, %arg3) : (memref<3x4xi8>, index, index, vector<2x4xi1>, vector<2x4xi8>) -> vector<2x4xi8>
    "func.return"(%2) : (vector<2x4xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<8x8x16xi4>, sym_name = "vector_extract_maskedload_2d_i4_negative"}> ({
  ^bb0(%arg0: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x8x16xi4>
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 16 : index}> : () -> index
    %3 = "arith.constant"() <{value = 8 : index}> : () -> index
    %4 = "arith.constant"() <{value = dense<0> : vector<8x8x16xi4>}> : () -> vector<8x8x16xi4>
    %5 = "arith.constant"() <{value = dense<0> : vector<8x16xi4>}> : () -> vector<8x16xi4>
    %6 = "vector.create_mask"(%3, %arg0, %2) : (index, index, index) -> vector<8x8x16xi1>
    %7 = "vector.extract"(%6) <{static_position = array<i64: 0>}> : (vector<8x8x16xi1>) -> vector<8x16xi1>
    %8 = "vector.maskedload"(%0, %1, %1, %1, %7, %5) : (memref<8x8x16xi4>, index, index, index, vector<8x16xi1>, vector<8x16xi4>) -> vector<8x16xi4>
    %9 = "vector.insert"(%8, %4) <{static_position = array<i64: 0>}> : (vector<8x16xi4>, vector<8x8x16xi4>) -> vector<8x8x16xi4>
    "func.return"(%9) : (vector<8x8x16xi4>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x8xi8>, index, index) -> (), sym_name = "vector_store_2d_i8_negative"}> ({
  ^bb0(%arg0: vector<2x8xi8>, %arg1: index, %arg2: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x8xi8>
    "vector.store"(%arg0, %0, %arg1, %arg2) : (vector<2x8xi8>, memref<4x8xi8>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, vector<2x8xi8>) -> (), sym_name = "vector_maskedstore_2d_i8_negative"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: vector<2x8xi8>):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x8xi8>
    %1 = "vector.create_mask"(%arg2, %arg2) : (index, index) -> vector<2x8xi1>
    "vector.maskedstore"(%0, %arg0, %arg1, %1, %arg3) : (memref<3x8xi8>, index, index, vector<2x8xi1>, vector<2x8xi8>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

