"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32)>, linkage = #llvm.linkage<external>, sym_name = "rsqrt_f32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg1: f32 loc("<stdin>":3:8)):
    %2 = "nvvm.rsqrt"(%arg1) <{ftz = false}> : (f32) -> f32 loc("<stdin>":4:10)
    %3 = "nvvm.rsqrt"(%2) <{ftz = true}> : (f32) -> f32 loc("<stdin>":5:10)
    "llvm.return"(%3) : (f32) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f64 (f64)>, linkage = #llvm.linkage<external>, sym_name = "rsqrt_f64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: f64 loc("<stdin>":9:8)):
    %0 = "nvvm.rsqrt"(%arg0) <{ftz = false}> : (f64) -> f64 loc("<stdin>":10:10)
    %1 = "nvvm.rsqrt"(%0) <{ftz = true}> : (f64) -> f64 loc("<stdin>":11:10)
    "llvm.return"(%1) : (f64) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":8:3)
}) : () -> () loc("<stdin>":1:1)
