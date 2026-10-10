"builtin.module"() ({
  "func.func"() <{function_type = (vector<8x32x16xf32>, vector<8x32x16xf32>, vector<8x16xf32>) -> vector<8x16xf32>, sym_name = "multidimreduction_contract"}> ({
  ^bb0(%arg0: vector<8x32x16xf32>, %arg1: vector<8x32x16xf32>, %arg2: vector<8x16xf32>):
    %0 = "arith.mulf"(%arg0, %arg1) <{fastmath = #arith.fastmath<none>}> : (vector<8x32x16xf32>, vector<8x32x16xf32>) -> vector<8x32x16xf32>
    %1 = "vector.multi_reduction"(%0, %arg2) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1>}> : (vector<8x32x16xf32>, vector<8x16xf32>) -> vector<8x16xf32>
    "func.return"(%1) : (vector<8x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8x32x16xi32>, vector<8x32x16xi32>, vector<8x16xi32>) -> vector<8x16xi32>, sym_name = "multidimreduction_contract_int"}> ({
  ^bb0(%arg0: vector<8x32x16xi32>, %arg1: vector<8x32x16xi32>, %arg2: vector<8x16xi32>):
    %0 = "arith.muli"(%arg0, %arg1) <{overflowFlags = #arith.overflow<none>}> : (vector<8x32x16xi32>, vector<8x32x16xi32>) -> vector<8x32x16xi32>
    %1 = "vector.multi_reduction"(%0, %arg2) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1>}> : (vector<8x32x16xi32>, vector<8x16xi32>) -> vector<8x16xi32>
    "func.return"(%1) : (vector<8x16xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<32x16x8xf32>, vector<8x32x16xf32>) -> vector<8x32xf32>, sym_name = "contract_transpose"}> ({
  ^bb0(%arg0: vector<32x16x8xf32>, %arg1: vector<8x32x16xf32>):
    %0 = "arith.constant"() <{value = dense<0.000000e+00> : vector<8x32xf32>}> : () -> vector<8x32xf32>
    %1 = "vector.transpose"(%arg0) <{permutation = array<i64: 2, 0, 1>}> : (vector<32x16x8xf32>) -> vector<8x32x16xf32>
    %2 = "vector.contract"(%1, %arg1, %0) <{indexing_maps = [#map, #map, #map1], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<8x32x16xf32>, vector<8x32x16xf32>, vector<8x32xf32>) -> vector<8x32xf32>
    "func.return"(%2) : (vector<8x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<32x16xf32>, vector<8x32x16xf32>) -> vector<8x32xf32>, sym_name = "contract_broadcast"}> ({
  ^bb0(%arg0: vector<32x16xf32>, %arg1: vector<8x32x16xf32>):
    %0 = "arith.constant"() <{value = dense<0.000000e+00> : vector<8x32xf32>}> : () -> vector<8x32xf32>
    %1 = "vector.broadcast"(%arg0) : (vector<32x16xf32>) -> vector<8x32x16xf32>
    %2 = "vector.contract"(%1, %arg1, %0) <{indexing_maps = [#map, #map, #map1], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<8x32x16xf32>, vector<8x32x16xf32>, vector<8x32xf32>) -> vector<8x32xf32>
    "func.return"(%2) : (vector<8x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<32x16xf32>, vector<8x32x16xf32>, vector<8x32x16xi1>) -> vector<8x32xf32>, sym_name = "contract_broadcast_masked"}> ({
  ^bb0(%arg0: vector<32x16xf32>, %arg1: vector<8x32x16xf32>, %arg2: vector<8x32x16xi1>):
    %0 = "arith.constant"() <{value = dense<0.000000e+00> : vector<8x32xf32>}> : () -> vector<8x32xf32>
    %1 = "vector.broadcast"(%arg0) : (vector<32x16xf32>) -> vector<8x32x16xf32>
    %2 = "vector.mask"(%arg2) ({
      %3 = "vector.contract"(%1, %arg1, %0) <{indexing_maps = [#map, #map, #map1], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<8x32x16xf32>, vector<8x32x16xf32>, vector<8x32xf32>) -> vector<8x32xf32>
      "vector.yield"(%3) : (vector<8x32xf32>) -> ()
    }) : (vector<8x32x16xi1>) -> vector<8x32xf32>
    "func.return"(%2) : (vector<8x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[32]x16xf32>, vector<8x[32]x16xf32>, vector<8x[32]x16xi1>) -> vector<8x32xf32>, sym_name = "contract_broadcast_masked_scalable"}> ({
  ^bb0(%arg0: vector<[32]x16xf32>, %arg1: vector<8x[32]x16xf32>, %arg2: vector<8x[32]x16xi1>):
    %0 = "arith.constant"() <{value = dense<0.000000e+00> : vector<8x32xf32>}> : () -> vector<8x32xf32>
    %1 = "vector.broadcast"(%arg0) : (vector<[32]x16xf32>) -> vector<8x[32]x16xf32>
    %2 = "vector.mask"(%arg2) ({
      %3 = "vector.contract"(%1, %arg1, %0) <{indexing_maps = [#map, #map, #map1], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<8x[32]x16xf32>, vector<8x[32]x16xf32>, vector<8x32xf32>) -> vector<8x32xf32>
      "vector.yield"(%3) : (vector<8x32xf32>) -> ()
    }) : (vector<8x[32]x16xi1>) -> vector<8x32xf32>
    "func.return"(%2) : (vector<8x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8x4xi32>, vector<8x4xi32>, vector<8x8xi32>) -> vector<8x8xi32>, sym_name = "contract_broadcast_unit_dim_reduction"}> ({
  ^bb0(%arg0: vector<8x4xi32>, %arg1: vector<8x4xi32>, %arg2: vector<8x8xi32>):
    %0 = "vector.broadcast"(%arg0) : (vector<8x4xi32>) -> vector<1x8x4xi32>
    %1 = "vector.broadcast"(%arg1) : (vector<8x4xi32>) -> vector<1x8x4xi32>
    %2 = "vector.contract"(%0, %1, %arg2) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<reduction>, #vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<1x8x4xi32>, vector<1x8x4xi32>, vector<8x8xi32>) -> vector<8x8xi32>
    "func.return"(%2) : (vector<8x8xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8x4xi32>, vector<8x4xi32>, vector<8x8xi32>, vector<1x8x8x4xi1>) -> vector<8x8xi32>, sym_name = "contract_broadcast_unit_dim_reduction_masked"}> ({
  ^bb0(%arg0: vector<8x4xi32>, %arg1: vector<8x4xi32>, %arg2: vector<8x8xi32>, %arg3: vector<1x8x8x4xi1>):
    %0 = "vector.broadcast"(%arg0) : (vector<8x4xi32>) -> vector<1x8x4xi32>
    %1 = "vector.broadcast"(%arg1) : (vector<8x4xi32>) -> vector<1x8x4xi32>
    %2 = "vector.mask"(%arg3) ({
      %3 = "vector.contract"(%0, %1, %arg2) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<reduction>, #vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<1x8x4xi32>, vector<1x8x4xi32>, vector<8x8xi32>) -> vector<8x8xi32>
      "vector.yield"(%3) : (vector<8x8xi32>) -> ()
    }) : (vector<1x8x8x4xi1>) -> vector<8x8xi32>
    "func.return"(%2) : (vector<8x8xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8x4xi32>, vector<[8]x4xi32>, vector<8x[8]xi32>, vector<1x8x[8]x4xi1>) -> vector<8x[8]xi32>, sym_name = "contract_broadcast_unit_dim_reduction_masked_scalable"}> ({
  ^bb0(%arg0: vector<8x4xi32>, %arg1: vector<[8]x4xi32>, %arg2: vector<8x[8]xi32>, %arg3: vector<1x8x[8]x4xi1>):
    %0 = "vector.broadcast"(%arg0) : (vector<8x4xi32>) -> vector<1x8x4xi32>
    %1 = "vector.broadcast"(%arg1) : (vector<[8]x4xi32>) -> vector<1x[8]x4xi32>
    %2 = "vector.mask"(%arg3) ({
      %3 = "vector.contract"(%0, %1, %arg2) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<reduction>, #vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<1x8x4xi32>, vector<1x[8]x4xi32>, vector<8x[8]xi32>) -> vector<8x[8]xi32>
      "vector.yield"(%3) : (vector<8x[8]xi32>) -> ()
    }) : (vector<1x8x[8]x4xi1>) -> vector<8x[8]xi32>
    "func.return"(%2) : (vector<8x[8]xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d1, d0, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d1, d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8x4xi32>, vector<8x4xi32>, vector<8x8xi32>) -> vector<8x8xi32>, sym_name = "contract_broadcast_non_unit_dim_reduction_with_permutation"}> ({
  ^bb0(%arg0: vector<8x4xi32>, %arg1: vector<8x4xi32>, %arg2: vector<8x8xi32>):
    %0 = "vector.broadcast"(%arg0) : (vector<8x4xi32>) -> vector<2x8x4xi32>
    %1 = "vector.broadcast"(%arg1) : (vector<8x4xi32>) -> vector<2x8x4xi32>
    %2 = "vector.contract"(%0, %1, %arg2) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x8x4xi32>, vector<2x8x4xi32>, vector<8x8xi32>) -> vector<8x8xi32>
    "func.return"(%2) : (vector<8x8xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xi32>, vector<8xi32>, vector<8x8xi32>) -> vector<8x8xi32>, sym_name = "contract_broadcast_unit_dim_reduction_as_only_reduction"}> ({
  ^bb0(%arg0: vector<8xi32>, %arg1: vector<8xi32>, %arg2: vector<8x8xi32>):
    %0 = "vector.broadcast"(%arg0) : (vector<8xi32>) -> vector<1x8xi32>
    %1 = "vector.broadcast"(%arg1) : (vector<8xi32>) -> vector<1x8xi32>
    %2 = "vector.contract"(%0, %1, %arg2) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<reduction>, #vector.iterator_type<parallel>, #vector.iterator_type<parallel>], kind = #vector.kind<add>}> : (vector<1x8xi32>, vector<1x8xi32>, vector<8x8xi32>) -> vector<8x8xi32>
    "func.return"(%2) : (vector<8x8xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x2xi32>, vector<2xi32>, vector<1xi32>) -> vector<1xi32>, sym_name = "contract_broadcast_dimension_would_go_unused_in_lhs_rhs"}> ({
  ^bb0(%arg0: vector<1x2xi32>, %arg1: vector<2xi32>, %arg2: vector<1xi32>):
    %0 = "vector.broadcast"(%arg1) : (vector<2xi32>) -> vector<1x1x2xi32>
    %1 = "vector.contract"(%arg0, %0, %arg2) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<reduction>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<1x2xi32>, vector<1x1x2xi32>, vector<1xi32>) -> vector<1xi32>
    "func.return"(%1) : (vector<1xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
#map2 = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1xf32>, vector<1xf32>, vector<1xf32>) -> vector<1xf32>, sym_name = "contract_broadcast_would_have_no_reduction_dim_pair"}> ({
  ^bb0(%arg0: vector<1xf32>, %arg1: vector<1xf32>, %arg2: vector<1xf32>):
    %0 = "vector.broadcast"(%arg1) : (vector<1xf32>) -> vector<1x1xf32>
    %1 = "vector.contract"(%arg0, %0, %arg2) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<1xf32>, vector<1x1xf32>, vector<1xf32>) -> vector<1xf32>
    "func.return"(%1) : (vector<1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d3, d1)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x4x4xf32>, vector<4x8xf32>, vector<2x8x4xf32>) -> vector<2x8x4xf32>, sym_name = "contract_result_transpose"}> ({
  ^bb0(%arg0: vector<2x4x4xf32>, %arg1: vector<4x8xf32>, %arg2: vector<2x8x4xf32>):
    %0 = "vector.transpose"(%arg2) <{permutation = array<i64: 0, 2, 1>}> : (vector<2x8x4xf32>) -> vector<2x4x8xf32>
    %1 = "vector.contract"(%arg0, %arg1, %0) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x4x4xf32>, vector<4x8xf32>, vector<2x4x8xf32>) -> vector<2x4x8xf32>
    %2 = "vector.transpose"(%1) <{permutation = array<i64: 0, 2, 1>}> : (vector<2x4x8xf32>) -> vector<2x8x4xf32>
    "func.return"(%2) : (vector<2x8x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

