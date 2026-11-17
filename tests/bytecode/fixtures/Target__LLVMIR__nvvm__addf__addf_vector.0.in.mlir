"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xf16> (vector<2xf16>, vector<2xf16>)>, linkage = #llvm.linkage<external>, sym_name = "addf_vector_f16_f16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg18: vector<2xf16> loc("<stdin>":3:8), %arg19: vector<2xf16> loc("<stdin>":3:31)):
    %24 = "nvvm.addf"(%arg18, %arg19) <{ftz = false, rnd = #nvvm.fp_rnd_mode<none>, sat = #nvvm.sat_mode<none>}> : (vector<2xf16>, vector<2xf16>) -> vector<2xf16> loc("<stdin>":4:11)
    %25 = "nvvm.addf"(%24, %24) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (vector<2xf16>, vector<2xf16>) -> vector<2xf16> loc("<stdin>":5:11)
    %26 = "nvvm.addf"(%25, %25) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>}> : (vector<2xf16>, vector<2xf16>) -> vector<2xf16> loc("<stdin>":6:11)
    %27 = "nvvm.addf"(%26, %26) <{ftz = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>}> : (vector<2xf16>, vector<2xf16>) -> vector<2xf16> loc("<stdin>":7:11)
    "llvm.return"(%24) : (vector<2xf16>) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xbf16> (vector<2xbf16>, vector<2xbf16>)>, linkage = #llvm.linkage<external>, sym_name = "addf_vector_bf16_bf16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg16: vector<2xbf16> loc("<stdin>":11:8), %arg17: vector<2xbf16> loc("<stdin>":11:32)):
    %22 = "nvvm.addf"(%arg16, %arg17) <{ftz = false, rnd = #nvvm.fp_rnd_mode<none>, sat = #nvvm.sat_mode<none>}> : (vector<2xbf16>, vector<2xbf16>) -> vector<2xbf16> loc("<stdin>":12:11)
    %23 = "nvvm.addf"(%22, %22) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (vector<2xbf16>, vector<2xbf16>) -> vector<2xbf16> loc("<stdin>":13:11)
    "llvm.return"(%23) : (vector<2xbf16>) -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":10:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xf32> (vector<2xf32>, vector<2xf32>)>, linkage = #llvm.linkage<external>, sym_name = "addf_vector_f32_f32_rn", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg14: vector<2xf32> loc("<stdin>":17:8), %arg15: vector<2xf32> loc("<stdin>":17:31)):
    %17 = "nvvm.addf"(%arg14, %arg15) <{ftz = false, rnd = #nvvm.fp_rnd_mode<none>, sat = #nvvm.sat_mode<none>}> : (vector<2xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":18:11)
    %18 = "nvvm.addf"(%17, %17) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (vector<2xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":19:11)
    %19 = "nvvm.addf"(%18, %18) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>}> : (vector<2xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":20:11)
    %20 = "nvvm.addf"(%19, %19) <{ftz = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (vector<2xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":21:11)
    %21 = "nvvm.addf"(%20, %20) <{ftz = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>}> : (vector<2xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":22:11)
    "llvm.return"(%20) : (vector<2xf32>) -> () loc("<stdin>":23:5)
  }) : () -> () loc("<stdin>":16:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xf32> (vector<2xf32>, vector<2xf32>)>, linkage = #llvm.linkage<external>, sym_name = "addf_vector_f32_f32_rm", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg12: vector<2xf32> loc("<stdin>":26:8), %arg13: vector<2xf32> loc("<stdin>":26:31)):
    %13 = "nvvm.addf"(%arg12, %arg13) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<none>}> : (vector<2xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":27:11)
    %14 = "nvvm.addf"(%13, %13) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<sat>}> : (vector<2xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":28:11)
    %15 = "nvvm.addf"(%14, %14) <{ftz = true, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<none>}> : (vector<2xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":29:11)
    %16 = "nvvm.addf"(%15, %15) <{ftz = true, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<sat>}> : (vector<2xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":30:11)
    "llvm.return"(%16) : (vector<2xf32>) -> () loc("<stdin>":31:5)
  }) : () -> () loc("<stdin>":25:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xf32> (vector<2xf32>, vector<2xf32>)>, linkage = #llvm.linkage<external>, sym_name = "addf_vector_f32_f32_rp", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg10: vector<2xf32> loc("<stdin>":34:8), %arg11: vector<2xf32> loc("<stdin>":34:31)):
    %9 = "nvvm.addf"(%arg10, %arg11) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<none>}> : (vector<2xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":35:10)
    %10 = "nvvm.addf"(%9, %9) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<sat>}> : (vector<2xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":36:11)
    %11 = "nvvm.addf"(%10, %10) <{ftz = true, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<none>}> : (vector<2xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":37:11)
    %12 = "nvvm.addf"(%11, %11) <{ftz = true, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<sat>}> : (vector<2xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":38:11)
    "llvm.return"(%12) : (vector<2xf32>) -> () loc("<stdin>":39:5)
  }) : () -> () loc("<stdin>":33:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xf32> (vector<2xf32>, vector<2xf32>)>, linkage = #llvm.linkage<external>, sym_name = "addf_vector_f32_f32_rz", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg8: vector<2xf32> loc("<stdin>":42:8), %arg9: vector<2xf32> loc("<stdin>":42:30)):
    %5 = "nvvm.addf"(%arg8, %arg9) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<none>}> : (vector<2xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":43:10)
    %6 = "nvvm.addf"(%5, %5) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<sat>}> : (vector<2xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":44:10)
    %7 = "nvvm.addf"(%6, %6) <{ftz = true, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<none>}> : (vector<2xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":45:10)
    %8 = "nvvm.addf"(%7, %7) <{ftz = true, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<sat>}> : (vector<2xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":46:10)
    "llvm.return"(%8) : (vector<2xf32>) -> () loc("<stdin>":47:5)
  }) : () -> () loc("<stdin>":41:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xf64> (vector<2xf64>, vector<2xf64>)>, linkage = #llvm.linkage<external>, sym_name = "addf_vector_f64_f64_rn", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg6: vector<2xf64> loc("<stdin>":50:8), %arg7: vector<2xf64> loc("<stdin>":50:30)):
    %3 = "nvvm.addf"(%arg6, %arg7) <{ftz = false, rnd = #nvvm.fp_rnd_mode<none>, sat = #nvvm.sat_mode<none>}> : (vector<2xf64>, vector<2xf64>) -> vector<2xf64> loc("<stdin>":51:10)
    %4 = "nvvm.addf"(%3, %3) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (vector<2xf64>, vector<2xf64>) -> vector<2xf64> loc("<stdin>":52:10)
    "llvm.return"(%4) : (vector<2xf64>) -> () loc("<stdin>":53:5)
  }) : () -> () loc("<stdin>":49:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xf64> (vector<2xf64>, vector<2xf64>)>, linkage = #llvm.linkage<external>, sym_name = "addf_vector_f64_f64_rm", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: vector<2xf64> loc("<stdin>":56:8), %arg5: vector<2xf64> loc("<stdin>":56:30)):
    %2 = "nvvm.addf"(%arg4, %arg5) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<none>}> : (vector<2xf64>, vector<2xf64>) -> vector<2xf64> loc("<stdin>":57:10)
    "llvm.return"(%2) : (vector<2xf64>) -> () loc("<stdin>":58:5)
  }) : () -> () loc("<stdin>":55:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xf64> (vector<2xf64>, vector<2xf64>)>, linkage = #llvm.linkage<external>, sym_name = "addf_vector_f64_f64_rp", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: vector<2xf64> loc("<stdin>":61:8), %arg3: vector<2xf64> loc("<stdin>":61:30)):
    %1 = "nvvm.addf"(%arg2, %arg3) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<none>}> : (vector<2xf64>, vector<2xf64>) -> vector<2xf64> loc("<stdin>":62:10)
    "llvm.return"(%1) : (vector<2xf64>) -> () loc("<stdin>":63:5)
  }) : () -> () loc("<stdin>":60:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xf64> (vector<2xf64>, vector<2xf64>)>, linkage = #llvm.linkage<external>, sym_name = "addf_vector_f64_f64_rz", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<2xf64> loc("<stdin>":66:8), %arg1: vector<2xf64> loc("<stdin>":66:30)):
    %0 = "nvvm.addf"(%arg0, %arg1) <{ftz = false, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<none>}> : (vector<2xf64>, vector<2xf64>) -> vector<2xf64> loc("<stdin>":67:10)
    "llvm.return"(%0) : (vector<2xf64>) -> () loc("<stdin>":68:5)
  }) : () -> () loc("<stdin>":65:3)
}) : () -> () loc("<stdin>":1:1)
