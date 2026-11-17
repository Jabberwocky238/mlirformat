"builtin.module"() ({
  "func.func"() <{function_type = (f32, f64) -> (), sym_name = "absf"}> ({
  ^bb0(%arg28: f32 loc("<stdin>":3:8), %arg29: f64 loc("<stdin>":3:21)):
    %24 = "math.absf"(%arg28) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":4:11)
    %25 = "math.absf"(%arg29) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64 loc("<stdin>":5:11)
    "func.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (f32, f64) -> (), sym_name = "floor"}> ({
  ^bb0(%arg26: f32 loc("<stdin>":9:8), %arg27: f64 loc("<stdin>":9:21)):
    %22 = "math.floor"(%arg26) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":10:11)
    %23 = "math.floor"(%arg27) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64 loc("<stdin>":11:11)
    "func.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = (f32, f64) -> (), sym_name = "sin"}> ({
  ^bb0(%arg24: f32 loc("<stdin>":15:8), %arg25: f64 loc("<stdin>":15:21)):
    %20 = "math.sin"(%arg24) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":16:11)
    %21 = "math.sin"(%arg25) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64 loc("<stdin>":17:11)
    "func.return"() : () -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":14:3)
  "func.func"() <{function_type = (f32, f64) -> (), sym_name = "cos"}> ({
  ^bb0(%arg22: f32 loc("<stdin>":21:8), %arg23: f64 loc("<stdin>":21:21)):
    %18 = "math.cos"(%arg22) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":22:11)
    %19 = "math.cos"(%arg23) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64 loc("<stdin>":23:11)
    "func.return"() : () -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":20:3)
  "func.func"() <{function_type = (f32, f64) -> (), sym_name = "asin"}> ({
  ^bb0(%arg20: f32 loc("<stdin>":27:8), %arg21: f64 loc("<stdin>":27:21)):
    %16 = "math.asin"(%arg20) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":28:11)
    %17 = "math.asin"(%arg21) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64 loc("<stdin>":29:11)
    "func.return"() : () -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":26:3)
  "func.func"() <{function_type = (f32, f64) -> (), sym_name = "acos"}> ({
  ^bb0(%arg18: f32 loc("<stdin>":33:8), %arg19: f64 loc("<stdin>":33:21)):
    %14 = "math.acos"(%arg18) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":34:11)
    %15 = "math.acos"(%arg19) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64 loc("<stdin>":35:11)
    "func.return"() : () -> () loc("<stdin>":36:5)
  }) : () -> () loc("<stdin>":32:3)
  "func.func"() <{function_type = (f32, f32, f64, f64) -> (), sym_name = "atan2"}> ({
  ^bb0(%arg14: f32 loc("<stdin>":39:8), %arg15: f32 loc("<stdin>":39:21), %arg16: f64 loc("<stdin>":39:34), %arg17: f64 loc("<stdin>":39:47)):
    %12 = "math.atan2"(%arg14, %arg15) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":40:11)
    %13 = "math.atan2"(%arg16, %arg17) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":41:11)
    "func.return"() : () -> () loc("<stdin>":42:5)
  }) : () -> () loc("<stdin>":38:3)
  "func.func"() <{function_type = (f32, f64) -> (), sym_name = "ceil"}> ({
  ^bb0(%arg12: f32 loc("<stdin>":45:8), %arg13: f64 loc("<stdin>":45:21)):
    %10 = "math.ceil"(%arg12) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":46:11)
    %11 = "math.ceil"(%arg13) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64 loc("<stdin>":47:11)
    "func.return"() : () -> () loc("<stdin>":48:5)
  }) : () -> () loc("<stdin>":44:3)
  "func.func"() <{function_type = (f32, f64) -> (), sym_name = "sqrt"}> ({
  ^bb0(%arg10: f32 loc("<stdin>":51:8), %arg11: f64 loc("<stdin>":51:21)):
    %8 = "math.sqrt"(%arg10) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":52:10)
    %9 = "math.sqrt"(%arg11) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64 loc("<stdin>":53:10)
    "func.return"() : () -> () loc("<stdin>":54:5)
  }) : () -> () loc("<stdin>":50:3)
  "func.func"() <{function_type = (f32, f64) -> (), sym_name = "exp"}> ({
  ^bb0(%arg8: f32 loc("<stdin>":57:8), %arg9: f64 loc("<stdin>":57:20)):
    %6 = "math.exp"(%arg8) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":58:10)
    %7 = "math.exp"(%arg9) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64 loc("<stdin>":59:10)
    "func.return"() : () -> () loc("<stdin>":60:5)
  }) : () -> () loc("<stdin>":56:3)
  "func.func"() <{function_type = (f32, f32, f64, f64) -> (), sym_name = "powf"}> ({
  ^bb0(%arg4: f32 loc("<stdin>":63:8), %arg5: f32 loc("<stdin>":63:20), %arg6: f64 loc("<stdin>":63:32), %arg7: f64 loc("<stdin>":63:44)):
    %4 = "math.powf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":64:10)
    %5 = "math.powf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":65:10)
    "func.return"() : () -> () loc("<stdin>":66:5)
  }) : () -> () loc("<stdin>":62:3)
  "func.func"() <{function_type = (f32, f64) -> (), sym_name = "round"}> ({
  ^bb0(%arg2: f32 loc("<stdin>":69:8), %arg3: f64 loc("<stdin>":69:20)):
    %2 = "math.round"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":70:10)
    %3 = "math.round"(%arg3) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64 loc("<stdin>":71:10)
    "func.return"() : () -> () loc("<stdin>":72:5)
  }) : () -> () loc("<stdin>":68:3)
  "func.func"() <{function_type = (f32, f64) -> (), sym_name = "roundeven"}> ({
  ^bb0(%arg0: f32 loc("<stdin>":75:8), %arg1: f64 loc("<stdin>":75:20)):
    %0 = "math.roundeven"(%arg0) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":76:10)
    %1 = "math.roundeven"(%arg1) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64 loc("<stdin>":77:10)
    "func.return"() : () -> () loc("<stdin>":78:5)
  }) : () -> () loc("<stdin>":74:3)
}) : () -> () loc("<stdin>":1:1)
