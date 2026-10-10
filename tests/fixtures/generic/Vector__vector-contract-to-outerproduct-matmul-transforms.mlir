#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map3 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map4 = affine_map<(d0, d1, d2) -> (d2, d0)>
#map5 = affine_map<(d0, d1, d2) -> (d1, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x4xf32>, vector<4x3xf32>, vector<2x3xf32>) -> vector<2x3xf32>, sym_name = "matmul"}> ({
  ^bb0(%arg42: vector<2x4xf32>, %arg43: vector<4x3xf32>, %arg44: vector<2x3xf32>):
    %16 = "vector.contract"(%arg42, %arg43, %arg44) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x4xf32>, vector<4x3xf32>, vector<2x3xf32>) -> vector<2x3xf32>
    "func.return"(%16) : (vector<2x3xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x4xf32>, vector<4x[3]xf32>, vector<2x[3]xf32>) -> vector<2x[3]xf32>, sym_name = "matmul_scalable"}> ({
  ^bb0(%arg39: vector<2x4xf32>, %arg40: vector<4x[3]xf32>, %arg41: vector<2x[3]xf32>):
    %15 = "vector.contract"(%arg39, %arg40, %arg41) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x4xf32>, vector<4x[3]xf32>, vector<2x[3]xf32>) -> vector<2x[3]xf32>
    "func.return"(%15) : (vector<2x[3]xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3x5xf32>, vector<5x7xf32>, vector<3x7xf32>, vector<3x7x5xi1>) -> vector<3x7xf32>, sym_name = "masked_matmul"}> ({
  ^bb0(%arg35: vector<3x5xf32>, %arg36: vector<5x7xf32>, %arg37: vector<3x7xf32>, %arg38: vector<3x7x5xi1>):
    %13 = "vector.mask"(%arg38) ({
      %14 = "vector.contract"(%arg35, %arg36, %arg37) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<3x5xf32>, vector<5x7xf32>, vector<3x7xf32>) -> vector<3x7xf32>
      "vector.yield"(%14) : (vector<3x7xf32>) -> ()
    }) : (vector<3x7x5xi1>) -> vector<3x7xf32>
    "func.return"(%13) : (vector<3x7xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3x5xf32>, vector<5x[7]xf32>, vector<3x[7]xf32>, vector<3x[7]x5xi1>) -> vector<3x[7]xf32>, sym_name = "masked_matmul_scalable"}> ({
  ^bb0(%arg31: vector<3x5xf32>, %arg32: vector<5x[7]xf32>, %arg33: vector<3x[7]xf32>, %arg34: vector<3x[7]x5xi1>):
    %11 = "vector.mask"(%arg34) ({
      %12 = "vector.contract"(%arg31, %arg32, %arg33) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<3x5xf32>, vector<5x[7]xf32>, vector<3x[7]xf32>) -> vector<3x[7]xf32>
      "vector.yield"(%12) : (vector<3x[7]xf32>) -> ()
    }) : (vector<3x[7]x5xi1>) -> vector<3x[7]xf32>
    "func.return"(%11) : (vector<3x[7]xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x1xf16>, vector<1x3xf16>, vector<2x3xf32>) -> vector<2x3xf32>, sym_name = "matmul_mixed"}> ({
  ^bb0(%arg28: vector<2x1xf16>, %arg29: vector<1x3xf16>, %arg30: vector<2x3xf32>):
    %10 = "vector.contract"(%arg28, %arg29, %arg30) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x1xf16>, vector<1x3xf16>, vector<2x3xf32>) -> vector<2x3xf32>
    "func.return"(%10) : (vector<2x3xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x1xf16>, vector<1x[3]xf16>, vector<2x[3]xf32>) -> vector<2x[3]xf32>, sym_name = "matmul_mixed_scalable"}> ({
  ^bb0(%arg25: vector<2x1xf16>, %arg26: vector<1x[3]xf16>, %arg27: vector<2x[3]xf32>):
    %9 = "vector.contract"(%arg25, %arg26, %arg27) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x1xf16>, vector<1x[3]xf16>, vector<2x[3]xf32>) -> vector<2x[3]xf32>
    "func.return"(%9) : (vector<2x[3]xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x1xf32>, vector<3x1xf32>, vector<2x3xf32>) -> vector<2x3xf32>, sym_name = "matmul_1"}> ({
  ^bb0(%arg22: vector<2x1xf32>, %arg23: vector<3x1xf32>, %arg24: vector<2x3xf32>):
    %8 = "vector.contract"(%arg22, %arg23, %arg24) <{indexing_maps = [#map, #map3, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x1xf32>, vector<3x1xf32>, vector<2x3xf32>) -> vector<2x3xf32>
    "func.return"(%8) : (vector<2x3xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x1xf32>, vector<[3]x1xf32>, vector<2x[3]xf32>) -> vector<2x[3]xf32>, sym_name = "matmul_1_scalable"}> ({
  ^bb0(%arg19: vector<2x1xf32>, %arg20: vector<[3]x1xf32>, %arg21: vector<2x[3]xf32>):
    %7 = "vector.contract"(%arg19, %arg20, %arg21) <{indexing_maps = [#map, #map3, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x1xf32>, vector<[3]x1xf32>, vector<2x[3]xf32>) -> vector<2x[3]xf32>
    "func.return"(%7) : (vector<2x[3]xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1x2xf32>, vector<1x3xf32>, vector<2x3xf32>) -> vector<2x3xf32>, sym_name = "matmul_2"}> ({
  ^bb0(%arg16: vector<1x2xf32>, %arg17: vector<1x3xf32>, %arg18: vector<2x3xf32>):
    %6 = "vector.contract"(%arg16, %arg17, %arg18) <{indexing_maps = [#map4, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<1x2xf32>, vector<1x3xf32>, vector<2x3xf32>) -> vector<2x3xf32>
    "func.return"(%6) : (vector<2x3xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1x2xf32>, vector<1x[3]xf32>, vector<2x[3]xf32>) -> vector<2x[3]xf32>, sym_name = "matmul_2_scalable"}> ({
  ^bb0(%arg13: vector<1x2xf32>, %arg14: vector<1x[3]xf32>, %arg15: vector<2x[3]xf32>):
    %5 = "vector.contract"(%arg13, %arg14, %arg15) <{indexing_maps = [#map4, #map1, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<1x2xf32>, vector<1x[3]xf32>, vector<2x[3]xf32>) -> vector<2x[3]xf32>
    "func.return"(%5) : (vector<2x[3]xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1x2xf32>, vector<3x1xf32>, vector<2x3xf32>) -> vector<2x3xf32>, sym_name = "matmul_3"}> ({
  ^bb0(%arg10: vector<1x2xf32>, %arg11: vector<3x1xf32>, %arg12: vector<2x3xf32>):
    %4 = "vector.contract"(%arg10, %arg11, %arg12) <{indexing_maps = [#map4, #map3, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<1x2xf32>, vector<3x1xf32>, vector<2x3xf32>) -> vector<2x3xf32>
    "func.return"(%4) : (vector<2x3xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1x2xf32>, vector<[3]x1xf32>, vector<2x[3]xf32>) -> vector<2x[3]xf32>, sym_name = "matmul_3_scalable"}> ({
  ^bb0(%arg7: vector<1x2xf32>, %arg8: vector<[3]x1xf32>, %arg9: vector<2x[3]xf32>):
    %3 = "vector.contract"(%arg7, %arg8, %arg9) <{indexing_maps = [#map4, #map3, #map2], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<1x2xf32>, vector<[3]x1xf32>, vector<2x[3]xf32>) -> vector<2x[3]xf32>
    "func.return"(%3) : (vector<2x[3]xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x1xf32>, vector<1x3xf32>, vector<3x2xf32>) -> vector<3x2xf32>, sym_name = "matmul_4"}> ({
  ^bb0(%arg4: vector<2x1xf32>, %arg5: vector<1x3xf32>, %arg6: vector<3x2xf32>):
    %2 = "vector.contract"(%arg4, %arg5, %arg6) <{indexing_maps = [#map, #map1, #map5], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x1xf32>, vector<1x3xf32>, vector<3x2xf32>) -> vector<3x2xf32>
    "func.return"(%2) : (vector<3x2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[2]x1xf32>, vector<1x3xf32>, vector<3x[2]xf32>) -> vector<3x[2]xf32>, sym_name = "matmul_4_scalable"}> ({
  ^bb0(%arg1: vector<[2]x1xf32>, %arg2: vector<1x3xf32>, %arg3: vector<3x[2]xf32>):
    %1 = "vector.contract"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map5], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<[2]x1xf32>, vector<1x3xf32>, vector<3x[2]xf32>) -> vector<3x[2]xf32>
    "func.return"(%1) : (vector<3x[2]xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_contraction"() <{lowering_strategy = 2 : i32}> : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

