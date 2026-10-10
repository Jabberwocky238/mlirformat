#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<5x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>>) -> vector<5x4x3x2xi8>, sym_name = "transfer_read_dims_match_contiguous"}> ({
  ^bb0(%arg1: memref<5x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>>):
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %5 = "vector.transfer_read"(%arg1, %3, %3, %3, %3, %4) <{in_bounds = [false, false, false, false], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<5x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>>, index, index, index, index, i8) -> vector<5x4x3x2xi8>
    "func.return"(%5) : (vector<5x4x3x2xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<5x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>>) -> vector<5x4x3x[2]xi8>, sym_name = "transfer_read_dims_match_contiguous_scalable"}> ({
  ^bb0(%arg0: memref<5x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %2 = "vector.transfer_read"(%arg0, %0, %0, %0, %0, %1) <{in_bounds = [false, false, false, false], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<5x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>>, index, index, index, index, i8) -> vector<5x4x3x[2]xi8>
    "func.return"(%2) : (vector<5x4x3x[2]xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<5x4x3x2xi8>) -> vector<5x4x3x2xi8>, sym_name = "transfer_read_dims_match_contiguous_empty_stride"}> ({
  ^bb0(%arg0: memref<5x4x3x2xi8>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %2 = "vector.transfer_read"(%arg0, %0, %0, %0, %0, %1) <{in_bounds = [false, false, false, false], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<5x4x3x2xi8>, index, index, index, index, i8) -> vector<5x4x3x2xi8>
    "func.return"(%2) : (vector<5x4x3x2xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<5x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>>) -> vector<2x3x2xi8>, sym_name = "transfer_read_dims_mismatch_contiguous"}> ({
  ^bb0(%arg0: memref<5x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %2 = "vector.transfer_read"(%arg0, %0, %0, %0, %0, %1) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<5x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>>, index, index, index, index, i8) -> vector<2x3x2xi8>
    "func.return"(%2) : (vector<2x3x2xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<6x5x4x3x2xi8, strided<[120, 24, 6, 2, 1], offset: ?>>) -> vector<1x1x4x3x2xi8>, sym_name = "transfer_read_dims_mismatch_contiguous_unit_dims"}> ({
  ^bb0(%arg0: memref<6x5x4x3x2xi8, strided<[120, 24, 6, 2, 1], offset: ?>>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %2 = "vector.transfer_read"(%arg0, %0, %0, %0, %0, %0, %1) <{in_bounds = [false, false, false, false, false], operandSegmentSizes = array<i32: 1, 5, 1, 0>, permutation_map = #map}> : (memref<6x5x4x3x2xi8, strided<[120, 24, 6, 2, 1], offset: ?>>, index, index, index, index, index, i8) -> vector<1x1x4x3x2xi8>
    "func.return"(%2) : (vector<1x1x4x3x2xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<5x4x3x2xi8, strided<[48, 6, 2, 1], offset: ?>>) -> vector<1x1x3x2xi8>, sym_name = "transfer_read_non_contiguous_unit_dims"}> ({
  ^bb0(%arg0: memref<5x4x3x2xi8, strided<[48, 6, 2, 1], offset: ?>>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %2 = "vector.transfer_read"(%arg0, %0, %0, %0, %0, %1) <{in_bounds = [false, false, false, false], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<5x4x3x2xi8, strided<[48, 6, 2, 1], offset: ?>>, index, index, index, index, i8) -> vector<1x1x3x2xi8>
    "func.return"(%2) : (vector<1x1x3x2xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, memref<1x43x4x6xi32>) -> vector<1x2x6xi32>, sym_name = "transfer_read_dims_mismatch_non_zero_indices"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: memref<1x43x4x6xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %2 = "vector.transfer_read"(%arg2, %0, %arg0, %arg1, %0, %1) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<1x43x4x6xi32>, index, index, index, index, i32) -> vector<1x2x6xi32>
    "func.return"(%2) : (vector<1x2x6xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x3x3x2xf32, strided<[40, 10, 2, 1], offset: ?>>, index, index) -> vector<2x2xf32>, sym_name = "transfer_read_dims_mismatch_non_contiguous_non_zero_indices"}> ({
  ^bb0(%arg0: memref<1x3x3x2xf32, strided<[40, 10, 2, 1], offset: ?>>, %arg1: index, %arg2: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "vector.transfer_read"(%arg0, %0, %arg1, %arg2, %0, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<1x3x3x2xf32, strided<[40, 10, 2, 1], offset: ?>>, index, index, index, index, f32) -> vector<2x2xf32>
    "func.return"(%2) : (vector<2x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x8x4xi8, strided<[?, 32, 4, 1], offset: ?>>, index, index) -> vector<8x4xi8>, sym_name = "transfer_read_leading_dynamic_dims"}> ({
  ^bb0(%arg0: memref<?x?x8x4xi8, strided<[?, 32, 4, 1], offset: ?>>, %arg1: index, %arg2: index):
    %0 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "vector.transfer_read"(%arg0, %arg1, %arg2, %1, %1, %0) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<?x?x8x4xi8, strided<[?, 32, 4, 1], offset: ?>>, index, index, index, index, i8) -> vector<8x4xi8>
    "func.return"(%2) : (vector<8x4xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x?x?x2xi8>) -> vector<2x2x2xi8>, sym_name = "negative_transfer_read_dynamic_dim_to_flatten"}> ({
  ^bb0(%arg0: memref<4x?x?x2xi8>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %2 = "vector.transfer_read"(%arg0, %0, %0, %0, %0, %1) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<4x?x?x2xi8>, index, index, index, index, i8) -> vector<2x2x2xi8>
    "func.return"(%2) : (vector<2x2x2xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, memref<1x?x4x6xi32>) -> vector<1x2x6xi32>, sym_name = "transfer_read_dynamic_dim_to_flatten"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: memref<1x?x4x6xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %2 = "vector.transfer_read"(%arg2, %0, %arg0, %arg1, %0, %1) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<1x?x4x6xi32>, index, index, index, index, i32) -> vector<1x2x6xi32>
    "func.return"(%2) : (vector<1x2x6xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<5x4x3x2xi8>) -> vector<2x1x2x2xi8>, sym_name = "transfer_read_dims_mismatch_non_contiguous_slice"}> ({
  ^bb0(%arg0: memref<5x4x3x2xi8>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %2 = "vector.transfer_read"(%arg0, %0, %0, %0, %0, %1) <{in_bounds = [false, false, false, false], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<5x4x3x2xi8>, index, index, index, index, i8) -> vector<2x1x2x2xi8>
    "func.return"(%2) : (vector<2x1x2x2xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i8>) -> vector<i8>, sym_name = "transfer_read_0d"}> ({
  ^bb0(%arg0: memref<i8>):
    %0 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %1 = "vector.transfer_read"(%arg0, %0) <{in_bounds = [], operandSegmentSizes = array<i32: 1, 0, 1, 0>, permutation_map = #map}> : (memref<i8>, i8) -> vector<i8>
    "func.return"(%1) : (vector<i8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<5x4x3x2xi8, strided<[24, 8, 2, 1], offset: ?>>) -> vector<5x4x3x2xi8>, sym_name = "transfer_read_non_contiguous_src"}> ({
  ^bb0(%arg0: memref<5x4x3x2xi8, strided<[24, 8, 2, 1], offset: ?>>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %2 = "vector.transfer_read"(%arg0, %0, %0, %0, %0, %1) <{in_bounds = [false, false, false, false], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<5x4x3x2xi8, strided<[24, 8, 2, 1], offset: ?>>, index, index, index, index, i8) -> vector<5x4x3x2xi8>
    "func.return"(%2) : (vector<5x4x3x2xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<5x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>>, vector<5x4x3x2xi8>) -> (), sym_name = "transfer_write_dims_match_contiguous"}> ({
  ^bb0(%arg2: memref<5x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>>, %arg3: vector<5x4x3x2xi8>):
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg3, %arg2, %1, %1, %1, %1) <{in_bounds = [false, false, false, false], operandSegmentSizes = array<i32: 1, 1, 4, 0>, permutation_map = #map}> : (vector<5x4x3x2xi8>, memref<5x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>>, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<5x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>>, vector<5x4x3x[2]xi8>) -> (), sym_name = "transfer_write_dims_match_contiguous_scalable"}> ({
  ^bb0(%arg0: memref<5x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>>, %arg1: vector<5x4x3x[2]xi8>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg1, %arg0, %0, %0, %0, %0) <{in_bounds = [false, false, false, false], operandSegmentSizes = array<i32: 1, 1, 4, 0>, permutation_map = #map}> : (vector<5x4x3x[2]xi8>, memref<5x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>>, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<5x4x3x2xi8>, vector<5x4x3x2xi8>) -> (), sym_name = "transfer_write_dims_match_contiguous_empty_stride"}> ({
  ^bb0(%arg0: memref<5x4x3x2xi8>, %arg1: vector<5x4x3x2xi8>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg1, %arg0, %0, %0, %0, %0) <{in_bounds = [false, false, false, false], operandSegmentSizes = array<i32: 1, 1, 4, 0>, permutation_map = #map}> : (vector<5x4x3x2xi8>, memref<5x4x3x2xi8>, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<5x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>>, vector<2x2xi8>) -> (), sym_name = "transfer_write_dims_mismatch_contiguous"}> ({
  ^bb0(%arg0: memref<5x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>>, %arg1: vector<2x2xi8>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg1, %arg0, %0, %0, %0, %0) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 4, 0>, permutation_map = #map}> : (vector<2x2xi8>, memref<5x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>>, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<6x5x4x3x2xi8, strided<[120, 24, 6, 2, 1], offset: ?>>, vector<1x1x4x3x2xi8>) -> (), sym_name = "transfer_write_dims_mismatch_contiguous_unit_dims"}> ({
  ^bb0(%arg0: memref<6x5x4x3x2xi8, strided<[120, 24, 6, 2, 1], offset: ?>>, %arg1: vector<1x1x4x3x2xi8>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg1, %arg0, %0, %0, %0, %0, %0) <{in_bounds = [false, false, false, false, false], operandSegmentSizes = array<i32: 1, 1, 5, 0>, permutation_map = #map}> : (vector<1x1x4x3x2xi8>, memref<6x5x4x3x2xi8, strided<[120, 24, 6, 2, 1], offset: ?>>, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<5x4x3x2xi8, strided<[48, 6, 2, 1], offset: ?>>, vector<1x1x3x2xi8>) -> (), sym_name = "transfer_write_non_contiguous_unit_dims"}> ({
  ^bb0(%arg0: memref<5x4x3x2xi8, strided<[48, 6, 2, 1], offset: ?>>, %arg1: vector<1x1x3x2xi8>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg1, %arg0, %0, %0, %0, %0) <{in_bounds = [false, false, false, false], operandSegmentSizes = array<i32: 1, 1, 4, 0>, permutation_map = #map}> : (vector<1x1x3x2xi8>, memref<5x4x3x2xi8, strided<[48, 6, 2, 1], offset: ?>>, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, memref<1x43x4x6xi32>, vector<1x2x6xi32>) -> (), sym_name = "transfer_write_dims_mismatch_non_zero_indices"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: memref<1x43x4x6xi32>, %arg3: vector<1x2x6xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    "vector.transfer_write"(%arg3, %arg2, %0, %arg0, %arg1, %0) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 1, 4, 0>, permutation_map = #map}> : (vector<1x2x6xi32>, memref<1x43x4x6xi32>, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x2xf32>, memref<1x3x3x2xf32, strided<[40, 10, 2, 1], offset: ?>>, index, index) -> (), sym_name = "transfer_write_dims_mismatch_non_contiguous_non_zero_indices"}> ({
  ^bb0(%arg0: vector<2x2xf32>, %arg1: memref<1x3x3x2xf32, strided<[40, 10, 2, 1], offset: ?>>, %arg2: index, %arg3: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg0, %arg1, %0, %arg2, %arg3, %0) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 4, 0>, permutation_map = #map}> : (vector<2x2xf32>, memref<1x3x3x2xf32, strided<[40, 10, 2, 1], offset: ?>>, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8x4xi8>, memref<?x?x8x4xi8, strided<[?, 32, 4, 1], offset: ?>>, index, index) -> (), sym_name = "transfer_write_leading_dynamic_dims"}> ({
  ^bb0(%arg0: vector<8x4xi8>, %arg1: memref<?x?x8x4xi8, strided<[?, 32, 4, 1], offset: ?>>, %arg2: index, %arg3: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg0, %arg1, %arg2, %arg3, %0, %0) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 4, 0>, permutation_map = #map}> : (vector<8x4xi8>, memref<?x?x8x4xi8, strided<[?, 32, 4, 1], offset: ?>>, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x?x?x2xi8>, vector<2x2x2xi8>) -> (), sym_name = "negative_transfer_write_dynamic_to_flatten"}> ({
  ^bb0(%arg0: memref<4x?x?x2xi8>, %arg1: vector<2x2x2xi8>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg1, %arg0, %0, %0, %0, %0) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 1, 4, 0>, permutation_map = #map}> : (vector<2x2x2xi8>, memref<4x?x?x2xi8>, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, vector<1x2x6xi32>, memref<1x?x4x6xi32>) -> (), sym_name = "transfer_write_dynamic_dim_to_flatten"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: vector<1x2x6xi32>, %arg3: memref<1x?x4x6xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    "vector.transfer_write"(%arg2, %arg3, %0, %arg0, %arg1, %0) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 1, 4, 0>, permutation_map = #map}> : (vector<1x2x6xi32>, memref<1x?x4x6xi32>, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<5x4x3x2xi8>, vector<2x1x2x2xi8>) -> (), sym_name = "transfer_write_dims_mismatch_non_contiguous_slice"}> ({
  ^bb0(%arg0: memref<5x4x3x2xi8>, %arg1: vector<2x1x2x2xi8>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    "vector.transfer_write"(%arg1, %arg0, %0, %0, %0, %0) <{in_bounds = [false, false, false, false], operandSegmentSizes = array<i32: 1, 1, 4, 0>, permutation_map = #map}> : (vector<2x1x2x2xi8>, memref<5x4x3x2xi8>, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i8>, vector<i8>) -> (), sym_name = "transfer_write_0d"}> ({
  ^bb0(%arg0: memref<i8>, %arg1: vector<i8>):
    "vector.transfer_write"(%arg1, %arg0) <{in_bounds = [], operandSegmentSizes = array<i32: 1, 1, 0, 0>, permutation_map = #map}> : (vector<i8>, memref<i8>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<5x4x3x2xi8, strided<[24, 8, 2, 1], offset: ?>>, vector<5x4x3x2xi8>) -> (), sym_name = "transfer_write_non_contiguous_src"}> ({
  ^bb0(%arg0: memref<5x4x3x2xi8, strided<[24, 8, 2, 1], offset: ?>>, %arg1: vector<5x4x3x2xi8>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg1, %arg0, %0, %0, %0, %0) <{in_bounds = [false, false, false, false], operandSegmentSizes = array<i32: 1, 1, 4, 0>, permutation_map = #map}> : (vector<5x4x3x2xi8>, memref<5x4x3x2xi8, strided<[24, 8, 2, 1], offset: ?>>, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>>) -> vector<5x4x3x2xi8>, sym_name = "negative_out_of_bound_transfer_read"}> ({
  ^bb0(%arg0: memref<?x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %2 = "vector.transfer_read"(%arg0, %0, %0, %0, %0, %1) <{in_bounds = [false, true, true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<?x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>>, index, index, index, index, i8) -> vector<5x4x3x2xi8>
    "func.return"(%2) : (vector<5x4x3x2xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>>, vector<1x1x3x2xi8>) -> (), sym_name = "negative_out_of_bound_transfer_write"}> ({
  ^bb0(%arg0: memref<?x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>>, %arg1: vector<1x1x3x2xi8>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg1, %arg0, %0, %0, %0, %0) <{in_bounds = [false, true, true, true], operandSegmentSizes = array<i32: 1, 1, 4, 0>, permutation_map = #map}> : (vector<1x1x3x2xi8>, memref<?x4x3x2xi8, strided<[24, 6, 2, 1], offset: ?>>, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

