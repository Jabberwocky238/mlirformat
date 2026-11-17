"builtin.module"() ({
  "gpu.module"() <{sym_name = "bar"}> ({
    "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "kernel_a", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
      "llvm.return"() : () -> () loc("<stdin>":4:7)
    }) {gpu.kernel} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
  "gpu.module"() <{sym_name = "foo"}> ({
    "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "fma", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    ^bb0(%arg0: f32 loc("<stdin>":9:10), %arg1: f32 loc("<stdin>":9:22)):
      %0 = "llvm.intr.fma"(%arg0, %arg1, %arg1) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32, f32) -> f32 loc("<stdin>":10:12)
      "llvm.return"(%0) : (f32) -> () loc("<stdin>":11:7)
    }) {gpu.kernel} : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":7:3)
}) : () -> () loc("<stdin>":1:1)
