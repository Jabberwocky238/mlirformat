"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf32>, vector<4xf32>, f32) -> f32, sym_name = "not_matmul"}> ({
  ^bb0(%arg36: vector<4xf32> loc("<stdin>":11:8), %arg37: vector<4xf32> loc("<stdin>":11:31), %arg38: f32 loc("<stdin>":11:54)):
    %18 = "vector.contract"(%arg36, %arg37, %arg38) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>], iterator_types = [#vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4xf32>, vector<4xf32>, f32) -> f32 loc("<stdin>":12:11)
    "func.return"(%18) : (f32) -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":10:3)
  "func.func"() <{function_type = (vector<4x4xi32>, vector<4x4xi32>, vector<4x4xi32>) -> vector<4x4xi32>, sym_name = "matmul_mk_nk_mn_4x4xi32"}> ({
  ^bb0(%arg33: vector<4x4xi32> loc("<stdin>":16:8), %arg34: vector<4x4xi32> loc("<stdin>":16:33), %arg35: vector<4x4xi32> loc("<stdin>":16:58)):
    %17 = "vector.contract"(%arg33, %arg34, %arg35) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x4xi32>, vector<4x4xi32>, vector<4x4xi32>) -> vector<4x4xi32> loc("<stdin>":17:11)
    "func.return"(%17) : (vector<4x4xi32>) -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":15:3)
  "func.func"() <{function_type = (vector<4x4xi32>, vector<4x4xi32>, vector<4x4xi32>) -> vector<4x4xi32>, sym_name = "matmul_mk_kn_mn_4x4xi32"}> ({
  ^bb0(%arg30: vector<4x4xi32> loc("<stdin>":21:8), %arg31: vector<4x4xi32> loc("<stdin>":21:33), %arg32: vector<4x4xi32> loc("<stdin>":21:58)):
    %16 = "vector.contract"(%arg30, %arg31, %arg32) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x4xi32>, vector<4x4xi32>, vector<4x4xi32>) -> vector<4x4xi32> loc("<stdin>":22:11)
    "func.return"(%16) : (vector<4x4xi32>) -> () loc("<stdin>":23:5)
  }) : () -> () loc("<stdin>":20:3)
  "func.func"() <{function_type = (vector<8x4xi8>, vector<4x16xi8>, vector<8x16xi32>) -> vector<8x16xi32>, sym_name = "matmul_mk_kn_mn_8x16xi8_extsi_i32"}> ({
  ^bb0(%arg27: vector<8x4xi8> loc("<stdin>":26:8), %arg28: vector<4x16xi8> loc("<stdin>":26:32), %arg29: vector<8x16xi32> loc("<stdin>":26:57)):
    %13 = "arith.extsi"(%arg27) : (vector<8x4xi8>) -> vector<8x4xi32> loc("<stdin>":27:11)
    %14 = "arith.extsi"(%arg28) : (vector<4x16xi8>) -> vector<4x16xi32> loc("<stdin>":28:11)
    %15 = "vector.contract"(%13, %14, %arg29) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<8x4xi32>, vector<4x16xi32>, vector<8x16xi32>) -> vector<8x16xi32> loc("<stdin>":29:11)
    "func.return"(%15) : (vector<8x16xi32>) -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":25:3)
  "func.func"() <{function_type = (vector<4x16xi32>, vector<16x4xi32>, vector<4x4xi32>) -> vector<4x4xi32>, sym_name = "matmul_mk_kn_mn_4x16xi32"}> ({
  ^bb0(%arg24: vector<4x16xi32> loc("<stdin>":33:8), %arg25: vector<16x4xi32> loc("<stdin>":33:34), %arg26: vector<4x4xi32> loc("<stdin>":33:60)):
    %12 = "vector.contract"(%arg24, %arg25, %arg26) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x16xi32>, vector<16x4xi32>, vector<4x4xi32>) -> vector<4x4xi32> loc("<stdin>":34:11)
    "func.return"(%12) : (vector<4x4xi32>) -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":32:3)
  "func.func"() <{function_type = (vector<8x4xi8>, vector<4x16xi8>, vector<8x16xi32>) -> vector<8x16xi32>, sym_name = "matmul_mk_kn_mn_8x16xi8_extui_i32"}> ({
  ^bb0(%arg21: vector<8x4xi8> loc("<stdin>":38:8), %arg22: vector<4x16xi8> loc("<stdin>":38:32), %arg23: vector<8x16xi32> loc("<stdin>":38:57)):
    %9 = "arith.extui"(%arg21) : (vector<8x4xi8>) -> vector<8x4xi32> loc("<stdin>":39:10)
    %10 = "arith.extui"(%arg22) : (vector<4x16xi8>) -> vector<4x16xi32> loc("<stdin>":40:11)
    %11 = "vector.contract"(%9, %10, %arg23) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<8x4xi32>, vector<4x16xi32>, vector<8x16xi32>) -> vector<8x16xi32> loc("<stdin>":41:11)
    "func.return"(%11) : (vector<8x16xi32>) -> () loc("<stdin>":42:5)
  }) : () -> () loc("<stdin>":37:3)
  "func.func"() <{function_type = (vector<4x4xi32>, vector<4x4xi32>, vector<4x4xi32>) -> vector<4x4xi32>, sym_name = "matmul_km_nk_mn_4x4xi32"}> ({
  ^bb0(%arg18: vector<4x4xi32> loc("<stdin>":45:8), %arg19: vector<4x4xi32> loc("<stdin>":45:33), %arg20: vector<4x4xi32> loc("<stdin>":45:58)):
    %8 = "vector.contract"(%arg18, %arg19, %arg20) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2) -> (d2, d0)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x4xi32>, vector<4x4xi32>, vector<4x4xi32>) -> vector<4x4xi32> loc("<stdin>":46:10)
    "func.return"(%8) : (vector<4x4xi32>) -> () loc("<stdin>":47:5)
  }) : () -> () loc("<stdin>":44:3)
  "func.func"() <{function_type = (vector<4x4xi32>, vector<4x4xi32>, vector<4x4xi32>) -> vector<4x4xi32>, sym_name = "matmul_km_kn_mn_4x4xi32"}> ({
  ^bb0(%arg15: vector<4x4xi32> loc("<stdin>":50:8), %arg16: vector<4x4xi32> loc("<stdin>":50:33), %arg17: vector<4x4xi32> loc("<stdin>":50:58)):
    %7 = "vector.contract"(%arg15, %arg16, %arg17) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2) -> (d2, d0)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x4xi32>, vector<4x4xi32>, vector<4x4xi32>) -> vector<4x4xi32> loc("<stdin>":51:10)
    "func.return"(%7) : (vector<4x4xi32>) -> () loc("<stdin>":52:5)
  }) : () -> () loc("<stdin>":49:3)
  "func.func"() <{function_type = (vector<4x8xi8>, vector<4x16xi8>, vector<8x16xi32>) -> vector<8x16xi32>, sym_name = "matmul_km_kn_mn_8x16xi8_mixed_ext_i32"}> ({
  ^bb0(%arg12: vector<4x8xi8> loc("<stdin>":55:8), %arg13: vector<4x16xi8> loc("<stdin>":55:32), %arg14: vector<8x16xi32> loc("<stdin>":55:57)):
    %4 = "arith.extsi"(%arg12) : (vector<4x8xi8>) -> vector<4x8xi32> loc("<stdin>":56:10)
    %5 = "arith.extui"(%arg13) : (vector<4x16xi8>) -> vector<4x16xi32> loc("<stdin>":57:10)
    %6 = "vector.contract"(%4, %5, %arg14) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2) -> (d2, d0)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x8xi32>, vector<4x16xi32>, vector<8x16xi32>) -> vector<8x16xi32> loc("<stdin>":58:10)
    "func.return"(%6) : (vector<8x16xi32>) -> () loc("<stdin>":59:5)
  }) : () -> () loc("<stdin>":54:3)
  "func.func"() <{function_type = (vector<4x4xi32>, vector<4x4xi32>, vector<4x4xi32>) -> vector<4x4xi32>, sym_name = "matmul_mk_nk_nm_4x4xi32"}> ({
  ^bb0(%arg9: vector<4x4xi32> loc("<stdin>":62:8), %arg10: vector<4x4xi32> loc("<stdin>":62:32), %arg11: vector<4x4xi32> loc("<stdin>":62:57)):
    %3 = "vector.contract"(%arg9, %arg10, %arg11) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d1, d0)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x4xi32>, vector<4x4xi32>, vector<4x4xi32>) -> vector<4x4xi32> loc("<stdin>":63:10)
    "func.return"(%3) : (vector<4x4xi32>) -> () loc("<stdin>":64:5)
  }) : () -> () loc("<stdin>":61:3)
  "func.func"() <{function_type = (vector<4x4xi32>, vector<4x4xi32>, vector<4x4xi32>) -> vector<4x4xi32>, sym_name = "matmul_km_kn_nm_4x4xi32"}> ({
  ^bb0(%arg6: vector<4x4xi32> loc("<stdin>":67:8), %arg7: vector<4x4xi32> loc("<stdin>":67:32), %arg8: vector<4x4xi32> loc("<stdin>":67:56)):
    %2 = "vector.contract"(%arg6, %arg7, %arg8) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2) -> (d2, d0)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d1, d0)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x4xi32>, vector<4x4xi32>, vector<4x4xi32>) -> vector<4x4xi32> loc("<stdin>":68:10)
    "func.return"(%2) : (vector<4x4xi32>) -> () loc("<stdin>":69:5)
  }) : () -> () loc("<stdin>":66:3)
  "func.func"() <{function_type = (vector<4x4xi32>, vector<4x4xi32>, vector<4x4xi32>) -> vector<4x4xi32>, sym_name = "matmul_mk_kn_nm_4x4xi32"}> ({
  ^bb0(%arg3: vector<4x4xi32> loc("<stdin>":72:8), %arg4: vector<4x4xi32> loc("<stdin>":72:32), %arg5: vector<4x4xi32> loc("<stdin>":72:56)):
    %1 = "vector.contract"(%arg3, %arg4, %arg5) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d1, d0)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x4xi32>, vector<4x4xi32>, vector<4x4xi32>) -> vector<4x4xi32> loc("<stdin>":73:10)
    "func.return"(%1) : (vector<4x4xi32>) -> () loc("<stdin>":74:5)
  }) : () -> () loc("<stdin>":71:3)
  "func.func"() <{function_type = (vector<4x4xi32>, vector<4x4xi32>, vector<4x4xi32>) -> vector<4x4xi32>, sym_name = "matmul_km_nk_nm_4x4xi32"}> ({
  ^bb0(%arg0: vector<4x4xi32> loc("<stdin>":77:8), %arg1: vector<4x4xi32> loc("<stdin>":77:32), %arg2: vector<4x4xi32> loc("<stdin>":77:56)):
    %0 = "vector.contract"(%arg0, %arg1, %arg2) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2) -> (d2, d0)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d1, d0)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x4xi32>, vector<4x4xi32>, vector<4x4xi32>) -> vector<4x4xi32> loc("<stdin>":78:10)
    "func.return"(%0) : (vector<4x4xi32>) -> () loc("<stdin>":79:5)
  }) : () -> () loc("<stdin>":76:3)
}) : () -> () loc("<stdin>":9:1)
