#map = affine_map<(d0, d1, d2, d3) -> (d1, d2, d3)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map3 = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3)>
#map4 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<64x32x16x2xf16>, memref<64x16x32x2xf16>, memref<64x64xf32>, index) -> (), sym_name = "transfers_static_dims"}> ({
  ^bb0(%arg0: memref<64x32x16x2xf16>, %arg1: memref<64x16x32x2xf16>, %arg2: memref<64x64xf32>, %arg3: index):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f16}> : () -> f16
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "vector.transfer_read"(%arg0, %arg3, %arg3, %arg3, %arg3, %0) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<64x32x16x2xf16>, index, index, index, index, f16) -> vector<4x8x2xf16>
    %3 = "vector.transfer_read"(%arg1, %arg3, %arg3, %arg3, %arg3, %0) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<64x16x32x2xf16>, index, index, index, index, f16) -> vector<8x16x2xf16>
    %4 = "vector.transfer_read"(%arg2, %arg3, %arg3, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map1}> : (memref<64x64xf32>, index, index, f32) -> vector<4x16xf32>
    %5 = "vector.contract"(%2, %3, %4) <{indexing_maps = [#map2, #map3, #map4], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x8x2xf16>, vector<8x16x2xf16>, vector<4x16xf32>) -> vector<4x16xf32>
    "vector.transfer_write"(%5, %arg2, %arg3, %arg3) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map1}> : (vector<4x16xf32>, memref<64x64xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d1, d2, d3)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map3 = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3)>
#map4 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x16x2xf16>, memref<?x?x32x2xf16>, memref<?x64xf32>, index) -> (), sym_name = "transfers_dynamic_outer_dims"}> ({
  ^bb0(%arg0: memref<?x?x16x2xf16>, %arg1: memref<?x?x32x2xf16>, %arg2: memref<?x64xf32>, %arg3: index):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f16}> : () -> f16
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "vector.transfer_read"(%arg0, %arg3, %arg3, %arg3, %arg3, %0) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<?x?x16x2xf16>, index, index, index, index, f16) -> vector<4x8x2xf16>
    %3 = "vector.transfer_read"(%arg1, %arg3, %arg3, %arg3, %arg3, %0) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<?x?x32x2xf16>, index, index, index, index, f16) -> vector<8x16x2xf16>
    %4 = "vector.transfer_read"(%arg2, %arg3, %arg3, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map1}> : (memref<?x64xf32>, index, index, f32) -> vector<4x16xf32>
    %5 = "vector.contract"(%2, %3, %4) <{indexing_maps = [#map2, #map3, #map4], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x8x2xf16>, vector<8x16x2xf16>, vector<4x16xf32>) -> vector<4x16xf32>
    "vector.transfer_write"(%5, %arg2, %arg3, %arg3) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map1}> : (vector<4x16xf32>, memref<?x64xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3)>
#map3 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<64x64xf32>, vector<4x8x2xf16>, vector<8x16x2xf16>, index) -> vector<4x16xf32>, sym_name = "transfer_read_multiple_users"}> ({
  ^bb0(%arg0: memref<64x64xf32>, %arg1: vector<4x8x2xf16>, %arg2: vector<8x16x2xf16>, %arg3: index):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "vector.transfer_read"(%arg0, %arg3, %arg3, %0) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<64x64xf32>, index, index, f32) -> vector<4x16xf32>
    %2 = "vector.contract"(%arg1, %arg2, %1) <{indexing_maps = [#map1, #map2, #map3], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x8x2xf16>, vector<8x16x2xf16>, vector<4x16xf32>) -> vector<4x16xf32>
    %3 = "arith.mulf"(%1, %2) <{fastmath = #arith.fastmath<none>}> : (vector<4x16xf32>, vector<4x16xf32>) -> vector<4x16xf32>
    "func.return"(%3) : (vector<4x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
#map3 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<64x64xf32>, vector<4x8x2xf16>, vector<8x16x2xf16>, vector<4x16xf32>, index) -> vector<4x16xf32>, sym_name = "negative_contract_multiple_users"}> ({
  ^bb0(%arg0: memref<64x64xf32>, %arg1: vector<4x8x2xf16>, %arg2: vector<8x16x2xf16>, %arg3: vector<4x16xf32>, %arg4: index):
    %0 = "vector.contract"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x8x2xf16>, vector<8x16x2xf16>, vector<4x16xf32>) -> vector<4x16xf32>
    "vector.transfer_write"(%0, %arg0, %arg4, %arg4) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map3}> : (vector<4x16xf32>, memref<64x64xf32>, index, index) -> ()
    %1 = "arith.mulf"(%arg3, %0) <{fastmath = #arith.fastmath<none>}> : (vector<4x16xf32>, vector<4x16xf32>) -> vector<4x16xf32>
    "func.return"(%1) : (vector<4x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
#map3 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<64x64xf32>, vector<4x8x2xf16>, vector<8x16x2xf16>, vector<4x16xf32>, index) -> (), sym_name = "negative_out_of_bounds"}> ({
  ^bb0(%arg0: memref<64x64xf32>, %arg1: vector<4x8x2xf16>, %arg2: vector<8x16x2xf16>, %arg3: vector<4x16xf32>, %arg4: index):
    %0 = "vector.contract"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x8x2xf16>, vector<8x16x2xf16>, vector<4x16xf32>) -> vector<4x16xf32>
    "vector.transfer_write"(%0, %arg0, %arg4, %arg4) <{in_bounds = [true, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map3}> : (vector<4x16xf32>, memref<64x64xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
#map3 = affine_map<(d0, d1) -> (d1, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<64x64xf32>, vector<4x8x2xf16>, vector<8x16x2xf16>, vector<4x16xf32>, index) -> (), sym_name = "negative_non_identity_map"}> ({
  ^bb0(%arg0: memref<64x64xf32>, %arg1: vector<4x8x2xf16>, %arg2: vector<8x16x2xf16>, %arg3: vector<4x16xf32>, %arg4: index):
    %0 = "vector.contract"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x8x2xf16>, vector<8x16x2xf16>, vector<4x16xf32>) -> vector<4x16xf32>
    "vector.transfer_write"(%0, %arg0, %arg4, %arg4) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map3}> : (vector<4x16xf32>, memref<64x64xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3)>
#map3 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8x128x2xf16, strided<[256, 4, 1]>>, vector<8x16x2xf16>, vector<4x16xf32>, index) -> vector<4x16xf32>, sym_name = "negative_non_contiguous_row"}> ({
  ^bb0(%arg0: memref<8x128x2xf16, strided<[256, 4, 1]>>, %arg1: vector<8x16x2xf16>, %arg2: vector<4x16xf32>, %arg3: index):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f16}> : () -> f16
    %1 = "vector.transfer_read"(%arg0, %arg3, %arg3, %arg3, %0) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 3, 1, 0>, permutation_map = #map}> : (memref<8x128x2xf16, strided<[256, 4, 1]>>, index, index, index, f16) -> vector<4x8x2xf16>
    %2 = "vector.contract"(%1, %arg1, %arg2) <{indexing_maps = [#map1, #map2, #map3], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x8x2xf16>, vector<8x16x2xf16>, vector<4x16xf32>) -> vector<4x16xf32>
    "func.return"(%2) : (vector<4x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (0, d0)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3)>
#map3 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<512xf32>, vector<4x8x2xf16>, vector<8x16x2xf16>, index) -> vector<4x16xf32>, sym_name = "negative_1D_buffer"}> ({
  ^bb0(%arg0: memref<512xf32>, %arg1: vector<4x8x2xf16>, %arg2: vector<8x16x2xf16>, %arg3: index):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "vector.transfer_read"(%arg0, %arg3, %0) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<512xf32>, index, f32) -> vector<4x16xf32>
    %2 = "vector.contract"(%arg1, %arg2, %1) <{indexing_maps = [#map1, #map2, #map3], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x8x2xf16>, vector<8x16x2xf16>, vector<4x16xf32>) -> vector<4x16xf32>
    "func.return"(%2) : (vector<4x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d1, d2, d3)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map2 = affine_map<(d0, d1) -> (d0, d1)>
#map3 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map4 = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3)>
#map5 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?x2xf16>, memref<?x?x2xf16>, memref<?x?xf32>, index) -> (), sym_name = "negative_dynamic_shapes"}> ({
  ^bb0(%arg0: memref<?x?x?x2xf16>, %arg1: memref<?x?x2xf16>, %arg2: memref<?x?xf32>, %arg3: index):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f16}> : () -> f16
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "vector.transfer_read"(%arg0, %arg3, %arg3, %arg3, %arg3, %0) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<?x?x?x2xf16>, index, index, index, index, f16) -> vector<4x8x2xf16>
    %3 = "vector.transfer_read"(%arg1, %arg3, %arg3, %arg3, %0) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 3, 1, 0>, permutation_map = #map1}> : (memref<?x?x2xf16>, index, index, index, f16) -> vector<8x16x2xf16>
    %4 = "vector.transfer_read"(%arg2, %arg3, %arg3, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map2}> : (memref<?x?xf32>, index, index, f32) -> vector<4x16xf32>
    %5 = "vector.contract"(%2, %3, %4) <{indexing_maps = [#map3, #map4, #map5], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x8x2xf16>, vector<8x16x2xf16>, vector<4x16xf32>) -> vector<4x16xf32>
    "vector.transfer_write"(%5, %arg2, %arg3, %arg3) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map2}> : (vector<4x16xf32>, memref<?x?xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3)>
#map3 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<5x2x4x4xf32>, vector<4x8x2xf16>, vector<8x16x2xf16>, index) -> vector<4x16xf32>, sym_name = "negative_invalid_buffer_row_shape"}> ({
  ^bb0(%arg0: memref<5x2x4x4xf32>, %arg1: vector<4x8x2xf16>, %arg2: vector<8x16x2xf16>, %arg3: index):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "vector.transfer_read"(%arg0, %arg3, %arg3, %arg3, %arg3, %0) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = #map}> : (memref<5x2x4x4xf32>, index, index, index, index, f32) -> vector<4x16xf32>
    %2 = "vector.contract"(%arg1, %arg2, %1) <{indexing_maps = [#map1, #map2, #map3], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x8x2xf16>, vector<8x16x2xf16>, vector<4x16xf32>) -> vector<4x16xf32>
    "func.return"(%2) : (vector<4x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3)>
#map3 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8x64x64xf16>, vector<8x16x2xf16>, vector<4x16xf32>, index) -> vector<4x16xf32>, sym_name = "negative_buffer_non_packed_source_shape"}> ({
  ^bb0(%arg0: memref<8x64x64xf16>, %arg1: vector<8x16x2xf16>, %arg2: vector<4x16xf32>, %arg3: index):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f16}> : () -> f16
    %1 = "vector.transfer_read"(%arg0, %arg3, %arg3, %arg3, %0) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 3, 1, 0>, permutation_map = #map}> : (memref<8x64x64xf16>, index, index, index, f16) -> vector<4x8x2xf16>
    %2 = "vector.contract"(%1, %arg1, %arg2) <{indexing_maps = [#map1, #map2, #map3], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x8x2xf16>, vector<8x16x2xf16>, vector<4x16xf32>) -> vector<4x16xf32>
    "func.return"(%2) : (vector<4x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

