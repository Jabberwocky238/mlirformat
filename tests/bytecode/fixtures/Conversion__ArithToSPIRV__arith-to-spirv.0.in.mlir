"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "int32_scalar"}> ({
  ^bb0(%arg33: i32 loc("<stdin>":3:8), %arg34: i32 loc("<stdin>":3:21)):
    %29 = "arith.addi"(%arg33, %arg34) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":4:11)
    %30 = "arith.subi"(%arg33, %arg34) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":5:11)
    %31 = "arith.muli"(%arg33, %arg34) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":6:11)
    %32 = "arith.divsi"(%arg33, %arg34) : (i32, i32) -> i32 loc("<stdin>":7:11)
    %33 = "arith.divui"(%arg33, %arg34) : (i32, i32) -> i32 loc("<stdin>":8:11)
    %34 = "arith.remui"(%arg33, %arg34) : (i32, i32) -> i32 loc("<stdin>":9:11)
    "func.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "int32_scalar_srem"}> ({
  ^bb0(%arg31: i32 loc("<stdin>":13:8), %arg32: i32 loc("<stdin>":13:21)):
    %28 = "arith.remsi"(%arg31, %arg32) : (i32, i32) -> i32 loc("<stdin>":14:11)
    "func.return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (index, index) -> (), sym_name = "index_scalar"}> ({
  ^bb0(%arg29: index loc("<stdin>":18:8), %arg30: index loc("<stdin>":18:23)):
    %22 = "arith.addi"(%arg29, %arg30) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":19:11)
    %23 = "arith.subi"(%arg29, %arg30) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":20:11)
    %24 = "arith.muli"(%arg29, %arg30) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":21:11)
    %25 = "arith.divsi"(%arg29, %arg30) : (index, index) -> index loc("<stdin>":22:11)
    %26 = "arith.divui"(%arg29, %arg30) : (index, index) -> index loc("<stdin>":23:11)
    %27 = "arith.remui"(%arg29, %arg30) : (index, index) -> index loc("<stdin>":24:11)
    "func.return"() : () -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (index, index) -> (), sym_name = "index_scalar_srem"}> ({
  ^bb0(%arg27: index loc("<stdin>":28:8), %arg28: index loc("<stdin>":28:23)):
    %21 = "arith.remsi"(%arg27, %arg28) : (index, index) -> index loc("<stdin>":29:11)
    "func.return"() : () -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":27:3)
  "func.func"() <{function_type = (i32, i32) -> (i32, i1), sym_name = "int32_scalar_addui_extended"}> ({
  ^bb0(%arg25: i32 loc("<stdin>":33:8), %arg26: i32 loc("<stdin>":33:21)):
    %20:2 = "arith.addui_extended"(%arg25, %arg26) : (i32, i32) -> (i32, i1) loc("<stdin>":34:13)
    "func.return"(%20#0, %20#1) : (i32, i1) -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":32:3)
  "func.func"() <{function_type = (vector<4xi32>, vector<4xi32>) -> (vector<4xi32>, vector<4xi1>), sym_name = "int32_vector_addui_extended"}> ({
  ^bb0(%arg23: vector<4xi32> loc("<stdin>":38:8), %arg24: vector<4xi32> loc("<stdin>":38:31)):
    %19:2 = "arith.addui_extended"(%arg23, %arg24) : (vector<4xi32>, vector<4xi32>) -> (vector<4xi32>, vector<4xi1>) loc("<stdin>":39:13)
    "func.return"(%19#0, %19#1) : (vector<4xi32>, vector<4xi1>) -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":37:3)
  "func.func"() <{function_type = (i32, i32) -> (i32, i1), sym_name = "int32_scalar_subui_extended"}> ({
  ^bb0(%arg21: i32 loc("<stdin>":43:8), %arg22: i32 loc("<stdin>":43:21)):
    %18:2 = "arith.subui_extended"(%arg21, %arg22) : (i32, i32) -> (i32, i1) loc("<stdin>":44:13)
    "func.return"(%18#0, %18#1) : (i32, i1) -> () loc("<stdin>":45:5)
  }) : () -> () loc("<stdin>":42:3)
  "func.func"() <{function_type = (vector<4xi32>, vector<4xi32>) -> (vector<4xi32>, vector<4xi1>), sym_name = "int32_vector_subui_extended"}> ({
  ^bb0(%arg19: vector<4xi32> loc("<stdin>":48:8), %arg20: vector<4xi32> loc("<stdin>":48:31)):
    %17:2 = "arith.subui_extended"(%arg19, %arg20) : (vector<4xi32>, vector<4xi32>) -> (vector<4xi32>, vector<4xi1>) loc("<stdin>":49:13)
    "func.return"(%17#0, %17#1) : (vector<4xi32>, vector<4xi1>) -> () loc("<stdin>":50:5)
  }) : () -> () loc("<stdin>":47:3)
  "func.func"() <{function_type = (i32, i32) -> (i32, i32), sym_name = "int32_scalar_mulsi_extended"}> ({
  ^bb0(%arg17: i32 loc("<stdin>":53:8), %arg18: i32 loc("<stdin>":53:21)):
    %16:2 = "arith.mulsi_extended"(%arg17, %arg18) : (i32, i32) -> (i32, i32) loc("<stdin>":54:13)
    "func.return"(%16#0, %16#1) : (i32, i32) -> () loc("<stdin>":55:5)
  }) : () -> () loc("<stdin>":52:3)
  "func.func"() <{function_type = (vector<4xi32>, vector<4xi32>) -> (vector<4xi32>, vector<4xi32>), sym_name = "int32_vector_mulsi_extended"}> ({
  ^bb0(%arg15: vector<4xi32> loc("<stdin>":58:8), %arg16: vector<4xi32> loc("<stdin>":58:31)):
    %15:2 = "arith.mulsi_extended"(%arg15, %arg16) : (vector<4xi32>, vector<4xi32>) -> (vector<4xi32>, vector<4xi32>) loc("<stdin>":59:13)
    "func.return"(%15#0, %15#1) : (vector<4xi32>, vector<4xi32>) -> () loc("<stdin>":60:5)
  }) : () -> () loc("<stdin>":57:3)
  "func.func"() <{function_type = (i32, i32) -> (i32, i32), sym_name = "int32_scalar_mului_extended"}> ({
  ^bb0(%arg13: i32 loc("<stdin>":63:8), %arg14: i32 loc("<stdin>":63:21)):
    %14:2 = "arith.mului_extended"(%arg13, %arg14) : (i32, i32) -> (i32, i32) loc("<stdin>":64:13)
    "func.return"(%14#0, %14#1) : (i32, i32) -> () loc("<stdin>":65:5)
  }) : () -> () loc("<stdin>":62:3)
  "func.func"() <{function_type = (vector<4xi32>, vector<4xi32>) -> (vector<4xi32>, vector<4xi32>), sym_name = "int32_vector_mului_extended"}> ({
  ^bb0(%arg11: vector<4xi32> loc("<stdin>":68:8), %arg12: vector<4xi32> loc("<stdin>":68:31)):
    %13:2 = "arith.mului_extended"(%arg11, %arg12) : (vector<4xi32>, vector<4xi32>) -> (vector<4xi32>, vector<4xi32>) loc("<stdin>":69:13)
    "func.return"(%13#0, %13#1) : (vector<4xi32>, vector<4xi32>) -> () loc("<stdin>":70:5)
  }) : () -> () loc("<stdin>":67:3)
  "func.func"() <{function_type = (f32) -> (), sym_name = "float32_unary_scalar"}> ({
  ^bb0(%arg10: f32 loc("<stdin>":73:8)):
    %12 = "arith.negf"(%arg10) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":74:11)
    "func.return"() : () -> () loc("<stdin>":75:5)
  }) : () -> () loc("<stdin>":72:3)
  "func.func"() <{function_type = (f32, f32) -> (), sym_name = "float32_binary_scalar"}> ({
  ^bb0(%arg8: f32 loc("<stdin>":78:8), %arg9: f32 loc("<stdin>":78:20)):
    %7 = "arith.addf"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":79:10)
    %8 = "arith.subf"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":80:10)
    %9 = "arith.mulf"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":81:10)
    %10 = "arith.divf"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":82:11)
    %11 = "arith.remf"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":83:11)
    "func.return"() : () -> () loc("<stdin>":84:5)
  }) : () -> () loc("<stdin>":77:3)
  "func.func"() <{function_type = (vector<2xi8>, vector<4xi64>) -> (), sym_name = "int_vector234"}> ({
  ^bb0(%arg6: vector<2xi8> loc("<stdin>":87:8), %arg7: vector<4xi64> loc("<stdin>":87:29)):
    %5 = "arith.divsi"(%arg6, %arg6) : (vector<2xi8>, vector<2xi8>) -> vector<2xi8> loc("<stdin>":88:10)
    %6 = "arith.divui"(%arg7, %arg7) : (vector<4xi64>, vector<4xi64>) -> vector<4xi64> loc("<stdin>":89:10)
    "func.return"() : () -> () loc("<stdin>":90:5)
  }) : () -> () loc("<stdin>":86:3)
  "func.func"() <{function_type = (vector<4xindex>) -> (), sym_name = "index_vector"}> ({
  ^bb0(%arg5: vector<4xindex> loc("<stdin>":93:8)):
    %4 = "arith.remui"(%arg5, %arg5) : (vector<4xindex>, vector<4xindex>) -> vector<4xindex> loc("<stdin>":94:10)
    "func.return"() : () -> () loc("<stdin>":95:5)
  }) : () -> () loc("<stdin>":92:3)
  "func.func"() <{function_type = (vector<3xi16>, vector<3xi16>) -> (), sym_name = "vector_srem"}> ({
  ^bb0(%arg3: vector<3xi16> loc("<stdin>":98:8), %arg4: vector<3xi16> loc("<stdin>":98:30)):
    %3 = "arith.remsi"(%arg3, %arg4) : (vector<3xi16>, vector<3xi16>) -> vector<3xi16> loc("<stdin>":99:10)
    "func.return"() : () -> () loc("<stdin>":100:5)
  }) : () -> () loc("<stdin>":97:3)
  "func.func"() <{function_type = (vector<2xf16>, vector<3xf64>) -> (), sym_name = "float_vector234"}> ({
  ^bb0(%arg1: vector<2xf16> loc("<stdin>":103:8), %arg2: vector<3xf64> loc("<stdin>":103:30)):
    %1 = "arith.addf"(%arg1, %arg1) <{fastmath = #arith.fastmath<none>}> : (vector<2xf16>, vector<2xf16>) -> vector<2xf16> loc("<stdin>":104:10)
    %2 = "arith.mulf"(%arg2, %arg2) <{fastmath = #arith.fastmath<none>}> : (vector<3xf64>, vector<3xf64>) -> vector<3xf64> loc("<stdin>":105:10)
    "func.return"() : () -> () loc("<stdin>":106:5)
  }) : () -> () loc("<stdin>":102:3)
  "func.func"() <{function_type = (vector<1xi32>) -> (), sym_name = "one_elem_vector"}> ({
  ^bb0(%arg0: vector<1xi32> loc("<stdin>":109:8)):
    %0 = "arith.addi"(%arg0, %arg0) <{overflowFlags = #arith.overflow<none>}> : (vector<1xi32>, vector<1xi32>) -> vector<1xi32> loc("<stdin>":110:10)
    "func.return"() : () -> () loc("<stdin>":111:5)
  }) : () -> () loc("<stdin>":108:3)
}) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Int8, Int16, Int64, Float16, Float64, Shader], []>, #spirv.resource_limits<>>} : () -> () loc("<stdin>":1:1)
