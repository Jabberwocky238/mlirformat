#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x16x8xf32>, vector<1x8x16xf32>, vector<1x16x16xf32>) -> vector<1x16x16xf32>, sym_name = "cast_away_contraction_leading_one_dims"}> ({
  ^bb0(%arg0: vector<1x16x8xf32>, %arg1: vector<1x8x16xf32>, %arg2: vector<1x16x16xf32>):
    %0 = "vector.contract"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<1x16x8xf32>, vector<1x8x16xf32>, vector<1x16x16xf32>) -> vector<1x16x16xf32>
    "func.return"(%0) : (vector<1x16x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x16x8xf32>, vector<1x8x16xf32>, vector<1x16x16xf32>) -> vector<1x16x16xf32>, sym_name = "cast_away_contraction_leading_one_dim_under_const_mask"}> ({
  ^bb0(%arg0: vector<1x16x8xf32>, %arg1: vector<1x8x16xf32>, %arg2: vector<1x16x16xf32>):
    %0 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 1, 15, 15, 8>}> : () -> vector<1x16x16x8xi1>
    %1 = "vector.mask"(%0) ({
      %2 = "vector.contract"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<1x16x8xf32>, vector<1x8x16xf32>, vector<1x16x16xf32>) -> vector<1x16x16xf32>
      "vector.yield"(%2) : (vector<1x16x16xf32>) -> ()
    }) : (vector<1x16x16x8xi1>) -> vector<1x16x16xf32>
    "func.return"(%1) : (vector<1x16x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x16x8xf32>, vector<1x8x16xf32>, vector<1x16x16xf32>, vector<1x16x16x8xi1>) -> vector<1x16x16xf32>, sym_name = "cast_away_contraction_leading_one_dim_under_mask"}> ({
  ^bb0(%arg0: vector<1x16x8xf32>, %arg1: vector<1x8x16xf32>, %arg2: vector<1x16x16xf32>, %arg3: vector<1x16x16x8xi1>):
    %0 = "vector.mask"(%arg3) ({
      %1 = "vector.contract"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<1x16x8xf32>, vector<1x8x16xf32>, vector<1x16x16xf32>) -> vector<1x16x16xf32>
      "vector.yield"(%1) : (vector<1x16x16xf32>) -> ()
    }) : (vector<1x16x16x8xi1>) -> vector<1x16x16xf32>
    "func.return"(%0) : (vector<1x16x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d1, d0, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x1x8xf32>, vector<1x8x16xf32>, vector<1x1x16xf32>) -> vector<1x1x16xf32>, sym_name = "cast_away_contraction_leading_one_dims_transposeneeded"}> ({
  ^bb0(%arg0: vector<1x1x8xf32>, %arg1: vector<1x8x16xf32>, %arg2: vector<1x1x16xf32>):
    %0 = "vector.contract"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<mul>}> : (vector<1x1x8xf32>, vector<1x8x16xf32>, vector<1x1x16xf32>) -> vector<1x1x16xf32>
    "func.return"(%0) : (vector<1x1x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d3, d0, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d1, d3, d0)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8x1x16xf32>, vector<2x8x1xf32>, vector<1x2x16xf32>) -> vector<1x2x16xf32>, sym_name = "cast_away_contraction_leading_one_dims_transposeneeded2"}> ({
  ^bb0(%arg0: vector<8x1x16xf32>, %arg1: vector<2x8x1xf32>, %arg2: vector<1x2x16xf32>):
    %0 = "vector.contract"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<8x1x16xf32>, vector<2x8x1xf32>, vector<1x2x16xf32>) -> vector<1x2x16xf32>
    "func.return"(%0) : (vector<1x2x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d4, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d2, d4, d1)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x8x1x16xf32>, vector<1x2x8x1xf32>, vector<1x1x2x16xf32>) -> vector<1x1x2x16xf32>, sym_name = "cast_away_contraction_leading_one_dims_nonleadingunitdim_rank4"}> ({
  ^bb0(%arg0: vector<1x8x1x16xf32>, %arg1: vector<1x2x8x1xf32>, %arg2: vector<1x1x2x16xf32>):
    %0 = "vector.contract"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<1x8x1x16xf32>, vector<1x2x8x1xf32>, vector<1x1x2x16xf32>) -> vector<1x1x2x16xf32>
    "func.return"(%0) : (vector<1x1x2x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d4, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d2, d4, d1)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d1, d0, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x8x1x16xf32>, vector<1x2x8x1xf32>, vector<1x1x2x16xf32>) -> vector<1x1x2x16xf32>, sym_name = "cast_away_contraction_leading_one_dims_nonleadingunitdim_rank4_acctranspose"}> ({
  ^bb0(%arg0: vector<1x8x1x16xf32>, %arg1: vector<1x2x8x1xf32>, %arg2: vector<1x1x2x16xf32>):
    %0 = "vector.contract"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<1x8x1x16xf32>, vector<1x2x8x1xf32>, vector<1x1x2x16xf32>) -> vector<1x1x2x16xf32>
    "func.return"(%0) : (vector<1x1x2x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x1x8xi32>, vector<1x8x8xi32>, vector<1x8xi32>) -> vector<1x8xi32>, sym_name = "cast_away_contraction_does_not_transpose_leading_unit_dims"}> ({
  ^bb0(%arg0: vector<1x1x8xi32>, %arg1: vector<1x8x8xi32>, %arg2: vector<1x8xi32>):
    %0 = "vector.contract"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<1x1x8xi32>, vector<1x8x8xi32>, vector<1x8xi32>) -> vector<1x8xi32>
    "func.return"(%0) : (vector<1x8xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x8x8xf16>) -> vector<1x1x8xf16>, sym_name = "cast_away_extract_strided_slice_leading_one_dims"}> ({
  ^bb0(%arg13: vector<1x8x8xf16>):
    %14 = "vector.extract_strided_slice"(%arg13) <{offsets = [0, 4], sizes = [1, 1], strides = [1, 1]}> : (vector<1x8x8xf16>) -> vector<1x1x8xf16>
    "func.return"(%14) : (vector<1x1x8xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1x8x[8]xf16>) -> vector<1x1x[8]xf16>, sym_name = "cast_away_extract_strided_slice_leading_one_dims_scalable"}> ({
  ^bb0(%arg12: vector<1x8x[8]xf16>):
    %13 = "vector.extract_strided_slice"(%arg12) <{offsets = [0, 4], sizes = [1, 1], strides = [1, 1]}> : (vector<1x8x[8]xf16>) -> vector<1x1x[8]xf16>
    "func.return"(%13) : (vector<1x1x[8]xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1x8xf16>, vector<1x8x8xf16>) -> vector<1x8x8xf16>, sym_name = "cast_away_insert_strided_slice_leading_one_dims"}> ({
  ^bb0(%arg10: vector<1x8xf16>, %arg11: vector<1x8x8xf16>):
    %12 = "vector.insert_strided_slice"(%arg10, %arg11) <{offsets = [0, 0, 0], strides = [1, 1]}> : (vector<1x8xf16>, vector<1x8x8xf16>) -> vector<1x8x8xf16>
    "func.return"(%12) : (vector<1x8x8xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1x[8]xf16>, vector<1x8x[8]xf16>) -> vector<1x8x[8]xf16>, sym_name = "cast_away_insert_strided_slice_leading_one_dims_scalable"}> ({
  ^bb0(%arg8: vector<1x[8]xf16>, %arg9: vector<1x8x[8]xf16>):
    %11 = "vector.insert_strided_slice"(%arg8, %arg9) <{offsets = [0, 0, 0], strides = [1, 1]}> : (vector<1x[8]xf16>, vector<1x8x[8]xf16>) -> vector<1x8x[8]xf16>
    "func.return"(%11) : (vector<1x8x[8]xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1x1xf16>, vector<1x1x1xf16>) -> vector<1x1x1xf16>, sym_name = "cast_away_insert_strided_slice_leading_one_dims_one_element"}> ({
  ^bb0(%arg6: vector<1x1xf16>, %arg7: vector<1x1x1xf16>):
    %10 = "vector.insert_strided_slice"(%arg6, %arg7) <{offsets = [0, 0, 0], strides = [1, 1]}> : (vector<1x1xf16>, vector<1x1x1xf16>) -> vector<1x1x1xf16>
    "func.return"(%10) : (vector<1x1x1xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1x[1]xf16>, vector<1x1x[1]xf16>) -> vector<1x1x[1]xf16>, sym_name = "cast_away_insert_strided_slice_leading_one_dims_one_element_scalable"}> ({
  ^bb0(%arg4: vector<1x[1]xf16>, %arg5: vector<1x1x[1]xf16>):
    %9 = "vector.insert_strided_slice"(%arg4, %arg5) <{offsets = [0, 0, 0], strides = [1, 1]}> : (vector<1x[1]xf16>, vector<1x1x[1]xf16>) -> vector<1x1x[1]xf16>
    "func.return"(%9) : (vector<1x1x[1]xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x4x8x16xf16>) -> vector<1x4xf16>, sym_name = "cast_away_transfer_read_leading_one_dims"}> ({
  ^bb0(%arg3: memref<1x4x8x16xf16>):
    %6 = "arith.constant"() <{value = 0 : index}> : () -> index
    %7 = "arith.constant"() <{value = 0.000000e+00 : f16}> : () -> f16
    %8 = "vector.transfer_read"(%arg3, %6, %6, %6, %6, %7) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<1x4x8x16xf16>, index, index, index, index, f16) -> vector<1x4xf16>
    "func.return"(%8) : (vector<1x4xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x4x8x16xf16>, vector<1x4xi1>) -> vector<1x4xf16>, sym_name = "cast_away_masked_transfer_read_leading_one_dims"}> ({
  ^bb0(%arg1: memref<1x4x8x16xf16>, %arg2: vector<1x4xi1>):
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 0.000000e+00 : f16}> : () -> f16
    %5 = "vector.transfer_read"(%arg1, %3, %3, %3, %3, %4, %arg2) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 4, 1, 1>, permutation_map = #map}> : (memref<1x4x8x16xf16>, index, index, index, index, f16, vector<1x4xi1>) -> vector<1x4xf16>
    "func.return"(%5) : (vector<1x4xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x1x1x1xf16>) -> vector<1x1xf16>, sym_name = "cast_away_transfer_read_leading_one_dims_one_element"}> ({
  ^bb0(%arg0: memref<1x1x1x1xf16>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f16}> : () -> f16
    %2 = "vector.transfer_read"(%arg0, %0, %0, %0, %0, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<1x1x1x1xf16>, index, index, index, index, f16) -> vector<1x1xf16>
    "func.return"(%2) : (vector<1x1xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x4x8xf16>, vector<1x4x1xi1>) -> vector<1x1x4xf16>, sym_name = "cast_away_nontrivial_map_masked_transfer_read"}> ({
  ^bb0(%arg0: memref<1x4x8xf16>, %arg1: vector<1x4x1xi1>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f16}> : () -> f16
    %2 = "vector.transfer_read"(%arg0, %0, %0, %0, %1, %arg1) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 3, 1, 1>, permutation_map = #map}> : (memref<1x4x8xf16>, index, index, index, f16, vector<1x4x1xi1>) -> vector<1x1x4xf16>
    "func.return"(%2) : (vector<1x1x4xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x1x4xf16>) -> vector<1x4xf16>, sym_name = "not_insert_cast_fo4_transfer_read_under_mask"}> ({
  ^bb0(%arg0: memref<1x1x4xf16>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f16}> : () -> f16
    %2 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 1, 3>}> : () -> vector<1x4xi1>
    %3 = "vector.mask"(%2) ({
      %4 = "vector.transfer_read"(%arg0, %0, %0, %0, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 3, 1, 0>, permutation_map = #map}> : (memref<1x1x4xf16>, index, index, index, f16) -> vector<1x4xf16>
      "vector.yield"(%4) : (vector<1x4xf16>) -> ()
    }) : (vector<1x4xi1>) -> vector<1x4xf16>
    "func.return"(%3) : (vector<1x4xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x4x8x16xf16>, vector<1x4xf16>) -> (), sym_name = "cast_away_transfer_write_leading_one_dims"}> ({
  ^bb0(%arg5: memref<1x4x8x16xf16>, %arg6: vector<1x4xf16>):
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg6, %arg5, %2, %2, %2, %2) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 4, 0>, permutation_map = #map}> : (vector<1x4xf16>, memref<1x4x8x16xf16>, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x4x8x16xf16>, vector<1x4xf16>, vector<1x4xi1>) -> (), sym_name = "cast_away_masked_transfer_write_leading_one_dims"}> ({
  ^bb0(%arg2: memref<1x4x8x16xf16>, %arg3: vector<1x4xf16>, %arg4: vector<1x4xi1>):
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg3, %arg2, %1, %1, %1, %1, %arg4) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 4, 1>, permutation_map = #map}> : (vector<1x4xf16>, memref<1x4x8x16xf16>, index, index, index, index, vector<1x4xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x1x1x1xf16>, vector<1x1xf16>) -> (), sym_name = "cast_away_transfer_write_leading_one_dims_one_element"}> ({
  ^bb0(%arg0: memref<1x1x1x1xf16>, %arg1: vector<1x1xf16>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg1, %arg0, %0, %0, %0, %0) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 4, 0>, permutation_map = #map}> : (vector<1x1xf16>, memref<1x1x1x1xf16>, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x1x4xf16>, vector<1x4xf16>) -> (), sym_name = "not_insert_cast_for_transfer_write_under_mask"}> ({
  ^bb0(%arg0: memref<1x1x4xf16>, %arg1: vector<1x4xf16>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 1, 3>}> : () -> vector<1x4xi1>
    "vector.mask"(%1) ({
      "vector.transfer_write"(%arg1, %arg0, %0, %0, %0) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 3, 0>, permutation_map = #map}> : (vector<1x4xf16>, memref<1x1x4xf16>, index, index, index) -> ()
      "vector.yield"() : () -> ()
    }) : (vector<1x4xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x4x8xf16>, vector<1x1x4xf16>, vector<1x4x1xi1>) -> (), sym_name = "cast_away_nontrivial_map_masked_transfer_write"}> ({
  ^bb0(%arg0: memref<1x4x8xf16>, %arg1: vector<1x1x4xf16>, %arg2: vector<1x4x1xi1>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.transfer_write"(%arg1, %arg0, %0, %0, %0, %arg2) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 1, 3, 1>, permutation_map = #map}> : (vector<1x1x4xf16>, memref<1x4x8xf16>, index, index, index, vector<1x4x1xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x1x8xf32>, f32, vector<1x4xf32>, vector<1x4xf32>, i1) -> (vector<1x1x8xf32>, vector<1x4xi1>, vector<1x4xf32>, vector<1x4xf32>), sym_name = "cast_away_elementwise_leading_one_dims"}> ({
  ^bb0(%arg0: vector<1x1x8xf32>, %arg1: f32, %arg2: vector<1x4xf32>, %arg3: vector<1x4xf32>, %arg4: i1):
    %0 = "arith.addf"(%arg0, %arg0) <{fastmath = #arith.fastmath<none>}> : (vector<1x1x8xf32>, vector<1x1x8xf32>) -> vector<1x1x8xf32>
    %1 = "arith.cmpf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>, predicate = 2 : i64}> : (vector<1x4xf32>, vector<1x4xf32>) -> vector<1x4xi1>
    %2 = "arith.select"(%1, %arg3, %arg2) : (vector<1x4xi1>, vector<1x4xf32>, vector<1x4xf32>) -> vector<1x4xf32>
    %3 = "arith.select"(%arg4, %arg3, %arg2) : (i1, vector<1x4xf32>, vector<1x4xf32>) -> vector<1x4xf32>
    "func.return"(%0, %1, %2, %3) : (vector<1x1x8xf32>, vector<1x4xi1>, vector<1x4xf32>, vector<1x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, vector<1x1x4xf32>) -> vector<1x1x4xf32>, sym_name = "cast_away_insert_leading_one_dims_scalar"}> ({
  ^bb0(%arg0: f32, %arg1: vector<1x1x4xf32>):
    %0 = "vector.insert"(%arg0, %arg1) <{static_position = array<i64: 0, 0, 0>}> : (f32, vector<1x1x4xf32>) -> vector<1x1x4xf32>
    "func.return"(%0) : (vector<1x1x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, vector<1x1x[4]xf32>) -> vector<1x1x[4]xf32>, sym_name = "cast_away_insert_leading_one_dims_scalar_scalable"}> ({
  ^bb0(%arg0: f32, %arg1: vector<1x1x[4]xf32>):
    %0 = "vector.insert"(%arg0, %arg1) <{static_position = array<i64: 0, 0, 0>}> : (f32, vector<1x1x[4]xf32>) -> vector<1x1x[4]xf32>
    "func.return"(%0) : (vector<1x1x[4]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, vector<1x[1]x4xf32>) -> vector<1x[1]x4xf32>, sym_name = "cast_away_insert_leading_one_dims_scalar_skip_scalable_dim"}> ({
  ^bb0(%arg0: f32, %arg1: vector<1x[1]x4xf32>):
    %0 = "vector.insert"(%arg0, %arg1) <{static_position = array<i64: 0, 0, 0>}> : (f32, vector<1x[1]x4xf32>) -> vector<1x[1]x4xf32>
    "func.return"(%0) : (vector<1x[1]x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf32>, vector<1x1x4xf32>) -> vector<1x1x4xf32>, sym_name = "cast_away_insert_leading_one_dims_rank1"}> ({
  ^bb0(%arg0: vector<4xf32>, %arg1: vector<1x1x4xf32>):
    %0 = "vector.insert"(%arg0, %arg1) <{static_position = array<i64: 0, 0>}> : (vector<4xf32>, vector<1x1x4xf32>) -> vector<1x1x4xf32>
    "func.return"(%0) : (vector<1x1x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]xf32>, vector<1x1x[4]xf32>) -> vector<1x1x[4]xf32>, sym_name = "cast_away_insert_leading_one_dims_rank1_scalable"}> ({
  ^bb0(%arg0: vector<[4]xf32>, %arg1: vector<1x1x[4]xf32>):
    %0 = "vector.insert"(%arg0, %arg1) <{static_position = array<i64: 0, 0>}> : (vector<[4]xf32>, vector<1x1x[4]xf32>) -> vector<1x1x[4]xf32>
    "func.return"(%0) : (vector<1x1x[4]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x4xf32>, vector<1x1x4xf32>) -> vector<1x1x4xf32>, sym_name = "cast_away_insert_leading_one_dims_rank2"}> ({
  ^bb0(%arg0: vector<1x4xf32>, %arg1: vector<1x1x4xf32>):
    %0 = "vector.insert"(%arg0, %arg1) <{static_position = array<i64: 0>}> : (vector<1x4xf32>, vector<1x1x4xf32>) -> vector<1x1x4xf32>
    "func.return"(%0) : (vector<1x1x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x[4]xf32>, vector<1x1x[4]xf32>) -> vector<1x1x[4]xf32>, sym_name = "cast_away_insert_leading_one_dims_rank2_scalable"}> ({
  ^bb0(%arg0: vector<1x[4]xf32>, %arg1: vector<1x1x[4]xf32>):
    %0 = "vector.insert"(%arg0, %arg1) <{static_position = array<i64: 0>}> : (vector<1x[4]xf32>, vector<1x1x[4]xf32>) -> vector<1x1x[4]xf32>
    "func.return"(%0) : (vector<1x1x[4]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x4xf32>, vector<1x2x1x4xf32>) -> vector<1x2x1x4xf32>, sym_name = "cast_away_insert_leading_one_dims_rank2_one_dest"}> ({
  ^bb0(%arg0: vector<1x4xf32>, %arg1: vector<1x2x1x4xf32>):
    %0 = "vector.insert"(%arg0, %arg1) <{static_position = array<i64: 0, 1>}> : (vector<1x4xf32>, vector<1x2x1x4xf32>) -> vector<1x2x1x4xf32>
    "func.return"(%0) : (vector<1x2x1x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x[4]xf32>, vector<1x2x1x[4]xf32>) -> vector<1x2x1x[4]xf32>, sym_name = "cast_away_insert_leading_one_dims_rank2_one_dest_scalable"}> ({
  ^bb0(%arg0: vector<1x[4]xf32>, %arg1: vector<1x2x1x[4]xf32>):
    %0 = "vector.insert"(%arg0, %arg1) <{static_position = array<i64: 0, 1>}> : (vector<1x[4]xf32>, vector<1x2x1x[4]xf32>) -> vector<1x2x1x[4]xf32>
    "func.return"(%0) : (vector<1x2x1x[4]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x4xf32>, vector<8x1x4xf32>) -> vector<8x1x4xf32>, sym_name = "cast_away_insert_leading_one_dims_non_one_dest"}> ({
  ^bb0(%arg0: vector<1x4xf32>, %arg1: vector<8x1x4xf32>):
    %0 = "vector.insert"(%arg0, %arg1) <{static_position = array<i64: 5>}> : (vector<1x4xf32>, vector<8x1x4xf32>) -> vector<8x1x4xf32>
    "func.return"(%0) : (vector<8x1x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x[4]xf32>, vector<8x1x[4]xf32>) -> vector<8x1x[4]xf32>, sym_name = "cast_away_insert_leading_one_dims_non_one_dest_scalable"}> ({
  ^bb0(%arg0: vector<1x[4]xf32>, %arg1: vector<8x1x[4]xf32>):
    %0 = "vector.insert"(%arg0, %arg1) <{static_position = array<i64: 5>}> : (vector<1x[4]xf32>, vector<8x1x[4]xf32>) -> vector<8x1x[4]xf32>
    "func.return"(%0) : (vector<8x1x[4]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x8xi1>, vector<1x1x8x1x8xi1>) -> vector<1x1x8x1x8xi1>, sym_name = "cast_away_insert_leading_one_dims_one_two_dest"}> ({
  ^bb0(%arg0: vector<1x8xi1>, %arg1: vector<1x1x8x1x8xi1>):
    %0 = "vector.insert"(%arg0, %arg1) <{static_position = array<i64: 0, 0, 7>}> : (vector<1x8xi1>, vector<1x1x8x1x8xi1>) -> vector<1x1x8x1x8xi1>
    "func.return"(%0) : (vector<1x1x8x1x8xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x[8]xi1>, vector<1x1x8x1x[8]xi1>) -> vector<1x1x8x1x[8]xi1>, sym_name = "cast_away_insert_leading_one_dims_one_two_dest_scalable"}> ({
  ^bb0(%arg0: vector<1x[8]xi1>, %arg1: vector<1x1x8x1x[8]xi1>):
    %0 = "vector.insert"(%arg0, %arg1) <{static_position = array<i64: 0, 0, 7>}> : (vector<1x[8]xi1>, vector<1x1x8x1x[8]xi1>) -> vector<1x1x8x1x[8]xi1>
    "func.return"(%0) : (vector<1x1x8x1x[8]xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<1x1x8x2x1xi1>, sym_name = "cast_away_constant_mask"}> ({
    %0 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 1, 1, 6, 1, 1>}> : () -> vector<1x1x8x2x1xi1>
    "func.return"(%0) : (vector<1x1x8x2x1xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1, vector<1x16xi1>, vector<1x16xi1>) -> vector<1x16xi1>, sym_name = "drop_unit_dims_scalar_cond_select"}> ({
  ^bb0(%arg0: i1, %arg1: vector<1x16xi1>, %arg2: vector<1x16xi1>):
    %0 = "arith.select"(%arg0, %arg1, %arg2) : (i1, vector<1x16xi1>, vector<1x16xi1>) -> vector<1x16xi1>
    "func.return"(%0) : (vector<1x16xi1>) -> ()
  }) : () -> ()
}) : () -> ()

