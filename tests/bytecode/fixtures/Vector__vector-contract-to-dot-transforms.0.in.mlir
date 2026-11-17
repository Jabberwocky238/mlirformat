"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf32>, vector<4xf32>, f32) -> f32, sym_name = "extract_contract1"}> ({
  ^bb0(%arg41: vector<4xf32> loc("<stdin>":15:8), %arg42: vector<4xf32> loc("<stdin>":15:31), %arg43: f32 loc("<stdin>":15:54)):
    %15 = "vector.contract"(%arg41, %arg42, %arg43) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>], iterator_types = [#vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4xf32>, vector<4xf32>, f32) -> f32 loc("<stdin>":16:11)
    "func.return"(%15) : (f32) -> () loc("<stdin>":17:5)
  }) : () -> () loc("<stdin>":14:3)
  "func.func"() <{function_type = (vector<4xf32>, vector<4xf32>, f32, vector<4xi1>) -> f32, sym_name = "masked_extract_contract1"}> ({
  ^bb0(%arg37: vector<4xf32> loc("<stdin>":20:8), %arg38: vector<4xf32> loc("<stdin>":20:31), %arg39: f32 loc("<stdin>":20:54), %arg40: vector<4xi1> loc("<stdin>":20:67)):
    %13 = "vector.mask"(%arg40) ({
      %14 = "vector.contract"(%arg37, %arg38, %arg39) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>], iterator_types = [#vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4xf32>, vector<4xf32>, f32) -> f32 loc("<stdin>":22:13)
      "vector.yield"(%14) : (f32) -> () loc("<stdin>":23:7)
    }) : (vector<4xi1>) -> f32 loc("<stdin>":21:11)
    "func.return"(%13) : (f32) -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":19:3)
  "func.func"() <{function_type = (vector<4xi32>, vector<4xi32>, i32) -> i32, sym_name = "extract_contract1_int"}> ({
  ^bb0(%arg34: vector<4xi32> loc("<stdin>":28:8), %arg35: vector<4xi32> loc("<stdin>":28:31), %arg36: i32 loc("<stdin>":28:54)):
    %12 = "vector.contract"(%arg34, %arg35, %arg36) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>], iterator_types = [#vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4xi32>, vector<4xi32>, i32) -> i32 loc("<stdin>":29:11)
    "func.return"(%12) : (i32) -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":27:3)
  "func.func"() <{function_type = (vector<2x3xf32>, vector<3xf32>, vector<2xf32>) -> vector<2xf32>, sym_name = "extract_contract2"}> ({
  ^bb0(%arg31: vector<2x3xf32> loc("<stdin>":33:8), %arg32: vector<3xf32> loc("<stdin>":33:33), %arg33: vector<2xf32> loc("<stdin>":33:56)):
    %11 = "vector.contract"(%arg31, %arg32, %arg33) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x3xf32>, vector<3xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":34:11)
    "func.return"(%11) : (vector<2xf32>) -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":32:3)
  "func.func"() <{function_type = (vector<2x3xi32>, vector<3xi32>, vector<2xi32>) -> vector<2xi32>, sym_name = "extract_contract2_int"}> ({
  ^bb0(%arg28: vector<2x3xi32> loc("<stdin>":38:8), %arg29: vector<3xi32> loc("<stdin>":38:33), %arg30: vector<2xi32> loc("<stdin>":38:56)):
    %10 = "vector.contract"(%arg28, %arg29, %arg30) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x3xi32>, vector<3xi32>, vector<2xi32>) -> vector<2xi32> loc("<stdin>":39:11)
    "func.return"(%10) : (vector<2xi32>) -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":37:3)
  "func.func"() <{function_type = (vector<3xf32>, vector<2x3xf32>, vector<2xf32>) -> vector<2xf32>, sym_name = "extract_contract3"}> ({
  ^bb0(%arg25: vector<3xf32> loc("<stdin>":43:8), %arg26: vector<2x3xf32> loc("<stdin>":43:31), %arg27: vector<2xf32> loc("<stdin>":43:56)):
    %9 = "vector.contract"(%arg25, %arg26, %arg27) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<3xf32>, vector<2x3xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":44:10)
    "func.return"(%9) : (vector<2xf32>) -> () loc("<stdin>":45:5)
  }) : () -> () loc("<stdin>":42:3)
  "func.func"() <{function_type = (vector<2x2xf32>, vector<2x2xf32>, vector<2x2xf32>) -> vector<2x2xf32>, sym_name = "contract_to_dot_matmat"}> ({
  ^bb0(%arg22: vector<2x2xf32> loc("<stdin>":48:8), %arg23: vector<2x2xf32> loc("<stdin>":48:33), %arg24: vector<2x2xf32> loc("<stdin>":48:58)):
    %8 = "vector.contract"(%arg22, %arg23, %arg24) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x2xf32>, vector<2x2xf32>, vector<2x2xf32>) -> vector<2x2xf32> loc("<stdin>":49:10)
    "func.return"(%8) : (vector<2x2xf32>) -> () loc("<stdin>":50:5)
  }) : () -> () loc("<stdin>":47:3)
  "func.func"() <{function_type = (vector<2x3xf32>, vector<2x3xf32>, f32) -> f32, sym_name = "full_contract1"}> ({
  ^bb0(%arg19: vector<2x3xf32> loc("<stdin>":53:8), %arg20: vector<2x3xf32> loc("<stdin>":53:33), %arg21: f32 loc("<stdin>":53:58)):
    %7 = "vector.contract"(%arg19, %arg20, %arg21) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> ()>], iterator_types = [#vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x3xf32>, vector<2x3xf32>, f32) -> f32 loc("<stdin>":54:10)
    "func.return"(%7) : (f32) -> () loc("<stdin>":55:5)
  }) : () -> () loc("<stdin>":52:3)
  "func.func"() <{function_type = (vector<2x3xf32>, vector<3x2xf32>, f32) -> f32, sym_name = "full_contract2"}> ({
  ^bb0(%arg16: vector<2x3xf32> loc("<stdin>":58:8), %arg17: vector<3x2xf32> loc("<stdin>":58:33), %arg18: f32 loc("<stdin>":58:58)):
    %6 = "vector.contract"(%arg16, %arg17, %arg18) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1, d0)>, affine_map<(d0, d1) -> ()>], iterator_types = [#vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x3xf32>, vector<3x2xf32>, f32) -> f32 loc("<stdin>":59:10)
    "func.return"(%6) : (f32) -> () loc("<stdin>":60:5)
  }) : () -> () loc("<stdin>":57:3)
  "func.func"() <{function_type = (vector<1x2xi32>, vector<2x2xi32>, vector<2xi32>) -> vector<2xi32>, sym_name = "contract_one_sided_unit_reduction_dim"}> ({
  ^bb0(%arg13: vector<1x2xi32> loc("<stdin>":63:8), %arg14: vector<2x2xi32> loc("<stdin>":63:33), %arg15: vector<2xi32> loc("<stdin>":63:58)):
    %5 = "vector.contract"(%arg13, %arg14, %arg15) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d1)>], iterator_types = [#vector.iterator_type<reduction>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<1x2xi32>, vector<2x2xi32>, vector<2xi32>) -> vector<2xi32> loc("<stdin>":64:10)
    "func.return"(%5) : (vector<2xi32>) -> () loc("<stdin>":65:5)
  }) : () -> () loc("<stdin>":62:3)
  "func.func"() <{function_type = (vector<2x3xf32>, vector<3xf32>, vector<2xf32>) -> vector<2xf32>, sym_name = "extract_contract2_fmf"}> ({
  ^bb0(%arg10: vector<2x3xf32> loc("<stdin>":68:8), %arg11: vector<3xf32> loc("<stdin>":68:33), %arg12: vector<2xf32> loc("<stdin>":68:56)):
    %4 = "vector.contract"(%arg10, %arg11, %arg12) <{fastmath = #arith.fastmath<contract>, indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x3xf32>, vector<3xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":69:10)
    "func.return"(%4) : (vector<2xf32>) -> () loc("<stdin>":70:5)
  }) : () -> () loc("<stdin>":67:3)
  "func.func"() <{function_type = (vector<2x2xf32>, vector<2x2xf32>, vector<2x2xf32>) -> vector<2x2xf32>, sym_name = "contract_to_dot_matmat_fmf"}> ({
  ^bb0(%arg7: vector<2x2xf32> loc("<stdin>":73:8), %arg8: vector<2x2xf32> loc("<stdin>":73:32), %arg9: vector<2x2xf32> loc("<stdin>":73:56)):
    %3 = "vector.contract"(%arg7, %arg8, %arg9) <{fastmath = #arith.fastmath<contract>, indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x2xf32>, vector<2x2xf32>, vector<2x2xf32>) -> vector<2x2xf32> loc("<stdin>":74:10)
    "func.return"(%3) : (vector<2x2xf32>) -> () loc("<stdin>":75:5)
  }) : () -> () loc("<stdin>":72:3)
  "func.func"() <{function_type = (vector<2x3xf32>, vector<2x3xf32>, f32) -> f32, sym_name = "full_contract1_fmf"}> ({
  ^bb0(%arg4: vector<2x3xf32> loc("<stdin>":78:8), %arg5: vector<2x3xf32> loc("<stdin>":78:32), %arg6: f32 loc("<stdin>":78:56)):
    %2 = "vector.contract"(%arg4, %arg5, %arg6) <{fastmath = #arith.fastmath<reassoc>, indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> ()>], iterator_types = [#vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x3xf32>, vector<2x3xf32>, f32) -> f32 loc("<stdin>":79:10)
    "func.return"(%2) : (f32) -> () loc("<stdin>":80:5)
  }) : () -> () loc("<stdin>":77:3)
  "func.func"() <{function_type = (vector<2x2xf32>, vector<2x2xf32>, vector<2xf32>) -> vector<2xf32>, sym_name = "batch_contract_fmf"}> ({
  ^bb0(%arg1: vector<2x2xf32> loc("<stdin>":83:8), %arg2: vector<2x2xf32> loc("<stdin>":83:32), %arg3: vector<2xf32> loc("<stdin>":83:56)):
    %1 = "vector.contract"(%arg1, %arg2, %arg3) <{fastmath = #arith.fastmath<reassoc>, indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x2xf32>, vector<2x2xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":84:10)
    "func.return"(%1) : (vector<2xf32>) -> () loc("<stdin>":85:5)
  }) : () -> () loc("<stdin>":82:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":89:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":90:12)
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_contraction"() <{lowering_strategy = 0 : i32}> : () -> () loc("<stdin>":92:9)
      }) : (!transform.any_op) -> () loc("<stdin>":91:7)
      "transform.yield"() : () -> () loc("<stdin>":94:7)
    }) : () -> () loc("<stdin>":88:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":87:3)
}) : () -> () loc("<stdin>":13:1)
