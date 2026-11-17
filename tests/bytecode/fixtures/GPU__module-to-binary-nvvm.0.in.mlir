"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernel_module1", targets = [#nvvm.target<chip = "sm_70">]}> ({
    "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, ptr, ptr, i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "kernel", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    ^bb0(%arg12: i32 loc("<stdin>":4:10), %arg13: !llvm.ptr loc("<stdin>":4:23), %arg14: !llvm.ptr loc("<stdin>":4:42), %arg15: i64 loc("<stdin>":4:61), %arg16: i64 loc("<stdin>":4:74), %arg17: i64 loc("<stdin>":4:87)):
      "llvm.return"() : () -> () loc("<stdin>":5:7)
    }) {gpu.kernel} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
  "gpu.module"() <{sym_name = "kernel_module2", targets = [#nvvm.target<flags = {fast}>, #nvvm.target]}> ({
    "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, ptr, ptr, i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "kernel", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    ^bb0(%arg6: i32 loc("<stdin>":10:10), %arg7: !llvm.ptr loc("<stdin>":10:22), %arg8: !llvm.ptr loc("<stdin>":10:40), %arg9: i64 loc("<stdin>":10:58), %arg10: i64 loc("<stdin>":10:70), %arg11: i64 loc("<stdin>":10:83)):
      "llvm.return"() : () -> () loc("<stdin>":11:7)
    }) {gpu.kernel} : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":8:3)
  "gpu.module"() <{offloadingHandler = #gpu.select_object<1 : i64>, sym_name = "kernel_module3", targets = [#nvvm.target<chip = "sm_70">, #nvvm.target<chip = "sm_80">]}> ({
    "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, ptr, ptr, i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "kernel", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    ^bb0(%arg0: i32 loc("<stdin>":16:10), %arg1: !llvm.ptr loc("<stdin>":16:22), %arg2: !llvm.ptr loc("<stdin>":16:40), %arg3: i64 loc("<stdin>":16:58), %arg4: i64 loc("<stdin>":16:70), %arg5: i64 loc("<stdin>":16:82)):
      "llvm.return"() : () -> () loc("<stdin>":17:7)
    }) {gpu.kernel} : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":14:3)
}) {gpu.container_module} : () -> () loc("<stdin>":1:1)
