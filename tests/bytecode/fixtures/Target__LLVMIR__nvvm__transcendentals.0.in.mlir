"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_sin", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg7: f32 loc("<stdin>":3:8)):
    %7 = "nvvm.sin"(%arg7) <{ftz = false}> : (f32) -> f32 loc("<stdin>":4:10)
    "llvm.return"(%7) : (f32) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_sin_ftz", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg6: f32 loc("<stdin>":8:8)):
    %6 = "nvvm.sin"(%arg6) <{ftz = true}> : (f32) -> f32 loc("<stdin>":9:10)
    "llvm.return"(%6) : (f32) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_cos", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg5: f32 loc("<stdin>":13:8)):
    %5 = "nvvm.cos"(%arg5) <{ftz = false}> : (f32) -> f32 loc("<stdin>":14:10)
    "llvm.return"(%5) : (f32) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_cos_ftz", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: f32 loc("<stdin>":18:8)):
    %4 = "nvvm.cos"(%arg4) <{ftz = true}> : (f32) -> f32 loc("<stdin>":19:10)
    "llvm.return"(%4) : (f32) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_lg2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg3: f32 loc("<stdin>":23:8)):
    %3 = "nvvm.log2"(%arg3) <{ftz = false}> : (f32) -> f32 loc("<stdin>":24:10)
    "llvm.return"(%3) : (f32) -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":22:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_lg2_ftz", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: f32 loc("<stdin>":28:8)):
    %2 = "nvvm.log2"(%arg2) <{ftz = true}> : (f32) -> f32 loc("<stdin>":29:10)
    "llvm.return"(%2) : (f32) -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":27:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_ex2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg1: f32 loc("<stdin>":33:8)):
    %1 = "nvvm.ex2"(%arg1) <{ftz = false}> : (f32) -> f32 loc("<stdin>":34:10)
    "llvm.return"(%1) : (f32) -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":32:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_ex2_ftz", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: f32 loc("<stdin>":38:8)):
    %0 = "nvvm.ex2"(%arg0) <{ftz = true}> : (f32) -> f32 loc("<stdin>":39:10)
    "llvm.return"(%0) : (f32) -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":37:3)
}) : () -> () loc("<stdin>":1:1)
