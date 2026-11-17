"builtin.module"() ({
  "func.func"() <{function_type = (f16) -> f16, sym_name = "sin"}> ({
  ^bb0(%arg13: f16 loc("<stdin>":3:8)):
    %10 = "math.sin"(%arg13) <{fastmath = #arith.fastmath<none>}> : (f16) -> f16 loc("<stdin>":4:11)
    "func.return"(%10) : (f16) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (f16, i32) -> f16, sym_name = "fpowi"}> ({
  ^bb0(%arg11: f16 loc("<stdin>":8:8), %arg12: i32 loc("<stdin>":8:21)):
    %9 = "math.fpowi"(%arg11, %arg12) <{fastmath = #arith.fastmath<none>}> : (f16, i32) -> f16 loc("<stdin>":9:10)
    "func.return"(%9) : (f16) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (f16, f16, f16) -> f16, sym_name = "fma"}> ({
  ^bb0(%arg8: f16 loc("<stdin>":13:8), %arg9: f16 loc("<stdin>":13:20), %arg10: f16 loc("<stdin>":13:32)):
    %8 = "math.fma"(%arg8, %arg9, %arg10) <{fastmath = #arith.fastmath<none>}> : (f16, f16, f16) -> f16 loc("<stdin>":14:10)
    "func.return"(%8) : (f16) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (f32) -> f32, sym_name = "absf_f32"}> ({
  ^bb0(%arg7: f32 loc("<stdin>":18:8)):
    %7 = "math.absf"(%arg7) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":19:10)
    "func.return"(%7) : (f32) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (f64) -> f64, sym_name = "absf_f64"}> ({
  ^bb0(%arg6: f64 loc("<stdin>":23:8)):
    %6 = "math.absf"(%arg6) <{fastmath = #arith.fastmath<none>}> : (f64) -> f64 loc("<stdin>":24:10)
    "func.return"(%6) : (f64) -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":22:3)
  "func.func"() <{function_type = (vector<2xbf16>) -> vector<2xbf16>, sym_name = "sin_vector"}> ({
  ^bb0(%arg5: vector<2xbf16> loc("<stdin>":28:8)):
    %5 = "math.sin"(%arg5) <{fastmath = #arith.fastmath<none>}> : (vector<2xbf16>) -> vector<2xbf16> loc("<stdin>":29:10)
    "func.return"(%5) : (vector<2xbf16>) -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":27:3)
  "func.func"() <{function_type = (f16) -> f16, sym_name = "fastmath"}> ({
  ^bb0(%arg4: f16 loc("<stdin>":33:8)):
    %4 = "math.sin"(%arg4) <{fastmath = #arith.fastmath<nsz>}> : (f16) -> f16 loc("<stdin>":34:10)
    "func.return"(%4) : (f16) -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":32:3)
  "func.func"() <{function_type = (f16) -> f16, sym_name = "sequences"}> ({
  ^bb0(%arg3: f16 loc("<stdin>":38:8)):
    %2 = "math.absf"(%arg3) <{fastmath = #arith.fastmath<none>}> : (f16) -> f16 loc("<stdin>":39:10)
    %3 = "math.sin"(%2) <{fastmath = #arith.fastmath<none>}> : (f16) -> f16 loc("<stdin>":40:10)
    "func.return"(%3) : (f16) -> () loc("<stdin>":41:5)
  }) : () -> () loc("<stdin>":37:3)
  "func.func"() <{function_type = (bf16, bf16, i1) -> bf16, sym_name = "promote_in_if_block"}> ({
  ^bb0(%arg0: bf16 loc("<stdin>":44:8), %arg1: bf16 loc("<stdin>":44:21), %arg2: i1 loc("<stdin>":44:34)):
    %0 = "scf.if"(%arg2) ({
      %1 = "math.absf"(%arg0) <{fastmath = #arith.fastmath<none>}> : (bf16) -> bf16 loc("<stdin>":46:12)
      "scf.yield"(%1) : (bf16) -> () loc("<stdin>":47:7)
    }, {
      "scf.yield"(%arg1) : (bf16) -> () loc("<stdin>":49:7)
    }) : (i1) -> bf16 loc("<stdin>":45:10)
    "func.return"(%0) : (bf16) -> () loc("<stdin>":51:5)
  }) : () -> () loc("<stdin>":43:3)
}) : () -> () loc("<stdin>":1:1)
