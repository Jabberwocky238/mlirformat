"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xf16> (vector<2xf16>, vector<2xf16>)>, linkage = #llvm.linkage<external>, sym_name = "subf_vector_f16_f16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg18: vector<2xf16>, %arg19: vector<2xf16>):
    %24 = "nvvm.subf"(%arg18, %arg19) <{ftz = false, rnd = #nvvm.fp_rnd_mode<none>, sat = #nvvm.sat_mode<none>}> : (vector<2xf16>, vector<2xf16>) -> vector<2xf16>
    %25 = "nvvm.subf"(%24, %24) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (vector<2xf16>, vector<2xf16>) -> vector<2xf16>
    %26 = "nvvm.subf"(%25, %25) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>}> : (vector<2xf16>, vector<2xf16>) -> vector<2xf16>
    %27 = "nvvm.subf"(%26, %26) <{ftz = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>}> : (vector<2xf16>, vector<2xf16>) -> vector<2xf16>
    "llvm.return"(%24) : (vector<2xf16>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xbf16> (vector<2xbf16>, vector<2xbf16>)>, linkage = #llvm.linkage<external>, sym_name = "subf_vector_bf16_bf16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg16: vector<2xbf16>, %arg17: vector<2xbf16>):
    %22 = "nvvm.subf"(%arg16, %arg17) <{ftz = false, rnd = #nvvm.fp_rnd_mode<none>, sat = #nvvm.sat_mode<none>}> : (vector<2xbf16>, vector<2xbf16>) -> vector<2xbf16>
    %23 = "nvvm.subf"(%22, %22) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (vector<2xbf16>, vector<2xbf16>) -> vector<2xbf16>
    "llvm.return"(%23) : (vector<2xbf16>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xf32> (vector<2xf32>, vector<2xf32>)>, linkage = #llvm.linkage<external>, sym_name = "subf_vector_f32_f32_rn", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg14: vector<2xf32>, %arg15: vector<2xf32>):
    %17 = "nvvm.subf"(%arg14, %arg15) <{ftz = false, rnd = #nvvm.fp_rnd_mode<none>, sat = #nvvm.sat_mode<none>}> : (vector<2xf32>, vector<2xf32>) -> vector<2xf32>
    %18 = "nvvm.subf"(%17, %17) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (vector<2xf32>, vector<2xf32>) -> vector<2xf32>
    %19 = "nvvm.subf"(%18, %18) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>}> : (vector<2xf32>, vector<2xf32>) -> vector<2xf32>
    %20 = "nvvm.subf"(%19, %19) <{ftz = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (vector<2xf32>, vector<2xf32>) -> vector<2xf32>
    %21 = "nvvm.subf"(%20, %20) <{ftz = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>}> : (vector<2xf32>, vector<2xf32>) -> vector<2xf32>
    "llvm.return"(%20) : (vector<2xf32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xf32> (vector<2xf32>, vector<2xf32>)>, linkage = #llvm.linkage<external>, sym_name = "subf_vector_f32_f32_rm", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg12: vector<2xf32>, %arg13: vector<2xf32>):
    %13 = "nvvm.subf"(%arg12, %arg13) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<none>}> : (vector<2xf32>, vector<2xf32>) -> vector<2xf32>
    %14 = "nvvm.subf"(%13, %13) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<sat>}> : (vector<2xf32>, vector<2xf32>) -> vector<2xf32>
    %15 = "nvvm.subf"(%14, %14) <{ftz = true, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<none>}> : (vector<2xf32>, vector<2xf32>) -> vector<2xf32>
    %16 = "nvvm.subf"(%15, %15) <{ftz = true, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<sat>}> : (vector<2xf32>, vector<2xf32>) -> vector<2xf32>
    "llvm.return"(%16) : (vector<2xf32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xf32> (vector<2xf32>, vector<2xf32>)>, linkage = #llvm.linkage<external>, sym_name = "subf_vector_f32_f32_rp", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg10: vector<2xf32>, %arg11: vector<2xf32>):
    %9 = "nvvm.subf"(%arg10, %arg11) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<none>}> : (vector<2xf32>, vector<2xf32>) -> vector<2xf32>
    %10 = "nvvm.subf"(%9, %9) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<sat>}> : (vector<2xf32>, vector<2xf32>) -> vector<2xf32>
    %11 = "nvvm.subf"(%10, %10) <{ftz = true, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<none>}> : (vector<2xf32>, vector<2xf32>) -> vector<2xf32>
    %12 = "nvvm.subf"(%11, %11) <{ftz = true, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<sat>}> : (vector<2xf32>, vector<2xf32>) -> vector<2xf32>
    "llvm.return"(%12) : (vector<2xf32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xf32> (vector<2xf32>, vector<2xf32>)>, linkage = #llvm.linkage<external>, sym_name = "subf_vector_f32_f32_rz", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg8: vector<2xf32>, %arg9: vector<2xf32>):
    %5 = "nvvm.subf"(%arg8, %arg9) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<none>}> : (vector<2xf32>, vector<2xf32>) -> vector<2xf32>
    %6 = "nvvm.subf"(%5, %5) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<sat>}> : (vector<2xf32>, vector<2xf32>) -> vector<2xf32>
    %7 = "nvvm.subf"(%6, %6) <{ftz = true, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<none>}> : (vector<2xf32>, vector<2xf32>) -> vector<2xf32>
    %8 = "nvvm.subf"(%7, %7) <{ftz = true, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<sat>}> : (vector<2xf32>, vector<2xf32>) -> vector<2xf32>
    "llvm.return"(%8) : (vector<2xf32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xf64> (vector<2xf64>, vector<2xf64>)>, linkage = #llvm.linkage<external>, sym_name = "subf_vector_f64_f64_rn", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg6: vector<2xf64>, %arg7: vector<2xf64>):
    %3 = "nvvm.subf"(%arg6, %arg7) <{ftz = false, rnd = #nvvm.fp_rnd_mode<none>, sat = #nvvm.sat_mode<none>}> : (vector<2xf64>, vector<2xf64>) -> vector<2xf64>
    %4 = "nvvm.subf"(%3, %3) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (vector<2xf64>, vector<2xf64>) -> vector<2xf64>
    "llvm.return"(%4) : (vector<2xf64>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xf64> (vector<2xf64>, vector<2xf64>)>, linkage = #llvm.linkage<external>, sym_name = "subf_vector_f64_f64_rm", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: vector<2xf64>, %arg5: vector<2xf64>):
    %2 = "nvvm.subf"(%arg4, %arg5) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<none>}> : (vector<2xf64>, vector<2xf64>) -> vector<2xf64>
    "llvm.return"(%2) : (vector<2xf64>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xf64> (vector<2xf64>, vector<2xf64>)>, linkage = #llvm.linkage<external>, sym_name = "subf_vector_f64_f64_rp", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: vector<2xf64>, %arg3: vector<2xf64>):
    %1 = "nvvm.subf"(%arg2, %arg3) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<none>}> : (vector<2xf64>, vector<2xf64>) -> vector<2xf64>
    "llvm.return"(%1) : (vector<2xf64>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xf64> (vector<2xf64>, vector<2xf64>)>, linkage = #llvm.linkage<external>, sym_name = "subf_vector_f64_f64_rz", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<2xf64>, %arg1: vector<2xf64>):
    %0 = "nvvm.subf"(%arg0, %arg1) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<none>}> : (vector<2xf64>, vector<2xf64>) -> vector<2xf64>
    "llvm.return"(%0) : (vector<2xf64>) -> ()
  }) : () -> ()
}) : () -> ()

