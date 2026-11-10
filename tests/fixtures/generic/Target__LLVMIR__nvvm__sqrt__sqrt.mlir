"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32)>, linkage = #llvm.linkage<external>, sym_name = "sqrt_f32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: f32):
    %6 = "nvvm.sqrt"(%arg2) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rn>}> : (f32) -> f32
    %7 = "nvvm.sqrt"(%6) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rz>}> : (f32) -> f32
    %8 = "nvvm.sqrt"(%7) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rm>}> : (f32) -> f32
    %9 = "nvvm.sqrt"(%8) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rp>}> : (f32) -> f32
    %10 = "nvvm.sqrt"(%9) <{ftz = true, rnd = #nvvm.fp_rnd_mode<rn>}> : (f32) -> f32
    %11 = "nvvm.sqrt"(%10) <{ftz = true, rnd = #nvvm.fp_rnd_mode<rz>}> : (f32) -> f32
    %12 = "nvvm.sqrt"(%11) <{ftz = true, rnd = #nvvm.fp_rnd_mode<rm>}> : (f32) -> f32
    %13 = "nvvm.sqrt"(%12) <{ftz = true, rnd = #nvvm.fp_rnd_mode<rp>}> : (f32) -> f32
    "llvm.return"(%13) : (f32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f64 (f64)>, linkage = #llvm.linkage<external>, sym_name = "sqrt_f64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg1: f64):
    %2 = "nvvm.sqrt"(%arg1) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rn>}> : (f64) -> f64
    %3 = "nvvm.sqrt"(%2) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rz>}> : (f64) -> f64
    %4 = "nvvm.sqrt"(%3) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rm>}> : (f64) -> f64
    %5 = "nvvm.sqrt"(%4) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rp>}> : (f64) -> f64
    "llvm.return"(%5) : (f64) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32)>, linkage = #llvm.linkage<external>, sym_name = "sqrt_approx", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: f32):
    %0 = "nvvm.sqrt.approx"(%arg0) <{ftz = false}> : (f32) -> f32
    %1 = "nvvm.sqrt.approx"(%0) <{ftz = true}> : (f32) -> f32
    "llvm.return"(%1) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

