#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
#map2 = affine_map<(d0, d1) -> (d0, d1)>
#map3 = affine_map<(d0, d1) -> (d1)>
#map4 = affine_map<(d0, d1) -> (d0)>
#map5 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map6 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map7 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map8 = affine_map<(d0, d1) -> ()>
#map9 = affine_map<(d0, d1) -> (d1, d0)>
#map10 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map11 = affine_map<(d0, d1, d2) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf32>, vector<4xf32>, f32) -> f32, sym_name = "extract_contract1"}> ({
  ^bb0(%arg29: vector<4xf32>, %arg30: vector<4xf32>, %arg31: f32):
    %11 = "vector.contract"(%arg29, %arg30, %arg31) <{indexing_maps = [#map, #map, #map1], iterator_types = [#vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4xf32>, vector<4xf32>, f32) -> f32
    "func.return"(%11) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf32>, vector<4xf32>, f32, vector<4xi1>) -> f32, sym_name = "masked_extract_contract1"}> ({
  ^bb0(%arg25: vector<4xf32>, %arg26: vector<4xf32>, %arg27: f32, %arg28: vector<4xi1>):
    %9 = "vector.mask"(%arg28) ({
      %10 = "vector.contract"(%arg25, %arg26, %arg27) <{indexing_maps = [#map, #map, #map1], iterator_types = [#vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4xf32>, vector<4xf32>, f32) -> f32
      "vector.yield"(%10) : (f32) -> ()
    }) : (vector<4xi1>) -> f32
    "func.return"(%9) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi32>, vector<4xi32>, i32) -> i32, sym_name = "extract_contract1_int"}> ({
  ^bb0(%arg22: vector<4xi32>, %arg23: vector<4xi32>, %arg24: i32):
    %8 = "vector.contract"(%arg22, %arg23, %arg24) <{indexing_maps = [#map, #map, #map1], iterator_types = [#vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4xi32>, vector<4xi32>, i32) -> i32
    "func.return"(%8) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x3xf32>, vector<3xf32>, vector<2xf32>) -> vector<2xf32>, sym_name = "extract_contract2"}> ({
  ^bb0(%arg19: vector<2x3xf32>, %arg20: vector<3xf32>, %arg21: vector<2xf32>):
    %7 = "vector.contract"(%arg19, %arg20, %arg21) <{indexing_maps = [#map2, #map3, #map4], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x3xf32>, vector<3xf32>, vector<2xf32>) -> vector<2xf32>
    "func.return"(%7) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x3xi32>, vector<3xi32>, vector<2xi32>) -> vector<2xi32>, sym_name = "extract_contract2_int"}> ({
  ^bb0(%arg16: vector<2x3xi32>, %arg17: vector<3xi32>, %arg18: vector<2xi32>):
    %6 = "vector.contract"(%arg16, %arg17, %arg18) <{indexing_maps = [#map2, #map3, #map4], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x3xi32>, vector<3xi32>, vector<2xi32>) -> vector<2xi32>
    "func.return"(%6) : (vector<2xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf32>, vector<2x3xf32>, vector<2xf32>) -> vector<2xf32>, sym_name = "extract_contract3"}> ({
  ^bb0(%arg13: vector<3xf32>, %arg14: vector<2x3xf32>, %arg15: vector<2xf32>):
    %5 = "vector.contract"(%arg13, %arg14, %arg15) <{indexing_maps = [#map3, #map2, #map4], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<3xf32>, vector<2x3xf32>, vector<2xf32>) -> vector<2xf32>
    "func.return"(%5) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x2xf32>, vector<2x2xf32>, vector<2x2xf32>) -> vector<2x2xf32>, sym_name = "contract_to_dot_matmat"}> ({
  ^bb0(%arg10: vector<2x2xf32>, %arg11: vector<2x2xf32>, %arg12: vector<2x2xf32>):
    %4 = "vector.contract"(%arg10, %arg11, %arg12) <{indexing_maps = [#map5, #map6, #map7], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x2xf32>, vector<2x2xf32>, vector<2x2xf32>) -> vector<2x2xf32>
    "func.return"(%4) : (vector<2x2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x3xf32>, vector<2x3xf32>, f32) -> f32, sym_name = "full_contract1"}> ({
  ^bb0(%arg7: vector<2x3xf32>, %arg8: vector<2x3xf32>, %arg9: f32):
    %3 = "vector.contract"(%arg7, %arg8, %arg9) <{indexing_maps = [#map2, #map2, #map8], iterator_types = [#vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x3xf32>, vector<2x3xf32>, f32) -> f32
    "func.return"(%3) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x3xf32>, vector<3x2xf32>, f32) -> f32, sym_name = "full_contract2"}> ({
  ^bb0(%arg4: vector<2x3xf32>, %arg5: vector<3x2xf32>, %arg6: f32):
    %2 = "vector.contract"(%arg4, %arg5, %arg6) <{indexing_maps = [#map2, #map9, #map8], iterator_types = [#vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x3xf32>, vector<3x2xf32>, f32) -> f32
    "func.return"(%2) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1x2xi32>, vector<2x2xi32>, vector<2xi32>) -> vector<2xi32>, sym_name = "contract_one_sided_unit_reduction_dim"}> ({
  ^bb0(%arg1: vector<1x2xi32>, %arg2: vector<2x2xi32>, %arg3: vector<2xi32>):
    %1 = "vector.contract"(%arg1, %arg2, %arg3) <{indexing_maps = [#map5, #map10, #map11], iterator_types = [#vector.iterator_type<reduction>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<1x2xi32>, vector<2x2xi32>, vector<2xi32>) -> vector<2xi32>
    "func.return"(%1) : (vector<2xi32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_contraction"() <{lowering_strategy = 0 : i32}> : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

