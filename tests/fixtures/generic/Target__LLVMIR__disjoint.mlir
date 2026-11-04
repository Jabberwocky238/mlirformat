"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "disjointflag_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64):
    %0 = "llvm.or"(%arg0, %arg1) <{isDisjoint}> : (i64, i64) -> i64
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

