#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
#map2 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map4 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map5 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map6 = affine_map<(d0, d1, d2) -> (d2, d0)>
#map7 = affine_map<(d0, d1, d2) -> (d1, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf32>, vector<4xf32>, f32) -> f32, sym_name = "not_matmul"}> ({
  ^bb0(%arg36: vector<4xf32>, %arg37: vector<4xf32>, %arg38: f32):
    %18 = "vector.contract"(%arg36, %arg37, %arg38) <{indexing_maps = [#map, #map, #map1], iterator_types = [#vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4xf32>, vector<4xf32>, f32) -> f32
    "func.return"(%18) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x4xi32>, vector<4x4xi32>, vector<4x4xi32>) -> vector<4x4xi32>, sym_name = "matmul_mk_nk_mn_4x4xi32"}> ({
  ^bb0(%arg33: vector<4x4xi32>, %arg34: vector<4x4xi32>, %arg35: vector<4x4xi32>):
    %17 = "vector.contract"(%arg33, %arg34, %arg35) <{indexing_maps = [#map2, #map3, #map4], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x4xi32>, vector<4x4xi32>, vector<4x4xi32>) -> vector<4x4xi32>
    "func.return"(%17) : (vector<4x4xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x4xi32>, vector<4x4xi32>, vector<4x4xi32>) -> vector<4x4xi32>, sym_name = "matmul_mk_kn_mn_4x4xi32"}> ({
  ^bb0(%arg30: vector<4x4xi32>, %arg31: vector<4x4xi32>, %arg32: vector<4x4xi32>):
    %16 = "vector.contract"(%arg30, %arg31, %arg32) <{indexing_maps = [#map2, #map5, #map4], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x4xi32>, vector<4x4xi32>, vector<4x4xi32>) -> vector<4x4xi32>
    "func.return"(%16) : (vector<4x4xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8x4xi8>, vector<4x16xi8>, vector<8x16xi32>) -> vector<8x16xi32>, sym_name = "matmul_mk_kn_mn_8x16xi8_extsi_i32"}> ({
  ^bb0(%arg27: vector<8x4xi8>, %arg28: vector<4x16xi8>, %arg29: vector<8x16xi32>):
    %13 = "arith.extsi"(%arg27) : (vector<8x4xi8>) -> vector<8x4xi32>
    %14 = "arith.extsi"(%arg28) : (vector<4x16xi8>) -> vector<4x16xi32>
    %15 = "vector.contract"(%13, %14, %arg29) <{indexing_maps = [#map2, #map5, #map4], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<8x4xi32>, vector<4x16xi32>, vector<8x16xi32>) -> vector<8x16xi32>
    "func.return"(%15) : (vector<8x16xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x16xi32>, vector<16x4xi32>, vector<4x4xi32>) -> vector<4x4xi32>, sym_name = "matmul_mk_kn_mn_4x16xi32"}> ({
  ^bb0(%arg24: vector<4x16xi32>, %arg25: vector<16x4xi32>, %arg26: vector<4x4xi32>):
    %12 = "vector.contract"(%arg24, %arg25, %arg26) <{indexing_maps = [#map2, #map5, #map4], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x16xi32>, vector<16x4xi32>, vector<4x4xi32>) -> vector<4x4xi32>
    "func.return"(%12) : (vector<4x4xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8x4xi8>, vector<4x16xi8>, vector<8x16xi32>) -> vector<8x16xi32>, sym_name = "matmul_mk_kn_mn_8x16xi8_extui_i32"}> ({
  ^bb0(%arg21: vector<8x4xi8>, %arg22: vector<4x16xi8>, %arg23: vector<8x16xi32>):
    %9 = "arith.extui"(%arg21) : (vector<8x4xi8>) -> vector<8x4xi32>
    %10 = "arith.extui"(%arg22) : (vector<4x16xi8>) -> vector<4x16xi32>
    %11 = "vector.contract"(%9, %10, %arg23) <{indexing_maps = [#map2, #map5, #map4], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<8x4xi32>, vector<4x16xi32>, vector<8x16xi32>) -> vector<8x16xi32>
    "func.return"(%11) : (vector<8x16xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x4xi32>, vector<4x4xi32>, vector<4x4xi32>) -> vector<4x4xi32>, sym_name = "matmul_km_nk_mn_4x4xi32"}> ({
  ^bb0(%arg18: vector<4x4xi32>, %arg19: vector<4x4xi32>, %arg20: vector<4x4xi32>):
    %8 = "vector.contract"(%arg18, %arg19, %arg20) <{indexing_maps = [#map6, #map3, #map4], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x4xi32>, vector<4x4xi32>, vector<4x4xi32>) -> vector<4x4xi32>
    "func.return"(%8) : (vector<4x4xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x4xi32>, vector<4x4xi32>, vector<4x4xi32>) -> vector<4x4xi32>, sym_name = "matmul_km_kn_mn_4x4xi32"}> ({
  ^bb0(%arg15: vector<4x4xi32>, %arg16: vector<4x4xi32>, %arg17: vector<4x4xi32>):
    %7 = "vector.contract"(%arg15, %arg16, %arg17) <{indexing_maps = [#map6, #map5, #map4], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x4xi32>, vector<4x4xi32>, vector<4x4xi32>) -> vector<4x4xi32>
    "func.return"(%7) : (vector<4x4xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x8xi8>, vector<4x16xi8>, vector<8x16xi32>) -> vector<8x16xi32>, sym_name = "matmul_km_kn_mn_8x16xi8_mixed_ext_i32"}> ({
  ^bb0(%arg12: vector<4x8xi8>, %arg13: vector<4x16xi8>, %arg14: vector<8x16xi32>):
    %4 = "arith.extsi"(%arg12) : (vector<4x8xi8>) -> vector<4x8xi32>
    %5 = "arith.extui"(%arg13) : (vector<4x16xi8>) -> vector<4x16xi32>
    %6 = "vector.contract"(%4, %5, %arg14) <{indexing_maps = [#map6, #map5, #map4], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x8xi32>, vector<4x16xi32>, vector<8x16xi32>) -> vector<8x16xi32>
    "func.return"(%6) : (vector<8x16xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x4xi32>, vector<4x4xi32>, vector<4x4xi32>) -> vector<4x4xi32>, sym_name = "matmul_mk_nk_nm_4x4xi32"}> ({
  ^bb0(%arg9: vector<4x4xi32>, %arg10: vector<4x4xi32>, %arg11: vector<4x4xi32>):
    %3 = "vector.contract"(%arg9, %arg10, %arg11) <{indexing_maps = [#map2, #map3, #map7], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x4xi32>, vector<4x4xi32>, vector<4x4xi32>) -> vector<4x4xi32>
    "func.return"(%3) : (vector<4x4xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x4xi32>, vector<4x4xi32>, vector<4x4xi32>) -> vector<4x4xi32>, sym_name = "matmul_km_kn_nm_4x4xi32"}> ({
  ^bb0(%arg6: vector<4x4xi32>, %arg7: vector<4x4xi32>, %arg8: vector<4x4xi32>):
    %2 = "vector.contract"(%arg6, %arg7, %arg8) <{indexing_maps = [#map6, #map5, #map7], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x4xi32>, vector<4x4xi32>, vector<4x4xi32>) -> vector<4x4xi32>
    "func.return"(%2) : (vector<4x4xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x4xi32>, vector<4x4xi32>, vector<4x4xi32>) -> vector<4x4xi32>, sym_name = "matmul_mk_kn_nm_4x4xi32"}> ({
  ^bb0(%arg3: vector<4x4xi32>, %arg4: vector<4x4xi32>, %arg5: vector<4x4xi32>):
    %1 = "vector.contract"(%arg3, %arg4, %arg5) <{indexing_maps = [#map2, #map5, #map7], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x4xi32>, vector<4x4xi32>, vector<4x4xi32>) -> vector<4x4xi32>
    "func.return"(%1) : (vector<4x4xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x4xi32>, vector<4x4xi32>, vector<4x4xi32>) -> vector<4x4xi32>, sym_name = "matmul_km_nk_nm_4x4xi32"}> ({
  ^bb0(%arg0: vector<4x4xi32>, %arg1: vector<4x4xi32>, %arg2: vector<4x4xi32>):
    %0 = "vector.contract"(%arg0, %arg1, %arg2) <{indexing_maps = [#map6, #map3, #map7], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x4xi32>, vector<4x4xi32>, vector<4x4xi32>) -> vector<4x4xi32>
    "func.return"(%0) : (vector<4x4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

