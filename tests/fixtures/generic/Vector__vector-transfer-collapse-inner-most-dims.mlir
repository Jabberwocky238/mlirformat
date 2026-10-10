#map = affine_map<(d0, d1, d2, d3) -> (d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x1x8x1xf32, strided<[3072, 8, 1, 1], offset: ?>>) -> vector<1x8x1xf32>, sym_name = "contiguous_inner_most"}> ({
  ^bb0(%arg3: memref<1x1x8x1xf32, strided<[3072, 8, 1, 1], offset: ?>>):
    %9 = "arith.constant"() <{value = 0 : index}> : () -> index
    %10 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %11 = "vector.transfer_read"(%arg3, %9, %9, %9, %9, %10) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<1x1x8x1xf32, strided<[3072, 8, 1, 1], offset: ?>>, index, index, index, index, f32) -> vector<1x8x1xf32>
    "func.return"(%11) : (vector<1x8x1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x1x8x1xf32, strided<[3072, 8, 1, 1], offset: ?>>) -> vector<1x[8]x1xf32>, sym_name = "contiguous_inner_most_scalable_inner_dim"}> ({
  ^bb0(%arg2: memref<1x1x8x1xf32, strided<[3072, 8, 1, 1], offset: ?>>):
    %6 = "arith.constant"() <{value = 0 : index}> : () -> index
    %7 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %8 = "vector.transfer_read"(%arg2, %6, %6, %6, %6, %7) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<1x1x8x1xf32, strided<[3072, 8, 1, 1], offset: ?>>, index, index, index, index, f32) -> vector<1x[8]x1xf32>
    "func.return"(%8) : (vector<1x[8]x1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x1x8x?xf32, strided<[3072, 8, 1, 1], offset: ?>>) -> vector<1x8x1xf32>, sym_name = "negative_dynamic_trailing_dim"}> ({
  ^bb0(%arg1: memref<1x1x8x?xf32, strided<[3072, 8, 1, 1], offset: ?>>):
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %5 = "vector.transfer_read"(%arg1, %3, %3, %3, %3, %4) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<1x1x8x?xf32, strided<[3072, 8, 1, 1], offset: ?>>, index, index, index, index, f32) -> vector<1x8x1xf32>
    "func.return"(%5) : (vector<1x8x1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x1x8x1xf32, strided<[3072, 8, 1, 1], offset: ?>>) -> vector<1x8x[1]xf32>, sym_name = "negative_scalable_one_trailing_dim"}> ({
  ^bb0(%arg0: memref<1x1x8x1xf32, strided<[3072, 8, 1, 1], offset: ?>>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "vector.transfer_read"(%arg0, %0, %0, %0, %0, %1) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<1x1x8x1xf32, strided<[3072, 8, 1, 1], offset: ?>>, index, index, index, index, f32) -> vector<1x8x[1]xf32>
    "func.return"(%2) : (vector<1x8x[1]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, memref<?x?x8x1xf32>) -> vector<8x1xf32>, sym_name = "contiguous_inner_most_dynamic_outer"}> ({
  ^bb0(%arg3: index, %arg4: index, %arg5: memref<?x?x8x1xf32>):
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %5 = "vector.transfer_read"(%arg5, %arg3, %arg4, %3, %3, %4) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<?x?x8x1xf32>, index, index, index, index, f32) -> vector<8x1xf32>
    "func.return"(%5) : (vector<8x1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, memref<?x?x8x1xf32>) -> vector<[8]x1xf32>, sym_name = "contiguous_inner_most_outer_dim_dyn_scalable_inner_dim"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: memref<?x?x8x1xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "vector.transfer_read"(%arg2, %arg0, %arg1, %0, %0, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<?x?x8x1xf32>, index, index, index, index, f32) -> vector<[8]x1xf32>
    "func.return"(%2) : (vector<[8]x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<16x1xf32>, index) -> vector<8x1xf32>, sym_name = "contiguous_inner_most_zero_idx_in_bounds"}> ({
  ^bb0(%arg8: memref<16x1xf32>, %arg9: index):
    %9 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %10 = "arith.constant"() <{value = 0 : index}> : () -> index
    %11 = "vector.transfer_read"(%arg8, %arg9, %10, %9) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<16x1xf32>, index, index, f32) -> vector<8x1xf32>
    "func.return"(%11) : (vector<8x1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16x1xf32>, index) -> vector<8x1xf32>, sym_name = "contiguous_inner_most_zero_idx_out_of_bounds"}> ({
  ^bb0(%arg6: memref<16x1xf32>, %arg7: index):
    %6 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %7 = "arith.constant"() <{value = 0 : index}> : () -> index
    %8 = "vector.transfer_read"(%arg6, %arg7, %7, %6) <{in_bounds = [true, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<16x1xf32>, index, index, f32) -> vector<8x1xf32>
    "func.return"(%8) : (vector<8x1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16x1xf32>, index) -> vector<8x1xf32>, sym_name = "contiguous_inner_most_non_zero_idx_in_bounds"}> ({
  ^bb0(%arg4: memref<16x1xf32>, %arg5: index):
    %4 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %5 = "vector.transfer_read"(%arg4, %arg5, %arg5, %4) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<16x1xf32>, index, index, f32) -> vector<8x1xf32>
    "func.return"(%5) : (vector<8x1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16x1xf32>, index) -> vector<[8]x1xf32>, sym_name = "contiguous_inner_most_non_zero_idx_in_bounds_scalable"}> ({
  ^bb0(%arg2: memref<16x1xf32>, %arg3: index):
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3 = "vector.transfer_read"(%arg2, %arg3, %arg3, %2) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<16x1xf32>, index, index, f32) -> vector<[8]x1xf32>
    "func.return"(%3) : (vector<[8]x1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16x1xf32>, index) -> vector<8x1xf32>, sym_name = "negative_contiguous_inner_most_non_zero_idx_out_of_bounds"}> ({
  ^bb0(%arg0: memref<16x1xf32>, %arg1: index):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "vector.transfer_read"(%arg0, %arg1, %arg1, %0) <{in_bounds = [true, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<16x1xf32>, index, index, f32) -> vector<8x1xf32>
    "func.return"(%1) : (vector<8x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1000x1xf32>, index, index) -> vector<4x1xf32>, sym_name = "contiguous_inner_most_dim_with_subview"}> ({
  ^bb0(%arg3: memref<1000x1xf32>, %arg4: index, %arg5: index):
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %6 = "memref.subview"(%arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: 40, 1>, static_strides = array<i64: 1, 1>}> : (memref<1000x1xf32>, index) -> memref<40x1xf32, strided<[1, 1], offset: ?>>
    %7 = "vector.transfer_read"(%6, %arg5, %4, %5) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<40x1xf32, strided<[1, 1], offset: ?>>, index, index, f32) -> vector<4x1xf32>
    "func.return"(%7) : (vector<4x1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1000x1xf32>, index, index) -> vector<[4]x1xf32>, sym_name = "contiguous_inner_most_dim_with_subview_scalable_inner_dim"}> ({
  ^bb0(%arg0: memref<1000x1xf32>, %arg1: index, %arg2: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "memref.subview"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: 40, 1>, static_strides = array<i64: 1, 1>}> : (memref<1000x1xf32>, index) -> memref<40x1xf32, strided<[1, 1], offset: ?>>
    %3 = "vector.transfer_read"(%2, %arg2, %0, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<40x1xf32, strided<[1, 1], offset: ?>>, index, index, f32) -> vector<[4]x1xf32>
    "func.return"(%3) : (vector<[4]x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1000x1x1xf32>, index, index) -> vector<4x1x1xf32>, sym_name = "contiguous_inner_most_dim_with_subview_2d"}> ({
  ^bb0(%arg3: memref<1000x1x1xf32>, %arg4: index, %arg5: index):
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %6 = "memref.subview"(%arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0, 0>, static_sizes = array<i64: 40, 1, 1>, static_strides = array<i64: 1, 1, 1>}> : (memref<1000x1x1xf32>, index) -> memref<40x1x1xf32, strided<[1, 1, 1], offset: ?>>
    %7 = "vector.transfer_read"(%6, %arg5, %4, %4, %5) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 3, 1, 0>, permutation_map = #map}> : (memref<40x1x1xf32, strided<[1, 1, 1], offset: ?>>, index, index, index, f32) -> vector<4x1x1xf32>
    "func.return"(%7) : (vector<4x1x1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1000x1x1xf32>, index, index) -> vector<[4]x1x1xf32>, sym_name = "contiguous_inner_most_dim_with_subview_2d_scalable_inner_dim"}> ({
  ^bb0(%arg0: memref<1000x1x1xf32>, %arg1: index, %arg2: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "memref.subview"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0, 0>, static_sizes = array<i64: 40, 1, 1>, static_strides = array<i64: 1, 1, 1>}> : (memref<1000x1x1xf32>, index) -> memref<40x1x1xf32, strided<[1, 1, 1], offset: ?>>
    %3 = "vector.transfer_read"(%2, %arg2, %0, %0, %1) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 3, 1, 0>, permutation_map = #map}> : (memref<40x1x1xf32, strided<[1, 1, 1], offset: ?>>, index, index, index, f32) -> vector<[4]x1x1xf32>
    "func.return"(%3) : (vector<[4]x1x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x1xf32>) -> vector<4x8xf32>, sym_name = "negative_non_unit_inner_vec_dim"}> ({
  ^bb0(%arg0: memref<4x1xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "vector.transfer_read"(%arg0, %0, %0, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x1xf32>, index, index, f32) -> vector<4x8xf32>
    "func.return"(%2) : (vector<4x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x8xf32>) -> vector<4x1xf32>, sym_name = "negative_non_unit_inner_memref_dim"}> ({
  ^bb0(%arg0: memref<4x8xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "vector.transfer_read"(%arg0, %0, %0, %1) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x8xf32>, index, index, f32) -> vector<4x1xf32>
    "func.return"(%2) : (vector<4x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<512x16x1xf32, strided<[8192, 16, 4], offset: ?>>, index) -> vector<16x16x1xf32>, sym_name = "negative_non_unit_strides"}> ({
  ^bb0(%arg0: memref<512x16x1xf32, strided<[8192, 16, 4], offset: ?>>, %arg1: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "vector.transfer_read"(%arg0, %arg1, %0, %0, %1) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 3, 1, 0>, permutation_map = #map}> : (memref<512x16x1xf32, strided<[8192, 16, 4], offset: ?>>, index, index, index, f32) -> vector<16x16x1xf32>
    "func.return"(%2) : (vector<16x16x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x512x16x1x1xf32>, vector<1x16x16x1x1xf32>, index) -> (), sym_name = "contiguous_inner_most"}> ({
  ^bb0(%arg9: memref<1x512x16x1x1xf32>, %arg10: vector<1x16x16x1x1xf32>, %arg11: index):
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg10, %arg9, %3, %arg11, %3, %3, %3) <{in_bounds = [true, true, true, true, true], operandSegmentSizes = array<i32: 1, 1, 5, 0>, permutation_map = #map}> : (vector<1x16x16x1x1xf32>, memref<1x512x16x1x1xf32>, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x512x16x1x1xf32>, vector<1x16x[16]x1x1xf32>, index) -> (), sym_name = "contiguous_inner_most_scalable_inner_dim"}> ({
  ^bb0(%arg6: memref<1x512x16x1x1xf32>, %arg7: vector<1x16x[16]x1x1xf32>, %arg8: index):
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg7, %arg6, %2, %arg8, %2, %2, %2) <{in_bounds = [true, true, true, true, true], operandSegmentSizes = array<i32: 1, 1, 5, 0>, permutation_map = #map}> : (vector<1x16x[16]x1x1xf32>, memref<1x512x16x1x1xf32>, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x512x16x1x?xf32>, vector<1x16x16x1x1xf32>, index) -> (), sym_name = "negative_dynamic_trailing_dim"}> ({
  ^bb0(%arg3: memref<1x512x16x1x?xf32>, %arg4: vector<1x16x16x1x1xf32>, %arg5: index):
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg4, %arg3, %1, %arg5, %1, %1, %1) <{in_bounds = [true, true, true, true, true], operandSegmentSizes = array<i32: 1, 1, 5, 0>, permutation_map = #map}> : (vector<1x16x16x1x1xf32>, memref<1x512x16x1x?xf32>, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x512x16x1x1xf32>, vector<1x16x16x1x[1]xf32>, index) -> (), sym_name = "negative_scalable_one_trailing_dim"}> ({
  ^bb0(%arg0: memref<1x512x16x1x1xf32>, %arg1: vector<1x16x16x1x[1]xf32>, %arg2: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg1, %arg0, %0, %arg2, %0, %0, %0) <{in_bounds = [true, true, true, true, true], operandSegmentSizes = array<i32: 1, 1, 5, 0>, permutation_map = #map}> : (vector<1x16x16x1x[1]xf32>, memref<1x512x16x1x1xf32>, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, memref<?x?x16x1xf32>, vector<8x1xf32>) -> (), sym_name = "contiguous_inner_most_dynamic_outer"}> ({
  ^bb0(%arg4: index, %arg5: index, %arg6: memref<?x?x16x1xf32>, %arg7: vector<8x1xf32>):
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg7, %arg6, %arg4, %arg5, %1, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 4, 0>, permutation_map = #map}> : (vector<8x1xf32>, memref<?x?x16x1xf32>, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, memref<?x?x16x1xf32>, vector<[8]x1xf32>) -> (), sym_name = "contiguous_inner_most_dynamic_outer_scalable_inner_dim"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: memref<?x?x16x1xf32>, %arg3: vector<[8]x1xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg3, %arg2, %arg0, %arg1, %0, %0) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 4, 0>, permutation_map = #map}> : (vector<[8]x1xf32>, memref<?x?x16x1xf32>, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<16x1xf32>, vector<8x1xf32>, index) -> (), sym_name = "contiguous_inner_most_zero_idx_in_bounds"}> ({
  ^bb0(%arg12: memref<16x1xf32>, %arg13: vector<8x1xf32>, %arg14: index):
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg13, %arg12, %arg14, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<8x1xf32>, memref<16x1xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16x1xf32>, vector<8x1xf32>, index) -> (), sym_name = "contiguous_inner_most_zero_idx_out_of_bounds"}> ({
  ^bb0(%arg9: memref<16x1xf32>, %arg10: vector<8x1xf32>, %arg11: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg10, %arg9, %arg11, %0) <{in_bounds = [true, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<8x1xf32>, memref<16x1xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16x1xf32>, vector<8x1xf32>, index) -> (), sym_name = "contiguous_inner_most_dim_non_zero_idx_in_bounds"}> ({
  ^bb0(%arg6: memref<16x1xf32>, %arg7: vector<8x1xf32>, %arg8: index):
    "vector.transfer_write"(%arg7, %arg6, %arg8, %arg8) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<8x1xf32>, memref<16x1xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16x1xf32>, vector<[8]x1xf32>, index) -> (), sym_name = "contiguous_inner_most_non_zero_idx_in_bounds_scalable"}> ({
  ^bb0(%arg3: memref<16x1xf32>, %arg4: vector<[8]x1xf32>, %arg5: index):
    "vector.transfer_write"(%arg4, %arg3, %arg5, %arg5) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<[8]x1xf32>, memref<16x1xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16x1xf32>, vector<8x1xf32>, index) -> (), sym_name = "negative_contiguous_inner_most_dim_non_zero_idx_out_of_bounds"}> ({
  ^bb0(%arg0: memref<16x1xf32>, %arg1: vector<8x1xf32>, %arg2: index):
    "vector.transfer_write"(%arg1, %arg0, %arg2, %arg2) <{in_bounds = [true, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<8x1xf32>, memref<16x1xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1000x1xf32>, index, index, vector<4x1xf32>) -> (), sym_name = "contiguous_inner_most_dim_with_subview"}> ({
  ^bb0(%arg4: memref<1000x1xf32>, %arg5: index, %arg6: index, %arg7: vector<4x1xf32>):
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %5 = "memref.subview"(%arg4, %arg5) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: 40, 1>, static_strides = array<i64: 1, 1>}> : (memref<1000x1xf32>, index) -> memref<40x1xf32, strided<[1, 1], offset: ?>>
    "vector.transfer_write"(%arg7, %5, %arg6, %3) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<4x1xf32>, memref<40x1xf32, strided<[1, 1], offset: ?>>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1000x1xf32>, index, index, vector<[4]x1xf32>) -> (), sym_name = "contiguous_inner_most_dim_with_subview_scalable_inner_dim"}> ({
  ^bb0(%arg0: memref<1000x1xf32>, %arg1: index, %arg2: index, %arg3: vector<[4]x1xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "memref.subview"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: 40, 1>, static_strides = array<i64: 1, 1>}> : (memref<1000x1xf32>, index) -> memref<40x1xf32, strided<[1, 1], offset: ?>>
    "vector.transfer_write"(%arg3, %2, %arg2, %0) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<[4]x1xf32>, memref<40x1xf32, strided<[1, 1], offset: ?>>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1000x1x1xf32>, index, index, vector<4x1x1xf32>) -> (), sym_name = "contiguous_inner_most_dim_with_subview_2d"}> ({
  ^bb0(%arg4: memref<1000x1x1xf32>, %arg5: index, %arg6: index, %arg7: vector<4x1x1xf32>):
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %5 = "memref.subview"(%arg4, %arg5) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0, 0>, static_sizes = array<i64: 40, 1, 1>, static_strides = array<i64: 1, 1, 1>}> : (memref<1000x1x1xf32>, index) -> memref<40x1x1xf32, strided<[1, 1, 1], offset: ?>>
    "vector.transfer_write"(%arg7, %5, %arg6, %3, %3) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 1, 3, 0>, permutation_map = #map}> : (vector<4x1x1xf32>, memref<40x1x1xf32, strided<[1, 1, 1], offset: ?>>, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1000x1x1xf32>, index, index, vector<[4]x1x1xf32>) -> (), sym_name = "contiguous_inner_most_dim_with_subview_2d_scalable"}> ({
  ^bb0(%arg0: memref<1000x1x1xf32>, %arg1: index, %arg2: index, %arg3: vector<[4]x1x1xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "memref.subview"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0, 0>, static_sizes = array<i64: 40, 1, 1>, static_strides = array<i64: 1, 1, 1>}> : (memref<1000x1x1xf32>, index) -> memref<40x1x1xf32, strided<[1, 1, 1], offset: ?>>
    "vector.transfer_write"(%arg3, %2, %arg2, %0, %0) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 1, 3, 0>, permutation_map = #map}> : (vector<[4]x1x1xf32>, memref<40x1x1xf32, strided<[1, 1, 1], offset: ?>>, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x1xf32>, vector<4x8xf32>) -> (), sym_name = "negative_non_unit_inner_vec_dim"}> ({
  ^bb0(%arg0: memref<4x1xf32>, %arg1: vector<4x8xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg1, %arg0, %0, %0) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<4x8xf32>, memref<4x1xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x8xf32>, vector<4x1xf32>) -> (), sym_name = "negative_non_unit_inner_memref_dim"}> ({
  ^bb0(%arg0: memref<4x8xf32>, %arg1: vector<4x1xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg1, %arg0, %0, %0) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<4x1xf32>, memref<4x8xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<512x16x1xf32, strided<[8192, 16, 4], offset: ?>>, vector<16x16x1xf32>, index) -> (), sym_name = "negative_non_unit_strides"}> ({
  ^bb0(%arg0: memref<512x16x1xf32, strided<[8192, 16, 4], offset: ?>>, %arg1: vector<16x16x1xf32>, %arg2: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg1, %arg0, %arg2, %0, %0) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 1, 3, 0>, permutation_map = #map}> : (vector<16x16x1xf32>, memref<512x16x1xf32, strided<[8192, 16, 4], offset: ?>>, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

