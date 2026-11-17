"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "subf_canonicalize", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: f32 loc("<stdin>":3:8), %arg1: f32 loc("<stdin>":3:20)):
    %0 = "nvvm.subf"(%arg0, %arg1) <{ftz = false, rnd = #nvvm.fp_rnd_mode<none>, sat = #nvvm.sat_mode<none>}> : (f32, f32) -> f32 loc("<stdin>":4:10)
    "llvm.return"(%0) : (f32) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
