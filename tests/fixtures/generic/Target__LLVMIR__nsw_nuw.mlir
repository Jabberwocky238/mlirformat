"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "intflags_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64):
    %0 = "llvm.add"(%arg0, %arg1) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
    %1 = "llvm.sub"(%arg0, %arg1) <{overflowFlags = 2 : i32}> : (i64, i64) -> i64
    %2 = "llvm.mul"(%arg0, %arg1) <{overflowFlags = 3 : i32}> : (i64, i64) -> i64
    %3 = "llvm.shl"(%arg0, %arg1) <{overflowFlags = 3 : i32}> : (i64, i64) -> i64
    %4 = "llvm.trunc"(%arg1) <{overflowFlags = 2 : i32}> : (i64) -> i32
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

