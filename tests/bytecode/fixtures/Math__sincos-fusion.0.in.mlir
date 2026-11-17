"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32) -> (f32, f32, f32, f32), sym_name = "sincos_fusion"}> ({
  ^bb0(%arg8: f32 loc("<stdin>":3:8), %arg9: f32 loc("<stdin>":3:20)):
    %14 = "math.sin"(%arg8) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":4:11)
    %15 = "math.cos"(%arg8) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":5:11)
    %16 = "math.cos"(%arg9) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":6:11)
    %17 = "math.sin"(%arg9) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":7:11)
    "func.return"(%14, %15, %16, %17) : (f32, f32, f32, f32) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (f32) -> (), sym_name = "sink", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":10:3)
  "func.func"() <{function_type = (f32, f32) -> (f32, f32, f32, f32), sym_name = "sincos_ensure_ssa_dominance"}> ({
  ^bb0(%arg6: f32 loc("<stdin>":13:8), %arg7: f32 loc("<stdin>":13:20)):
    %10 = "math.sin"(%arg6) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":14:11)
    "func.call"(%10) <{callee = @sink}> : (f32) -> () loc("<stdin>":15:5)
    %11 = "math.cos"(%arg6) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":16:11)
    %12 = "math.cos"(%arg7) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":17:11)
    "func.call"(%12) <{callee = @sink}> : (f32) -> () loc("<stdin>":18:5)
    %13 = "math.sin"(%arg7) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":19:11)
    "func.return"(%10, %11, %12, %13) : (f32, f32, f32, f32) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (f32) -> (f32, f32), sym_name = "sincos_fusion_no_match_fmf"}> ({
  ^bb0(%arg5: f32 loc("<stdin>":23:8)):
    %8 = "math.sin"(%arg5) <{fastmath = #arith.fastmath<contract>}> : (f32) -> f32 loc("<stdin>":24:10)
    %9 = "math.cos"(%arg5) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":25:10)
    "func.return"(%8, %9) : (f32, f32) -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":22:3)
  "func.func"() <{function_type = (f32, i1) -> f32, sym_name = "sincos_no_fusion_different_block"}> ({
  ^bb0(%arg3: f32 loc("<stdin>":29:8), %arg4: i1 loc("<stdin>":29:20)):
    %5 = "scf.if"(%arg4) ({
      %7 = "math.sin"(%arg3) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":31:12)
      "scf.yield"(%7) : (f32) -> () loc("<stdin>":32:7)
    }, {
      %6 = "math.cos"(%arg3) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":34:12)
      "scf.yield"(%6) : (f32) -> () loc("<stdin>":35:7)
    }) : (i1) -> f32 loc("<stdin>":30:10)
    "func.return"(%5) : (f32) -> () loc("<stdin>":37:5)
  }) : () -> () loc("<stdin>":28:3)
  "func.func"() <{function_type = (f32, i1) -> (f32, f32), sym_name = "sincos_no_fusion_nested_region"}> ({
  ^bb0(%arg1: f32 loc("<stdin>":40:8), %arg2: i1 loc("<stdin>":40:20)):
    %2 = "math.sin"(%arg1) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":41:10)
    %3 = "scf.if"(%arg2) ({
      %4 = "math.cos"(%arg1) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":43:12)
      "scf.yield"(%4) : (f32) -> () loc("<stdin>":44:7)
    }, {
      "scf.yield"(%2) : (f32) -> () loc("<stdin>":46:7)
    }) : (i1) -> f32 loc("<stdin>":42:10)
    "func.return"(%2, %3) : (f32, f32) -> () loc("<stdin>":48:5)
  }) : () -> () loc("<stdin>":39:3)
  "func.func"() <{function_type = (f32) -> (f32, f32), sym_name = "sincos_fusion_preserve_fastmath"}> ({
  ^bb0(%arg0: f32 loc("<stdin>":51:8)):
    %0 = "math.sin"(%arg0) <{fastmath = #arith.fastmath<contract>}> : (f32) -> f32 loc("<stdin>":52:10)
    %1 = "math.cos"(%arg0) <{fastmath = #arith.fastmath<contract>}> : (f32) -> f32 loc("<stdin>":53:10)
    "func.return"(%0, %1) : (f32, f32) -> () loc("<stdin>":54:5)
  }) : () -> () loc("<stdin>":50:3)
}) : () -> () loc("<stdin>":1:1)
