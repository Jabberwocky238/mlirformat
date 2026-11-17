"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x1x1x2xbf16>, vector<1x1x16x2xbf16>, vector<1x16xf32>) -> vector<1x16xf32>, sym_name = "brgemm_to_bf16dp"}> ({
  ^bb0(%arg1: vector<1x1x1x2xbf16> loc("<stdin>":6:8), %arg2: vector<1x1x16x2xbf16> loc("<stdin>":6:37), %arg3: vector<1x16xf32> loc("<stdin>":6:67)):
    %1 = "vector.contract"(%arg1, %arg2, %arg3) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2, d3, d4) -> (d0, d2, d4, d1)>, affine_map<(d0, d1, d2, d3, d4) -> (d0, d4, d3, d1)>, affine_map<(d0, d1, d2, d3, d4) -> (d2, d3)>], iterator_types = [#vector.iterator_type<reduction>, #vector.iterator_type<reduction>, #vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<1x1x1x2xbf16>, vector<1x1x16x2xbf16>, vector<1x16xf32>) -> vector<1x16xf32> loc("<stdin>":7:10)
    "func.return"(%1) : (vector<1x16xf32>) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":5:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":12:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":13:12)
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.x86.vector_contract_to_packed_type_dot_product"() : () -> () loc("<stdin>":15:9)
      }) : (!transform.any_op) -> () loc("<stdin>":14:7)
      "transform.yield"() : () -> () loc("<stdin>":17:7)
    }) : () -> () loc("<stdin>":11:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":10:3)
}) : () -> () loc("<stdin>":4:1)
