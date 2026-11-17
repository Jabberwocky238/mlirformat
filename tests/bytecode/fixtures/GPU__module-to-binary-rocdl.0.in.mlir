"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernel_module1", targets = [#rocdl.target<chip = "gfx90a">]}> ({
    "llvm.module_flags"() <{flags = [#rocdl.buffer_oob_mode_flag<relaxed>]}> : () -> () loc("<stdin>":3:5)
    "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, ptr, ptr, i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "kernel", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    ^bb0(%arg6: i32 loc("<stdin>":5:10), %arg7: !llvm.ptr loc("<stdin>":5:22), %arg8: !llvm.ptr loc("<stdin>":5:40), %arg9: i64 loc("<stdin>":5:58), %arg10: i64 loc("<stdin>":5:70), %arg11: i64 loc("<stdin>":5:83)):
      "llvm.return"() : () -> () loc("<stdin>":6:7)
    }) {gpu.kernel} : () -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
  "gpu.module"() <{sym_name = "kernel_module2", targets = [#rocdl.target<flags = {fast}>, #rocdl.target]}> ({
    "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, ptr, ptr, i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "kernel", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    ^bb0(%arg0: i32 loc("<stdin>":11:10), %arg1: !llvm.ptr loc("<stdin>":11:22), %arg2: !llvm.ptr loc("<stdin>":11:40), %arg3: i64 loc("<stdin>":11:58), %arg4: i64 loc("<stdin>":11:70), %arg5: i64 loc("<stdin>":11:82)):
      "llvm.return"() : () -> () loc("<stdin>":12:7)
    }) {gpu.kernel} : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":9:3)
}) {gpu.container_module} : () -> () loc("<stdin>":1:1)
