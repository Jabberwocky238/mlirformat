"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f16 (f16, f16)>, linkage = #llvm.linkage<external>, sym_name = "fadd_f16_f16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg6: f16, %arg7: f16):
    %24 = "nvvm.addf"(%arg6, %arg7) <{ftz = false, rnd = #nvvm.fp_rnd_mode<none>, sat = #nvvm.sat_mode<none>}> : (f16, f16) -> f16
    %25 = "nvvm.addf"(%24, %24) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (f16, f16) -> f16
    %26 = "nvvm.addf"(%25, %25) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>}> : (f16, f16) -> f16
    %27 = "nvvm.addf"(%26, %26) <{ftz = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>}> : (f16, f16) -> f16
    "llvm.return"(%27) : (f16) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<bf16 (bf16, bf16)>, linkage = #llvm.linkage<external>, sym_name = "fadd_bf16_bf16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: bf16, %arg5: bf16):
    %22 = "nvvm.addf"(%arg4, %arg5) <{ftz = false, rnd = #nvvm.fp_rnd_mode<none>, sat = #nvvm.sat_mode<none>}> : (bf16, bf16) -> bf16
    %23 = "nvvm.addf"(%22, %22) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (bf16, bf16) -> bf16
    "llvm.return"(%23) : (bf16) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "fadd_f32_f32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: f32, %arg3: f32):
    %5 = "nvvm.addf"(%arg2, %arg3) <{ftz = false, rnd = #nvvm.fp_rnd_mode<none>, sat = #nvvm.sat_mode<none>}> : (f32, f32) -> f32
    %6 = "nvvm.addf"(%5, %5) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (f32, f32) -> f32
    %7 = "nvvm.addf"(%6, %6) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>}> : (f32, f32) -> f32
    %8 = "nvvm.addf"(%7, %7) <{ftz = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (f32, f32) -> f32
    %9 = "nvvm.addf"(%8, %8) <{ftz = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>}> : (f32, f32) -> f32
    %10 = "nvvm.addf"(%9, %9) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<none>}> : (f32, f32) -> f32
    %11 = "nvvm.addf"(%10, %10) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<sat>}> : (f32, f32) -> f32
    %12 = "nvvm.addf"(%11, %11) <{ftz = true, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<none>}> : (f32, f32) -> f32
    %13 = "nvvm.addf"(%12, %12) <{ftz = true, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<sat>}> : (f32, f32) -> f32
    %14 = "nvvm.addf"(%13, %13) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<none>}> : (f32, f32) -> f32
    %15 = "nvvm.addf"(%14, %14) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<sat>}> : (f32, f32) -> f32
    %16 = "nvvm.addf"(%15, %15) <{ftz = true, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<none>}> : (f32, f32) -> f32
    %17 = "nvvm.addf"(%16, %16) <{ftz = true, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<sat>}> : (f32, f32) -> f32
    %18 = "nvvm.addf"(%17, %17) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<none>}> : (f32, f32) -> f32
    %19 = "nvvm.addf"(%18, %18) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<sat>}> : (f32, f32) -> f32
    %20 = "nvvm.addf"(%19, %19) <{ftz = true, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<none>}> : (f32, f32) -> f32
    %21 = "nvvm.addf"(%20, %20) <{ftz = true, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<sat>}> : (f32, f32) -> f32
    "llvm.return"(%21) : (f32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f64 (f64, f64)>, linkage = #llvm.linkage<external>, sym_name = "fadd_f64_f64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: f64, %arg1: f64):
    %0 = "nvvm.addf"(%arg0, %arg1) <{ftz = false, rnd = #nvvm.fp_rnd_mode<none>, sat = #nvvm.sat_mode<none>}> : (f64, f64) -> f64
    %1 = "nvvm.addf"(%0, %0) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (f64, f64) -> f64
    %2 = "nvvm.addf"(%1, %1) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<none>}> : (f64, f64) -> f64
    %3 = "nvvm.addf"(%2, %2) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<none>}> : (f64, f64) -> f64
    %4 = "nvvm.addf"(%3, %3) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<none>}> : (f64, f64) -> f64
    "llvm.return"(%4) : (f64) -> ()
  }) : () -> ()
}) : () -> ()

