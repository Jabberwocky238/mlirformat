"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "unroll_heuristic_nested_loop", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: i32, %arg2: i32):
    %0 = "omp.new_cli"() : () -> !omp.cli
    %1 = "omp.new_cli"() : () -> !omp.cli
    "omp.canonical_loop"(%arg1, %0) ({
    ^bb0(%arg3: i32):
      "omp.canonical_loop"(%arg2, %1) ({
      ^bb0(%arg4: i32):
        %2 = "llvm.mlir.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
        "llvm.store"(%2, %arg0) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
        "omp.terminator"() : () -> ()
      }) : (i32, !omp.cli) -> ()
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    "omp.unroll_heuristic"(%0) : (!omp.cli) -> ()
    "omp.unroll_heuristic"(%1) : (!omp.cli) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

