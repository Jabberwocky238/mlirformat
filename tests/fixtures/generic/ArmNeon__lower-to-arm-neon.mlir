#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x8xi8>, vector<2x8xi4>, vector<2x2xi32>) -> vector<2x2xi32>, sym_name = "vector_arm_neon_mixed_types"}> ({
  ^bb0(%arg0: vector<2x8xi8>, %arg1: vector<2x8xi4>, %arg2: vector<2x2xi32>):
    %0 = "arith.extsi"(%arg0) : (vector<2x8xi8>) -> vector<2x8xi32>
    %1 = "arith.extsi"(%arg1) : (vector<2x8xi4>) -> vector<2x8xi32>
    %2 = "vector.contract"(%0, %1, %arg2) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x8xi32>, vector<2x8xi32>, vector<2x2xi32>) -> vector<2x2xi32>
    "func.return"(%2) : (vector<2x2xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x8xi8>, vector<2x8xi8>, vector<2x2xi32>) -> vector<2x2xi32>, sym_name = "vector_arm_neon_implicit_extsi"}> ({
  ^bb0(%arg0: vector<2x8xi8>, %arg1: vector<2x8xi8>, %arg2: vector<2x2xi32>):
    %0 = "vector.contract"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x8xi8>, vector<2x8xi8>, vector<2x2xi32>) -> vector<2x2xi32>
    "func.return"(%0) : (vector<2x2xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x8xi8>, vector<2x8xi8>, vector<2x2xi32>) -> vector<2x2xi32>, sym_name = "vector_arm_neon_signed_signed"}> ({
  ^bb0(%arg0: vector<2x8xi8>, %arg1: vector<2x8xi8>, %arg2: vector<2x2xi32>):
    %0 = "arith.extsi"(%arg0) : (vector<2x8xi8>) -> vector<2x8xi32>
    %1 = "arith.extsi"(%arg1) : (vector<2x8xi8>) -> vector<2x8xi32>
    %2 = "vector.contract"(%0, %1, %arg2) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x8xi32>, vector<2x8xi32>, vector<2x2xi32>) -> vector<2x2xi32>
    "func.return"(%2) : (vector<2x2xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x8xi8>, vector<2x8xi8>, vector<2x2xi32>) -> vector<2x2xi32>, sym_name = "vector_arm_neon_unsigned_signed"}> ({
  ^bb0(%arg0: vector<2x8xi8>, %arg1: vector<2x8xi8>, %arg2: vector<2x2xi32>):
    %0 = "arith.extui"(%arg0) : (vector<2x8xi8>) -> vector<2x8xi32>
    %1 = "arith.extsi"(%arg1) : (vector<2x8xi8>) -> vector<2x8xi32>
    %2 = "vector.contract"(%0, %1, %arg2) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x8xi32>, vector<2x8xi32>, vector<2x2xi32>) -> vector<2x2xi32>
    "func.return"(%2) : (vector<2x2xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x8xi8>, vector<2x8xi8>, vector<2x2xi32>) -> vector<2x2xi32>, sym_name = "vector_arm_neon_unsigned_unsigned"}> ({
  ^bb0(%arg0: vector<2x8xi8>, %arg1: vector<2x8xi8>, %arg2: vector<2x2xi32>):
    %0 = "arith.extui"(%arg0) : (vector<2x8xi8>) -> vector<2x8xi32>
    %1 = "arith.extui"(%arg1) : (vector<2x8xi8>) -> vector<2x8xi32>
    %2 = "vector.contract"(%0, %1, %arg2) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x8xi32>, vector<2x8xi32>, vector<2x2xi32>) -> vector<2x2xi32>
    "func.return"(%2) : (vector<2x2xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x8xi8>, vector<2x8xi8>, vector<2x2xi32>) -> vector<2x2xi32>, sym_name = "vector_arm_neon_signed_unsigned"}> ({
  ^bb0(%arg0: vector<2x8xi8>, %arg1: vector<2x8xi8>, %arg2: vector<2x2xi32>):
    %0 = "arith.extsi"(%arg0) : (vector<2x8xi8>) -> vector<2x8xi32>
    %1 = "arith.extui"(%arg1) : (vector<2x8xi8>) -> vector<2x8xi32>
    %2 = "vector.contract"(%0, %1, %arg2) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x8xi32>, vector<2x8xi32>, vector<2x2xi32>) -> vector<2x2xi32>
    "func.return"(%2) : (vector<2x2xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x8xi8>, vector<4x8xi8>, vector<4x4xi32>) -> vector<4x4xi32>, sym_name = "vector_arm_neon_unroll"}> ({
  ^bb0(%arg0: vector<4x8xi8>, %arg1: vector<4x8xi8>, %arg2: vector<4x4xi32>):
    %0 = "arith.extsi"(%arg0) : (vector<4x8xi8>) -> vector<4x8xi32>
    %1 = "arith.extsi"(%arg1) : (vector<4x8xi8>) -> vector<4x8xi32>
    %2 = "vector.contract"(%0, %1, %arg2) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x8xi32>, vector<4x8xi32>, vector<4x4xi32>) -> vector<4x4xi32>
    "func.return"(%2) : (vector<4x4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x8xi8>, vector<2x8xi4>, vector<4x2xi32>) -> vector<4x2xi32>, sym_name = "vector_arm_neon_mixed_unroll"}> ({
  ^bb0(%arg0: vector<4x8xi8>, %arg1: vector<2x8xi4>, %arg2: vector<4x2xi32>):
    %0 = "arith.extsi"(%arg0) : (vector<4x8xi8>) -> vector<4x8xi32>
    %1 = "arith.extsi"(%arg1) : (vector<2x8xi4>) -> vector<2x8xi32>
    %2 = "vector.contract"(%0, %1, %arg2) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x8xi32>, vector<2x8xi32>, vector<4x2xi32>) -> vector<4x2xi32>
    "func.return"(%2) : (vector<4x2xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x12xi8>, vector<4x12xi8>, vector<4x4xi32>) -> vector<4x4xi32>, sym_name = "vector_arm_neon_unroll_incompatible_shape"}> ({
  ^bb0(%arg0: vector<4x12xi8>, %arg1: vector<4x12xi8>, %arg2: vector<4x4xi32>):
    %0 = "arith.extsi"(%arg0) : (vector<4x12xi8>) -> vector<4x12xi32>
    %1 = "arith.extsi"(%arg1) : (vector<4x12xi8>) -> vector<4x12xi32>
    %2 = "vector.contract"(%0, %1, %arg2) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x12xi32>, vector<4x12xi32>, vector<4x4xi32>) -> vector<4x4xi32>
    "func.return"(%2) : (vector<4x4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xi8>, vector<8x8xi8>, vector<8xi32>) -> vector<8xi32>, sym_name = "vector_arm_neon_vecmat_unroll"}> ({
  ^bb0(%arg0: vector<8xi8>, %arg1: vector<8x8xi8>, %arg2: vector<8xi32>):
    %0 = "arith.extsi"(%arg0) : (vector<8xi8>) -> vector<8xi32>
    %1 = "arith.extsi"(%arg1) : (vector<8x8xi8>) -> vector<8x8xi32>
    %2 = "vector.contract"(%0, %1, %arg2) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<8xi32>, vector<8x8xi32>, vector<8xi32>) -> vector<8xi32>
    "func.return"(%2) : (vector<8xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x8xi8>, vector<8x8xi8>, vector<1x8xi32>) -> vector<1x8xi32>, sym_name = "vector_arm_neon_vecmat_unroll_leading_dim"}> ({
  ^bb0(%arg0: vector<1x8xi8>, %arg1: vector<8x8xi8>, %arg2: vector<1x8xi32>):
    %0 = "arith.extsi"(%arg0) : (vector<1x8xi8>) -> vector<1x8xi32>
    %1 = "arith.extsi"(%arg1) : (vector<8x8xi8>) -> vector<8x8xi32>
    %2 = "vector.contract"(%0, %1, %arg2) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<1x8xi32>, vector<8x8xi32>, vector<1x8xi32>) -> vector<1x8xi32>
    "func.return"(%2) : (vector<1x8xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
#map2 = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8x8xi8>, vector<8xi8>, vector<8xi32>) -> vector<8xi32>, sym_name = "vector_arm_neon_matvec"}> ({
  ^bb0(%arg0: vector<8x8xi8>, %arg1: vector<8xi8>, %arg2: vector<8xi32>):
    %0 = "arith.extsi"(%arg1) : (vector<8xi8>) -> vector<8xi32>
    %1 = "arith.extsi"(%arg0) : (vector<8x8xi8>) -> vector<8x8xi32>
    %2 = "vector.contract"(%1, %0, %arg2) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<8x8xi32>, vector<8xi32>, vector<8xi32>) -> vector<8xi32>
    "func.return"(%2) : (vector<8xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x16xi8>, vector<2x16xi4>, vector<2x2xi32>) -> vector<2x2xi32>, sym_name = "vector_arm_neon_k_unroll"}> ({
  ^bb0(%arg0: vector<2x16xi8>, %arg1: vector<2x16xi4>, %arg2: vector<2x2xi32>):
    %0 = "arith.extsi"(%arg0) : (vector<2x16xi8>) -> vector<2x16xi32>
    %1 = "arith.extsi"(%arg1) : (vector<2x16xi4>) -> vector<2x16xi32>
    %2 = "vector.contract"(%0, %1, %arg2) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x16xi32>, vector<2x16xi32>, vector<2x2xi32>) -> vector<2x2xi32>
    "func.return"(%2) : (vector<2x2xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x32xi8>, vector<2x32xi4>, vector<1x2xi32>) -> vector<1x2xi32>, sym_name = "vector_arm_neon_k_unroll_vecmat"}> ({
  ^bb0(%arg0: vector<1x32xi8>, %arg1: vector<2x32xi4>, %arg2: vector<1x2xi32>):
    %0 = "arith.extsi"(%arg0) : (vector<1x32xi8>) -> vector<1x32xi32>
    %1 = "arith.extsi"(%arg1) : (vector<2x32xi4>) -> vector<2x32xi32>
    %2 = "vector.contract"(%0, %1, %arg2) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<1x32xi32>, vector<2x32xi32>, vector<1x2xi32>) -> vector<1x2xi32>
    "func.return"(%2) : (vector<1x2xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x16xi8>, vector<4x16xi8>, vector<4x4xi32>) -> vector<4x4xi32>, sym_name = "vector_arm_neon_mnk_unroll"}> ({
  ^bb0(%arg1: vector<4x16xi8>, %arg2: vector<4x16xi8>, %arg3: vector<4x4xi32>):
    %1 = "arith.extsi"(%arg1) : (vector<4x16xi8>) -> vector<4x16xi32>
    %2 = "arith.extsi"(%arg2) : (vector<4x16xi8>) -> vector<4x16xi32>
    %3 = "vector.contract"(%1, %2, %arg3) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x16xi32>, vector<4x16xi32>, vector<4x4xi32>) -> vector<4x4xi32>
    "func.return"(%3) : (vector<4x4xi32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.arm_neon.vector_contract_to_i8mm"() : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

