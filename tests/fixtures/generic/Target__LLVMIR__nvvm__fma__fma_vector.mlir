"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xf16> (vector<2xf16>, vector<2xf16>, vector<2xf16>)>, linkage = #llvm.linkage<external>, sym_name = "fma_f16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg18: vector<2xf16>, %arg19: vector<2xf16>, %arg20: vector<2xf16>):
    %24 = "nvvm.fma"(%arg18, %arg19, %arg20) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (vector<2xf16>, vector<2xf16>, vector<2xf16>) -> vector<2xf16>
    %25 = "nvvm.fma"(%arg18, %arg19, %24) <{ftz = true, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (vector<2xf16>, vector<2xf16>, vector<2xf16>) -> vector<2xf16>
    %26 = "nvvm.fma"(%arg18, %arg19, %25) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>}> : (vector<2xf16>, vector<2xf16>, vector<2xf16>) -> vector<2xf16>
    %27 = "nvvm.fma"(%arg18, %arg19, %26) <{ftz = true, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>}> : (vector<2xf16>, vector<2xf16>, vector<2xf16>) -> vector<2xf16>
    %28 = "nvvm.fma"(%arg18, %arg19, %27) <{ftz = false, oob = false, relu = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (vector<2xf16>, vector<2xf16>, vector<2xf16>) -> vector<2xf16>
    %29 = "nvvm.fma"(%arg18, %arg19, %28) <{ftz = true, oob = false, relu = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (vector<2xf16>, vector<2xf16>, vector<2xf16>) -> vector<2xf16>
    %30 = "nvvm.fma"(%arg18, %arg19, %29) <{ftz = false, oob = true, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (vector<2xf16>, vector<2xf16>, vector<2xf16>) -> vector<2xf16>
    %31 = "nvvm.fma"(%arg18, %arg19, %30) <{ftz = false, oob = true, relu = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (vector<2xf16>, vector<2xf16>, vector<2xf16>) -> vector<2xf16>
    "llvm.return"(%31) : (vector<2xf16>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xbf16> (vector<2xbf16>, vector<2xbf16>, vector<2xbf16>)>, linkage = #llvm.linkage<external>, sym_name = "fma_bf16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg15: vector<2xbf16>, %arg16: vector<2xbf16>, %arg17: vector<2xbf16>):
    %20 = "nvvm.fma"(%arg15, %arg16, %arg17) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (vector<2xbf16>, vector<2xbf16>, vector<2xbf16>) -> vector<2xbf16>
    %21 = "nvvm.fma"(%arg15, %arg16, %20) <{ftz = false, oob = false, relu = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (vector<2xbf16>, vector<2xbf16>, vector<2xbf16>) -> vector<2xbf16>
    %22 = "nvvm.fma"(%arg15, %arg16, %21) <{ftz = false, oob = true, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (vector<2xbf16>, vector<2xbf16>, vector<2xbf16>) -> vector<2xbf16>
    %23 = "nvvm.fma"(%arg15, %arg16, %22) <{ftz = false, oob = true, relu = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (vector<2xbf16>, vector<2xbf16>, vector<2xbf16>) -> vector<2xbf16>
    "llvm.return"(%23) : (vector<2xbf16>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xf32> (vector<2xf32>, vector<2xf32>, vector<2xf32>)>, linkage = #llvm.linkage<external>, sym_name = "fma_f32_rn", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg12: vector<2xf32>, %arg13: vector<2xf32>, %arg14: vector<2xf32>):
    %16 = "nvvm.fma"(%arg12, %arg13, %arg14) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (vector<2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32>
    %17 = "nvvm.fma"(%arg12, %arg13, %16) <{ftz = true, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (vector<2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32>
    %18 = "nvvm.fma"(%arg12, %arg13, %17) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>}> : (vector<2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32>
    %19 = "nvvm.fma"(%arg12, %arg13, %18) <{ftz = true, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>}> : (vector<2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32>
    "llvm.return"(%19) : (vector<2xf32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xf32> (vector<2xf32>, vector<2xf32>, vector<2xf32>)>, linkage = #llvm.linkage<external>, sym_name = "fma_f32_rm", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg9: vector<2xf32>, %arg10: vector<2xf32>, %arg11: vector<2xf32>):
    %12 = "nvvm.fma"(%arg9, %arg10, %arg11) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<none>}> : (vector<2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32>
    %13 = "nvvm.fma"(%arg9, %arg10, %12) <{ftz = true, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<none>}> : (vector<2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32>
    %14 = "nvvm.fma"(%arg9, %arg10, %13) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<sat>}> : (vector<2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32>
    %15 = "nvvm.fma"(%arg9, %arg10, %14) <{ftz = true, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<sat>}> : (vector<2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32>
    "llvm.return"(%15) : (vector<2xf32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xf32> (vector<2xf32>, vector<2xf32>, vector<2xf32>)>, linkage = #llvm.linkage<external>, sym_name = "fma_f32_rp", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg6: vector<2xf32>, %arg7: vector<2xf32>, %arg8: vector<2xf32>):
    %8 = "nvvm.fma"(%arg6, %arg7, %arg8) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<none>}> : (vector<2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32>
    %9 = "nvvm.fma"(%arg6, %arg7, %8) <{ftz = true, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<none>}> : (vector<2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32>
    %10 = "nvvm.fma"(%arg6, %arg7, %9) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<sat>}> : (vector<2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32>
    %11 = "nvvm.fma"(%arg6, %arg7, %10) <{ftz = true, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<sat>}> : (vector<2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32>
    "llvm.return"(%11) : (vector<2xf32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xf32> (vector<2xf32>, vector<2xf32>, vector<2xf32>)>, linkage = #llvm.linkage<external>, sym_name = "fma_f32_rz", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg3: vector<2xf32>, %arg4: vector<2xf32>, %arg5: vector<2xf32>):
    %4 = "nvvm.fma"(%arg3, %arg4, %arg5) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<none>}> : (vector<2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32>
    %5 = "nvvm.fma"(%arg3, %arg4, %4) <{ftz = true, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<none>}> : (vector<2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32>
    %6 = "nvvm.fma"(%arg3, %arg4, %5) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<sat>}> : (vector<2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32>
    %7 = "nvvm.fma"(%arg3, %arg4, %6) <{ftz = true, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<sat>}> : (vector<2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32>
    "llvm.return"(%7) : (vector<2xf32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xf64> (vector<2xf64>, vector<2xf64>, vector<2xf64>)>, linkage = #llvm.linkage<external>, sym_name = "fma_f64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<2xf64>, %arg1: vector<2xf64>, %arg2: vector<2xf64>):
    %0 = "nvvm.fma"(%arg0, %arg1, %arg2) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (vector<2xf64>, vector<2xf64>, vector<2xf64>) -> vector<2xf64>
    %1 = "nvvm.fma"(%arg0, %arg1, %0) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<none>}> : (vector<2xf64>, vector<2xf64>, vector<2xf64>) -> vector<2xf64>
    %2 = "nvvm.fma"(%arg0, %arg1, %1) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<none>}> : (vector<2xf64>, vector<2xf64>, vector<2xf64>) -> vector<2xf64>
    %3 = "nvvm.fma"(%arg0, %arg1, %2) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<none>}> : (vector<2xf64>, vector<2xf64>, vector<2xf64>) -> vector<2xf64>
    "llvm.return"(%3) : (vector<2xf64>) -> ()
  }) : () -> ()
}) : () -> ()

