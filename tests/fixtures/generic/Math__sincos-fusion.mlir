"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32) -> (f32, f32, f32, f32), sym_name = "sincos_fusion"}> ({
  ^bb0(%arg6: f32, %arg7: f32):
    %11 = "math.sin"(%arg6) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    %12 = "math.cos"(%arg6) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    %13 = "math.cos"(%arg7) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    %14 = "math.sin"(%arg7) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "func.return"(%11, %12, %13, %14) : (f32, f32, f32, f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> (), sym_name = "sink", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (f32, f32) -> (f32, f32, f32, f32), sym_name = "sincos_ensure_ssa_dominance"}> ({
  ^bb0(%arg4: f32, %arg5: f32):
    %7 = "math.sin"(%arg4) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "func.call"(%7) <{callee = @sink}> : (f32) -> ()
    %8 = "math.cos"(%arg4) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    %9 = "math.cos"(%arg5) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "func.call"(%9) <{callee = @sink}> : (f32) -> ()
    %10 = "math.sin"(%arg5) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "func.return"(%7, %8, %9, %10) : (f32, f32, f32, f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> (f32, f32), sym_name = "sincos_fusion_no_match_fmf"}> ({
  ^bb0(%arg3: f32):
    %5 = "math.sin"(%arg3) <{fastmath = #arith.fastmath<contract>}> : (f32) -> f32
    %6 = "math.cos"(%arg3) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "func.return"(%5, %6) : (f32, f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, i1) -> f32, sym_name = "sincos_no_fusion_different_block"}> ({
  ^bb0(%arg1: f32, %arg2: i1):
    %2 = "scf.if"(%arg2) ({
      %4 = "math.sin"(%arg1) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "scf.yield"(%4) : (f32) -> ()
    }, {
      %3 = "math.cos"(%arg1) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "scf.yield"(%3) : (f32) -> ()
    }) : (i1) -> f32
    "func.return"(%2) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> (f32, f32), sym_name = "sincos_fusion_preserve_fastmath"}> ({
  ^bb0(%arg0: f32):
    %0 = "math.sin"(%arg0) <{fastmath = #arith.fastmath<contract>}> : (f32) -> f32
    %1 = "math.cos"(%arg0) <{fastmath = #arith.fastmath<contract>}> : (f32) -> f32
    "func.return"(%0, %1) : (f32, f32) -> ()
  }) : () -> ()
}) : () -> ()

