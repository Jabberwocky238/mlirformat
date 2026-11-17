"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32)>, linkage = #llvm.linkage<external>, sym_name = "omp_atomic_update_multiple_step_update", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":3:8), %arg1: i32 loc("<stdin>":3:26)):
    "omp.atomic.update"(%arg0) ({
    ^bb0(%arg2: i32 loc("<stdin>":5:10)):
      %0 = "llvm.mul"(%arg2, %arg1) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32 loc("<stdin>":6:12)
      %1 = "llvm.sdiv"(%0, %arg1) : (i32, i32) -> i32 loc("<stdin>":7:12)
      %2 = "llvm.add"(%arg2, %1) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32 loc("<stdin>":8:12)
      "omp.yield"(%2) : (i32) -> () loc("<stdin>":9:7)
    }) : (!llvm.ptr) -> () loc("<stdin>":4:5)
    "llvm.return"() : () -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
