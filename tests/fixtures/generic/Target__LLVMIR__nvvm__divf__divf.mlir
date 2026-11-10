"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "divf_f32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg6: f32, %arg7: f32):
    %8 = "nvvm.divf"(%arg6, %arg7) <{approx = false, ftz = false, full = false, rnd = #nvvm.fp_rnd_mode<rn>}> : (f32, f32) -> f32
    %9 = "nvvm.divf"(%8, %8) <{approx = false, ftz = false, full = false, rnd = #nvvm.fp_rnd_mode<rz>}> : (f32, f32) -> f32
    %10 = "nvvm.divf"(%9, %9) <{approx = false, ftz = false, full = false, rnd = #nvvm.fp_rnd_mode<rm>}> : (f32, f32) -> f32
    %11 = "nvvm.divf"(%10, %10) <{approx = false, ftz = false, full = false, rnd = #nvvm.fp_rnd_mode<rp>}> : (f32, f32) -> f32
    %12 = "nvvm.divf"(%11, %11) <{approx = false, ftz = true, full = false, rnd = #nvvm.fp_rnd_mode<rn>}> : (f32, f32) -> f32
    %13 = "nvvm.divf"(%12, %12) <{approx = false, ftz = true, full = false, rnd = #nvvm.fp_rnd_mode<rz>}> : (f32, f32) -> f32
    %14 = "nvvm.divf"(%13, %13) <{approx = false, ftz = true, full = false, rnd = #nvvm.fp_rnd_mode<rm>}> : (f32, f32) -> f32
    %15 = "nvvm.divf"(%14, %14) <{approx = false, ftz = true, full = false, rnd = #nvvm.fp_rnd_mode<rp>}> : (f32, f32) -> f32
    "llvm.return"(%15) : (f32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f64 (f64, f64)>, linkage = #llvm.linkage<external>, sym_name = "divf_f64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: f64, %arg5: f64):
    %4 = "nvvm.divf"(%arg4, %arg5) <{approx = false, ftz = false, full = false, rnd = #nvvm.fp_rnd_mode<rn>}> : (f64, f64) -> f64
    %5 = "nvvm.divf"(%4, %4) <{approx = false, ftz = false, full = false, rnd = #nvvm.fp_rnd_mode<rz>}> : (f64, f64) -> f64
    %6 = "nvvm.divf"(%5, %5) <{approx = false, ftz = false, full = false, rnd = #nvvm.fp_rnd_mode<rm>}> : (f64, f64) -> f64
    %7 = "nvvm.divf"(%6, %6) <{approx = false, ftz = false, full = false, rnd = #nvvm.fp_rnd_mode<rp>}> : (f64, f64) -> f64
    "llvm.return"(%7) : (f64) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "divf_approx", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: f32, %arg3: f32):
    %2 = "nvvm.divf"(%arg2, %arg3) <{approx = true, ftz = false, full = false, rnd = #nvvm.fp_rnd_mode<none>}> : (f32, f32) -> f32
    %3 = "nvvm.divf"(%2, %2) <{approx = true, ftz = true, full = false, rnd = #nvvm.fp_rnd_mode<none>}> : (f32, f32) -> f32
    "llvm.return"(%3) : (f32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "divf_full", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: f32, %arg1: f32):
    %0 = "nvvm.divf"(%arg0, %arg1) <{approx = false, ftz = false, full = true, rnd = #nvvm.fp_rnd_mode<none>}> : (f32, f32) -> f32
    %1 = "nvvm.divf"(%0, %0) <{approx = false, ftz = true, full = true, rnd = #nvvm.fp_rnd_mode<none>}> : (f32, f32) -> f32
    "llvm.return"(%1) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

