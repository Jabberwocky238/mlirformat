"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32) -> (f32, f32, f32, f32), sym_name = "sincos_fusion"}> ({
  ^bb0(%arg8: f32, %arg9: f32):
    %14 = "math.sin"(%arg8) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    %15 = "math.cos"(%arg8) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    %16 = "math.cos"(%arg9) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    %17 = "math.sin"(%arg9) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "func.return"(%14, %15, %16, %17) : (f32, f32, f32, f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> (), sym_name = "sink", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (f32, f32) -> (f32, f32, f32, f32), sym_name = "sincos_ensure_ssa_dominance"}> ({
  ^bb0(%arg6: f32, %arg7: f32):
    %10 = "math.sin"(%arg6) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "func.call"(%10) <{callee = @sink}> : (f32) -> ()
    %11 = "math.cos"(%arg6) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    %12 = "math.cos"(%arg7) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "func.call"(%12) <{callee = @sink}> : (f32) -> ()
    %13 = "math.sin"(%arg7) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "func.return"(%10, %11, %12, %13) : (f32, f32, f32, f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> (f32, f32), sym_name = "sincos_fusion_no_match_fmf"}> ({
  ^bb0(%arg5: f32):
    %8 = "math.sin"(%arg5) <{fastmath = #arith.fastmath<contract>}> : (f32) -> f32
    %9 = "math.cos"(%arg5) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "func.return"(%8, %9) : (f32, f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, i1) -> f32, sym_name = "sincos_no_fusion_different_block"}> ({
  ^bb0(%arg3: f32, %arg4: i1):
    %5 = "scf.if"(%arg4) ({
      %7 = "math.sin"(%arg3) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "scf.yield"(%7) : (f32) -> ()
    }, {
      %6 = "math.cos"(%arg3) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "scf.yield"(%6) : (f32) -> ()
    }) : (i1) -> f32
    "func.return"(%5) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, i1) -> (f32, f32), sym_name = "sincos_no_fusion_nested_region"}> ({
  ^bb0(%arg1: f32, %arg2: i1):
    %2 = "math.sin"(%arg1) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    %3 = "scf.if"(%arg2) ({
      %4 = "math.cos"(%arg1) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "scf.yield"(%4) : (f32) -> ()
    }, {
      "scf.yield"(%2) : (f32) -> ()
    }) : (i1) -> f32
    "func.return"(%2, %3) : (f32, f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> (f32, f32), sym_name = "sincos_fusion_preserve_fastmath"}> ({
  ^bb0(%arg0: f32):
    %0 = "math.sin"(%arg0) <{fastmath = #arith.fastmath<contract>}> : (f32) -> f32
    %1 = "math.cos"(%arg0) <{fastmath = #arith.fastmath<contract>}> : (f32) -> f32
    "func.return"(%0, %1) : (f32, f32) -> ()
  }) : () -> ()
}) : () -> ()

