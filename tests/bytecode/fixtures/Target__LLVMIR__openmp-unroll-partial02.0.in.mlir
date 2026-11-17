"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "unroll_partial_nested_loop", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":3:8), %arg1: i32 loc("<stdin>":3:26), %arg2: i32 loc("<stdin>":3:38)):
    %0 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":4:10)
    %1 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":5:10)
    "omp.canonical_loop"(%arg1, %0) ({
    ^bb0(%arg3: i32 loc("<stdin>":7:10)):
      "omp.canonical_loop"(%arg2, %1) ({
      ^bb0(%arg4: i32 loc("<stdin>":9:12)):
        %2 = "llvm.mlir.constant"() <{value = 4.200000e+01 : f32}> : () -> f32 loc("<stdin>":10:14)
        "llvm.store"(%2, %arg0) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> () loc("<stdin>":11:9)
        "omp.terminator"() : () -> () loc("<stdin>":12:9)
      }) : (i32, !omp.cli) -> () loc("<stdin>":8:7)
      "omp.terminator"() : () -> () loc("<stdin>":14:7)
    }) : (i32, !omp.cli) -> () loc("<stdin>":6:5)
    "omp.unroll_partial"(%0) <{unroll_factor = 2 : i64}> : (!omp.cli) -> () loc("<stdin>":16:5)
    "omp.unroll_partial"(%1) <{unroll_factor = 4 : i64}> : (!omp.cli) -> () loc("<stdin>":17:5)
    "llvm.return"() : () -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
