"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32)>, linkage = #llvm.linkage<external>, sym_name = "anon_loop", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg8: !llvm.ptr, %arg9: i32):
    "omp.canonical_loop"(%arg9) ({
    ^bb0(%arg10: i32):
      %5 = "llvm.mlir.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
      "llvm.store"(%5, %arg8) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32)>, linkage = #llvm.linkage<external>, sym_name = "trivial_loop", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg5: !llvm.ptr, %arg6: i32):
    %3 = "omp.new_cli"() : () -> !omp.cli
    "omp.canonical_loop"(%arg6, %3) ({
    ^bb0(%arg7: i32):
      %4 = "llvm.mlir.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
      "llvm.store"(%4, %arg5) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "nested_loop", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
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
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

