"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x8xbf16>, vector<4x8xbf16>, vector<4x4xf32>) -> vector<4x4xf32>, sym_name = "vector_contract_to_bfmmla"}> ({
  ^bb0(%arg4: vector<4x8xbf16> loc("<stdin>":9:8), %arg5: vector<4x8xbf16> loc("<stdin>":9:33), %arg6: vector<4x4xf32> loc("<stdin>":9:58)):
    %2 = "vector.contract"(%arg4, %arg5, %arg6) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x8xbf16>, vector<4x8xbf16>, vector<4x4xf32>) -> vector<4x4xf32> loc("<stdin>":10:10)
    "func.return"(%2) : (vector<4x4xf32>) -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = (vector<8xbf16>, vector<4x8xbf16>, vector<4xf32>) -> vector<4xf32>, sym_name = "vector_contract_vecmat_to_bfmmla"}> ({
  ^bb0(%arg1: vector<8xbf16> loc("<stdin>":14:8), %arg2: vector<4x8xbf16> loc("<stdin>":14:31), %arg3: vector<4xf32> loc("<stdin>":14:56)):
    %1 = "vector.contract"(%arg1, %arg2, %arg3) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<8xbf16>, vector<4x8xbf16>, vector<4xf32>) -> vector<4xf32> loc("<stdin>":15:10)
    "func.return"(%1) : (vector<4xf32>) -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":13:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":20:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func"> loc("<stdin>":21:12)
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.arm_neon.vector_contract_to_bfmmla"() : () -> () loc("<stdin>":23:9)
      }) : (!transform.op<"func.func">) -> () loc("<stdin>":22:7)
      "transform.yield"() : () -> () loc("<stdin>":25:7)
    }) : () -> () loc("<stdin>":19:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":18:3)
}) : () -> () loc("<stdin>":7:1)
