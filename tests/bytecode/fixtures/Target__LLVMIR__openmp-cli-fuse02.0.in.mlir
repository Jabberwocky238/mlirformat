"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "fuse_looprange_loops", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":3:8), %arg1: i32 loc("<stdin>":3:26), %arg2: i32 loc("<stdin>":3:38), %arg3: i32 loc("<stdin>":3:50)):
    %0 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":4:10)
    "omp.canonical_loop"(%arg1, %0) ({
    ^bb0(%arg6: i32 loc("<stdin>":6:10)):
      %7 = "llvm.getelementptr"(%arg0, %arg6) <{elem_type = f32, noWrapFlags = 3 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i32) -> !llvm.ptr loc("<stdin>":7:12)
      %8 = "llvm.mlir.constant"() <{value = 4.200000e+01 : f32}> : () -> f32 loc("<stdin>":8:12)
      "llvm.store"(%8, %7) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> () loc("<stdin>":9:7)
      "omp.terminator"() : () -> () loc("<stdin>":10:7)
    }) : (i32, !omp.cli) -> () loc("<stdin>":5:5)
    %1 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":12:10)
    "omp.canonical_loop"(%arg2, %1) ({
    ^bb0(%arg5: i32 loc("<stdin>":14:10)):
      %5 = "llvm.getelementptr"(%arg0, %arg5) <{elem_type = f32, noWrapFlags = 3 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i32) -> !llvm.ptr loc("<stdin>":15:12)
      %6 = "llvm.mlir.constant"() <{value = 2.100000e+01 : f32}> : () -> f32 loc("<stdin>":16:12)
      "llvm.store"(%6, %5) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> () loc("<stdin>":17:7)
      "omp.terminator"() : () -> () loc("<stdin>":18:7)
    }) : (i32, !omp.cli) -> () loc("<stdin>":13:5)
    %2 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":20:10)
    "omp.canonical_loop"(%arg3, %2) ({
    ^bb0(%arg4: i32 loc("<stdin>":22:10)):
      %3 = "llvm.getelementptr"(%arg0, %arg4) <{elem_type = f32, noWrapFlags = 3 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i32) -> !llvm.ptr loc("<stdin>":23:12)
      %4 = "llvm.mlir.constant"() <{value = 6.300000e+01 : f32}> : () -> f32 loc("<stdin>":24:12)
      "llvm.store"(%4, %3) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> () loc("<stdin>":25:7)
      "omp.terminator"() : () -> () loc("<stdin>":26:7)
    }) : (i32, !omp.cli) -> () loc("<stdin>":21:5)
    "omp.fuse"(%0, %1, %2) <{count = 2 : i64, first = 1 : i64, operandSegmentSizes = array<i32: 0, 3>}> : (!omp.cli, !omp.cli, !omp.cli) -> () loc("<stdin>":28:5)
    "llvm.return"() : () -> () loc("<stdin>":29:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
