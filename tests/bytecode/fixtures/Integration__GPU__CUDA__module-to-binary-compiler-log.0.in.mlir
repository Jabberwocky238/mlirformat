"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernel_module", targets = [#nvvm.target<flags = {"collect-compiler-diagnostics"}>]}> ({
    "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, ptr, ptr, i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "kernel", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    ^bb0(%arg0: i32 loc("<stdin>":4:10), %arg1: !llvm.ptr loc("<stdin>":4:22), %arg2: !llvm.ptr loc("<stdin>":4:40), %arg3: i64 loc("<stdin>":4:58), %arg4: i64 loc("<stdin>":4:70), %arg5: i64 loc("<stdin>":4:82)):
      "llvm.return"() : () -> () loc("<stdin>":5:7)
    }) {gpu.kernel} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
}) {gpu.container_module} : () -> () loc("<stdin>":1:1)
