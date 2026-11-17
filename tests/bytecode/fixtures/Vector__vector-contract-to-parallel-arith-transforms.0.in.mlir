"builtin.module"() ({
  "func.func"() <{function_type = (vector<1x1x4xf32>, vector<1x1x4xf32>, vector<4xf32>) -> vector<4xf32>, sym_name = "parallel_contract_lowering"}> ({
  ^bb0(%arg13: vector<1x1x4xf32> loc("<stdin>":11:8), %arg14: vector<1x1x4xf32> loc("<stdin>":11:35), %arg15: vector<4xf32> loc("<stdin>":11:62)):
    %5 = "vector.contract"(%arg13, %arg14, %arg15) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2) -> (d1, d2, d0)>, affine_map<(d0, d1, d2) -> (d1, d2, d0)>, affine_map<(d0, d1, d2) -> (d0)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<1x1x4xf32>, vector<1x1x4xf32>, vector<4xf32>) -> vector<4xf32> loc("<stdin>":12:10)
    "func.return"(%5) : (vector<4xf32>) -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":10:3)
  "func.func"() <{function_type = (vector<1x1xf32>, vector<1x1x4xf32>, vector<4xf32>) -> vector<4xf32>, sym_name = "parallel_contract_lowering_broadcast"}> ({
  ^bb0(%arg10: vector<1x1xf32> loc("<stdin>":16:8), %arg11: vector<1x1x4xf32> loc("<stdin>":16:33), %arg12: vector<4xf32> loc("<stdin>":16:60)):
    %4 = "vector.contract"(%arg10, %arg11, %arg12) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d1, d2, d0)>, affine_map<(d0, d1, d2) -> (d0)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<1x1xf32>, vector<1x1x4xf32>, vector<4xf32>) -> vector<4xf32> loc("<stdin>":17:10)
    "func.return"(%4) : (vector<4xf32>) -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":15:3)
  "func.func"() <{function_type = (vector<1x1xf32>, vector<1x4x1xf32>, vector<4xf32>) -> vector<4xf32>, sym_name = "parallel_contract_lowering_transpose"}> ({
  ^bb0(%arg7: vector<1x1xf32> loc("<stdin>":21:8), %arg8: vector<1x4x1xf32> loc("<stdin>":21:32), %arg9: vector<4xf32> loc("<stdin>":21:58)):
    %3 = "vector.contract"(%arg7, %arg8, %arg9) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d1, d0, d2)>, affine_map<(d0, d1, d2) -> (d0)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<1x1xf32>, vector<1x4x1xf32>, vector<4xf32>) -> vector<4xf32> loc("<stdin>":22:10)
    "func.return"(%3) : (vector<4xf32>) -> () loc("<stdin>":23:5)
  }) : () -> () loc("<stdin>":20:3)
  "func.func"() <{function_type = (vector<1x1xf32>, vector<1x1xf32>, f32) -> f32, sym_name = "parallel_contract_lowering_scalar"}> ({
  ^bb0(%arg4: vector<1x1xf32> loc("<stdin>":26:8), %arg5: vector<1x1xf32> loc("<stdin>":26:32), %arg6: f32 loc("<stdin>":26:56)):
    %2 = "vector.contract"(%arg4, %arg5, %arg6) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> ()>], iterator_types = [#vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<1x1xf32>, vector<1x1xf32>, f32) -> f32 loc("<stdin>":27:10)
    "func.return"(%2) : (f32) -> () loc("<stdin>":28:5)
  }) : () -> () loc("<stdin>":25:3)
  "func.func"() <{function_type = (vector<3x2xf32>, vector<3x2xf32>, vector<2xf32>) -> vector<2xf32>, sym_name = "parallel_contract_lowering_non_unit_parallel"}> ({
  ^bb0(%arg1: vector<3x2xf32> loc("<stdin>":31:8), %arg2: vector<3x2xf32> loc("<stdin>":31:32), %arg3: vector<2xf32> loc("<stdin>":31:56)):
    %1 = "vector.contract"(%arg1, %arg2, %arg3) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1) -> (d1, d0)>, affine_map<(d0, d1) -> (d1, d0)>, affine_map<(d0, d1) -> (d0)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<3x2xf32>, vector<3x2xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":32:10)
    "func.return"(%1) : (vector<2xf32>) -> () loc("<stdin>":33:5)
  }) : () -> () loc("<stdin>":30:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":37:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":38:12)
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_contraction"() <{lowering_strategy = 3 : i32}> : () -> () loc("<stdin>":40:9)
      }) : (!transform.any_op) -> () loc("<stdin>":39:7)
      "transform.yield"() : () -> () loc("<stdin>":42:7)
    }) : () -> () loc("<stdin>":36:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":35:3)
}) : () -> () loc("<stdin>":9:1)
