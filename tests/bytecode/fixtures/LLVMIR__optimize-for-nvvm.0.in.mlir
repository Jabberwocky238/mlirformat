"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f16 (f16, f16)>, linkage = #llvm.linkage<external>, sym_name = "fdiv_fp16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: f16 loc("<stdin>":3:8), %arg1: f16 loc("<stdin>":3:20)):
    %0 = "llvm.fdiv"(%arg0, %arg1) <{fastmathFlags = #llvm.fastmath<none>}> : (f16, f16) -> f16 loc("<stdin>":4:10)
    "llvm.return"(%0) : (f16) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
