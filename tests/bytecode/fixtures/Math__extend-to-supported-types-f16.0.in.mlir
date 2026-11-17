"builtin.module"() ({
  "func.func"() <{function_type = (f8E5M2) -> f8E5M2, sym_name = "sin_f8E5M2"}> ({
  ^bb0(%arg19: f8E5M2 loc("<stdin>":3:8)):
    %16 = "math.sin"(%arg19) <{fastmath = #arith.fastmath<none>}> : (f8E5M2) -> f8E5M2 loc("<stdin>":4:11)
    "func.return"(%16) : (f8E5M2) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (f16) -> f16, sym_name = "sin"}> ({
  ^bb0(%arg18: f16 loc("<stdin>":8:8)):
    %15 = "math.sin"(%arg18) <{fastmath = #arith.fastmath<none>}> : (f16) -> f16 loc("<stdin>":9:11)
    "func.return"(%15) : (f16) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (f8E5M2, i32) -> f8E5M2, sym_name = "fpowi_f8E5M2"}> ({
  ^bb0(%arg16: f8E5M2 loc("<stdin>":13:8), %arg17: i32 loc("<stdin>":13:24)):
    %14 = "math.fpowi"(%arg16, %arg17) <{fastmath = #arith.fastmath<none>}> : (f8E5M2, i32) -> f8E5M2 loc("<stdin>":14:11)
    "func.return"(%14) : (f8E5M2) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (f16, i32) -> f16, sym_name = "fpowi"}> ({
  ^bb0(%arg14: f16 loc("<stdin>":18:8), %arg15: i32 loc("<stdin>":18:21)):
    %13 = "math.fpowi"(%arg14, %arg15) <{fastmath = #arith.fastmath<none>}> : (f16, i32) -> f16 loc("<stdin>":19:11)
    "func.return"(%13) : (f16) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (f16, f16, f16) -> f16, sym_name = "fma"}> ({
  ^bb0(%arg11: f16 loc("<stdin>":23:8), %arg12: f16 loc("<stdin>":23:21), %arg13: f16 loc("<stdin>":23:34)):
    %12 = "math.fma"(%arg11, %arg12, %arg13) <{fastmath = #arith.fastmath<none>}> : (f16, f16, f16) -> f16 loc("<stdin>":24:11)
    "func.return"(%12) : (f16) -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":22:3)
  "func.func"() <{function_type = (f16) -> f16, sym_name = "absf_f16"}> ({
  ^bb0(%arg10: f16 loc("<stdin>":28:8)):
    %11 = "math.absf"(%arg10) <{fastmath = #arith.fastmath<none>}> : (f16) -> f16 loc("<stdin>":29:11)
    "func.return"(%11) : (f16) -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":27:3)
  "func.func"() <{function_type = (f32) -> f32, sym_name = "absf_f32"}> ({
  ^bb0(%arg9: f32 loc("<stdin>":33:8)):
    %10 = "math.absf"(%arg9) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":34:11)
    "func.return"(%10) : (f32) -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":32:3)
  "func.func"() <{function_type = (f64) -> f64, sym_name = "absf_f64"}> ({
  ^bb0(%arg8: f64 loc("<stdin>":38:8)):
    %9 = "math.absf"(%arg8) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64 loc("<stdin>":39:10)
    "func.return"(%9) : (f64) -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":37:3)
  "func.func"() <{function_type = (vector<2xbf16>) -> vector<2xbf16>, sym_name = "sin_vector"}> ({
  ^bb0(%arg7: vector<2xbf16> loc("<stdin>":43:8)):
    %8 = "math.sin"(%arg7) <{fastmath = #arith.fastmath<none>}> : (vector<2xbf16>) -> vector<2xbf16> loc("<stdin>":44:10)
    "func.return"(%8) : (vector<2xbf16>) -> () loc("<stdin>":45:5)
  }) : () -> () loc("<stdin>":42:3)
  "func.func"() <{function_type = (vector<2xf16>) -> vector<2xf16>, sym_name = "sin_vector_f16"}> ({
  ^bb0(%arg6: vector<2xf16> loc("<stdin>":48:8)):
    %7 = "math.sin"(%arg6) <{fastmath = #arith.fastmath<none>}> : (vector<2xf16>) -> vector<2xf16> loc("<stdin>":49:10)
    "func.return"(%7) : (vector<2xf16>) -> () loc("<stdin>":50:5)
  }) : () -> () loc("<stdin>":47:3)
  "func.func"() <{function_type = (f16) -> f16, sym_name = "fastmath"}> ({
  ^bb0(%arg5: f16 loc("<stdin>":53:8)):
    %6 = "math.sin"(%arg5) <{fastmath = #arith.fastmath<nsz>}> : (f16) -> f16 loc("<stdin>":54:10)
    "func.return"(%6) : (f16) -> () loc("<stdin>":55:5)
  }) : () -> () loc("<stdin>":52:3)
  "func.func"() <{function_type = (f8E5M2) -> f8E5M2, sym_name = "sequences_f8E5M2"}> ({
  ^bb0(%arg4: f8E5M2 loc("<stdin>":58:8)):
    %4 = "math.absf"(%arg4) <{fastmath = #arith.fastmath<none>}> : (f8E5M2) -> f8E5M2 loc("<stdin>":59:10)
    %5 = "math.sin"(%4) <{fastmath = #arith.fastmath<none>}> : (f8E5M2) -> f8E5M2 loc("<stdin>":60:10)
    "func.return"(%5) : (f8E5M2) -> () loc("<stdin>":61:5)
  }) : () -> () loc("<stdin>":57:3)
  "func.func"() <{function_type = (f16) -> f16, sym_name = "sequences"}> ({
  ^bb0(%arg3: f16 loc("<stdin>":64:8)):
    %2 = "math.absf"(%arg3) <{fastmath = #arith.fastmath<none>}> : (f16) -> f16 loc("<stdin>":65:10)
    %3 = "math.sin"(%2) <{fastmath = #arith.fastmath<none>}> : (f16) -> f16 loc("<stdin>":66:10)
    "func.return"(%3) : (f16) -> () loc("<stdin>":67:5)
  }) : () -> () loc("<stdin>":63:3)
  "func.func"() <{function_type = (bf16, bf16, i1) -> bf16, sym_name = "promote_in_if_block"}> ({
  ^bb0(%arg0: bf16 loc("<stdin>":70:8), %arg1: bf16 loc("<stdin>":70:21), %arg2: i1 loc("<stdin>":70:34)):
    %0 = "scf.if"(%arg2) ({
      %1 = "math.absf"(%arg0) <{fastmath = #arith.fastmath<none>}> : (bf16) -> bf16 loc("<stdin>":72:12)
      "scf.yield"(%1) : (bf16) -> () loc("<stdin>":73:7)
    }, {
      "scf.yield"(%arg1) : (bf16) -> () loc("<stdin>":75:7)
    }) : (i1) -> bf16 loc("<stdin>":71:10)
    "func.return"(%0) : (bf16) -> () loc("<stdin>":77:5)
  }) : () -> () loc("<stdin>":69:3)
}) : () -> () loc("<stdin>":1:1)
