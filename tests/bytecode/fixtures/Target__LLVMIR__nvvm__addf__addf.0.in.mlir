"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f16 (f16, f16)>, linkage = #llvm.linkage<external>, sym_name = "fadd_f16_f16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg6: f16 loc("<stdin>":3:8), %arg7: f16 loc("<stdin>":3:20)):
    %24 = "nvvm.addf"(%arg6, %arg7) <{ftz = false, rnd = #nvvm.fp_rnd_mode<none>, sat = #nvvm.sat_mode<none>}> : (f16, f16) -> f16 loc("<stdin>":4:11)
    %25 = "nvvm.addf"(%24, %24) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (f16, f16) -> f16 loc("<stdin>":5:11)
    %26 = "nvvm.addf"(%25, %25) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>}> : (f16, f16) -> f16 loc("<stdin>":6:11)
    %27 = "nvvm.addf"(%26, %26) <{ftz = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>}> : (f16, f16) -> f16 loc("<stdin>":7:11)
    "llvm.return"(%27) : (f16) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<bf16 (bf16, bf16)>, linkage = #llvm.linkage<external>, sym_name = "fadd_bf16_bf16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: bf16 loc("<stdin>":11:8), %arg5: bf16 loc("<stdin>":11:21)):
    %22 = "nvvm.addf"(%arg4, %arg5) <{ftz = false, rnd = #nvvm.fp_rnd_mode<none>, sat = #nvvm.sat_mode<none>}> : (bf16, bf16) -> bf16 loc("<stdin>":12:11)
    %23 = "nvvm.addf"(%22, %22) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (bf16, bf16) -> bf16 loc("<stdin>":13:11)
    "llvm.return"(%23) : (bf16) -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":10:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "fadd_f32_f32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: f32 loc("<stdin>":17:8), %arg3: f32 loc("<stdin>":17:20)):
    %5 = "nvvm.addf"(%arg2, %arg3) <{ftz = false, rnd = #nvvm.fp_rnd_mode<none>, sat = #nvvm.sat_mode<none>}> : (f32, f32) -> f32 loc("<stdin>":18:10)
    %6 = "nvvm.addf"(%5, %5) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (f32, f32) -> f32 loc("<stdin>":19:10)
    %7 = "nvvm.addf"(%6, %6) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>}> : (f32, f32) -> f32 loc("<stdin>":20:10)
    %8 = "nvvm.addf"(%7, %7) <{ftz = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (f32, f32) -> f32 loc("<stdin>":21:10)
    %9 = "nvvm.addf"(%8, %8) <{ftz = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>}> : (f32, f32) -> f32 loc("<stdin>":22:10)
    %10 = "nvvm.addf"(%9, %9) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<none>}> : (f32, f32) -> f32 loc("<stdin>":23:11)
    %11 = "nvvm.addf"(%10, %10) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<sat>}> : (f32, f32) -> f32 loc("<stdin>":24:11)
    %12 = "nvvm.addf"(%11, %11) <{ftz = true, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<none>}> : (f32, f32) -> f32 loc("<stdin>":25:11)
    %13 = "nvvm.addf"(%12, %12) <{ftz = true, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<sat>}> : (f32, f32) -> f32 loc("<stdin>":26:11)
    %14 = "nvvm.addf"(%13, %13) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<none>}> : (f32, f32) -> f32 loc("<stdin>":27:11)
    %15 = "nvvm.addf"(%14, %14) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<sat>}> : (f32, f32) -> f32 loc("<stdin>":28:11)
    %16 = "nvvm.addf"(%15, %15) <{ftz = true, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<none>}> : (f32, f32) -> f32 loc("<stdin>":29:11)
    %17 = "nvvm.addf"(%16, %16) <{ftz = true, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<sat>}> : (f32, f32) -> f32 loc("<stdin>":30:11)
    %18 = "nvvm.addf"(%17, %17) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<none>}> : (f32, f32) -> f32 loc("<stdin>":31:11)
    %19 = "nvvm.addf"(%18, %18) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<sat>}> : (f32, f32) -> f32 loc("<stdin>":32:11)
    %20 = "nvvm.addf"(%19, %19) <{ftz = true, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<none>}> : (f32, f32) -> f32 loc("<stdin>":33:11)
    %21 = "nvvm.addf"(%20, %20) <{ftz = true, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<sat>}> : (f32, f32) -> f32 loc("<stdin>":34:11)
    "llvm.return"(%21) : (f32) -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":16:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f64 (f64, f64)>, linkage = #llvm.linkage<external>, sym_name = "fadd_f64_f64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: f64 loc("<stdin>":38:8), %arg1: f64 loc("<stdin>":38:20)):
    %0 = "nvvm.addf"(%arg0, %arg1) <{ftz = false, rnd = #nvvm.fp_rnd_mode<none>, sat = #nvvm.sat_mode<none>}> : (f64, f64) -> f64 loc("<stdin>":39:10)
    %1 = "nvvm.addf"(%0, %0) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (f64, f64) -> f64 loc("<stdin>":40:10)
    %2 = "nvvm.addf"(%1, %1) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<none>}> : (f64, f64) -> f64 loc("<stdin>":41:10)
    %3 = "nvvm.addf"(%2, %2) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<none>}> : (f64, f64) -> f64 loc("<stdin>":42:10)
    %4 = "nvvm.addf"(%3, %3) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<none>}> : (f64, f64) -> f64 loc("<stdin>":43:10)
    "llvm.return"(%4) : (f64) -> () loc("<stdin>":44:5)
  }) : () -> () loc("<stdin>":37:3)
}) : () -> () loc("<stdin>":1:1)
