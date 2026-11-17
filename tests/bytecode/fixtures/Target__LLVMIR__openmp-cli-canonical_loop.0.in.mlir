"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32)>, linkage = #llvm.linkage<external>, sym_name = "anon_loop", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg8: !llvm.ptr loc("<stdin>":3:8), %arg9: i32 loc("<stdin>":3:26)):
    "omp.canonical_loop"(%arg9) ({
    ^bb0(%arg10: i32 loc("<stdin>":5:10)):
      %5 = "llvm.mlir.constant"() <{value = 4.200000e+01 : f32}> : () -> f32 loc("<stdin>":6:12)
      "llvm.store"(%5, %arg8) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> () loc("<stdin>":7:7)
      "omp.terminator"() : () -> () loc("<stdin>":8:7)
    }) : (i32) -> () loc("<stdin>":4:5)
    "llvm.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32)>, linkage = #llvm.linkage<external>, sym_name = "trivial_loop", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg5: !llvm.ptr loc("<stdin>":13:8), %arg6: i32 loc("<stdin>":13:26)):
    %3 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":14:10)
    "omp.canonical_loop"(%arg6, %3) ({
    ^bb0(%arg7: i32 loc("<stdin>":16:10)):
      %4 = "llvm.mlir.constant"() <{value = 4.200000e+01 : f32}> : () -> f32 loc("<stdin>":17:12)
      "llvm.store"(%4, %arg5) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> () loc("<stdin>":18:7)
      "omp.terminator"() : () -> () loc("<stdin>":19:7)
    }) : (i32, !omp.cli) -> () loc("<stdin>":15:5)
    "llvm.return"() : () -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":12:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "nested_loop", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":24:8), %arg1: i32 loc("<stdin>":24:26), %arg2: i32 loc("<stdin>":24:38)):
    %0 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":25:10)
    %1 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":26:10)
    "omp.canonical_loop"(%arg1, %0) ({
    ^bb0(%arg3: i32 loc("<stdin>":28:10)):
      "omp.canonical_loop"(%arg2, %1) ({
      ^bb0(%arg4: i32 loc("<stdin>":30:12)):
        %2 = "llvm.mlir.constant"() <{value = 4.200000e+01 : f32}> : () -> f32 loc("<stdin>":31:14)
        "llvm.store"(%2, %arg0) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> () loc("<stdin>":32:9)
        "omp.terminator"() : () -> () loc("<stdin>":33:9)
      }) : (i32, !omp.cli) -> () loc("<stdin>":29:7)
      "omp.terminator"() : () -> () loc("<stdin>":35:7)
    }) : (i32, !omp.cli) -> () loc("<stdin>":27:5)
    "llvm.return"() : () -> () loc("<stdin>":37:5)
  }) : () -> () loc("<stdin>":23:3)
}) : () -> () loc("<stdin>":1:1)
