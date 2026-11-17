"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32)>, linkage = #llvm.linkage<external>, sym_name = "nnegflag_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32 loc("<stdin>":3:8)):
    %0 = "llvm.zext"(%arg0) <{nonNeg}> : (i32) -> i64 loc("<stdin>":4:10)
    %1 = "llvm.uitofp"(%arg0) <{nonNeg}> : (i32) -> f32 loc("<stdin>":5:10)
    "llvm.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
