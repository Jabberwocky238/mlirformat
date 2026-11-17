"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "float32_unary_scalar"}> ({
  ^bb0(%arg17: f32 loc("<stdin>":3:8)):
    %34 = "math.atan"(%arg17) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":4:11)
    %35 = "math.cos"(%arg17) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":5:11)
    %36 = "math.exp"(%arg17) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":6:11)
    %37 = "math.expm1"(%arg17) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":7:11)
    %38 = "math.log"(%arg17) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":8:11)
    %39 = "math.log1p"(%arg17) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":9:11)
    %40 = "math.log2"(%arg17) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":10:11)
    %41 = "math.log10"(%arg17) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":11:11)
    %42 = "math.exp2"(%arg17) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":12:11)
    %43 = "math.roundeven"(%arg17) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":13:11)
    %44 = "math.rsqrt"(%arg17) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":14:11)
    %45 = "math.sqrt"(%arg17) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":15:11)
    %46 = "math.tanh"(%arg17) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":16:11)
    %47 = "math.sin"(%arg17) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":17:11)
    %48 = "math.absf"(%arg17) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":18:11)
    %49 = "math.ceil"(%arg17) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":19:11)
    %50 = "math.floor"(%arg17) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":20:11)
    %51 = "math.erf"(%arg17) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":21:11)
    %52 = "math.erfc"(%arg17) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":22:11)
    %53 = "math.round"(%arg17) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":23:11)
    %54 = "math.tan"(%arg17) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":24:11)
    %55 = "math.asin"(%arg17) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":25:11)
    %56 = "math.acos"(%arg17) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":26:11)
    %57 = "math.sinh"(%arg17) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":27:11)
    %58 = "math.cosh"(%arg17) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":28:11)
    %59 = "math.asinh"(%arg17) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":29:11)
    %60 = "math.acosh"(%arg17) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":30:11)
    %61 = "math.atanh"(%arg17) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":31:11)
    %62 = "math.trunc"(%arg17) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":32:11)
    %63 = "math.cbrt"(%arg17) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":33:11)
    "func.return"() : () -> () loc("<stdin>":34:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (vector<3xf32>) -> (), sym_name = "float32_unary_vector"}> ({
  ^bb0(%arg16: vector<3xf32> loc("<stdin>":37:8)):
    %11 = "math.atan"(%arg16) <{fastmath = #arith.fastmath<none>}> : (vector<3xf32>) -> vector<3xf32> loc("<stdin>":38:11)
    %12 = "math.cos"(%arg16) <{fastmath = #arith.fastmath<none>}> : (vector<3xf32>) -> vector<3xf32> loc("<stdin>":39:11)
    %13 = "math.exp"(%arg16) <{fastmath = #arith.fastmath<none>}> : (vector<3xf32>) -> vector<3xf32> loc("<stdin>":40:11)
    %14 = "math.expm1"(%arg16) <{fastmath = #arith.fastmath<none>}> : (vector<3xf32>) -> vector<3xf32> loc("<stdin>":41:11)
    %15 = "math.log"(%arg16) <{fastmath = #arith.fastmath<none>}> : (vector<3xf32>) -> vector<3xf32> loc("<stdin>":42:11)
    %16 = "math.log1p"(%arg16) <{fastmath = #arith.fastmath<none>}> : (vector<3xf32>) -> vector<3xf32> loc("<stdin>":43:11)
    %17 = "math.log2"(%arg16) <{fastmath = #arith.fastmath<none>}> : (vector<3xf32>) -> vector<3xf32> loc("<stdin>":44:11)
    %18 = "math.log10"(%arg16) <{fastmath = #arith.fastmath<none>}> : (vector<3xf32>) -> vector<3xf32> loc("<stdin>":45:11)
    %19 = "math.exp2"(%arg16) <{fastmath = #arith.fastmath<none>}> : (vector<3xf32>) -> vector<3xf32> loc("<stdin>":46:11)
    %20 = "math.roundeven"(%arg16) <{fastmath = #arith.fastmath<none>}> : (vector<3xf32>) -> vector<3xf32> loc("<stdin>":47:11)
    %21 = "math.rsqrt"(%arg16) <{fastmath = #arith.fastmath<none>}> : (vector<3xf32>) -> vector<3xf32> loc("<stdin>":48:11)
    %22 = "math.sqrt"(%arg16) <{fastmath = #arith.fastmath<none>}> : (vector<3xf32>) -> vector<3xf32> loc("<stdin>":49:11)
    %23 = "math.tanh"(%arg16) <{fastmath = #arith.fastmath<none>}> : (vector<3xf32>) -> vector<3xf32> loc("<stdin>":50:11)
    %24 = "math.sin"(%arg16) <{fastmath = #arith.fastmath<none>}> : (vector<3xf32>) -> vector<3xf32> loc("<stdin>":51:11)
    %25 = "math.tan"(%arg16) <{fastmath = #arith.fastmath<none>}> : (vector<3xf32>) -> vector<3xf32> loc("<stdin>":52:11)
    %26 = "math.asin"(%arg16) <{fastmath = #arith.fastmath<none>}> : (vector<3xf32>) -> vector<3xf32> loc("<stdin>":53:11)
    %27 = "math.acos"(%arg16) <{fastmath = #arith.fastmath<none>}> : (vector<3xf32>) -> vector<3xf32> loc("<stdin>":54:11)
    %28 = "math.sinh"(%arg16) <{fastmath = #arith.fastmath<none>}> : (vector<3xf32>) -> vector<3xf32> loc("<stdin>":55:11)
    %29 = "math.cosh"(%arg16) <{fastmath = #arith.fastmath<none>}> : (vector<3xf32>) -> vector<3xf32> loc("<stdin>":56:11)
    %30 = "math.asinh"(%arg16) <{fastmath = #arith.fastmath<none>}> : (vector<3xf32>) -> vector<3xf32> loc("<stdin>":57:11)
    %31 = "math.acosh"(%arg16) <{fastmath = #arith.fastmath<none>}> : (vector<3xf32>) -> vector<3xf32> loc("<stdin>":58:11)
    %32 = "math.atanh"(%arg16) <{fastmath = #arith.fastmath<none>}> : (vector<3xf32>) -> vector<3xf32> loc("<stdin>":59:11)
    %33 = "math.trunc"(%arg16) <{fastmath = #arith.fastmath<none>}> : (vector<3xf32>) -> vector<3xf32> loc("<stdin>":60:11)
    "func.return"() : () -> () loc("<stdin>":61:5)
  }) : () -> () loc("<stdin>":36:3)
  "func.func"() <{function_type = (f32, f32) -> (), sym_name = "float32_binary_scalar"}> ({
  ^bb0(%arg14: f32 loc("<stdin>":64:8), %arg15: f32 loc("<stdin>":64:21)):
    %9 = "math.atan2"(%arg14, %arg15) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":65:10)
    %10 = "math.powf"(%arg14, %arg15) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":66:11)
    "func.return"() : () -> () loc("<stdin>":67:5)
  }) : () -> () loc("<stdin>":63:3)
  "func.func"() <{function_type = (vector<4xf32>, vector<4xf32>) -> (), sym_name = "float32_binary_vector"}> ({
  ^bb0(%arg12: vector<4xf32> loc("<stdin>":70:8), %arg13: vector<4xf32> loc("<stdin>":70:31)):
    %7 = "math.atan2"(%arg12, %arg13) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32> loc("<stdin>":71:10)
    %8 = "math.powf"(%arg12, %arg13) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32> loc("<stdin>":72:10)
    "func.return"() : () -> () loc("<stdin>":73:5)
  }) : () -> () loc("<stdin>":69:3)
  "func.func"() <{function_type = (f32, i32) -> f32, sym_name = "fpowi_scalar"}> ({
  ^bb0(%arg10: f32 loc("<stdin>":76:8), %arg11: i32 loc("<stdin>":76:21)):
    %6 = "math.fpowi"(%arg10, %arg11) <{fastmath = #arith.fastmath<none>}> : (f32, i32) -> f32 loc("<stdin>":77:10)
    "func.return"(%6) : (f32) -> () loc("<stdin>":78:5)
  }) : () -> () loc("<stdin>":75:3)
  "func.func"() <{function_type = (vector<4xf32>, vector<4xi32>) -> vector<4xf32>, sym_name = "fpowi_vector"}> ({
  ^bb0(%arg8: vector<4xf32> loc("<stdin>":81:8), %arg9: vector<4xi32> loc("<stdin>":81:30)):
    %5 = "math.fpowi"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>, vector<4xi32>) -> vector<4xf32> loc("<stdin>":82:10)
    "func.return"(%5) : (vector<4xf32>) -> () loc("<stdin>":83:5)
  }) : () -> () loc("<stdin>":80:3)
  "func.func"() <{function_type = (f32, f32, f32) -> (), sym_name = "float32_ternary_scalar"}> ({
  ^bb0(%arg5: f32 loc("<stdin>":86:8), %arg6: f32 loc("<stdin>":86:20), %arg7: f32 loc("<stdin>":86:32)):
    %4 = "math.fma"(%arg5, %arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32, f32) -> f32 loc("<stdin>":87:10)
    "func.return"() : () -> () loc("<stdin>":88:5)
  }) : () -> () loc("<stdin>":85:3)
  "func.func"() <{function_type = (vector<4xf32>, vector<4xf32>, vector<4xf32>) -> (), sym_name = "float32_ternary_vector"}> ({
  ^bb0(%arg2: vector<4xf32> loc("<stdin>":91:8), %arg3: vector<4xf32> loc("<stdin>":91:30), %arg4: vector<4xf32> loc("<stdin>":91:52)):
    %3 = "math.fma"(%arg2, %arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>, vector<4xf32>, vector<4xf32>) -> vector<4xf32> loc("<stdin>":92:10)
    "func.return"() : () -> () loc("<stdin>":93:5)
  }) : () -> () loc("<stdin>":90:3)
  "func.func"() <{function_type = (i32) -> (), sym_name = "int_unary"}> ({
  ^bb0(%arg1: i32 loc("<stdin>":96:8)):
    %1 = "math.absi"(%arg1) : (i32) -> i32 loc("<stdin>":97:10)
    %2 = "math.ctlz"(%arg1) : (i32) -> i32 loc("<stdin>":98:10)
    "func.return"() : () -> () loc("<stdin>":99:5)
  }) : () -> () loc("<stdin>":95:3)
  "func.func"() <{function_type = (vector<2xi32>) -> (), sym_name = "int_unary_vector"}> ({
  ^bb0(%arg0: vector<2xi32> loc("<stdin>":102:8)):
    %0 = "math.ctlz"(%arg0) : (vector<2xi32>) -> vector<2xi32> loc("<stdin>":103:10)
    "func.return"() : () -> () loc("<stdin>":104:5)
  }) : () -> () loc("<stdin>":101:3)
}) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Kernel], []>, #spirv.resource_limits<>>} : () -> () loc("<stdin>":1:1)
