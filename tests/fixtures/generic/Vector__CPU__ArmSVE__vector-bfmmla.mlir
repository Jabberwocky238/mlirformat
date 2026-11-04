#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x4xbf16>, vector<[4]x4xbf16>, vector<4x[4]xf32>) -> vector<4x[4]xf32>, sym_name = "test_vector_contract_to_bfmmla"}> ({
  ^bb0(%arg1: vector<4x4xbf16>, %arg2: vector<[4]x4xbf16>, %arg3: vector<4x[4]xf32>):
    %1 = "vector.contract"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x4xbf16>, vector<[4]x4xbf16>, vector<4x[4]xf32>) -> vector<4x[4]xf32>
    "func.return"(%1) : (vector<4x[4]xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.arm_sve.vector_contract_to_bfmmla"() : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

