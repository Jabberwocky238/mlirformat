"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32)>, linkage = #llvm.linkage<external>, sym_name = "unroll_partial_trivial_loop", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: i32):
    %0 = "omp.new_cli"() : () -> !omp.cli
    "omp.canonical_loop"(%arg1, %0) ({
    ^bb0(%arg2: i32):
      %1 = "llvm.mlir.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
      "llvm.store"(%1, %arg0) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    "omp.unroll_partial"(%0) <{unroll_factor = 4 : i64}> : (!omp.cli) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

