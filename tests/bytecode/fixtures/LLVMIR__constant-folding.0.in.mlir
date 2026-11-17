"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 ()>, linkage = #llvm.linkage<external>, sym_name = "zext_basic", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %2 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":3:10)
    %3 = "llvm.zext"(%2) : (i32) -> i64 loc("<stdin>":4:10)
    "llvm.return"(%3) : (i64) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i64 ()>, linkage = #llvm.linkage<external>, sym_name = "zext_neg", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = -1 : i32}> : () -> i32 loc("<stdin>":8:10)
    %1 = "llvm.zext"(%0) : (i32) -> i64 loc("<stdin>":9:10)
    "llvm.return"(%1) : (i64) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
}) : () -> () loc("<stdin>":1:1)
