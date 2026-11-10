#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8x4xf32>, vector<8x4xf32>, vector<8x8xf32>) -> vector<8x8xf32>, sym_name = "vector_contract_f32"}> ({
  ^bb0(%arg0: vector<8x4xf32>, %arg1: vector<8x4xf32>, %arg2: vector<8x8xf32>):
    %0 = "vector.contract"(%arg0, %arg1, %arg2) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<8x4xf32>, vector<8x4xf32>, vector<8x8xf32>) -> vector<8x8xf32>
    "func.return"(%0) : (vector<8x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8x8xf16>, vector<8x8xf16>, vector<8x8xf16>) -> vector<8x8xf16>, sym_name = "vector_contract_f16"}> ({
  ^bb0(%arg0: vector<8x8xf16>, %arg1: vector<8x8xf16>, %arg2: vector<8x8xf16>):
    %0 = "vector.contract"(%arg0, %arg1, %arg2) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<8x8xf16>, vector<8x8xf16>, vector<8x8xf16>) -> vector<8x8xf16>
    "func.return"(%0) : (vector<8x8xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x4xf32>, vector<4x4xf32>, vector<4x4xf32>) -> vector<4x4xf32>, sym_name = "vector_fma"}> ({
  ^bb0(%arg0: vector<4x4xf32>, %arg1: vector<4x4xf32>, %arg2: vector<4x4xf32>):
    %0 = "vector.fma"(%arg0, %arg1, %arg2) : (vector<4x4xf32>, vector<4x4xf32>, vector<4x4xf32>) -> vector<4x4xf32>
    "func.return"(%0) : (vector<4x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<3x2x2xf32>) -> vector<3x2x2xf32>, sym_name = "vector_fma_3d"}> ({
  ^bb0(%arg0: vector<3x2x2xf32>):
    %0 = "vector.fma"(%arg0, %arg0, %arg0) : (vector<3x2x2xf32>, vector<3x2x2xf32>, vector<3x2x2xf32>) -> vector<3x2x2xf32>
    "func.return"(%0) : (vector<3x2x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x6xf32>, vector<4xf32>) -> vector<4xf32>, sym_name = "vector_multi_reduction"}> ({
  ^bb0(%arg0: vector<4x6xf32>, %arg1: vector<4xf32>):
    %0 = "vector.multi_reduction"(%arg0, %arg1) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1>}> : (vector<4x6xf32>, vector<4xf32>) -> vector<4xf32>
    "func.return"(%0) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x2xf32>, f32) -> f32, sym_name = "vector_multi_reduction_scalar"}> ({
  ^bb0(%arg0: vector<4x2xf32>, %arg1: f32):
    %0 = "vector.multi_reduction"(%arg0, %arg1) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0, 1>}> : (vector<4x2xf32>, f32) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xf32>) -> f32, sym_name = "vector_reduction"}> ({
  ^bb0(%arg0: vector<8xf32>):
    %0 = "vector.reduction"(%arg0) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<8xf32>) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x4x3x8xf32>) -> vector<2x3x8x4xf32>, sym_name = "vector_transpose"}> ({
  ^bb0(%arg0: vector<2x4x3x8xf32>):
    %0 = "vector.transpose"(%arg0) <{permutation = array<i64: 0, 2, 3, 1>}> : (vector<2x4x3x8xf32>) -> vector<2x3x8x4xf32>
    "func.return"(%0) : (vector<2x3x8x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8x8x4xf32>, vector<8x8x4xf32>, vector<8x8x8xf32>) -> vector<8x8x8xf32>, sym_name = "vector_contract_batched"}> ({
  ^bb0(%arg0: vector<8x8x4xf32>, %arg1: vector<8x8x4xf32>, %arg2: vector<8x8x8xf32>):
    %0 = "vector.contract"(%arg0, %arg1, %arg2) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<8x8x4xf32>, vector<8x8x4xf32>, vector<8x8x8xf32>) -> vector<8x8x8xf32>
    "func.return"(%0) : (vector<8x8x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf32>) -> vector<4x4xf32>, sym_name = "vector_broadcast"}> ({
  ^bb0(%arg0: vector<4xf32>):
    %0 = "vector.broadcast"(%arg0) : (vector<4xf32>) -> vector<4x4xf32>
    "func.return"(%0) : (vector<4x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x4xf32>) -> vector<4x4xf32>, sym_name = "vector_broadcast_with_leading_unit_dim"}> ({
  ^bb0(%arg0: vector<1x4xf32>):
    %0 = "vector.broadcast"(%arg0) : (vector<1x4xf32>) -> vector<4x4xf32>
    "func.return"(%0) : (vector<4x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x1xf32>) -> vector<4x4xf32>, sym_name = "vector_broadcast_with_tailing_unit_dim"}> ({
  ^bb0(%arg0: vector<4x1xf32>):
    %0 = "vector.broadcast"(%arg0) : (vector<4x1xf32>) -> vector<4x4xf32>
    "func.return"(%0) : (vector<4x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x4xf16>) -> vector<4x4xf16>, sym_name = "vector_load_2D"}> ({
  ^bb0(%arg0: memref<4x4xf16>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "vector.load"(%arg0, %0, %0) : (memref<4x4xf16>, index, index) -> vector<4x4xf16>
    "func.return"(%1) : (vector<4x4xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x4xf16>, vector<4x4xf16>) -> (), sym_name = "vector_store_2D"}> ({
  ^bb0(%arg0: memref<4x4xf16>, %arg1: vector<4x4xf16>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.store"(%arg1, %arg0, %0, %0) : (vector<4x4xf16>, memref<4x4xf16>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<32xindex>, sym_name = "vector_step"}> ({
    %0 = "vector.step"() : () -> vector<32xindex>
    "func.return"(%0) : (vector<32xindex>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x2x2xf32>, vector<2x2x2xf32>) -> vector<2x2x2xf32>, sym_name = "elementwise_3D_to_2D"}> ({
  ^bb0(%arg0: vector<2x2x2xf32>, %arg1: vector<2x2x2xf32>):
    %0 = "arith.addf"(%arg0, %arg1) <{fastmath = #arith.fastmath<none>}> : (vector<2x2x2xf32>, vector<2x2x2xf32>) -> vector<2x2x2xf32>
    "func.return"(%0) : (vector<2x2x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x2x2x2xf32>, vector<2x2x2x2xf32>) -> vector<2x2x2x2xf32>, sym_name = "elementwise_4D_to_2D"}> ({
  ^bb0(%arg0: vector<2x2x2x2xf32>, %arg1: vector<2x2x2x2xf32>):
    %0 = "arith.addf"(%arg0, %arg1) <{fastmath = #arith.fastmath<none>}> : (vector<2x2x2x2xf32>, vector<2x2x2x2xf32>) -> vector<2x2x2x2xf32>
    "func.return"(%0) : (vector<2x2x2x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> vector<16x16xi1>, sym_name = "vector_create_mask"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "vector.create_mask"(%arg0, %arg1) : (index, index) -> vector<16x16xi1>
    "func.return"(%0) : (vector<16x16xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<16x16xi1>, sym_name = "vector_create_mask_constant_dim_sizes"}> ({
    %0 = "arith.constant"() <{value = 16 : index}> : () -> index
    %1 = "vector.create_mask"(%0, %0) : (index, index) -> vector<16x16xi1>
    "func.return"(%1) : (vector<16x16xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> vector<16x16xi1>, sym_name = "vector_constant_mask"}> ({
    %0 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 12, 10>}> : () -> vector<16x16xi1>
    "func.return"(%0) : (vector<16x16xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<16xf32>) -> vector<2x2x4xf32>, sym_name = "shape_cast_1D"}> ({
  ^bb0(%arg0: vector<16xf32>):
    %0 = "vector.shape_cast"(%arg0) : (vector<16xf32>) -> vector<2x2x4xf32>
    "func.return"(%0) : (vector<2x2x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8x2xf32>) -> vector<4x4xf32>, sym_name = "shape_cast_2D"}> ({
  ^bb0(%arg0: vector<8x2xf32>):
    %0 = "vector.shape_cast"(%arg0) : (vector<8x2xf32>) -> vector<4x4xf32>
    "func.return"(%0) : (vector<4x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<64xf32>) -> vector<8x8xf32>, sym_name = "negative_shape_cast_target_shape_not_contiguous"}> ({
  ^bb0(%arg0: vector<64xf32>):
    %0 = "vector.shape_cast"(%arg0) : (vector<64xf32>) -> vector<8x8xf32>
    "func.return"(%0) : (vector<8x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8x3xf32>) -> vector<6x4xf32>, sym_name = "negative_shape_cast_source_shape_not_determinable"}> ({
  ^bb0(%arg0: vector<8x3xf32>):
    %0 = "vector.shape_cast"(%arg0) : (vector<8x3xf32>) -> vector<6x4xf32>
    "func.return"(%0) : (vector<6x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<32xf32>) -> vector<1x32xf32>, sym_name = "shape_cast_leading_unit_dim"}> ({
  ^bb0(%arg0: vector<32xf32>):
    %0 = "vector.shape_cast"(%arg0) : (vector<32xf32>) -> vector<1x32xf32>
    "func.return"(%0) : (vector<1x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2xf32>) -> vector<2x1xf32>, sym_name = "shape_cast_with_all_unit_target_shape"}> ({
  ^bb0(%arg4: vector<2xf32>):
    %4 = "vector.shape_cast"(%arg4) : (vector<2xf32>) -> vector<2x1xf32>
    "func.return"(%4) : (vector<2x1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8x32xf32>) -> vector<8x1x32xf32>, sym_name = "shape_cast_multi_group_rank_increasing"}> ({
  ^bb0(%arg3: vector<8x32xf32>):
    %3 = "vector.shape_cast"(%arg3) : (vector<8x32xf32>) -> vector<8x1x32xf32>
    "func.return"(%3) : (vector<8x1x32xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x2x4xf32>) -> vector<4x4xf32>, sym_name = "shape_cast_multi_group_rank_decreasing"}> ({
  ^bb0(%arg2: vector<2x2x4xf32>):
    %2 = "vector.shape_cast"(%arg2) : (vector<2x2x4xf32>) -> vector<4x4xf32>
    "func.return"(%2) : (vector<4x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x32xf32>) -> vector<2x8x4xf32>, sym_name = "negative_shape_cast_multi_group_target_not_contiguous"}> ({
  ^bb0(%arg1: vector<2x32xf32>):
    %1 = "vector.shape_cast"(%arg1) : (vector<2x32xf32>) -> vector<2x8x4xf32>
    "func.return"(%1) : (vector<2x8x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x8x3xf32>) -> vector<2x24xf32>, sym_name = "negative_shape_cast_multi_group_source_not_determinable"}> ({
  ^bb0(%arg0: vector<2x8x3xf32>):
    %0 = "vector.shape_cast"(%arg0) : (vector<2x8x3xf32>) -> vector<2x24xf32>
    "func.return"(%0) : (vector<2x24xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8x4xf32>) -> vector<8x8xi16>, sym_name = "bitcast_2d"}> ({
  ^bb0(%arg0: vector<8x4xf32>):
    %0 = "vector.bitcast"(%arg0) : (vector<8x4xf32>) -> vector<8x8xi16>
    "func.return"(%0) : (vector<8x8xi16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x4xi32>, vector<4x4xi32>) -> vector<4x8xi32>, sym_name = "interleave_2d"}> ({
  ^bb0(%arg0: vector<4x4xi32>, %arg1: vector<4x4xi32>):
    %0 = "vector.interleave"(%arg0, %arg1) : (vector<4x4xi32>, vector<4x4xi32>) -> vector<4x8xi32>
    "func.return"(%0) : (vector<4x8xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x8xi32>) -> (vector<4x4xi32>, vector<4x4xi32>), sym_name = "deinterleave_2d"}> ({
  ^bb0(%arg0: vector<4x8xi32>):
    %0:2 = "vector.deinterleave"(%arg0) : (vector<4x8xi32>) -> (vector<4x4xi32>, vector<4x4xi32>)
    "func.return"(%0#0, %0#1) : (vector<4x4xi32>, vector<4x4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

