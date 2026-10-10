"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> f32, sym_name = "erf_scalar"}> ({
  ^bb0(%arg34: f32):
    %55 = "math.erf"(%arg34) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "func.return"(%55) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> f32, sym_name = "erfc_scalar"}> ({
  ^bb0(%arg33: f32):
    %54 = "math.erfc"(%arg33) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "func.return"(%54) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf32>) -> vector<8xf32>, sym_name = "erf_vector"}> ({
  ^bb0(%arg32: vector<8xf32>):
    %53 = "math.erf"(%arg32) <{fastmath = #arith.fastmath<none>}> : (vector<8xf32>) -> vector<8xf32>
    "func.return"(%53) : (vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xf32>) -> vector<[8]xf32>, sym_name = "erf_scalable_vector"}> ({
  ^bb0(%arg31: vector<[8]xf32>):
    %52 = "math.erf"(%arg31) <{fastmath = #arith.fastmath<none>}> : (vector<[8]xf32>) -> vector<[8]xf32>
    "func.return"(%52) : (vector<[8]xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> f32, sym_name = "exp_scalar"}> ({
  ^bb0(%arg30: f32):
    %51 = "math.exp"(%arg30) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "func.return"(%51) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf32>) -> vector<8xf32>, sym_name = "exp_vector"}> ({
  ^bb0(%arg29: vector<8xf32>):
    %50 = "math.exp"(%arg29) <{fastmath = #arith.fastmath<none>}> : (vector<8xf32>) -> vector<8xf32>
    "func.return"(%50) : (vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xf32>) -> vector<[8]xf32>, sym_name = "exp_scalable_vector"}> ({
  ^bb0(%arg28: vector<[8]xf32>):
    %49 = "math.exp"(%arg28) <{fastmath = #arith.fastmath<none>}> : (vector<[8]xf32>) -> vector<[8]xf32>
    "func.return"(%49) : (vector<[8]xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> f32, sym_name = "expm1_scalar"}> ({
  ^bb0(%arg27: f32):
    %48 = "math.expm1"(%arg27) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "func.return"(%48) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8x8xf32>) -> vector<8x8xf32>, sym_name = "expm1_vector"}> ({
  ^bb0(%arg26: vector<8x8xf32>):
    %47 = "math.expm1"(%arg26) <{fastmath = #arith.fastmath<none>}> : (vector<8x8xf32>) -> vector<8x8xf32>
    "func.return"(%47) : (vector<8x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8x[8]xf32>) -> vector<8x[8]xf32>, sym_name = "expm1_scalable_vector"}> ({
  ^bb0(%arg25: vector<8x[8]xf32>):
    %46 = "math.expm1"(%arg25) <{fastmath = #arith.fastmath<none>}> : (vector<8x[8]xf32>) -> vector<8x[8]xf32>
    "func.return"(%46) : (vector<8x[8]xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> f32, sym_name = "log_scalar"}> ({
  ^bb0(%arg24: f32):
    %45 = "math.log"(%arg24) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "func.return"(%45) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf32>) -> vector<8xf32>, sym_name = "log_vector"}> ({
  ^bb0(%arg23: vector<8xf32>):
    %44 = "math.log"(%arg23) <{fastmath = #arith.fastmath<none>}> : (vector<8xf32>) -> vector<8xf32>
    "func.return"(%44) : (vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xf32>) -> vector<[8]xf32>, sym_name = "log_scalable_vector"}> ({
  ^bb0(%arg22: vector<[8]xf32>):
    %43 = "math.log"(%arg22) <{fastmath = #arith.fastmath<none>}> : (vector<[8]xf32>) -> vector<[8]xf32>
    "func.return"(%43) : (vector<[8]xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> f32, sym_name = "log2_scalar"}> ({
  ^bb0(%arg21: f32):
    %42 = "math.log2"(%arg21) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "func.return"(%42) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf32>) -> vector<8xf32>, sym_name = "log2_vector"}> ({
  ^bb0(%arg20: vector<8xf32>):
    %41 = "math.log2"(%arg20) <{fastmath = #arith.fastmath<none>}> : (vector<8xf32>) -> vector<8xf32>
    "func.return"(%41) : (vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xf32>) -> vector<[8]xf32>, sym_name = "log2_scalable_vector"}> ({
  ^bb0(%arg19: vector<[8]xf32>):
    %40 = "math.log2"(%arg19) <{fastmath = #arith.fastmath<none>}> : (vector<[8]xf32>) -> vector<[8]xf32>
    "func.return"(%40) : (vector<[8]xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> f32, sym_name = "log1p_scalar"}> ({
  ^bb0(%arg18: f32):
    %39 = "math.log1p"(%arg18) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "func.return"(%39) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf32>) -> vector<8xf32>, sym_name = "log1p_vector"}> ({
  ^bb0(%arg17: vector<8xf32>):
    %38 = "math.log1p"(%arg17) <{fastmath = #arith.fastmath<none>}> : (vector<8xf32>) -> vector<8xf32>
    "func.return"(%38) : (vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xf32>) -> vector<[8]xf32>, sym_name = "log1p_scalable_vector"}> ({
  ^bb0(%arg16: vector<[8]xf32>):
    %37 = "math.log1p"(%arg16) <{fastmath = #arith.fastmath<none>}> : (vector<[8]xf32>) -> vector<[8]xf32>
    "func.return"(%37) : (vector<[8]xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> f32, sym_name = "tanh_scalar"}> ({
  ^bb0(%arg15: f32):
    %36 = "math.tanh"(%arg15) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "func.return"(%36) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf32>) -> vector<8xf32>, sym_name = "tanh_vector"}> ({
  ^bb0(%arg14: vector<8xf32>):
    %35 = "math.tanh"(%arg14) <{fastmath = #arith.fastmath<none>}> : (vector<8xf32>) -> vector<8xf32>
    "func.return"(%35) : (vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xf32>) -> vector<[8]xf32>, sym_name = "tanh_scalable_vector"}> ({
  ^bb0(%arg13: vector<[8]xf32>):
    %34 = "math.tanh"(%arg13) <{fastmath = #arith.fastmath<none>}> : (vector<[8]xf32>) -> vector<[8]xf32>
    "func.return"(%34) : (vector<[8]xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> f32, sym_name = "rsqrt_scalar"}> ({
  ^bb0(%arg12: f32):
    %33 = "math.rsqrt"(%arg12) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "func.return"(%33) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf32>) -> vector<8xf32>, sym_name = "rsqrt_vector_8xf32"}> ({
  ^bb0(%arg11: vector<8xf32>):
    %32 = "math.rsqrt"(%arg11) <{fastmath = #arith.fastmath<none>}> : (vector<8xf32>) -> vector<8xf32>
    "func.return"(%32) : (vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<5xf32>) -> vector<5xf32>, sym_name = "rsqrt_vector_5xf32"}> ({
  ^bb0(%arg10: vector<5xf32>):
    %31 = "math.rsqrt"(%arg10) <{fastmath = #arith.fastmath<none>}> : (vector<5xf32>) -> vector<5xf32>
    "func.return"(%31) : (vector<5xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xf32>) -> vector<16xf32>, sym_name = "rsqrt_vector_16xf32"}> ({
  ^bb0(%arg9: vector<16xf32>):
    %30 = "math.rsqrt"(%arg9) <{fastmath = #arith.fastmath<none>}> : (vector<16xf32>) -> vector<16xf32>
    "func.return"(%30) : (vector<16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x8xf32>) -> vector<2x8xf32>, sym_name = "rsqrt_vector_2x8xf32"}> ({
  ^bb0(%arg8: vector<2x8xf32>):
    %29 = "math.rsqrt"(%arg8) <{fastmath = #arith.fastmath<none>}> : (vector<2x8xf32>) -> vector<2x8xf32>
    "func.return"(%29) : (vector<2x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x16xf32>) -> vector<2x16xf32>, sym_name = "rsqrt_vector_2x16xf32"}> ({
  ^bb0(%arg7: vector<2x16xf32>):
    %28 = "math.rsqrt"(%arg7) <{fastmath = #arith.fastmath<none>}> : (vector<2x16xf32>) -> vector<2x16xf32>
    "func.return"(%28) : (vector<2x16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> f32, sym_name = "atan_scalar"}> ({
  ^bb0(%arg6: f32):
    %27 = "math.atan"(%arg6) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    "func.return"(%27) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f16, f16) -> f16, sym_name = "atan2_scalar"}> ({
  ^bb0(%arg4: f16, %arg5: f16):
    %26 = "math.atan2"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f16, f16) -> f16
    "func.return"(%26) : (f16) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf32>) -> vector<4xf32>, sym_name = "cbrt_vector"}> ({
  ^bb0(%arg3: vector<4xf32>):
    %25 = "math.cbrt"(%arg3) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>) -> vector<4xf32>
    "func.return"(%25) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf16>) -> vector<4xf16>, sym_name = "math_f16"}> ({
  ^bb0(%arg2: vector<4xf16>):
    %13 = "math.atan"(%arg2) <{fastmath = #arith.fastmath<none>}> : (vector<4xf16>) -> vector<4xf16>
    %14 = "math.atan2"(%13, %arg2) <{fastmath = #arith.fastmath<none>}> : (vector<4xf16>, vector<4xf16>) -> vector<4xf16>
    %15 = "math.tanh"(%14) <{fastmath = #arith.fastmath<none>}> : (vector<4xf16>) -> vector<4xf16>
    %16 = "math.log"(%15) <{fastmath = #arith.fastmath<none>}> : (vector<4xf16>) -> vector<4xf16>
    %17 = "math.log2"(%16) <{fastmath = #arith.fastmath<none>}> : (vector<4xf16>) -> vector<4xf16>
    %18 = "math.log1p"(%17) <{fastmath = #arith.fastmath<none>}> : (vector<4xf16>) -> vector<4xf16>
    %19 = "math.erf"(%18) <{fastmath = #arith.fastmath<none>}> : (vector<4xf16>) -> vector<4xf16>
    %20 = "math.exp"(%19) <{fastmath = #arith.fastmath<none>}> : (vector<4xf16>) -> vector<4xf16>
    %21 = "math.expm1"(%20) <{fastmath = #arith.fastmath<none>}> : (vector<4xf16>) -> vector<4xf16>
    %22 = "math.cbrt"(%21) <{fastmath = #arith.fastmath<none>}> : (vector<4xf16>) -> vector<4xf16>
    %23 = "math.sin"(%22) <{fastmath = #arith.fastmath<none>}> : (vector<4xf16>) -> vector<4xf16>
    %24 = "math.cos"(%23) <{fastmath = #arith.fastmath<none>}> : (vector<4xf16>) -> vector<4xf16>
    "func.return"(%24) : (vector<4xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<f16>) -> vector<f16>, sym_name = "math_zero_rank"}> ({
  ^bb0(%arg1: vector<f16>):
    %1 = "math.atan"(%arg1) <{fastmath = #arith.fastmath<none>}> : (vector<f16>) -> vector<f16>
    %2 = "math.atan2"(%1, %arg1) <{fastmath = #arith.fastmath<none>}> : (vector<f16>, vector<f16>) -> vector<f16>
    %3 = "math.tanh"(%2) <{fastmath = #arith.fastmath<none>}> : (vector<f16>) -> vector<f16>
    %4 = "math.log"(%3) <{fastmath = #arith.fastmath<none>}> : (vector<f16>) -> vector<f16>
    %5 = "math.log2"(%4) <{fastmath = #arith.fastmath<none>}> : (vector<f16>) -> vector<f16>
    %6 = "math.log1p"(%5) <{fastmath = #arith.fastmath<none>}> : (vector<f16>) -> vector<f16>
    %7 = "math.erf"(%6) <{fastmath = #arith.fastmath<none>}> : (vector<f16>) -> vector<f16>
    %8 = "math.exp"(%7) <{fastmath = #arith.fastmath<none>}> : (vector<f16>) -> vector<f16>
    %9 = "math.expm1"(%8) <{fastmath = #arith.fastmath<none>}> : (vector<f16>) -> vector<f16>
    %10 = "math.cbrt"(%9) <{fastmath = #arith.fastmath<none>}> : (vector<f16>) -> vector<f16>
    %11 = "math.sin"(%10) <{fastmath = #arith.fastmath<none>}> : (vector<f16>) -> vector<f16>
    %12 = "math.cos"(%11) <{fastmath = #arith.fastmath<none>}> : (vector<f16>) -> vector<f16>
    "func.return"(%12) : (vector<f16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x8xf16>) -> vector<2x8xf16>, sym_name = "rsqrt_f16"}> ({
  ^bb0(%arg0: vector<2x8xf16>):
    %0 = "math.rsqrt"(%arg0) <{fastmath = #arith.fastmath<none>}> : (vector<2x8xf16>) -> vector<2x8xf16>
    "func.return"(%0) : (vector<2x8xf16>) -> ()
  }) : () -> ()
}) : () -> ()

