#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x8x2xf16>, vector<8x16x2xf16>, vector<4x16xf32>) -> vector<4x16xf32>, sym_name = "contract_vnni_f16"}> ({
  ^bb0(%arg0: vector<4x8x2xf16>, %arg1: vector<8x16x2xf16>, %arg2: vector<4x16xf32>):
    %0 = "vector.contract"(%arg0, %arg1, %arg2) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x8x2xf16>, vector<8x16x2xf16>, vector<4x16xf32>) -> vector<4x16xf32>
    "func.return"(%0) : (vector<4x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x8x2xbf16>, vector<8x16x2xbf16>, vector<4x16xf32>) -> vector<4x16xf32>, sym_name = "contract_vnni_bf16"}> ({
  ^bb0(%arg0: vector<4x8x2xbf16>, %arg1: vector<8x16x2xbf16>, %arg2: vector<4x16xf32>):
    %0 = "vector.contract"(%arg0, %arg1, %arg2) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x8x2xbf16>, vector<8x16x2xbf16>, vector<4x16xf32>) -> vector<4x16xf32>
    "func.return"(%0) : (vector<4x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x16x4xi8>, vector<16x8x4xi8>, vector<4x8xi32>) -> vector<4x8xi32>, sym_name = "contract_vnni_i8"}> ({
  ^bb0(%arg0: vector<4x16x4xi8>, %arg1: vector<16x8x4xi8>, %arg2: vector<4x8xi32>):
    %0 = "vector.contract"(%arg0, %arg1, %arg2) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x16x4xi8>, vector<16x8x4xi8>, vector<4x8xi32>) -> vector<4x8xi32>
    "func.return"(%0) : (vector<4x8xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d1, d2, d0)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d3, d0)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d1, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x16x4xi8>, vector<16x8x4xi8>, vector<4x8xi32>) -> vector<4x8xi32>, sym_name = "contract_shuffled_iterators"}> ({
  ^bb0(%arg0: vector<4x16x4xi8>, %arg1: vector<16x8x4xi8>, %arg2: vector<4x8xi32>):
    %0 = "vector.contract"(%arg0, %arg1, %arg2) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<reduction>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>, #vector.iterator_type<parallel>], kind = #vector.kind<add>}> : (vector<4x16x4xi8>, vector<16x8x4xi8>, vector<4x8xi32>) -> vector<4x8xi32>
    "func.return"(%0) : (vector<4x8xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x8x2xf16>, vector<8x16x2xf16>, vector<4x16xf32>) -> vector<4x16xf32>, sym_name = "negative_invalid_kind"}> ({
  ^bb0(%arg0: vector<4x8x2xf16>, %arg1: vector<8x16x2xf16>, %arg2: vector<4x16xf32>):
    %0 = "vector.contract"(%arg0, %arg1, %arg2) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<mul>}> : (vector<4x8x2xf16>, vector<8x16x2xf16>, vector<4x16xf32>) -> vector<4x16xf32>
    "func.return"(%0) : (vector<4x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x8x2xf16>, vector<8x4x2xf16>, f32) -> f32, sym_name = "negative_non_vector_acc"}> ({
  ^bb0(%arg0: vector<4x8x2xf16>, %arg1: vector<8x4x2xf16>, %arg2: f32):
    %0 = "vector.contract"(%arg0, %arg1, %arg2) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<reduction>, #vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x8x2xf16>, vector<8x4x2xf16>, f32) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x8x2xf32>, vector<8x16x2xf32>, vector<4x16xf32>) -> vector<4x16xf32>, sym_name = "negative_invalid_operand_types"}> ({
  ^bb0(%arg0: vector<4x8x2xf32>, %arg1: vector<8x16x2xf32>, %arg2: vector<4x16xf32>):
    %0 = "vector.contract"(%arg0, %arg1, %arg2) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x8x2xf32>, vector<8x16x2xf32>, vector<4x16xf32>) -> vector<4x16xf32>
    "func.return"(%0) : (vector<4x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x16xf16>, vector<16x16xf16>, vector<4x16xf32>) -> vector<4x16xf32>, sym_name = "negative_non_packed_layout"}> ({
  ^bb0(%arg0: vector<4x16xf16>, %arg1: vector<16x16xf16>, %arg2: vector<4x16xf32>):
    %0 = "vector.contract"(%arg0, %arg1, %arg2) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x16xf16>, vector<16x16xf16>, vector<4x16xf32>) -> vector<4x16xf32>
    "func.return"(%0) : (vector<4x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x2x4xf16>, vector<2x2x4xf16>, vector<4x2xf32>) -> vector<4x2xf32>, sym_name = "negative_invalid_vnni_factor"}> ({
  ^bb0(%arg0: vector<4x2x4xf16>, %arg1: vector<2x2x4xf16>, %arg2: vector<4x2xf32>):
    %0 = "vector.contract"(%arg0, %arg1, %arg2) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x2x4xf16>, vector<2x2x4xf16>, vector<4x2xf32>) -> vector<4x2xf32>
    "func.return"(%0) : (vector<4x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d3, d4)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d3, d2, d4)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x4x8x2xf16>, vector<1x8x16x2xf16>, vector<1x4x16xf32>) -> vector<1x4x16xf32>, sym_name = "negative_invalid_operands_shapes"}> ({
  ^bb0(%arg0: vector<1x4x8x2xf16>, %arg1: vector<1x8x16x2xf16>, %arg2: vector<1x4x16xf32>):
    %0 = "vector.contract"(%arg0, %arg1, %arg2) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<1x4x8x2xf16>, vector<1x8x16x2xf16>, vector<1x4x16xf32>) -> vector<1x4x16xf32>
    "func.return"(%0) : (vector<1x4x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<32x8x2xf16>, vector<8x16x2xf16>, vector<32x16xf32>) -> vector<32x16xf32>, sym_name = "negative_too_many_rows"}> ({
  ^bb0(%arg0: vector<32x8x2xf16>, %arg1: vector<8x16x2xf16>, %arg2: vector<32x16xf32>):
    %0 = "vector.contract"(%arg0, %arg1, %arg2) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<32x8x2xf16>, vector<8x16x2xf16>, vector<32x16xf32>) -> vector<32x16xf32>
    "func.return"(%0) : (vector<32x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x32x2xf16>, vector<32x16x2xf16>, vector<4x16xf32>) -> vector<4x16xf32>, sym_name = "negative_too_wide_rows"}> ({
  ^bb0(%arg0: vector<4x32x2xf16>, %arg1: vector<32x16x2xf16>, %arg2: vector<4x16xf32>):
    %0 = "vector.contract"(%arg0, %arg1, %arg2) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x32x2xf16>, vector<32x16x2xf16>, vector<4x16xf32>) -> vector<4x16xf32>
    "func.return"(%0) : (vector<4x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d2, d3, d0)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d1, d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x2x2xf16>, vector<2x2x2xf16>, vector<2x2xf32>) -> vector<2x2xf32>, sym_name = "negative_input_dim_permutation"}> ({
  ^bb0(%arg0: vector<2x2x2xf16>, %arg1: vector<2x2x2xf16>, %arg2: vector<2x2xf32>):
    %0 = "vector.contract"(%arg0, %arg1, %arg2) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x2x2xf16>, vector<2x2x2xf16>, vector<2x2xf32>) -> vector<2x2xf32>
    "func.return"(%0) : (vector<2x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d1, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d1, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x8x2xf16>, vector<8x16x2xf16>, vector<16x4xf32>) -> vector<16x4xf32>, sym_name = "negative_output_dim_permutation"}> ({
  ^bb0(%arg0: vector<4x8x2xf16>, %arg1: vector<8x16x2xf16>, %arg2: vector<16x4xf32>):
    %0 = "vector.contract"(%arg0, %arg1, %arg2) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x8x2xf16>, vector<8x16x2xf16>, vector<16x4xf32>) -> vector<16x4xf32>
    "func.return"(%0) : (vector<16x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

