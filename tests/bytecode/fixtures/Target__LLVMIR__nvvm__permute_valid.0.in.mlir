"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "test_prmt_default", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg17: i32 loc("<stdin>":3:8), %arg18: i32 loc("<stdin>":3:21), %arg19: i32 loc("<stdin>":3:34)):
    %9 = "nvvm.prmt"(%arg18, %arg19, %arg17) <{mode = #nvvm.permute_mode<default>}> : (i32, i32, i32) -> i32 loc("<stdin>":4:10)
    "llvm.return"(%9) : (i32) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "test_prmt_f4e", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg14: i32 loc("<stdin>":8:8), %arg15: i32 loc("<stdin>":8:21), %arg16: i32 loc("<stdin>":8:34)):
    %8 = "nvvm.prmt"(%arg15, %arg16, %arg14) <{mode = #nvvm.permute_mode<f4e>}> : (i32, i32, i32) -> i32 loc("<stdin>":9:10)
    "llvm.return"(%8) : (i32) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "test_prmt_b4e", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg11: i32 loc("<stdin>":13:8), %arg12: i32 loc("<stdin>":13:21), %arg13: i32 loc("<stdin>":13:34)):
    %7 = "nvvm.prmt"(%arg12, %arg13, %arg11) <{mode = #nvvm.permute_mode<b4e>}> : (i32, i32, i32) -> i32 loc("<stdin>":14:10)
    "llvm.return"(%7) : (i32) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "test_prmt_rc8", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg9: i32 loc("<stdin>":18:8), %arg10: i32 loc("<stdin>":18:20)):
    %6 = "nvvm.prmt"(%arg10, %arg9) <{mode = #nvvm.permute_mode<rc8>}> : (i32, i32) -> i32 loc("<stdin>":19:10)
    "llvm.return"(%6) : (i32) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "test_prmt_ecl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg7: i32 loc("<stdin>":23:8), %arg8: i32 loc("<stdin>":23:20)):
    %5 = "nvvm.prmt"(%arg8, %arg7) <{mode = #nvvm.permute_mode<ecl>}> : (i32, i32) -> i32 loc("<stdin>":24:10)
    "llvm.return"(%5) : (i32) -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":22:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "test_prmt_ecr", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg5: i32 loc("<stdin>":28:8), %arg6: i32 loc("<stdin>":28:20)):
    %4 = "nvvm.prmt"(%arg6, %arg5) <{mode = #nvvm.permute_mode<ecr>}> : (i32, i32) -> i32 loc("<stdin>":29:10)
    "llvm.return"(%4) : (i32) -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":27:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "test_prmt_rc16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg3: i32 loc("<stdin>":33:8), %arg4: i32 loc("<stdin>":33:20)):
    %3 = "nvvm.prmt"(%arg4, %arg3) <{mode = #nvvm.permute_mode<rc16>}> : (i32, i32) -> i32 loc("<stdin>":34:10)
    "llvm.return"(%3) : (i32) -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":32:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "test_prmt_mixed", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32 loc("<stdin>":38:8), %arg1: i32 loc("<stdin>":38:20), %arg2: i32 loc("<stdin>":38:32)):
    %0 = "nvvm.prmt"(%arg1, %arg2, %arg0) <{mode = #nvvm.permute_mode<default>}> : (i32, i32, i32) -> i32 loc("<stdin>":39:10)
    %1 = "nvvm.prmt"(%0, %arg0) <{mode = #nvvm.permute_mode<rc8>}> : (i32, i32) -> i32 loc("<stdin>":40:10)
    %2 = "nvvm.prmt"(%1, %arg0, %arg1) <{mode = #nvvm.permute_mode<f4e>}> : (i32, i32, i32) -> i32 loc("<stdin>":41:10)
    "llvm.return"(%2) : (i32) -> () loc("<stdin>":42:5)
  }) : () -> () loc("<stdin>":37:3)
}) : () -> () loc("<stdin>":1:1)
