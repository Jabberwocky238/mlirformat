"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f16 (f16, f16, f16)>, linkage = #llvm.linkage<external>, sym_name = "fma_f16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg18: f16, %arg19: f16, %arg20: f16):
    %24 = "nvvm.fma"(%arg18, %arg19, %arg20) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (f16, f16, f16) -> f16
    %25 = "nvvm.fma"(%arg18, %arg19, %24) <{ftz = true, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (f16, f16, f16) -> f16
    %26 = "nvvm.fma"(%arg18, %arg19, %25) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>}> : (f16, f16, f16) -> f16
    %27 = "nvvm.fma"(%arg18, %arg19, %26) <{ftz = true, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>}> : (f16, f16, f16) -> f16
    %28 = "nvvm.fma"(%arg18, %arg19, %27) <{ftz = false, oob = false, relu = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (f16, f16, f16) -> f16
    %29 = "nvvm.fma"(%arg18, %arg19, %28) <{ftz = true, oob = false, relu = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (f16, f16, f16) -> f16
    %30 = "nvvm.fma"(%arg18, %arg19, %29) <{ftz = false, oob = true, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (f16, f16, f16) -> f16
    %31 = "nvvm.fma"(%arg18, %arg19, %30) <{ftz = false, oob = true, relu = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (f16, f16, f16) -> f16
    "llvm.return"(%31) : (f16) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<bf16 (bf16, bf16, bf16)>, linkage = #llvm.linkage<external>, sym_name = "fma_bf16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg15: bf16, %arg16: bf16, %arg17: bf16):
    %20 = "nvvm.fma"(%arg15, %arg16, %arg17) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (bf16, bf16, bf16) -> bf16
    %21 = "nvvm.fma"(%arg15, %arg16, %20) <{ftz = false, oob = false, relu = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (bf16, bf16, bf16) -> bf16
    %22 = "nvvm.fma"(%arg15, %arg16, %21) <{ftz = false, oob = true, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (bf16, bf16, bf16) -> bf16
    %23 = "nvvm.fma"(%arg15, %arg16, %22) <{ftz = false, oob = true, relu = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (bf16, bf16, bf16) -> bf16
    "llvm.return"(%23) : (bf16) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32, f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "fma_f32_rn", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg12: f32, %arg13: f32, %arg14: f32):
    %16 = "nvvm.fma"(%arg12, %arg13, %arg14) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (f32, f32, f32) -> f32
    %17 = "nvvm.fma"(%arg12, %arg13, %16) <{ftz = true, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (f32, f32, f32) -> f32
    %18 = "nvvm.fma"(%arg12, %arg13, %17) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>}> : (f32, f32, f32) -> f32
    %19 = "nvvm.fma"(%arg12, %arg13, %18) <{ftz = true, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>}> : (f32, f32, f32) -> f32
    "llvm.return"(%19) : (f32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32, f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "fma_f32_rm", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg9: f32, %arg10: f32, %arg11: f32):
    %12 = "nvvm.fma"(%arg9, %arg10, %arg11) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<none>}> : (f32, f32, f32) -> f32
    %13 = "nvvm.fma"(%arg9, %arg10, %12) <{ftz = true, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<none>}> : (f32, f32, f32) -> f32
    %14 = "nvvm.fma"(%arg9, %arg10, %13) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<sat>}> : (f32, f32, f32) -> f32
    %15 = "nvvm.fma"(%arg9, %arg10, %14) <{ftz = true, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<sat>}> : (f32, f32, f32) -> f32
    "llvm.return"(%15) : (f32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32, f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "fma_f32_rp", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg6: f32, %arg7: f32, %arg8: f32):
    %8 = "nvvm.fma"(%arg6, %arg7, %arg8) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<none>}> : (f32, f32, f32) -> f32
    %9 = "nvvm.fma"(%arg6, %arg7, %8) <{ftz = true, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<none>}> : (f32, f32, f32) -> f32
    %10 = "nvvm.fma"(%arg6, %arg7, %9) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<sat>}> : (f32, f32, f32) -> f32
    %11 = "nvvm.fma"(%arg6, %arg7, %10) <{ftz = true, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<sat>}> : (f32, f32, f32) -> f32
    "llvm.return"(%11) : (f32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32, f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "fma_f32_rz", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
    %4 = "nvvm.fma"(%arg3, %arg4, %arg5) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<none>}> : (f32, f32, f32) -> f32
    %5 = "nvvm.fma"(%arg3, %arg4, %4) <{ftz = true, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<none>}> : (f32, f32, f32) -> f32
    %6 = "nvvm.fma"(%arg3, %arg4, %5) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<sat>}> : (f32, f32, f32) -> f32
    %7 = "nvvm.fma"(%arg3, %arg4, %6) <{ftz = true, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<sat>}> : (f32, f32, f32) -> f32
    "llvm.return"(%7) : (f32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f64 (f64, f64, f64)>, linkage = #llvm.linkage<external>, sym_name = "fma_f64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: f64, %arg1: f64, %arg2: f64):
    %0 = "nvvm.fma"(%arg0, %arg1, %arg2) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (f64, f64, f64) -> f64
    %1 = "nvvm.fma"(%arg0, %arg1, %0) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<none>}> : (f64, f64, f64) -> f64
    %2 = "nvvm.fma"(%arg0, %arg1, %1) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<none>}> : (f64, f64, f64) -> f64
    %3 = "nvvm.fma"(%arg0, %arg1, %2) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<none>}> : (f64, f64, f64) -> f64
    "llvm.return"(%3) : (f64) -> ()
  }) : () -> ()
}) : () -> ()

