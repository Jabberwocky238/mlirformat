"builtin.module"() ({
  "func.func"() <{function_type = (f32, vector<4xf32>, tensor<4x4x?xf32>) -> (), sym_name = "atan"}> ({
  ^bb0(%arg89: f32, %arg90: vector<4xf32>, %arg91: tensor<4x4x?xf32>):
    %93 = "math.atan"(%arg89) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    %94 = "math.atan"(%arg90) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> vector<4xf32>
    %95 = "math.atan"(%arg91) <{fastmath = #arith.fastmath<none>}> : (tensor<4x4x?xf32>) -> tensor<4x4x?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<4xf32>, tensor<4x4x?xf32>) -> (), sym_name = "atan2"}> ({
  ^bb0(%arg86: f32, %arg87: vector<4xf32>, %arg88: tensor<4x4x?xf32>):
    %90 = "math.atan2"(%arg86, %arg86) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %91 = "math.atan2"(%arg87, %arg87) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    %92 = "math.atan2"(%arg88, %arg88) <{fastmath = #arith.fastmath<none>}> : (tensor<4x4x?xf32>, tensor<4x4x?xf32>) -> tensor<4x4x?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<4xf32>, tensor<4x4x?xf32>) -> (), sym_name = "cbrt"}> ({
  ^bb0(%arg83: f32, %arg84: vector<4xf32>, %arg85: tensor<4x4x?xf32>):
    %87 = "math.cbrt"(%arg83) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    %88 = "math.cbrt"(%arg84) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> vector<4xf32>
    %89 = "math.cbrt"(%arg85) <{fastmath = #arith.fastmath<none>}> : (tensor<4x4x?xf32>) -> tensor<4x4x?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<4xf32>, tensor<4x4x?xf32>) -> (), sym_name = "cos"}> ({
  ^bb0(%arg80: f32, %arg81: vector<4xf32>, %arg82: tensor<4x4x?xf32>):
    %84 = "math.cos"(%arg80) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    %85 = "math.cos"(%arg81) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> vector<4xf32>
    %86 = "math.cos"(%arg82) <{fastmath = #arith.fastmath<none>}> : (tensor<4x4x?xf32>) -> tensor<4x4x?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<4xf32>, tensor<4x4x?xf32>) -> (), sym_name = "sin"}> ({
  ^bb0(%arg77: f32, %arg78: vector<4xf32>, %arg79: tensor<4x4x?xf32>):
    %81 = "math.sin"(%arg77) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    %82 = "math.sin"(%arg78) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> vector<4xf32>
    %83 = "math.sin"(%arg79) <{fastmath = #arith.fastmath<none>}> : (tensor<4x4x?xf32>) -> tensor<4x4x?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<4xf32>, tensor<4x4x?xf32>) -> (), sym_name = "sincos"}> ({
  ^bb0(%arg74: f32, %arg75: vector<4xf32>, %arg76: tensor<4x4x?xf32>):
    %78:2 = "math.sincos"(%arg74) <{fastmath = #arith.fastmath<none>}> : (f32) -> (f32, f32)
    %79:2 = "math.sincos"(%arg75) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> (vector<4xf32>, vector<4xf32>)
    %80:2 = "math.sincos"(%arg76) <{fastmath = #arith.fastmath<none>}> : (tensor<4x4x?xf32>) -> (tensor<4x4x?xf32>, tensor<4x4x?xf32>)
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<4xf32>, tensor<4x4x?xf32>) -> (), sym_name = "erf"}> ({
  ^bb0(%arg71: f32, %arg72: vector<4xf32>, %arg73: tensor<4x4x?xf32>):
    %75 = "math.erf"(%arg71) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    %76 = "math.erf"(%arg72) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> vector<4xf32>
    %77 = "math.erf"(%arg73) <{fastmath = #arith.fastmath<none>}> : (tensor<4x4x?xf32>) -> tensor<4x4x?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<4xf32>, tensor<4x4x?xf32>) -> (), sym_name = "exp"}> ({
  ^bb0(%arg68: f32, %arg69: vector<4xf32>, %arg70: tensor<4x4x?xf32>):
    %72 = "math.exp"(%arg68) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    %73 = "math.exp"(%arg69) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> vector<4xf32>
    %74 = "math.exp"(%arg70) <{fastmath = #arith.fastmath<none>}> : (tensor<4x4x?xf32>) -> tensor<4x4x?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<4xf32>, tensor<4x4x?xf32>) -> (), sym_name = "exp2"}> ({
  ^bb0(%arg65: f32, %arg66: vector<4xf32>, %arg67: tensor<4x4x?xf32>):
    %69 = "math.exp2"(%arg65) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    %70 = "math.exp2"(%arg66) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> vector<4xf32>
    %71 = "math.exp2"(%arg67) <{fastmath = #arith.fastmath<none>}> : (tensor<4x4x?xf32>) -> tensor<4x4x?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<4xf32>, tensor<4x4x?xf32>) -> (), sym_name = "expm1"}> ({
  ^bb0(%arg62: f32, %arg63: vector<4xf32>, %arg64: tensor<4x4x?xf32>):
    %66 = "math.expm1"(%arg62) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    %67 = "math.expm1"(%arg63) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> vector<4xf32>
    %68 = "math.expm1"(%arg64) <{fastmath = #arith.fastmath<none>}> : (tensor<4x4x?xf32>) -> tensor<4x4x?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<4xf32>, tensor<4x4x?xf32>) -> (), sym_name = "log"}> ({
  ^bb0(%arg59: f32, %arg60: vector<4xf32>, %arg61: tensor<4x4x?xf32>):
    %63 = "math.log"(%arg59) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    %64 = "math.log"(%arg60) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> vector<4xf32>
    %65 = "math.log"(%arg61) <{fastmath = #arith.fastmath<none>}> : (tensor<4x4x?xf32>) -> tensor<4x4x?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<4xf32>, tensor<4x4x?xf32>) -> (), sym_name = "log10"}> ({
  ^bb0(%arg56: f32, %arg57: vector<4xf32>, %arg58: tensor<4x4x?xf32>):
    %60 = "math.log10"(%arg56) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    %61 = "math.log10"(%arg57) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> vector<4xf32>
    %62 = "math.log10"(%arg58) <{fastmath = #arith.fastmath<none>}> : (tensor<4x4x?xf32>) -> tensor<4x4x?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<4xf32>, tensor<4x4x?xf32>) -> (), sym_name = "log1p"}> ({
  ^bb0(%arg53: f32, %arg54: vector<4xf32>, %arg55: tensor<4x4x?xf32>):
    %57 = "math.log1p"(%arg53) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    %58 = "math.log1p"(%arg54) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> vector<4xf32>
    %59 = "math.log1p"(%arg55) <{fastmath = #arith.fastmath<none>}> : (tensor<4x4x?xf32>) -> tensor<4x4x?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<4xf32>, tensor<4x4x?xf32>) -> (), sym_name = "log2"}> ({
  ^bb0(%arg50: f32, %arg51: vector<4xf32>, %arg52: tensor<4x4x?xf32>):
    %54 = "math.log2"(%arg50) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    %55 = "math.log2"(%arg51) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> vector<4xf32>
    %56 = "math.log2"(%arg52) <{fastmath = #arith.fastmath<none>}> : (tensor<4x4x?xf32>) -> tensor<4x4x?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<4xf32>, tensor<4x4x?xf32>) -> (), sym_name = "powf"}> ({
  ^bb0(%arg47: f32, %arg48: vector<4xf32>, %arg49: tensor<4x4x?xf32>):
    %51 = "math.powf"(%arg47, %arg47) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
    %52 = "math.powf"(%arg48, %arg48) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    %53 = "math.powf"(%arg49, %arg49) <{fastmath = #arith.fastmath<none>}> : (tensor<4x4x?xf32>, tensor<4x4x?xf32>) -> tensor<4x4x?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, i32, vector<4xf64>, vector<4xi16>, tensor<4x3x?xf16>, tensor<4x3x?xi64>) -> (), sym_name = "fpowi"}> ({
  ^bb0(%arg41: f32, %arg42: i32, %arg43: vector<4xf64>, %arg44: vector<4xi16>, %arg45: tensor<4x3x?xf16>, %arg46: tensor<4x3x?xi64>):
    %48 = "math.fpowi"(%arg41, %arg42) <{fastmath = #arith.fastmath<none>}> : (f32, i32) -> f32
    %49 = "math.fpowi"(%arg43, %arg44) <{fastmath = #arith.fastmath<none>}> : (vector<4xf64>, vector<4xi16>) -> vector<4xf64>
    %50 = "math.fpowi"(%arg45, %arg46) <{fastmath = #arith.fastmath<none>}> : (tensor<4x3x?xf16>, tensor<4x3x?xi64>) -> tensor<4x3x?xf16>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<4xf32>, tensor<4x4x?xf32>) -> (), sym_name = "rsqrt"}> ({
  ^bb0(%arg38: f32, %arg39: vector<4xf32>, %arg40: tensor<4x4x?xf32>):
    %45 = "math.rsqrt"(%arg38) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    %46 = "math.rsqrt"(%arg39) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> vector<4xf32>
    %47 = "math.rsqrt"(%arg40) <{fastmath = #arith.fastmath<none>}> : (tensor<4x4x?xf32>) -> tensor<4x4x?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<4xf32>, tensor<4x4x?xf32>) -> (), sym_name = "sqrt"}> ({
  ^bb0(%arg35: f32, %arg36: vector<4xf32>, %arg37: tensor<4x4x?xf32>):
    %42 = "math.sqrt"(%arg35) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    %43 = "math.sqrt"(%arg36) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> vector<4xf32>
    %44 = "math.sqrt"(%arg37) <{fastmath = #arith.fastmath<none>}> : (tensor<4x4x?xf32>) -> tensor<4x4x?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<4xf32>, tensor<4x4x?xf32>) -> (), sym_name = "tan"}> ({
  ^bb0(%arg32: f32, %arg33: vector<4xf32>, %arg34: tensor<4x4x?xf32>):
    %39 = "math.tan"(%arg32) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    %40 = "math.tan"(%arg33) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> vector<4xf32>
    %41 = "math.tan"(%arg34) <{fastmath = #arith.fastmath<none>}> : (tensor<4x4x?xf32>) -> tensor<4x4x?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<4xf32>, tensor<4x4x?xf32>) -> (), sym_name = "tanh"}> ({
  ^bb0(%arg29: f32, %arg30: vector<4xf32>, %arg31: tensor<4x4x?xf32>):
    %36 = "math.tanh"(%arg29) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    %37 = "math.tanh"(%arg30) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> vector<4xf32>
    %38 = "math.tanh"(%arg31) <{fastmath = #arith.fastmath<none>}> : (tensor<4x4x?xf32>) -> tensor<4x4x?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<4xf32>, tensor<4x4x?xf32>) -> (), sym_name = "round"}> ({
  ^bb0(%arg26: f32, %arg27: vector<4xf32>, %arg28: tensor<4x4x?xf32>):
    %33 = "math.round"(%arg26) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    %34 = "math.round"(%arg27) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> vector<4xf32>
    %35 = "math.round"(%arg28) <{fastmath = #arith.fastmath<none>}> : (tensor<4x4x?xf32>) -> tensor<4x4x?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<4xf32>, tensor<4x4x?xf32>) -> (), sym_name = "roundeven"}> ({
  ^bb0(%arg23: f32, %arg24: vector<4xf32>, %arg25: tensor<4x4x?xf32>):
    %30 = "math.roundeven"(%arg23) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    %31 = "math.roundeven"(%arg24) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> vector<4xf32>
    %32 = "math.roundeven"(%arg25) <{fastmath = #arith.fastmath<none>}> : (tensor<4x4x?xf32>) -> tensor<4x4x?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, vector<4xi32>, tensor<4x4x?xi32>) -> (), sym_name = "ipowi"}> ({
  ^bb0(%arg20: i32, %arg21: vector<4xi32>, %arg22: tensor<4x4x?xi32>):
    %27 = "math.ipowi"(%arg20, %arg20) : (i32, i32) -> i32
    %28 = "math.ipowi"(%arg21, %arg21) : (vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    %29 = "math.ipowi"(%arg22, %arg22) : (tensor<4x4x?xi32>, tensor<4x4x?xi32>) -> tensor<4x4x?xi32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<4xf32>, tensor<4x4x?xf32>) -> (), sym_name = "trunc"}> ({
  ^bb0(%arg17: f32, %arg18: vector<4xf32>, %arg19: tensor<4x4x?xf32>):
    %24 = "math.trunc"(%arg17) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    %25 = "math.trunc"(%arg18) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> vector<4xf32>
    %26 = "math.trunc"(%arg19) <{fastmath = #arith.fastmath<none>}> : (tensor<4x4x?xf32>) -> tensor<4x4x?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, i32, vector<4xf32>, tensor<4x4x?xf32>) -> (), sym_name = "fastmath"}> ({
  ^bb0(%arg13: f32, %arg14: i32, %arg15: vector<4xf32>, %arg16: tensor<4x4x?xf32>):
    %19 = "math.trunc"(%arg13) <{fastmath = #arith.fastmath<fast>}> : (f32) -> f32
    %20 = "math.powf"(%arg15, %arg15) <{fastmath = #arith.fastmath<fast>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    %21 = "math.fma"(%arg16, %arg16, %arg16) <{fastmath = #arith.fastmath<none>}> : (tensor<4x4x?xf32>, tensor<4x4x?xf32>, tensor<4x4x?xf32>) -> tensor<4x4x?xf32>
    %22 = "math.absf"(%arg13) <{fastmath = #arith.fastmath<ninf>}> : (f32) -> f32
    %23 = "math.fpowi"(%arg13, %arg14) <{fastmath = #arith.fastmath<fast>}> : (f32, i32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, f64, vector<4xf32>, tensor<4x?xf32>) -> (), sym_name = "fpclassify"}> ({
  ^bb0(%arg9: f32, %arg10: f64, %arg11: vector<4xf32>, %arg12: tensor<4x?xf32>):
    %3 = "math.isfinite"(%arg9) <{fastmath = #arith.fastmath<none>}> : (f32) -> i1
    %4 = "math.isfinite"(%arg10) <{fastmath = #arith.fastmath<none>}> : (f64) -> i1
    %5 = "math.isfinite"(%arg11) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> vector<4xi1>
    %6 = "math.isfinite"(%arg12) <{fastmath = #arith.fastmath<none>}> : (tensor<4x?xf32>) -> tensor<4x?xi1>
    %7 = "math.isinf"(%arg9) <{fastmath = #arith.fastmath<none>}> : (f32) -> i1
    %8 = "math.isinf"(%arg10) <{fastmath = #arith.fastmath<none>}> : (f64) -> i1
    %9 = "math.isinf"(%arg11) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> vector<4xi1>
    %10 = "math.isinf"(%arg12) <{fastmath = #arith.fastmath<none>}> : (tensor<4x?xf32>) -> tensor<4x?xi1>
    %11 = "math.isnan"(%arg9) <{fastmath = #arith.fastmath<none>}> : (f32) -> i1
    %12 = "math.isnan"(%arg10) <{fastmath = #arith.fastmath<none>}> : (f64) -> i1
    %13 = "math.isnan"(%arg11) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> vector<4xi1>
    %14 = "math.isnan"(%arg12) <{fastmath = #arith.fastmath<none>}> : (tensor<4x?xf32>) -> tensor<4x?xi1>
    %15 = "math.isnormal"(%arg9) <{fastmath = #arith.fastmath<none>}> : (f32) -> i1
    %16 = "math.isnormal"(%arg10) <{fastmath = #arith.fastmath<none>}> : (f64) -> i1
    %17 = "math.isnormal"(%arg11) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> vector<4xi1>
    %18 = "math.isnormal"(%arg12) <{fastmath = #arith.fastmath<none>}> : (tensor<4x?xf32>) -> tensor<4x?xi1>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3x4xf32>, vector<3x4xf32>, vector<3x4xf32>, f32, f32, f32, tensor<?xf80>, tensor<?xf80>, tensor<?xf80>) -> (), sym_name = "clampf"}> ({
  ^bb0(%arg0: vector<3x4xf32>, %arg1: vector<3x4xf32>, %arg2: vector<3x4xf32>, %arg3: f32, %arg4: f32, %arg5: f32, %arg6: tensor<?xf80>, %arg7: tensor<?xf80>, %arg8: tensor<?xf80>):
    %0 = "math.clampf"(%arg0, %arg1, %arg2) <{fastmath = #arith.fastmath<fast>}> : (vector<3x4xf32>, vector<3x4xf32>, vector<3x4xf32>) -> vector<3x4xf32>
    %1 = "math.clampf"(%arg3, %arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32, f32) -> f32
    %2 = "math.clampf"(%arg6, %arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (tensor<?xf80>, tensor<?xf80>, tensor<?xf80>) -> tensor<?xf80>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

