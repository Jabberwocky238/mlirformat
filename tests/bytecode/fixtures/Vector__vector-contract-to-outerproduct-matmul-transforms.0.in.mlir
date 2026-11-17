"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x4xf32>, vector<4x3xf32>, vector<2x3xf32>) -> vector<2x3xf32>, sym_name = "matmul"}> ({
  ^bb0(%arg42: vector<2x4xf32> loc("<stdin>":9:8), %arg43: vector<4x3xf32> loc("<stdin>":9:33), %arg44: vector<2x3xf32> loc("<stdin>":9:58)):
    %16 = "vector.contract"(%arg42, %arg43, %arg44) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x4xf32>, vector<4x3xf32>, vector<2x3xf32>) -> vector<2x3xf32> loc("<stdin>":10:11)
    "func.return"(%16) : (vector<2x3xf32>) -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = (vector<2x4xf32>, vector<4x[3]xf32>, vector<2x[3]xf32>) -> vector<2x[3]xf32>, sym_name = "matmul_scalable"}> ({
  ^bb0(%arg39: vector<2x4xf32> loc("<stdin>":14:8), %arg40: vector<4x[3]xf32> loc("<stdin>":14:33), %arg41: vector<2x[3]xf32> loc("<stdin>":14:60)):
    %15 = "vector.contract"(%arg39, %arg40, %arg41) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x4xf32>, vector<4x[3]xf32>, vector<2x[3]xf32>) -> vector<2x[3]xf32> loc("<stdin>":15:11)
    "func.return"(%15) : (vector<2x[3]xf32>) -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":13:3)
  "func.func"() <{function_type = (vector<3x5xf32>, vector<5x7xf32>, vector<3x7xf32>, vector<3x7x5xi1>) -> vector<3x7xf32>, sym_name = "masked_matmul"}> ({
  ^bb0(%arg35: vector<3x5xf32> loc("<stdin>":19:8), %arg36: vector<5x7xf32> loc("<stdin>":19:33), %arg37: vector<3x7xf32> loc("<stdin>":19:58), %arg38: vector<3x7x5xi1> loc("<stdin>":19:83)):
    %13 = "vector.mask"(%arg38) ({
      %14 = "vector.contract"(%arg35, %arg36, %arg37) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<3x5xf32>, vector<5x7xf32>, vector<3x7xf32>) -> vector<3x7xf32> loc("<stdin>":21:13)
      "vector.yield"(%14) : (vector<3x7xf32>) -> () loc("<stdin>":22:7)
    }) : (vector<3x7x5xi1>) -> vector<3x7xf32> loc("<stdin>":20:11)
    "func.return"(%13) : (vector<3x7xf32>) -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":18:3)
  "func.func"() <{function_type = (vector<3x5xf32>, vector<5x[7]xf32>, vector<3x[7]xf32>, vector<3x[7]x5xi1>) -> vector<3x[7]xf32>, sym_name = "masked_matmul_scalable"}> ({
  ^bb0(%arg31: vector<3x5xf32> loc("<stdin>":27:8), %arg32: vector<5x[7]xf32> loc("<stdin>":27:33), %arg33: vector<3x[7]xf32> loc("<stdin>":27:60), %arg34: vector<3x[7]x5xi1> loc("<stdin>":27:87)):
    %11 = "vector.mask"(%arg34) ({
      %12 = "vector.contract"(%arg31, %arg32, %arg33) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<3x5xf32>, vector<5x[7]xf32>, vector<3x[7]xf32>) -> vector<3x[7]xf32> loc("<stdin>":29:13)
      "vector.yield"(%12) : (vector<3x[7]xf32>) -> () loc("<stdin>":30:7)
    }) : (vector<3x[7]x5xi1>) -> vector<3x[7]xf32> loc("<stdin>":28:11)
    "func.return"(%11) : (vector<3x[7]xf32>) -> () loc("<stdin>":32:5)
  }) : () -> () loc("<stdin>":26:3)
  "func.func"() <{function_type = (vector<2x1xf16>, vector<1x3xf16>, vector<2x3xf32>) -> vector<2x3xf32>, sym_name = "matmul_mixed"}> ({
  ^bb0(%arg28: vector<2x1xf16> loc("<stdin>":35:8), %arg29: vector<1x3xf16> loc("<stdin>":35:33), %arg30: vector<2x3xf32> loc("<stdin>":35:58)):
    %10 = "vector.contract"(%arg28, %arg29, %arg30) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x1xf16>, vector<1x3xf16>, vector<2x3xf32>) -> vector<2x3xf32> loc("<stdin>":36:11)
    "func.return"(%10) : (vector<2x3xf32>) -> () loc("<stdin>":37:5)
  }) : () -> () loc("<stdin>":34:3)
  "func.func"() <{function_type = (vector<2x1xf16>, vector<1x[3]xf16>, vector<2x[3]xf32>) -> vector<2x[3]xf32>, sym_name = "matmul_mixed_scalable"}> ({
  ^bb0(%arg25: vector<2x1xf16> loc("<stdin>":40:8), %arg26: vector<1x[3]xf16> loc("<stdin>":40:33), %arg27: vector<2x[3]xf32> loc("<stdin>":40:60)):
    %9 = "vector.contract"(%arg25, %arg26, %arg27) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x1xf16>, vector<1x[3]xf16>, vector<2x[3]xf32>) -> vector<2x[3]xf32> loc("<stdin>":41:10)
    "func.return"(%9) : (vector<2x[3]xf32>) -> () loc("<stdin>":42:5)
  }) : () -> () loc("<stdin>":39:3)
  "func.func"() <{function_type = (vector<2x1xf32>, vector<3x1xf32>, vector<2x3xf32>) -> vector<2x3xf32>, sym_name = "matmul_1"}> ({
  ^bb0(%arg22: vector<2x1xf32> loc("<stdin>":45:8), %arg23: vector<3x1xf32> loc("<stdin>":45:33), %arg24: vector<2x3xf32> loc("<stdin>":45:58)):
    %8 = "vector.contract"(%arg22, %arg23, %arg24) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x1xf32>, vector<3x1xf32>, vector<2x3xf32>) -> vector<2x3xf32> loc("<stdin>":46:10)
    "func.return"(%8) : (vector<2x3xf32>) -> () loc("<stdin>":47:5)
  }) : () -> () loc("<stdin>":44:3)
  "func.func"() <{function_type = (vector<2x1xf32>, vector<[3]x1xf32>, vector<2x[3]xf32>) -> vector<2x[3]xf32>, sym_name = "matmul_1_scalable"}> ({
  ^bb0(%arg19: vector<2x1xf32> loc("<stdin>":50:8), %arg20: vector<[3]x1xf32> loc("<stdin>":50:33), %arg21: vector<2x[3]xf32> loc("<stdin>":50:60)):
    %7 = "vector.contract"(%arg19, %arg20, %arg21) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x1xf32>, vector<[3]x1xf32>, vector<2x[3]xf32>) -> vector<2x[3]xf32> loc("<stdin>":51:10)
    "func.return"(%7) : (vector<2x[3]xf32>) -> () loc("<stdin>":52:5)
  }) : () -> () loc("<stdin>":49:3)
  "func.func"() <{function_type = (vector<1x2xf32>, vector<1x3xf32>, vector<2x3xf32>) -> vector<2x3xf32>, sym_name = "matmul_2"}> ({
  ^bb0(%arg16: vector<1x2xf32> loc("<stdin>":55:8), %arg17: vector<1x3xf32> loc("<stdin>":55:33), %arg18: vector<2x3xf32> loc("<stdin>":55:58)):
    %6 = "vector.contract"(%arg16, %arg17, %arg18) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2) -> (d2, d0)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<1x2xf32>, vector<1x3xf32>, vector<2x3xf32>) -> vector<2x3xf32> loc("<stdin>":56:10)
    "func.return"(%6) : (vector<2x3xf32>) -> () loc("<stdin>":57:5)
  }) : () -> () loc("<stdin>":54:3)
  "func.func"() <{function_type = (vector<1x2xf32>, vector<1x[3]xf32>, vector<2x[3]xf32>) -> vector<2x[3]xf32>, sym_name = "matmul_2_scalable"}> ({
  ^bb0(%arg13: vector<1x2xf32> loc("<stdin>":60:8), %arg14: vector<1x[3]xf32> loc("<stdin>":60:33), %arg15: vector<2x[3]xf32> loc("<stdin>":60:60)):
    %5 = "vector.contract"(%arg13, %arg14, %arg15) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2) -> (d2, d0)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<1x2xf32>, vector<1x[3]xf32>, vector<2x[3]xf32>) -> vector<2x[3]xf32> loc("<stdin>":61:10)
    "func.return"(%5) : (vector<2x[3]xf32>) -> () loc("<stdin>":62:5)
  }) : () -> () loc("<stdin>":59:3)
  "func.func"() <{function_type = (vector<1x2xf32>, vector<3x1xf32>, vector<2x3xf32>) -> vector<2x3xf32>, sym_name = "matmul_3"}> ({
  ^bb0(%arg10: vector<1x2xf32> loc("<stdin>":65:8), %arg11: vector<3x1xf32> loc("<stdin>":65:33), %arg12: vector<2x3xf32> loc("<stdin>":65:58)):
    %4 = "vector.contract"(%arg10, %arg11, %arg12) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2) -> (d2, d0)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<1x2xf32>, vector<3x1xf32>, vector<2x3xf32>) -> vector<2x3xf32> loc("<stdin>":66:10)
    "func.return"(%4) : (vector<2x3xf32>) -> () loc("<stdin>":67:5)
  }) : () -> () loc("<stdin>":64:3)
  "func.func"() <{function_type = (vector<1x2xf32>, vector<[3]x1xf32>, vector<2x[3]xf32>) -> vector<2x[3]xf32>, sym_name = "matmul_3_scalable"}> ({
  ^bb0(%arg7: vector<1x2xf32> loc("<stdin>":70:8), %arg8: vector<[3]x1xf32> loc("<stdin>":70:32), %arg9: vector<2x[3]xf32> loc("<stdin>":70:58)):
    %3 = "vector.contract"(%arg7, %arg8, %arg9) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2) -> (d2, d0)>, affine_map<(d0, d1, d2) -> (d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<1x2xf32>, vector<[3]x1xf32>, vector<2x[3]xf32>) -> vector<2x[3]xf32> loc("<stdin>":71:10)
    "func.return"(%3) : (vector<2x[3]xf32>) -> () loc("<stdin>":72:5)
  }) : () -> () loc("<stdin>":69:3)
  "func.func"() <{function_type = (vector<2x1xf32>, vector<1x3xf32>, vector<3x2xf32>) -> vector<3x2xf32>, sym_name = "matmul_4"}> ({
  ^bb0(%arg4: vector<2x1xf32> loc("<stdin>":75:8), %arg5: vector<1x3xf32> loc("<stdin>":75:32), %arg6: vector<3x2xf32> loc("<stdin>":75:56)):
    %2 = "vector.contract"(%arg4, %arg5, %arg6) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d1, d0)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x1xf32>, vector<1x3xf32>, vector<3x2xf32>) -> vector<3x2xf32> loc("<stdin>":76:10)
    "func.return"(%2) : (vector<3x2xf32>) -> () loc("<stdin>":77:5)
  }) : () -> () loc("<stdin>":74:3)
  "func.func"() <{function_type = (vector<[2]x1xf32>, vector<1x3xf32>, vector<3x[2]xf32>) -> vector<3x[2]xf32>, sym_name = "matmul_4_scalable"}> ({
  ^bb0(%arg1: vector<[2]x1xf32> loc("<stdin>":80:8), %arg2: vector<1x3xf32> loc("<stdin>":80:34), %arg3: vector<3x[2]xf32> loc("<stdin>":80:58)):
    %1 = "vector.contract"(%arg1, %arg2, %arg3) <{fastmath = #arith.fastmath<none>, indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d1, d0)>], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<[2]x1xf32>, vector<1x3xf32>, vector<3x[2]xf32>) -> vector<3x[2]xf32> loc("<stdin>":81:10)
    "func.return"(%1) : (vector<3x[2]xf32>) -> () loc("<stdin>":82:5)
  }) : () -> () loc("<stdin>":79:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":86:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":87:12)
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_contraction"() <{lowering_strategy = 2 : i32}> : () -> () loc("<stdin>":89:9)
      }) : (!transform.any_op) -> () loc("<stdin>":88:7)
      "transform.yield"() : () -> () loc("<stdin>":91:7)
    }) : () -> () loc("<stdin>":85:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":84:3)
}) : () -> () loc("<stdin>":7:1)
