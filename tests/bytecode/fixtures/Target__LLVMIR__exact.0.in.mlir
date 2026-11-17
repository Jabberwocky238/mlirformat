"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "exactflag_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64 loc("<stdin>":3:8), %arg1: i64 loc("<stdin>":3:20)):
    %0 = "llvm.udiv"(%arg0, %arg1) <{isExact}> : (i64, i64) -> i64 loc("<stdin>":4:10)
    %1 = "llvm.sdiv"(%arg0, %arg1) <{isExact}> : (i64, i64) -> i64 loc("<stdin>":5:10)
    %2 = "llvm.lshr"(%arg0, %arg1) <{isExact}> : (i64, i64) -> i64 loc("<stdin>":6:10)
    %3 = "llvm.ashr"(%arg0, %arg1) <{isExact}> : (i64, i64) -> i64 loc("<stdin>":7:10)
    "llvm.return"() : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
