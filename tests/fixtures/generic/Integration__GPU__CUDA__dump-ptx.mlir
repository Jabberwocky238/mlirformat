"builtin.module"() ({
  "gpu.module"() <{sym_name = "bar"}> ({
    "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "kernel_a", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
      "llvm.return"() : () -> ()
    }) {gpu.kernel} : () -> ()
  }) : () -> ()
  "gpu.module"() <{sym_name = "foo"}> ({
    "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "fma", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    ^bb0(%arg0: f32, %arg1: f32):
      %0 = "llvm.intr.fma"(%arg0, %arg1, %arg1) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32, f32) -> f32
      "llvm.return"(%0) : (f32) -> ()
    }) {gpu.kernel} : () -> ()
  }) : () -> ()
}) : () -> ()

