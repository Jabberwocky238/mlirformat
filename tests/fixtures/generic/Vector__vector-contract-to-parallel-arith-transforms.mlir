#map = affine_map<(d0, d1, d2) -> (d1, d2, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d0)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d1, d0, d2)>
#map4 = affine_map<(d0, d1) -> (d0, d1)>
#map5 = affine_map<(d0, d1) -> ()>
#map6 = affine_map<(d0, d1) -> (d1, d0)>
#map7 = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x1x4xf32>, vector<1x1x4xf32>, vector<4xf32>) -> vector<4xf32>, sym_name = "parallel_contract_lowering"}> ({
  ^bb0(%arg13: vector<1x1x4xf32>, %arg14: vector<1x1x4xf32>, %arg15: vector<4xf32>):
    %5 = "vector.contract"(%arg13, %arg14, %arg15) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map, #map, #map1], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<1x1x4xf32>, vector<1x1x4xf32>, vector<4xf32>) -> vector<4xf32>
    "func.return"(%5) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1x1xf32>, vector<1x1x4xf32>, vector<4xf32>) -> vector<4xf32>, sym_name = "parallel_contract_lowering_broadcast"}> ({
  ^bb0(%arg10: vector<1x1xf32>, %arg11: vector<1x1x4xf32>, %arg12: vector<4xf32>):
    %4 = "vector.contract"(%arg10, %arg11, %arg12) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map2, #map, #map1], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<1x1xf32>, vector<1x1x4xf32>, vector<4xf32>) -> vector<4xf32>
    "func.return"(%4) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1x1xf32>, vector<1x4x1xf32>, vector<4xf32>) -> vector<4xf32>, sym_name = "parallel_contract_lowering_transpose"}> ({
  ^bb0(%arg7: vector<1x1xf32>, %arg8: vector<1x4x1xf32>, %arg9: vector<4xf32>):
    %3 = "vector.contract"(%arg7, %arg8, %arg9) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map2, #map3, #map1], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<1x1xf32>, vector<1x4x1xf32>, vector<4xf32>) -> vector<4xf32>
    "func.return"(%3) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1x1xf32>, vector<1x1xf32>, f32) -> f32, sym_name = "parallel_contract_lowering_scalar"}> ({
  ^bb0(%arg4: vector<1x1xf32>, %arg5: vector<1x1xf32>, %arg6: f32):
    %2 = "vector.contract"(%arg4, %arg5, %arg6) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map4, #map4, #map5], iterator_types = [#vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<1x1xf32>, vector<1x1xf32>, f32) -> f32
    "func.return"(%2) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3x2xf32>, vector<3x2xf32>, vector<2xf32>) -> vector<2xf32>, sym_name = "parallel_contract_lowering_non_unit_parallel"}> ({
  ^bb0(%arg1: vector<3x2xf32>, %arg2: vector<3x2xf32>, %arg3: vector<2xf32>):
    %1 = "vector.contract"(%arg1, %arg2, %arg3) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map6, #map6, #map7], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<3x2xf32>, vector<3x2xf32>, vector<2xf32>) -> vector<2xf32>
    "func.return"(%1) : (vector<2xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_contraction"() <{lowering_strategy = 3 : i32}> : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

