#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x8xi8>, vector<[4]x8xi8>, vector<4x[4]xi32>) -> vector<4x[4]xi32>, sym_name = "test_vector_contract_to_usmmla_rev"}> ({
  ^bb0(%arg1: vector<4x8xi8>, %arg2: vector<[4]x8xi8>, %arg3: vector<4x[4]xi32>):
    %1 = "arith.extsi"(%arg1) : (vector<4x8xi8>) -> vector<4x8xi32>
    %2 = "arith.extui"(%arg2) : (vector<[4]x8xi8>) -> vector<[4]x8xi32>
    %3 = "vector.contract"(%1, %2, %arg3) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x8xi32>, vector<[4]x8xi32>, vector<4x[4]xi32>) -> vector<4x[4]xi32>
    "func.return"(%3) : (vector<4x[4]xi32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.arm_sve.vector_contract_to_i8mm"() : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

