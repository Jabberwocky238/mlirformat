"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f16 (f16, f16, f16)>, linkage = #llvm.linkage<external>, sym_name = "fma_f16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg18: f16 loc("<stdin>":3:8), %arg19: f16 loc("<stdin>":3:21), %arg20: f16 loc("<stdin>":3:34)):
    %24 = "nvvm.fma"(%arg18, %arg19, %arg20) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (f16, f16, f16) -> f16 loc("<stdin>":4:11)
    %25 = "nvvm.fma"(%arg18, %arg19, %24) <{ftz = true, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (f16, f16, f16) -> f16 loc("<stdin>":5:11)
    %26 = "nvvm.fma"(%arg18, %arg19, %25) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>}> : (f16, f16, f16) -> f16 loc("<stdin>":6:11)
    %27 = "nvvm.fma"(%arg18, %arg19, %26) <{ftz = true, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>}> : (f16, f16, f16) -> f16 loc("<stdin>":7:11)
    %28 = "nvvm.fma"(%arg18, %arg19, %27) <{ftz = false, oob = false, relu = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (f16, f16, f16) -> f16 loc("<stdin>":8:11)
    %29 = "nvvm.fma"(%arg18, %arg19, %28) <{ftz = true, oob = false, relu = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (f16, f16, f16) -> f16 loc("<stdin>":9:11)
    %30 = "nvvm.fma"(%arg18, %arg19, %29) <{ftz = false, oob = true, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (f16, f16, f16) -> f16 loc("<stdin>":10:11)
    %31 = "nvvm.fma"(%arg18, %arg19, %30) <{ftz = false, oob = true, relu = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (f16, f16, f16) -> f16 loc("<stdin>":11:11)
    "llvm.return"(%31) : (f16) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<bf16 (bf16, bf16, bf16)>, linkage = #llvm.linkage<external>, sym_name = "fma_bf16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg15: bf16 loc("<stdin>":15:8), %arg16: bf16 loc("<stdin>":15:22), %arg17: bf16 loc("<stdin>":15:36)):
    %20 = "nvvm.fma"(%arg15, %arg16, %arg17) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (bf16, bf16, bf16) -> bf16 loc("<stdin>":16:11)
    %21 = "nvvm.fma"(%arg15, %arg16, %20) <{ftz = false, oob = false, relu = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (bf16, bf16, bf16) -> bf16 loc("<stdin>":17:11)
    %22 = "nvvm.fma"(%arg15, %arg16, %21) <{ftz = false, oob = true, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (bf16, bf16, bf16) -> bf16 loc("<stdin>":18:11)
    %23 = "nvvm.fma"(%arg15, %arg16, %22) <{ftz = false, oob = true, relu = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (bf16, bf16, bf16) -> bf16 loc("<stdin>":19:11)
    "llvm.return"(%23) : (bf16) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":14:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32, f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "fma_f32_rn", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg12: f32 loc("<stdin>":23:8), %arg13: f32 loc("<stdin>":23:21), %arg14: f32 loc("<stdin>":23:34)):
    %16 = "nvvm.fma"(%arg12, %arg13, %arg14) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (f32, f32, f32) -> f32 loc("<stdin>":24:11)
    %17 = "nvvm.fma"(%arg12, %arg13, %16) <{ftz = true, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (f32, f32, f32) -> f32 loc("<stdin>":25:11)
    %18 = "nvvm.fma"(%arg12, %arg13, %17) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>}> : (f32, f32, f32) -> f32 loc("<stdin>":26:11)
    %19 = "nvvm.fma"(%arg12, %arg13, %18) <{ftz = true, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>}> : (f32, f32, f32) -> f32 loc("<stdin>":27:11)
    "llvm.return"(%19) : (f32) -> () loc("<stdin>":28:5)
  }) : () -> () loc("<stdin>":22:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32, f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "fma_f32_rm", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg9: f32 loc("<stdin>":31:8), %arg10: f32 loc("<stdin>":31:20), %arg11: f32 loc("<stdin>":31:33)):
    %12 = "nvvm.fma"(%arg9, %arg10, %arg11) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<none>}> : (f32, f32, f32) -> f32 loc("<stdin>":32:11)
    %13 = "nvvm.fma"(%arg9, %arg10, %12) <{ftz = true, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<none>}> : (f32, f32, f32) -> f32 loc("<stdin>":33:11)
    %14 = "nvvm.fma"(%arg9, %arg10, %13) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<sat>}> : (f32, f32, f32) -> f32 loc("<stdin>":34:11)
    %15 = "nvvm.fma"(%arg9, %arg10, %14) <{ftz = true, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<sat>}> : (f32, f32, f32) -> f32 loc("<stdin>":35:11)
    "llvm.return"(%15) : (f32) -> () loc("<stdin>":36:5)
  }) : () -> () loc("<stdin>":30:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32, f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "fma_f32_rp", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg6: f32 loc("<stdin>":39:8), %arg7: f32 loc("<stdin>":39:20), %arg8: f32 loc("<stdin>":39:32)):
    %8 = "nvvm.fma"(%arg6, %arg7, %arg8) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<none>}> : (f32, f32, f32) -> f32 loc("<stdin>":40:10)
    %9 = "nvvm.fma"(%arg6, %arg7, %8) <{ftz = true, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<none>}> : (f32, f32, f32) -> f32 loc("<stdin>":41:10)
    %10 = "nvvm.fma"(%arg6, %arg7, %9) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<sat>}> : (f32, f32, f32) -> f32 loc("<stdin>":42:11)
    %11 = "nvvm.fma"(%arg6, %arg7, %10) <{ftz = true, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<sat>}> : (f32, f32, f32) -> f32 loc("<stdin>":43:11)
    "llvm.return"(%11) : (f32) -> () loc("<stdin>":44:5)
  }) : () -> () loc("<stdin>":38:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32, f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "fma_f32_rz", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg3: f32 loc("<stdin>":47:8), %arg4: f32 loc("<stdin>":47:20), %arg5: f32 loc("<stdin>":47:32)):
    %4 = "nvvm.fma"(%arg3, %arg4, %arg5) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<none>}> : (f32, f32, f32) -> f32 loc("<stdin>":48:10)
    %5 = "nvvm.fma"(%arg3, %arg4, %4) <{ftz = true, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<none>}> : (f32, f32, f32) -> f32 loc("<stdin>":49:10)
    %6 = "nvvm.fma"(%arg3, %arg4, %5) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<sat>}> : (f32, f32, f32) -> f32 loc("<stdin>":50:10)
    %7 = "nvvm.fma"(%arg3, %arg4, %6) <{ftz = true, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<sat>}> : (f32, f32, f32) -> f32 loc("<stdin>":51:10)
    "llvm.return"(%7) : (f32) -> () loc("<stdin>":52:5)
  }) : () -> () loc("<stdin>":46:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f64 (f64, f64, f64)>, linkage = #llvm.linkage<external>, sym_name = "fma_f64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: f64 loc("<stdin>":55:8), %arg1: f64 loc("<stdin>":55:20), %arg2: f64 loc("<stdin>":55:32)):
    %0 = "nvvm.fma"(%arg0, %arg1, %arg2) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (f64, f64, f64) -> f64 loc("<stdin>":56:10)
    %1 = "nvvm.fma"(%arg0, %arg1, %0) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<none>}> : (f64, f64, f64) -> f64 loc("<stdin>":57:10)
    %2 = "nvvm.fma"(%arg0, %arg1, %1) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<none>}> : (f64, f64, f64) -> f64 loc("<stdin>":58:10)
    %3 = "nvvm.fma"(%arg0, %arg1, %2) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<none>}> : (f64, f64, f64) -> f64 loc("<stdin>":59:10)
    "llvm.return"(%3) : (f64) -> () loc("<stdin>":60:5)
  }) : () -> () loc("<stdin>":54:3)
}) : () -> () loc("<stdin>":1:1)
