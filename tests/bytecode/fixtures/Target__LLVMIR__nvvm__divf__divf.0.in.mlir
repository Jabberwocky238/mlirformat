"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "divf_f32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg6: f32 loc("<stdin>":3:8), %arg7: f32 loc("<stdin>":3:20)):
    %8 = "nvvm.divf"(%arg6, %arg7) <{approx = false, ftz = false, full = false, rnd = #nvvm.fp_rnd_mode<rn>}> : (f32, f32) -> f32 loc("<stdin>":4:10)
    %9 = "nvvm.divf"(%8, %8) <{approx = false, ftz = false, full = false, rnd = #nvvm.fp_rnd_mode<rz>}> : (f32, f32) -> f32 loc("<stdin>":5:10)
    %10 = "nvvm.divf"(%9, %9) <{approx = false, ftz = false, full = false, rnd = #nvvm.fp_rnd_mode<rm>}> : (f32, f32) -> f32 loc("<stdin>":6:11)
    %11 = "nvvm.divf"(%10, %10) <{approx = false, ftz = false, full = false, rnd = #nvvm.fp_rnd_mode<rp>}> : (f32, f32) -> f32 loc("<stdin>":7:11)
    %12 = "nvvm.divf"(%11, %11) <{approx = false, ftz = true, full = false, rnd = #nvvm.fp_rnd_mode<rn>}> : (f32, f32) -> f32 loc("<stdin>":8:11)
    %13 = "nvvm.divf"(%12, %12) <{approx = false, ftz = true, full = false, rnd = #nvvm.fp_rnd_mode<rz>}> : (f32, f32) -> f32 loc("<stdin>":9:11)
    %14 = "nvvm.divf"(%13, %13) <{approx = false, ftz = true, full = false, rnd = #nvvm.fp_rnd_mode<rm>}> : (f32, f32) -> f32 loc("<stdin>":10:11)
    %15 = "nvvm.divf"(%14, %14) <{approx = false, ftz = true, full = false, rnd = #nvvm.fp_rnd_mode<rp>}> : (f32, f32) -> f32 loc("<stdin>":11:11)
    "llvm.return"(%15) : (f32) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f64 (f64, f64)>, linkage = #llvm.linkage<external>, sym_name = "divf_f64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: f64 loc("<stdin>":15:8), %arg5: f64 loc("<stdin>":15:20)):
    %4 = "nvvm.divf"(%arg4, %arg5) <{approx = false, ftz = false, full = false, rnd = #nvvm.fp_rnd_mode<rn>}> : (f64, f64) -> f64 loc("<stdin>":16:10)
    %5 = "nvvm.divf"(%4, %4) <{approx = false, ftz = false, full = false, rnd = #nvvm.fp_rnd_mode<rz>}> : (f64, f64) -> f64 loc("<stdin>":17:10)
    %6 = "nvvm.divf"(%5, %5) <{approx = false, ftz = false, full = false, rnd = #nvvm.fp_rnd_mode<rm>}> : (f64, f64) -> f64 loc("<stdin>":18:10)
    %7 = "nvvm.divf"(%6, %6) <{approx = false, ftz = false, full = false, rnd = #nvvm.fp_rnd_mode<rp>}> : (f64, f64) -> f64 loc("<stdin>":19:10)
    "llvm.return"(%7) : (f64) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":14:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "divf_approx", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: f32 loc("<stdin>":23:8), %arg3: f32 loc("<stdin>":23:20)):
    %2 = "nvvm.divf"(%arg2, %arg3) <{approx = true, ftz = false, full = false, rnd = #nvvm.fp_rnd_mode<none>}> : (f32, f32) -> f32 loc("<stdin>":24:10)
    %3 = "nvvm.divf"(%2, %2) <{approx = true, ftz = true, full = false, rnd = #nvvm.fp_rnd_mode<none>}> : (f32, f32) -> f32 loc("<stdin>":25:10)
    "llvm.return"(%3) : (f32) -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":22:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "divf_full", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: f32 loc("<stdin>":29:8), %arg1: f32 loc("<stdin>":29:20)):
    %0 = "nvvm.divf"(%arg0, %arg1) <{approx = false, ftz = false, full = true, rnd = #nvvm.fp_rnd_mode<none>}> : (f32, f32) -> f32 loc("<stdin>":30:10)
    %1 = "nvvm.divf"(%0, %0) <{approx = false, ftz = true, full = true, rnd = #nvvm.fp_rnd_mode<none>}> : (f32, f32) -> f32 loc("<stdin>":31:10)
    "llvm.return"(%1) : (f32) -> () loc("<stdin>":32:5)
  }) : () -> () loc("<stdin>":28:3)
}) : () -> () loc("<stdin>":1:1)
