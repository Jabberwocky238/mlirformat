"builtin.module"() ({
  "func.func"() <{function_type = (f16) -> f16, sym_name = "sin"}> ({
  ^bb0(%arg13: f16):
    %10 = "math.sin"(%arg13) <{fastmath = #arith.fastmath<none>}> : (f16) -> f16
    "func.return"(%10) : (f16) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f16, i32) -> f16, sym_name = "fpowi"}> ({
  ^bb0(%arg11: f16, %arg12: i32):
    %9 = "math.fpowi"(%arg11, %arg12) <{fastmath = #arith.fastmath<none>}> : (f16, i32) -> f16
    "func.return"(%9) : (f16) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f16, f16, f16) -> f16, sym_name = "fma"}> ({
  ^bb0(%arg8: f16, %arg9: f16, %arg10: f16):
    %8 = "math.fma"(%arg8, %arg9, %arg10) <{fastmath = #arith.fastmath<none>}> : (f16, f16, f16) -> f16
    "func.return"(%8) : (f16) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> f32, sym_name = "absf_f32"}> ({
  ^bb0(%arg7: f32):
    %7 = "math.absf"(%arg7) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "func.return"(%7) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f64) -> f64, sym_name = "absf_f64"}> ({
  ^bb0(%arg6: f64):
    %6 = "math.absf"(%arg6) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64
    "func.return"(%6) : (f64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xbf16>) -> vector<2xbf16>, sym_name = "sin_vector"}> ({
  ^bb0(%arg5: vector<2xbf16>):
    %5 = "math.sin"(%arg5) <{fastmath = #arith.fastmath<none>}> : (vector<2xbf16>) -> vector<2xbf16>
    "func.return"(%5) : (vector<2xbf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f16) -> f16, sym_name = "fastmath"}> ({
  ^bb0(%arg4: f16):
    %4 = "math.sin"(%arg4) <{fastmath = #arith.fastmath<nsz>}> : (f16) -> f16
    "func.return"(%4) : (f16) -> ()
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

