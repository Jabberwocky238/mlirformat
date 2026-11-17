"builtin.module"() ({
  "func.func"() <{function_type = (vector<1xi4>) -> vector<1xi8>, sym_name = "unaligned_extsi_i4_to_i8"}> ({
  ^bb0(%arg23: vector<1xi4> loc("<stdin>":3:8)):
    %23 = "arith.extsi"(%arg23) : (vector<1xi4>) -> vector<1xi8> loc("<stdin>":4:11)
    "func.return"(%23) : (vector<1xi8>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (vector<2xi2>) -> vector<2xi8>, sym_name = "unaligned_extsi_i2_to_i8"}> ({
  ^bb0(%arg22: vector<2xi2> loc("<stdin>":8:8)):
    %22 = "arith.extsi"(%arg22) : (vector<2xi2>) -> vector<2xi8> loc("<stdin>":9:11)
    "func.return"(%22) : (vector<2xi8>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (vector<8xi4>) -> vector<8xi8>, sym_name = "aligned_extsi_i4_to_i8"}> ({
  ^bb0(%arg21: vector<8xi4> loc("<stdin>":13:8)):
    %21 = "arith.extsi"(%arg21) : (vector<8xi4>) -> vector<8xi8> loc("<stdin>":14:11)
    "func.return"(%21) : (vector<8xi8>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (vector<8xi2>) -> vector<8xi8>, sym_name = "aligned_extsi_i2_to_i8"}> ({
  ^bb0(%arg20: vector<8xi2> loc("<stdin>":18:8)):
    %20 = "arith.extsi"(%arg20) : (vector<8xi2>) -> vector<8xi8> loc("<stdin>":19:11)
    "func.return"(%20) : (vector<8xi8>) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (vector<8xi4>) -> vector<8xi32>, sym_name = "aligned_extsi_i4_to_i32"}> ({
  ^bb0(%arg19: vector<8xi4> loc("<stdin>":23:8)):
    %19 = "arith.extsi"(%arg19) : (vector<8xi4>) -> vector<8xi32> loc("<stdin>":24:11)
    "func.return"(%19) : (vector<8xi32>) -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":22:3)
  "func.func"() <{function_type = (vector<8xi2>) -> vector<8xi32>, sym_name = "aligned_extsi_i2_to_i32"}> ({
  ^bb0(%arg18: vector<8xi2> loc("<stdin>":28:8)):
    %18 = "arith.extsi"(%arg18) : (vector<8xi2>) -> vector<8xi32> loc("<stdin>":29:11)
    "func.return"(%18) : (vector<8xi32>) -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":27:3)
  "func.func"() <{function_type = (vector<8x32xi4>) -> vector<8x32xi32>, sym_name = "aligned_extsi_i4_to_i32_2d"}> ({
  ^bb0(%arg17: vector<8x32xi4> loc("<stdin>":33:8)):
    %17 = "arith.extsi"(%arg17) : (vector<8x32xi4>) -> vector<8x32xi32> loc("<stdin>":34:11)
    "func.return"(%17) : (vector<8x32xi32>) -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":32:3)
  "func.func"() <{function_type = (vector<8x32xi2>) -> vector<8x32xi32>, sym_name = "aligned_extsi_i2_to_i32_2d"}> ({
  ^bb0(%arg16: vector<8x32xi2> loc("<stdin>":38:8)):
    %16 = "arith.extsi"(%arg16) : (vector<8x32xi2>) -> vector<8x32xi32> loc("<stdin>":39:11)
    "func.return"(%16) : (vector<8x32xi32>) -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":37:3)
  "func.func"() <{function_type = (vector<8xi8>) -> vector<8xi4>, sym_name = "aligned_trunci_i8_to_i4"}> ({
  ^bb0(%arg15: vector<8xi8> loc("<stdin>":43:8)):
    %15 = "arith.trunci"(%arg15) <{overflowFlags = #arith.overflow<none>}> : (vector<8xi8>) -> vector<8xi4> loc("<stdin>":44:11)
    "func.return"(%15) : (vector<8xi4>) -> () loc("<stdin>":45:5)
  }) : () -> () loc("<stdin>":42:3)
  "func.func"() <{function_type = (vector<8xi32>) -> vector<8xi4>, sym_name = "aligned_trunci_i32_to_i4"}> ({
  ^bb0(%arg14: vector<8xi32> loc("<stdin>":48:8)):
    %14 = "arith.trunci"(%arg14) <{overflowFlags = #arith.overflow<none>}> : (vector<8xi32>) -> vector<8xi4> loc("<stdin>":49:11)
    "func.return"(%14) : (vector<8xi4>) -> () loc("<stdin>":50:5)
  }) : () -> () loc("<stdin>":47:3)
  "func.func"() <{function_type = (vector<8x32xi32>) -> vector<8x32xi4>, sym_name = "aligned_trunci_2d"}> ({
  ^bb0(%arg13: vector<8x32xi32> loc("<stdin>":53:8)):
    %13 = "arith.trunci"(%arg13) <{overflowFlags = #arith.overflow<none>}> : (vector<8x32xi32>) -> vector<8x32xi4> loc("<stdin>":54:11)
    "func.return"(%13) : (vector<8x32xi4>) -> () loc("<stdin>":55:5)
  }) : () -> () loc("<stdin>":52:3)
  "func.func"() <{function_type = (vector<3x8x32xi32>) -> vector<3x8x32xi4>, sym_name = "aligned_trunci_nd"}> ({
  ^bb0(%arg12: vector<3x8x32xi32> loc("<stdin>":58:8)):
    %12 = "arith.trunci"(%arg12) <{overflowFlags = #arith.overflow<none>}> : (vector<3x8x32xi32>) -> vector<3x8x32xi4> loc("<stdin>":59:11)
    "func.return"(%12) : (vector<3x8x32xi4>) -> () loc("<stdin>":60:5)
  }) : () -> () loc("<stdin>":57:3)
  "func.func"() <{function_type = (vector<8xi8>) -> vector<8xi2>, sym_name = "aligned_trunci_i8_to_i2_no_match"}> ({
  ^bb0(%arg11: vector<8xi8> loc("<stdin>":63:8)):
    %11 = "arith.trunci"(%arg11) <{overflowFlags = #arith.overflow<none>}> : (vector<8xi8>) -> vector<8xi2> loc("<stdin>":64:11)
    "func.return"(%11) : (vector<8xi2>) -> () loc("<stdin>":65:5)
  }) : () -> () loc("<stdin>":62:3)
  "func.func"() <{function_type = (vector<8xi4>) -> vector<8xi8>, sym_name = "aligned_extui_i4_to_i8"}> ({
  ^bb0(%arg10: vector<8xi4> loc("<stdin>":68:8)):
    %10 = "arith.extui"(%arg10) : (vector<8xi4>) -> vector<8xi8> loc("<stdin>":69:11)
    "func.return"(%10) : (vector<8xi8>) -> () loc("<stdin>":70:5)
  }) : () -> () loc("<stdin>":67:3)
  "func.func"() <{function_type = (vector<8xi2>) -> vector<8xi8>, sym_name = "aligned_extui_i2_to_i8"}> ({
  ^bb0(%arg9: vector<8xi2> loc("<stdin>":73:8)):
    %9 = "arith.extui"(%arg9) : (vector<8xi2>) -> vector<8xi8> loc("<stdin>":74:10)
    "func.return"(%9) : (vector<8xi8>) -> () loc("<stdin>":75:5)
  }) : () -> () loc("<stdin>":72:3)
  "func.func"() <{function_type = (vector<8xi4>) -> vector<8xi32>, sym_name = "aligned_extui_i4_to_i32"}> ({
  ^bb0(%arg8: vector<8xi4> loc("<stdin>":78:8)):
    %8 = "arith.extui"(%arg8) : (vector<8xi4>) -> vector<8xi32> loc("<stdin>":79:10)
    "func.return"(%8) : (vector<8xi32>) -> () loc("<stdin>":80:5)
  }) : () -> () loc("<stdin>":77:3)
  "func.func"() <{function_type = (vector<8xi2>) -> vector<8xi32>, sym_name = "aligned_extui_i2_to_i32"}> ({
  ^bb0(%arg7: vector<8xi2> loc("<stdin>":83:8)):
    %7 = "arith.extui"(%arg7) : (vector<8xi2>) -> vector<8xi32> loc("<stdin>":84:10)
    "func.return"(%7) : (vector<8xi32>) -> () loc("<stdin>":85:5)
  }) : () -> () loc("<stdin>":82:3)
  "func.func"() <{function_type = (vector<8x32xi4>) -> vector<8x32xi32>, sym_name = "aligned_extui_i4_to_i32_2d"}> ({
  ^bb0(%arg6: vector<8x32xi4> loc("<stdin>":88:8)):
    %6 = "arith.extui"(%arg6) : (vector<8x32xi4>) -> vector<8x32xi32> loc("<stdin>":89:10)
    "func.return"(%6) : (vector<8x32xi32>) -> () loc("<stdin>":90:5)
  }) : () -> () loc("<stdin>":87:3)
  "func.func"() <{function_type = (vector<8x32xi2>) -> vector<8x32xi32>, sym_name = "aligned_extui_i2_to_i32_2d"}> ({
  ^bb0(%arg5: vector<8x32xi2> loc("<stdin>":93:8)):
    %5 = "arith.extui"(%arg5) : (vector<8x32xi2>) -> vector<8x32xi32> loc("<stdin>":94:10)
    "func.return"(%5) : (vector<8x32xi32>) -> () loc("<stdin>":95:5)
  }) : () -> () loc("<stdin>":92:3)
  "func.func"() <{function_type = (vector<8xi4>) -> vector<8xf32>, sym_name = "aligned_sitofp"}> ({
  ^bb0(%arg4: vector<8xi4> loc("<stdin>":98:8)):
    %4 = "arith.sitofp"(%arg4) : (vector<8xi4>) -> vector<8xf32> loc("<stdin>":99:10)
    "func.return"(%4) : (vector<8xf32>) -> () loc("<stdin>":100:5)
  }) : () -> () loc("<stdin>":97:3)
  "func.func"() <{function_type = (vector<8x32xi4>) -> vector<8x32xf32>, sym_name = "aligned_sitofp_2d"}> ({
  ^bb0(%arg3: vector<8x32xi4> loc("<stdin>":103:8)):
    %3 = "arith.sitofp"(%arg3) : (vector<8x32xi4>) -> vector<8x32xf32> loc("<stdin>":104:10)
    "func.return"(%3) : (vector<8x32xf32>) -> () loc("<stdin>":105:5)
  }) : () -> () loc("<stdin>":102:3)
  "func.func"() <{function_type = (vector<8xi4>) -> vector<8xf32>, sym_name = "aligned_uitofp"}> ({
  ^bb0(%arg2: vector<8xi4> loc("<stdin>":108:8)):
    %2 = "arith.uitofp"(%arg2) : (vector<8xi4>) -> vector<8xf32> loc("<stdin>":109:10)
    "func.return"(%2) : (vector<8xf32>) -> () loc("<stdin>":110:5)
  }) : () -> () loc("<stdin>":107:3)
  "func.func"() <{function_type = (vector<8x32xi4>) -> vector<8x32xf32>, sym_name = "aligned_uitofp_2d"}> ({
  ^bb0(%arg1: vector<8x32xi4> loc("<stdin>":113:8)):
    %1 = "arith.uitofp"(%arg1) : (vector<8x32xi4>) -> vector<8x32xf32> loc("<stdin>":114:10)
    "func.return"(%1) : (vector<8x32xf32>) -> () loc("<stdin>":115:5)
  }) : () -> () loc("<stdin>":112:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":119:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":120:12)
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.rewrite_narrow_types"() : () -> () loc("<stdin>":122:9)
      }) : (!transform.any_op) -> () loc("<stdin>":121:7)
      "transform.yield"() : () -> () loc("<stdin>":124:7)
    }) : () -> () loc("<stdin>":118:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":117:3)
}) : () -> () loc("<stdin>":1:1)
