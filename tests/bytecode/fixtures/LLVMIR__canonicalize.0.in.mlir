"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i1 (i32)>, linkage = #llvm.linkage<external>, sym_name = "fold_icmp_eq", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32 loc("<stdin>":3:8)):
    %0 = "llvm.icmp"(%arg0, %arg0) <{predicate = 0 : i64}> : (i32, i32) -> i1 loc("<stdin>":4:10)
    "llvm.return"(%0) : (i1) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
