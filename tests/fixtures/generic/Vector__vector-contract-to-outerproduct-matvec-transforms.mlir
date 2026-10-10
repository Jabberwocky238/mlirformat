#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
#map2 = affine_map<(d0, d1) -> (d0)>
#map3 = affine_map<(d0, d1) -> (d1, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32>, sym_name = "matvec_mk_k_m"}> ({
  ^bb0(%arg101: vector<2x2xf32>, %arg102: vector<2xf32>, %arg103: vector<2xf32>):
    %47 = "vector.contract"(%arg101, %arg102, %arg103) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32>
    "func.return"(%47) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x3xf32>, vector<3xf32>, vector<2xf32>, vector<2x3xi1>) -> vector<2xf32>, sym_name = "masked_matvec_mk_k_m"}> ({
  ^bb0(%arg97: vector<2x3xf32>, %arg98: vector<3xf32>, %arg99: vector<2xf32>, %arg100: vector<2x3xi1>):
    %45 = "vector.mask"(%arg100) ({
      %46 = "vector.contract"(%arg97, %arg98, %arg99) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x3xf32>, vector<3xf32>, vector<2xf32>) -> vector<2xf32>
      "vector.yield"(%46) : (vector<2xf32>) -> ()
    }) : (vector<2x3xi1>) -> vector<2xf32>
    "func.return"(%45) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[2]x3xf32>, vector<3xf32>, vector<[2]xf32>, vector<[2]x3xi1>) -> vector<[2]xf32>, sym_name = "masked_matvec_mk_k_m_scalable_parallel_dim"}> ({
  ^bb0(%arg93: vector<[2]x3xf32>, %arg94: vector<3xf32>, %arg95: vector<[2]xf32>, %arg96: vector<[2]x3xi1>):
    %43 = "vector.mask"(%arg96) ({
      %44 = "vector.contract"(%arg93, %arg94, %arg95) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<[2]x3xf32>, vector<3xf32>, vector<[2]xf32>) -> vector<[2]xf32>
      "vector.yield"(%44) : (vector<[2]xf32>) -> ()
    }) : (vector<[2]x3xi1>) -> vector<[2]xf32>
    "func.return"(%43) : (vector<[2]xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32>, sym_name = "matvec_mk_k_m_max"}> ({
  ^bb0(%arg90: vector<2x2xf32>, %arg91: vector<2xf32>, %arg92: vector<2xf32>):
    %42 = "vector.contract"(%arg90, %arg91, %arg92) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<maxnumf>}> : (vector<2x2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32>
    "func.return"(%42) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x3xf32>, vector<3xf32>, vector<2xf32>, vector<2x3xi1>) -> vector<2xf32>, sym_name = "masked_matvec_mk_k_m_max"}> ({
  ^bb0(%arg86: vector<2x3xf32>, %arg87: vector<3xf32>, %arg88: vector<2xf32>, %arg89: vector<2x3xi1>):
    %40 = "vector.mask"(%arg89) ({
      %41 = "vector.contract"(%arg86, %arg87, %arg88) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<maxnumf>}> : (vector<2x3xf32>, vector<3xf32>, vector<2xf32>) -> vector<2xf32>
      "vector.yield"(%41) : (vector<2xf32>) -> ()
    }) : (vector<2x3xi1>) -> vector<2xf32>
    "func.return"(%40) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[2]x3xf32>, vector<3xf32>, vector<[2]xf32>, vector<[2]x3xi1>) -> vector<[2]xf32>, sym_name = "masked_matvec_mk_k_m_max_scalable_parallel_dim"}> ({
  ^bb0(%arg82: vector<[2]x3xf32>, %arg83: vector<3xf32>, %arg84: vector<[2]xf32>, %arg85: vector<[2]x3xi1>):
    %38 = "vector.mask"(%arg85) ({
      %39 = "vector.contract"(%arg82, %arg83, %arg84) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<maxnumf>}> : (vector<[2]x3xf32>, vector<3xf32>, vector<[2]xf32>) -> vector<[2]xf32>
      "vector.yield"(%39) : (vector<[2]xf32>) -> ()
    }) : (vector<[2]x3xi1>) -> vector<[2]xf32>
    "func.return"(%38) : (vector<[2]xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32>, sym_name = "matvec_km_k_m"}> ({
  ^bb0(%arg79: vector<2x2xf32>, %arg80: vector<2xf32>, %arg81: vector<2xf32>):
    %37 = "vector.contract"(%arg79, %arg80, %arg81) <{indexing_maps = [#map3, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32>
    "func.return"(%37) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x4xf32>, vector<2xf32>, vector<4xf32>, vector<4x2xi1>) -> vector<4xf32>, sym_name = "masked_matvec_km_k_m"}> ({
  ^bb0(%arg75: vector<2x4xf32>, %arg76: vector<2xf32>, %arg77: vector<4xf32>, %arg78: vector<4x2xi1>):
    %35 = "vector.mask"(%arg78) ({
      %36 = "vector.contract"(%arg75, %arg76, %arg77) <{indexing_maps = [#map3, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x4xf32>, vector<2xf32>, vector<4xf32>) -> vector<4xf32>
      "vector.yield"(%36) : (vector<4xf32>) -> ()
    }) : (vector<4x2xi1>) -> vector<4xf32>
    "func.return"(%35) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x[4]xf32>, vector<2xf32>, vector<[4]xf32>, vector<[4]x2xi1>) -> vector<[4]xf32>, sym_name = "masked_matvec_km_k_m_scalable_parallel_dim"}> ({
  ^bb0(%arg71: vector<2x[4]xf32>, %arg72: vector<2xf32>, %arg73: vector<[4]xf32>, %arg74: vector<[4]x2xi1>):
    %33 = "vector.mask"(%arg74) ({
      %34 = "vector.contract"(%arg71, %arg72, %arg73) <{indexing_maps = [#map3, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x[4]xf32>, vector<2xf32>, vector<[4]xf32>) -> vector<[4]xf32>
      "vector.yield"(%34) : (vector<[4]xf32>) -> ()
    }) : (vector<[4]x2xi1>) -> vector<[4]xf32>
    "func.return"(%33) : (vector<[4]xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32>, sym_name = "matvec_k_mk_m"}> ({
  ^bb0(%arg68: vector<2x2xf32>, %arg69: vector<2xf32>, %arg70: vector<2xf32>):
    %32 = "vector.contract"(%arg69, %arg68, %arg70) <{indexing_maps = [#map1, #map, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2xf32>, vector<2x2xf32>, vector<2xf32>) -> vector<2xf32>
    "func.return"(%32) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x2xf32>, vector<2xf32>, vector<4xf32>, vector<4x2xi1>) -> vector<4xf32>, sym_name = "masked_matvec_k_mk_m"}> ({
  ^bb0(%arg64: vector<4x2xf32>, %arg65: vector<2xf32>, %arg66: vector<4xf32>, %arg67: vector<4x2xi1>):
    %30 = "vector.mask"(%arg67) ({
      %31 = "vector.contract"(%arg65, %arg64, %arg66) <{indexing_maps = [#map1, #map, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2xf32>, vector<4x2xf32>, vector<4xf32>) -> vector<4xf32>
      "vector.yield"(%31) : (vector<4xf32>) -> ()
    }) : (vector<4x2xi1>) -> vector<4xf32>
    "func.return"(%30) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[4]x2xf32>, vector<2xf32>, vector<[4]xf32>, vector<[4]x2xi1>) -> vector<[4]xf32>, sym_name = "masked_matvec_k_mk_m_scalable_parallel_dim"}> ({
  ^bb0(%arg60: vector<[4]x2xf32>, %arg61: vector<2xf32>, %arg62: vector<[4]xf32>, %arg63: vector<[4]x2xi1>):
    %28 = "vector.mask"(%arg63) ({
      %29 = "vector.contract"(%arg61, %arg60, %arg62) <{indexing_maps = [#map1, #map, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2xf32>, vector<[4]x2xf32>, vector<[4]xf32>) -> vector<[4]xf32>
      "vector.yield"(%29) : (vector<[4]xf32>) -> ()
    }) : (vector<[4]x2xi1>) -> vector<[4]xf32>
    "func.return"(%28) : (vector<[4]xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32>, sym_name = "matvec_k_km_m"}> ({
  ^bb0(%arg57: vector<2x2xf32>, %arg58: vector<2xf32>, %arg59: vector<2xf32>):
    %27 = "vector.contract"(%arg58, %arg57, %arg59) <{indexing_maps = [#map1, #map3, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2xf32>, vector<2x2xf32>, vector<2xf32>) -> vector<2xf32>
    "func.return"(%27) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x[4]xf32>, vector<2xf32>, vector<[4]xf32>, vector<[4]x2xi1>) -> vector<[4]xf32>, sym_name = "masked_matvec_k_km_m_scalable_parallel_dim"}> ({
  ^bb0(%arg53: vector<2x[4]xf32>, %arg54: vector<2xf32>, %arg55: vector<[4]xf32>, %arg56: vector<[4]x2xi1>):
    %25 = "vector.mask"(%arg56) ({
      %26 = "vector.contract"(%arg54, %arg53, %arg55) <{indexing_maps = [#map1, #map3, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2xf32>, vector<2x[4]xf32>, vector<[4]xf32>) -> vector<[4]xf32>
      "vector.yield"(%26) : (vector<[4]xf32>) -> ()
    }) : (vector<[4]x2xi1>) -> vector<[4]xf32>
    "func.return"(%25) : (vector<[4]xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x4xf32>, vector<2xf32>, vector<4xf32>, vector<4x2xi1>) -> vector<4xf32>, sym_name = "masked_matvec_k_km_m"}> ({
  ^bb0(%arg49: vector<2x4xf32>, %arg50: vector<2xf32>, %arg51: vector<4xf32>, %arg52: vector<4x2xi1>):
    %23 = "vector.mask"(%arg52) ({
      %24 = "vector.contract"(%arg50, %arg49, %arg51) <{indexing_maps = [#map1, #map3, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2xf32>, vector<2x4xf32>, vector<4xf32>) -> vector<4xf32>
      "vector.yield"(%24) : (vector<4xf32>) -> ()
    }) : (vector<4x2xi1>) -> vector<4xf32>
    "func.return"(%23) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32>, sym_name = "tmatvec_mk_k_m"}> ({
  ^bb0(%arg46: vector<2x2xf32>, %arg47: vector<2xf32>, %arg48: vector<2xf32>):
    %22 = "vector.contract"(%arg46, %arg47, %arg48) <{indexing_maps = [#map3, #map2, #map1], iterator_types = [#vector.iterator_type<reduction>, #vector.iterator_type<parallel>], kind = #vector.kind<add>}> : (vector<2x2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32>
    "func.return"(%22) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x2xf32>, vector<2xf32>, vector<4xf32>, vector<2x4xi1>) -> vector<4xf32>, sym_name = "masked_tmatvec_mk_k_m"}> ({
  ^bb0(%arg42: vector<4x2xf32>, %arg43: vector<2xf32>, %arg44: vector<4xf32>, %arg45: vector<2x4xi1>):
    %20 = "vector.mask"(%arg45) ({
      %21 = "vector.contract"(%arg42, %arg43, %arg44) <{indexing_maps = [#map3, #map2, #map1], iterator_types = [#vector.iterator_type<reduction>, #vector.iterator_type<parallel>], kind = #vector.kind<add>}> : (vector<4x2xf32>, vector<2xf32>, vector<4xf32>) -> vector<4xf32>
      "vector.yield"(%21) : (vector<4xf32>) -> ()
    }) : (vector<2x4xi1>) -> vector<4xf32>
    "func.return"(%20) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[4]x2xf32>, vector<2xf32>, vector<[4]xf32>, vector<2x[4]xi1>) -> vector<[4]xf32>, sym_name = "masked_tmatvec_mk_k_m_scalable_parallel_dim"}> ({
  ^bb0(%arg38: vector<[4]x2xf32>, %arg39: vector<2xf32>, %arg40: vector<[4]xf32>, %arg41: vector<2x[4]xi1>):
    %18 = "vector.mask"(%arg41) ({
      %19 = "vector.contract"(%arg38, %arg39, %arg40) <{indexing_maps = [#map3, #map2, #map1], iterator_types = [#vector.iterator_type<reduction>, #vector.iterator_type<parallel>], kind = #vector.kind<add>}> : (vector<[4]x2xf32>, vector<2xf32>, vector<[4]xf32>) -> vector<[4]xf32>
      "vector.yield"(%19) : (vector<[4]xf32>) -> ()
    }) : (vector<2x[4]xi1>) -> vector<[4]xf32>
    "func.return"(%18) : (vector<[4]xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32>, sym_name = "tmatvec_km_k_m"}> ({
  ^bb0(%arg35: vector<2x2xf32>, %arg36: vector<2xf32>, %arg37: vector<2xf32>):
    %17 = "vector.contract"(%arg35, %arg36, %arg37) <{indexing_maps = [#map, #map2, #map1], iterator_types = [#vector.iterator_type<reduction>, #vector.iterator_type<parallel>], kind = #vector.kind<add>}> : (vector<2x2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32>
    "func.return"(%17) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x4xf32>, vector<2xf32>, vector<4xf32>, vector<2x4xi1>) -> vector<4xf32>, sym_name = "masked_tmatvec_km_k_m"}> ({
  ^bb0(%arg31: vector<2x4xf32>, %arg32: vector<2xf32>, %arg33: vector<4xf32>, %arg34: vector<2x4xi1>):
    %15 = "vector.mask"(%arg34) ({
      %16 = "vector.contract"(%arg31, %arg32, %arg33) <{indexing_maps = [#map, #map2, #map1], iterator_types = [#vector.iterator_type<reduction>, #vector.iterator_type<parallel>], kind = #vector.kind<add>}> : (vector<2x4xf32>, vector<2xf32>, vector<4xf32>) -> vector<4xf32>
      "vector.yield"(%16) : (vector<4xf32>) -> ()
    }) : (vector<2x4xi1>) -> vector<4xf32>
    "func.return"(%15) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x[4]xf32>, vector<2xf32>, vector<[4]xf32>, vector<2x[4]xi1>) -> vector<[4]xf32>, sym_name = "masked_tmatvec_km_k_m_scalable_parallel_dim"}> ({
  ^bb0(%arg27: vector<2x[4]xf32>, %arg28: vector<2xf32>, %arg29: vector<[4]xf32>, %arg30: vector<2x[4]xi1>):
    %13 = "vector.mask"(%arg30) ({
      %14 = "vector.contract"(%arg27, %arg28, %arg29) <{indexing_maps = [#map, #map2, #map1], iterator_types = [#vector.iterator_type<reduction>, #vector.iterator_type<parallel>], kind = #vector.kind<add>}> : (vector<2x[4]xf32>, vector<2xf32>, vector<[4]xf32>) -> vector<[4]xf32>
      "vector.yield"(%14) : (vector<[4]xf32>) -> ()
    }) : (vector<2x[4]xi1>) -> vector<[4]xf32>
    "func.return"(%13) : (vector<[4]xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32>, sym_name = "tmatvec_k_mk_m"}> ({
  ^bb0(%arg24: vector<2x2xf32>, %arg25: vector<2xf32>, %arg26: vector<2xf32>):
    %12 = "vector.contract"(%arg25, %arg24, %arg26) <{indexing_maps = [#map2, #map3, #map1], iterator_types = [#vector.iterator_type<reduction>, #vector.iterator_type<parallel>], kind = #vector.kind<add>}> : (vector<2xf32>, vector<2x2xf32>, vector<2xf32>) -> vector<2xf32>
    "func.return"(%12) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x2xf32>, vector<2xf32>, vector<4xf32>, vector<2x4xi1>) -> vector<4xf32>, sym_name = "masked_tmatvec_k_mk_m"}> ({
  ^bb0(%arg20: vector<4x2xf32>, %arg21: vector<2xf32>, %arg22: vector<4xf32>, %arg23: vector<2x4xi1>):
    %10 = "vector.mask"(%arg23) ({
      %11 = "vector.contract"(%arg21, %arg20, %arg22) <{indexing_maps = [#map2, #map3, #map1], iterator_types = [#vector.iterator_type<reduction>, #vector.iterator_type<parallel>], kind = #vector.kind<add>}> : (vector<2xf32>, vector<4x2xf32>, vector<4xf32>) -> vector<4xf32>
      "vector.yield"(%11) : (vector<4xf32>) -> ()
    }) : (vector<2x4xi1>) -> vector<4xf32>
    "func.return"(%10) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[4]x2xf32>, vector<2xf32>, vector<[4]xf32>, vector<2x[4]xi1>) -> vector<[4]xf32>, sym_name = "masked_tmatvec_k_mk_m_scalable_parallel_dim"}> ({
  ^bb0(%arg16: vector<[4]x2xf32>, %arg17: vector<2xf32>, %arg18: vector<[4]xf32>, %arg19: vector<2x[4]xi1>):
    %8 = "vector.mask"(%arg19) ({
      %9 = "vector.contract"(%arg17, %arg16, %arg18) <{indexing_maps = [#map2, #map3, #map1], iterator_types = [#vector.iterator_type<reduction>, #vector.iterator_type<parallel>], kind = #vector.kind<add>}> : (vector<2xf32>, vector<[4]x2xf32>, vector<[4]xf32>) -> vector<[4]xf32>
      "vector.yield"(%9) : (vector<[4]xf32>) -> ()
    }) : (vector<2x[4]xi1>) -> vector<[4]xf32>
    "func.return"(%8) : (vector<[4]xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32>, sym_name = "tmatvec_m_mk_k"}> ({
  ^bb0(%arg13: vector<2x2xf32>, %arg14: vector<2xf32>, %arg15: vector<2xf32>):
    %7 = "vector.contract"(%arg14, %arg13, %arg15) <{indexing_maps = [#map2, #map, #map1], iterator_types = [#vector.iterator_type<reduction>, #vector.iterator_type<parallel>], kind = #vector.kind<add>}> : (vector<2xf32>, vector<2x2xf32>, vector<2xf32>) -> vector<2xf32>
    "func.return"(%7) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x4xf32>, vector<2xf32>, vector<4xf32>, vector<2x4xi1>) -> vector<4xf32>, sym_name = "masked_tmatvec_k_km_m"}> ({
  ^bb0(%arg9: vector<2x4xf32>, %arg10: vector<2xf32>, %arg11: vector<4xf32>, %arg12: vector<2x4xi1>):
    %5 = "vector.mask"(%arg12) ({
      %6 = "vector.contract"(%arg10, %arg9, %arg11) <{indexing_maps = [#map2, #map, #map1], iterator_types = [#vector.iterator_type<reduction>, #vector.iterator_type<parallel>], kind = #vector.kind<add>}> : (vector<2xf32>, vector<2x4xf32>, vector<4xf32>) -> vector<4xf32>
      "vector.yield"(%6) : (vector<4xf32>) -> ()
    }) : (vector<2x4xi1>) -> vector<4xf32>
    "func.return"(%5) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x[4]xf32>, vector<2xf32>, vector<[4]xf32>, vector<2x[4]xi1>) -> vector<[4]xf32>, sym_name = "masked_tmatvec_k_km_m_scalable_parallel_dim"}> ({
  ^bb0(%arg5: vector<2x[4]xf32>, %arg6: vector<2xf32>, %arg7: vector<[4]xf32>, %arg8: vector<2x[4]xi1>):
    %3 = "vector.mask"(%arg8) ({
      %4 = "vector.contract"(%arg6, %arg5, %arg7) <{indexing_maps = [#map2, #map, #map1], iterator_types = [#vector.iterator_type<reduction>, #vector.iterator_type<parallel>], kind = #vector.kind<add>}> : (vector<2xf32>, vector<2x[4]xf32>, vector<[4]xf32>) -> vector<[4]xf32>
      "vector.yield"(%4) : (vector<[4]xf32>) -> ()
    }) : (vector<2x[4]xi1>) -> vector<[4]xf32>
    "func.return"(%3) : (vector<[4]xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[2]x[3]xf32>, vector<[3]xf32>, vector<[2]xf32>, vector<[2]x[3]xi1>) -> vector<[2]xf32>, sym_name = "masked_extract_contract2_scalable_reduction_dim"}> ({
  ^bb0(%arg1: vector<[2]x[3]xf32>, %arg2: vector<[3]xf32>, %arg3: vector<[2]xf32>, %arg4: vector<[2]x[3]xi1>):
    %1 = "vector.mask"(%arg4) ({
      %2 = "vector.contract"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<[2]x[3]xf32>, vector<[3]xf32>, vector<[2]xf32>) -> vector<[2]xf32>
      "vector.yield"(%2) : (vector<[2]xf32>) -> ()
    }) : (vector<[2]x[3]xi1>) -> vector<[2]xf32>
    "func.return"(%1) : (vector<[2]xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_contraction"() <{lowering_strategy = 2 : i32}> : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

