#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map3 = affine_map<(d0, d1) -> (d1)>
#map4 = affine_map<(d0, d1) -> (d0, d1)>
#map5 = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x8xbf16>, vector<4x8xbf16>, vector<4x4xf32>) -> vector<4x4xf32>, sym_name = "vector_contract_to_bfmmla"}> ({
  ^bb0(%arg4: vector<4x8xbf16>, %arg5: vector<4x8xbf16>, %arg6: vector<4x4xf32>):
    %2 = "vector.contract"(%arg4, %arg5, %arg6) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x8xbf16>, vector<4x8xbf16>, vector<4x4xf32>) -> vector<4x4xf32>
    "func.return"(%2) : (vector<4x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xbf16>, vector<4x8xbf16>, vector<4xf32>) -> vector<4xf32>, sym_name = "vector_contract_vecmat_to_bfmmla"}> ({
  ^bb0(%arg1: vector<8xbf16>, %arg2: vector<4x8xbf16>, %arg3: vector<4xf32>):
    %1 = "vector.contract"(%arg1, %arg2, %arg3) <{indexing_maps = [#map3, #map4, #map5], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<8xbf16>, vector<4x8xbf16>, vector<4xf32>) -> vector<4xf32>
    "func.return"(%1) : (vector<4xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.arm_neon.vector_contract_to_bfmmla"() : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

