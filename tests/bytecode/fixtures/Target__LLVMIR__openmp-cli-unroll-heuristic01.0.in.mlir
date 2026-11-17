"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32)>, linkage = #llvm.linkage<external>, sym_name = "unroll_heuristic_trivial_loop", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":3:8), %arg1: i32 loc("<stdin>":3:26)):
    %0 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":4:10)
    "omp.canonical_loop"(%arg1, %0) ({
    ^bb0(%arg2: i32 loc("<stdin>":6:10)):
      %1 = "llvm.mlir.constant"() <{value = 4.200000e+01 : f32}> : () -> f32 loc("<stdin>":7:12)
      "llvm.store"(%1, %arg0) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> () loc("<stdin>":8:7)
      "omp.terminator"() : () -> () loc("<stdin>":9:7)
    }) : (i32, !omp.cli) -> () loc("<stdin>":5:5)
    "omp.unroll_heuristic"(%0) : (!omp.cli) -> () loc("<stdin>":11:5)
    "llvm.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
