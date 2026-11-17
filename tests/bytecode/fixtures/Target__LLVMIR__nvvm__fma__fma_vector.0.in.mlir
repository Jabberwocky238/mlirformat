"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xf16> (vector<2xf16>, vector<2xf16>, vector<2xf16>)>, linkage = #llvm.linkage<external>, sym_name = "fma_f16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg18: vector<2xf16> loc("<stdin>":3:8), %arg19: vector<2xf16> loc("<stdin>":3:31), %arg20: vector<2xf16> loc("<stdin>":3:54)):
    %24 = "nvvm.fma"(%arg18, %arg19, %arg20) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (vector<2xf16>, vector<2xf16>, vector<2xf16>) -> vector<2xf16> loc("<stdin>":4:11)
    %25 = "nvvm.fma"(%arg18, %arg19, %24) <{ftz = true, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (vector<2xf16>, vector<2xf16>, vector<2xf16>) -> vector<2xf16> loc("<stdin>":5:11)
    %26 = "nvvm.fma"(%arg18, %arg19, %25) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>}> : (vector<2xf16>, vector<2xf16>, vector<2xf16>) -> vector<2xf16> loc("<stdin>":6:11)
    %27 = "nvvm.fma"(%arg18, %arg19, %26) <{ftz = true, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>}> : (vector<2xf16>, vector<2xf16>, vector<2xf16>) -> vector<2xf16> loc("<stdin>":7:11)
    %28 = "nvvm.fma"(%arg18, %arg19, %27) <{ftz = false, oob = false, relu = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (vector<2xf16>, vector<2xf16>, vector<2xf16>) -> vector<2xf16> loc("<stdin>":8:11)
    %29 = "nvvm.fma"(%arg18, %arg19, %28) <{ftz = true, oob = false, relu = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (vector<2xf16>, vector<2xf16>, vector<2xf16>) -> vector<2xf16> loc("<stdin>":9:11)
    %30 = "nvvm.fma"(%arg18, %arg19, %29) <{ftz = false, oob = true, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (vector<2xf16>, vector<2xf16>, vector<2xf16>) -> vector<2xf16> loc("<stdin>":10:11)
    %31 = "nvvm.fma"(%arg18, %arg19, %30) <{ftz = false, oob = true, relu = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (vector<2xf16>, vector<2xf16>, vector<2xf16>) -> vector<2xf16> loc("<stdin>":11:11)
    "llvm.return"(%31) : (vector<2xf16>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xbf16> (vector<2xbf16>, vector<2xbf16>, vector<2xbf16>)>, linkage = #llvm.linkage<external>, sym_name = "fma_bf16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg15: vector<2xbf16> loc("<stdin>":15:8), %arg16: vector<2xbf16> loc("<stdin>":15:32), %arg17: vector<2xbf16> loc("<stdin>":15:56)):
    %20 = "nvvm.fma"(%arg15, %arg16, %arg17) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (vector<2xbf16>, vector<2xbf16>, vector<2xbf16>) -> vector<2xbf16> loc("<stdin>":16:11)
    %21 = "nvvm.fma"(%arg15, %arg16, %20) <{ftz = false, oob = false, relu = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (vector<2xbf16>, vector<2xbf16>, vector<2xbf16>) -> vector<2xbf16> loc("<stdin>":17:11)
    %22 = "nvvm.fma"(%arg15, %arg16, %21) <{ftz = false, oob = true, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (vector<2xbf16>, vector<2xbf16>, vector<2xbf16>) -> vector<2xbf16> loc("<stdin>":18:11)
    %23 = "nvvm.fma"(%arg15, %arg16, %22) <{ftz = false, oob = true, relu = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (vector<2xbf16>, vector<2xbf16>, vector<2xbf16>) -> vector<2xbf16> loc("<stdin>":19:11)
    "llvm.return"(%23) : (vector<2xbf16>) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":14:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xf32> (vector<2xf32>, vector<2xf32>, vector<2xf32>)>, linkage = #llvm.linkage<external>, sym_name = "fma_f32_rn", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg12: vector<2xf32> loc("<stdin>":23:8), %arg13: vector<2xf32> loc("<stdin>":23:31), %arg14: vector<2xf32> loc("<stdin>":23:54)):
    %16 = "nvvm.fma"(%arg12, %arg13, %arg14) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (vector<2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":24:11)
    %17 = "nvvm.fma"(%arg12, %arg13, %16) <{ftz = true, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (vector<2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":25:11)
    %18 = "nvvm.fma"(%arg12, %arg13, %17) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>}> : (vector<2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":26:11)
    %19 = "nvvm.fma"(%arg12, %arg13, %18) <{ftz = true, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<sat>}> : (vector<2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":27:11)
    "llvm.return"(%19) : (vector<2xf32>) -> () loc("<stdin>":28:5)
  }) : () -> () loc("<stdin>":22:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xf32> (vector<2xf32>, vector<2xf32>, vector<2xf32>)>, linkage = #llvm.linkage<external>, sym_name = "fma_f32_rm", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg9: vector<2xf32> loc("<stdin>":31:8), %arg10: vector<2xf32> loc("<stdin>":31:30), %arg11: vector<2xf32> loc("<stdin>":31:53)):
    %12 = "nvvm.fma"(%arg9, %arg10, %arg11) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<none>}> : (vector<2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":32:11)
    %13 = "nvvm.fma"(%arg9, %arg10, %12) <{ftz = true, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<none>}> : (vector<2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":33:11)
    %14 = "nvvm.fma"(%arg9, %arg10, %13) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<sat>}> : (vector<2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":34:11)
    %15 = "nvvm.fma"(%arg9, %arg10, %14) <{ftz = true, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<sat>}> : (vector<2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":35:11)
    "llvm.return"(%15) : (vector<2xf32>) -> () loc("<stdin>":36:5)
  }) : () -> () loc("<stdin>":30:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xf32> (vector<2xf32>, vector<2xf32>, vector<2xf32>)>, linkage = #llvm.linkage<external>, sym_name = "fma_f32_rp", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg6: vector<2xf32> loc("<stdin>":39:8), %arg7: vector<2xf32> loc("<stdin>":39:30), %arg8: vector<2xf32> loc("<stdin>":39:52)):
    %8 = "nvvm.fma"(%arg6, %arg7, %arg8) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<none>}> : (vector<2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":40:10)
    %9 = "nvvm.fma"(%arg6, %arg7, %8) <{ftz = true, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<none>}> : (vector<2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":41:10)
    %10 = "nvvm.fma"(%arg6, %arg7, %9) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<sat>}> : (vector<2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":42:11)
    %11 = "nvvm.fma"(%arg6, %arg7, %10) <{ftz = true, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<sat>}> : (vector<2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":43:11)
    "llvm.return"(%11) : (vector<2xf32>) -> () loc("<stdin>":44:5)
  }) : () -> () loc("<stdin>":38:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xf32> (vector<2xf32>, vector<2xf32>, vector<2xf32>)>, linkage = #llvm.linkage<external>, sym_name = "fma_f32_rz", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg3: vector<2xf32> loc("<stdin>":47:8), %arg4: vector<2xf32> loc("<stdin>":47:30), %arg5: vector<2xf32> loc("<stdin>":47:52)):
    %4 = "nvvm.fma"(%arg3, %arg4, %arg5) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<none>}> : (vector<2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":48:10)
    %5 = "nvvm.fma"(%arg3, %arg4, %4) <{ftz = true, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<none>}> : (vector<2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":49:10)
    %6 = "nvvm.fma"(%arg3, %arg4, %5) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<sat>}> : (vector<2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":50:10)
    %7 = "nvvm.fma"(%arg3, %arg4, %6) <{ftz = true, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<sat>}> : (vector<2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32> loc("<stdin>":51:10)
    "llvm.return"(%7) : (vector<2xf32>) -> () loc("<stdin>":52:5)
  }) : () -> () loc("<stdin>":46:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xf64> (vector<2xf64>, vector<2xf64>, vector<2xf64>)>, linkage = #llvm.linkage<external>, sym_name = "fma_f64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<2xf64> loc("<stdin>":55:8), %arg1: vector<2xf64> loc("<stdin>":55:30), %arg2: vector<2xf64> loc("<stdin>":55:52)):
    %0 = "nvvm.fma"(%arg0, %arg1, %arg2) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (vector<2xf64>, vector<2xf64>, vector<2xf64>) -> vector<2xf64> loc("<stdin>":56:10)
    %1 = "nvvm.fma"(%arg0, %arg1, %0) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rm>, sat = #nvvm.sat_mode<none>}> : (vector<2xf64>, vector<2xf64>, vector<2xf64>) -> vector<2xf64> loc("<stdin>":57:10)
    %2 = "nvvm.fma"(%arg0, %arg1, %1) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<none>}> : (vector<2xf64>, vector<2xf64>, vector<2xf64>) -> vector<2xf64> loc("<stdin>":58:10)
    %3 = "nvvm.fma"(%arg0, %arg1, %2) <{ftz = false, oob = false, relu = false, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<none>}> : (vector<2xf64>, vector<2xf64>, vector<2xf64>) -> vector<2xf64> loc("<stdin>":59:10)
    "llvm.return"(%3) : (vector<2xf64>) -> () loc("<stdin>":60:5)
  }) : () -> () loc("<stdin>":54:3)
}) : () -> () loc("<stdin>":1:1)
