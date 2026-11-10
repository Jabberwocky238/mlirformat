"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32)>, linkage = #llvm.linkage<external>, sym_name = "rsqrt_f32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg1: f32):
    %2 = "nvvm.rsqrt"(%arg1) <{ftz = false}> : (f32) -> f32
    %3 = "nvvm.rsqrt"(%2) <{ftz = true}> : (f32) -> f32
    "llvm.return"(%3) : (f32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f64 (f64)>, linkage = #llvm.linkage<external>, sym_name = "rsqrt_f64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: f64):
    %0 = "nvvm.rsqrt"(%arg0) <{ftz = false}> : (f64) -> f64
    %1 = "nvvm.rsqrt"(%0) <{ftz = true}> : (f64) -> f64
    "llvm.return"(%1) : (f64) -> ()
  }) : () -> ()
}) : () -> ()

