#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8x4xf32>, vector<8x4xf32>, vector<8x8xf32>) -> vector<8x8xf32>, sym_name = "vector_contract_f32"}> ({
  ^bb0(%arg13: vector<8x4xf32>, %arg14: vector<8x4xf32>, %arg15: vector<8x8xf32>):
    %7 = "vector.contract"(%arg13, %arg14, %arg15) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<8x4xf32>, vector<8x4xf32>, vector<8x8xf32>) -> vector<8x8xf32>
    "func.return"(%7) : (vector<8x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8x8xf16>, vector<8x8xf16>, vector<8x8xf16>) -> vector<8x8xf16>, sym_name = "vector_contract_f16"}> ({
  ^bb0(%arg10: vector<8x8xf16>, %arg11: vector<8x8xf16>, %arg12: vector<8x8xf16>):
    %6 = "vector.contract"(%arg10, %arg11, %arg12) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<8x8xf16>, vector<8x8xf16>, vector<8x8xf16>) -> vector<8x8xf16>
    "func.return"(%6) : (vector<8x8xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x4xf32>, vector<4x4xf32>, vector<4x4xf32>) -> vector<4x4xf32>, sym_name = "vector_fma"}> ({
  ^bb0(%arg7: vector<4x4xf32>, %arg8: vector<4x4xf32>, %arg9: vector<4x4xf32>):
    %5 = "vector.fma"(%arg7, %arg8, %arg9) : (vector<4x4xf32>, vector<4x4xf32>, vector<4x4xf32>) -> vector<4x4xf32>
    "func.return"(%5) : (vector<4x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3x2x2xf32>) -> vector<3x2x2xf32>, sym_name = "vector_fma_3d"}> ({
  ^bb0(%arg6: vector<3x2x2xf32>):
    %4 = "vector.fma"(%arg6, %arg6, %arg6) : (vector<3x2x2xf32>, vector<3x2x2xf32>, vector<3x2x2xf32>) -> vector<3x2x2xf32>
    "func.return"(%4) : (vector<3x2x2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x6xf32>, vector<4xf32>) -> vector<4xf32>, sym_name = "vector_multi_reduction"}> ({
  ^bb0(%arg4: vector<4x6xf32>, %arg5: vector<4xf32>):
    %3 = "vector.multi_reduction"(%arg4, %arg5) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1>}> : (vector<4x6xf32>, vector<4xf32>) -> vector<4xf32>
    "func.return"(%3) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x2xf32>, f32) -> f32, sym_name = "negative_vector_multi_reduction"}> ({
  ^bb0(%arg2: vector<4x2xf32>, %arg3: f32):
    %2 = "vector.multi_reduction"(%arg2, %arg3) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0, 1>}> : (vector<4x2xf32>, f32) -> f32
    "func.return"(%2) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf32>) -> f32, sym_name = "vector_reduction"}> ({
  ^bb0(%arg1: vector<8xf32>):
    %1 = "vector.reduction"(%arg1) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<8xf32>) -> f32
    "func.return"(%1) : (f32) -> ()
  }) : () -> ()
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
  ^bb0(%arg17: vector<8x8x4xf32>, %arg18: vector<8x8x4xf32>, %arg19: vector<8x8x8xf32>):
    %18 = "vector.contract"(%arg17, %arg18, %arg19) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<8x8x4xf32>, vector<8x8x4xf32>, vector<8x8x8xf32>) -> vector<8x8x8xf32>
    "func.return"(%18) : (vector<8x8x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf32>) -> vector<4x4xf32>, sym_name = "vector_broadcast"}> ({
  ^bb0(%arg16: vector<4xf32>):
    %17 = "vector.broadcast"(%arg16) : (vector<4xf32>) -> vector<4x4xf32>
    "func.return"(%17) : (vector<4x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1x4xf32>) -> vector<4x4xf32>, sym_name = "vector_broadcast_with_leading_unit_dim"}> ({
  ^bb0(%arg15: vector<1x4xf32>):
    %16 = "vector.broadcast"(%arg15) : (vector<1x4xf32>) -> vector<4x4xf32>
    "func.return"(%16) : (vector<4x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x1xf32>) -> vector<4x4xf32>, sym_name = "vector_broadcast_with_tailing_unit_dim"}> ({
  ^bb0(%arg14: vector<4x1xf32>):
    %15 = "vector.broadcast"(%arg14) : (vector<4x1xf32>) -> vector<4x4xf32>
    "func.return"(%15) : (vector<4x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<4x4xf16>) -> vector<4x4xf16>, sym_name = "vector_load_2D"}> ({
  ^bb0(%arg13: memref<4x4xf16>):
    %13 = "arith.constant"() <{value = 0 : index}> : () -> index
    %14 = "vector.load"(%arg13, %13, %13) : (memref<4x4xf16>, index, index) -> vector<4x4xf16>
    "func.return"(%14) : (vector<4x4xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<4x4xf16>, vector<4x4xf16>) -> (), sym_name = "vector_store_2D"}> ({
  ^bb0(%arg11: memref<4x4xf16>, %arg12: vector<4x4xf16>):
    %12 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.store"(%arg12, %arg11, %12, %12) : (vector<4x4xf16>, memref<4x4xf16>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> vector<32xindex>, sym_name = "vector_step"}> ({
    %11 = "vector.step"() : () -> vector<32xindex>
    "func.return"(%11) : (vector<32xindex>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x2x2xf32>, vector<2x2x2xf32>) -> vector<2x2x2xf32>, sym_name = "elementwise_3D_to_2D"}> ({
  ^bb0(%arg9: vector<2x2x2xf32>, %arg10: vector<2x2x2xf32>):
    %10 = "arith.addf"(%arg9, %arg10) <{fastmath = #arith.fastmath<none>}> : (vector<2x2x2xf32>, vector<2x2x2xf32>) -> vector<2x2x2xf32>
    "func.return"(%10) : (vector<2x2x2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x2x2x2xf32>, vector<2x2x2x2xf32>) -> vector<2x2x2x2xf32>, sym_name = "elementwise_4D_to_2D"}> ({
  ^bb0(%arg7: vector<2x2x2x2xf32>, %arg8: vector<2x2x2x2xf32>):
    %9 = "arith.addf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (vector<2x2x2x2xf32>, vector<2x2x2x2xf32>) -> vector<2x2x2x2xf32>
    "func.return"(%9) : (vector<2x2x2x2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> vector<16x16xi1>, sym_name = "vector_create_mask"}> ({
  ^bb0(%arg5: index, %arg6: index):
    %8 = "vector.create_mask"(%arg5, %arg6) : (index, index) -> vector<16x16xi1>
    "func.return"(%8) : (vector<16x16xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> vector<16x16xi1>, sym_name = "vector_create_mask_constant_dim_sizes"}> ({
    %6 = "arith.constant"() <{value = 16 : index}> : () -> index
    %7 = "vector.create_mask"(%6, %6) : (index, index) -> vector<16x16xi1>
    "func.return"(%7) : (vector<16x16xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> vector<16x16xi1>, sym_name = "vector_constant_mask"}> ({
    %5 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 12, 10>}> : () -> vector<16x16xi1>
    "func.return"(%5) : (vector<16x16xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xf32>) -> vector<2x2x4xf32>, sym_name = "shape_cast_1D"}> ({
  ^bb0(%arg4: vector<16xf32>):
    %4 = "vector.shape_cast"(%arg4) : (vector<16xf32>) -> vector<2x2x4xf32>
    "func.return"(%4) : (vector<2x2x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8x2xf32>) -> vector<4x4xf32>, sym_name = "shape_cast_2D"}> ({
  ^bb0(%arg3: vector<8x2xf32>):
    %3 = "vector.shape_cast"(%arg3) : (vector<8x2xf32>) -> vector<4x4xf32>
    "func.return"(%3) : (vector<4x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<64xf32>) -> vector<8x8xf32>, sym_name = "negative_shape_cast_target_shape_not_contiguous"}> ({
  ^bb0(%arg2: vector<64xf32>):
    %2 = "vector.shape_cast"(%arg2) : (vector<64xf32>) -> vector<8x8xf32>
    "func.return"(%2) : (vector<8x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8x3xf32>) -> vector<6x4xf32>, sym_name = "negative_shape_cast_source_shape_not_determinable"}> ({
  ^bb0(%arg1: vector<8x3xf32>):
    %1 = "vector.shape_cast"(%arg1) : (vector<8x3xf32>) -> vector<6x4xf32>
    "func.return"(%1) : (vector<6x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<32xf32>) -> vector<1x32xf32>, sym_name = "shape_cast_leading_unit_dim"}> ({
  ^bb0(%arg0: vector<32xf32>):
    %0 = "vector.shape_cast"(%arg0) : (vector<32xf32>) -> vector<1x32xf32>
    "func.return"(%0) : (vector<1x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

