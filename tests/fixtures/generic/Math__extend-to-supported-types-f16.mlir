"builtin.module"() ({
  "func.func"() <{function_type = (f8E5M2) -> f8E5M2, sym_name = "sin_f8E5M2"}> ({
  ^bb0(%arg19: f8E5M2):
    %16 = "math.sin"(%arg19) <{fastmath = #arith.fastmath<none>}> : (f8E5M2) -> f8E5M2
    "func.return"(%16) : (f8E5M2) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f16) -> f16, sym_name = "sin"}> ({
  ^bb0(%arg18: f16):
    %15 = "math.sin"(%arg18) <{fastmath = #arith.fastmath<none>}> : (f16) -> f16
    "func.return"(%15) : (f16) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f8E5M2, i32) -> f8E5M2, sym_name = "fpowi_f8E5M2"}> ({
  ^bb0(%arg16: f8E5M2, %arg17: i32):
    %14 = "math.fpowi"(%arg16, %arg17) <{fastmath = #arith.fastmath<none>}> : (f8E5M2, i32) -> f8E5M2
    "func.return"(%14) : (f8E5M2) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f16, i32) -> f16, sym_name = "fpowi"}> ({
  ^bb0(%arg14: f16, %arg15: i32):
    %13 = "math.fpowi"(%arg14, %arg15) <{fastmath = #arith.fastmath<none>}> : (f16, i32) -> f16
    "func.return"(%13) : (f16) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f16, f16, f16) -> f16, sym_name = "fma"}> ({
  ^bb0(%arg11: f16, %arg12: f16, %arg13: f16):
    %12 = "math.fma"(%arg11, %arg12, %arg13) <{fastmath = #arith.fastmath<none>}> : (f16, f16, f16) -> f16
    "func.return"(%12) : (f16) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f16) -> f16, sym_name = "absf_f16"}> ({
  ^bb0(%arg10: f16):
    %11 = "math.absf"(%arg10) <{fastmath = #arith.fastmath<none>}> : (f16) -> f16
    "func.return"(%11) : (f16) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> f32, sym_name = "absf_f32"}> ({
  ^bb0(%arg9: f32):
    %10 = "math.absf"(%arg9) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "func.return"(%10) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64) -> f64, sym_name = "absf_f64"}> ({
  ^bb0(%arg8: f64):
    %9 = "math.absf"(%arg8) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64
    "func.return"(%9) : (f64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xbf16>) -> vector<2xbf16>, sym_name = "sin_vector"}> ({
  ^bb0(%arg7: vector<2xbf16>):
    %8 = "math.sin"(%arg7) <{fastmath = #arith.fastmath<none>}> : (vector<2xbf16>) -> vector<2xbf16>
    "func.return"(%8) : (vector<2xbf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf16>) -> vector<2xf16>, sym_name = "sin_vector_f16"}> ({
  ^bb0(%arg6: vector<2xf16>):
    %7 = "math.sin"(%arg6) <{fastmath = #arith.fastmath<none>}> : (vector<2xf16>) -> vector<2xf16>
    "func.return"(%7) : (vector<2xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f16) -> f16, sym_name = "fastmath"}> ({
  ^bb0(%arg5: f16):
    %6 = "math.sin"(%arg5) <{fastmath = #arith.fastmath<nsz>}> : (f16) -> f16
    "func.return"(%6) : (f16) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f8E5M2) -> f8E5M2, sym_name = "sequences_f8E5M2"}> ({
  ^bb0(%arg4: f8E5M2):
    %4 = "math.absf"(%arg4) <{fastmath = #arith.fastmath<none>}> : (f8E5M2) -> f8E5M2
    %5 = "math.sin"(%4) <{fastmath = #arith.fastmath<none>}> : (f8E5M2) -> f8E5M2
    "func.return"(%5) : (f8E5M2) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f16) -> f16, sym_name = "sequences"}> ({
  ^bb0(%arg3: f16):
    %2 = "math.absf"(%arg3) <{fastmath = #arith.fastmath<none>}> : (f16) -> f16
    %3 = "math.sin"(%2) <{fastmath = #arith.fastmath<none>}> : (f16) -> f16
    "func.return"(%3) : (f16) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (bf16, bf16, i1) -> bf16, sym_name = "promote_in_if_block"}> ({
  ^bb0(%arg0: bf16, %arg1: bf16, %arg2: i1):
    %0 = "scf.if"(%arg2) ({
      %1 = "math.absf"(%arg0) <{fastmath = #arith.fastmath<none>}> : (bf16) -> bf16
      "scf.yield"(%1) : (bf16) -> ()
    }, {
      "scf.yield"(%arg1) : (bf16) -> ()
    }) : (i1) -> bf16
    "func.return"(%0) : (bf16) -> ()
  }) : () -> ()
}) : () -> ()

