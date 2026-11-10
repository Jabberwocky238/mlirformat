"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "fuse_looprange_loops", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: i32, %arg2: i32, %arg3: i32):
    %0 = "omp.new_cli"() : () -> !omp.cli
    "omp.canonical_loop"(%arg1, %0) ({
    ^bb0(%arg6: i32):
      %7 = "llvm.getelementptr"(%arg0, %arg6) <{elem_type = f32, noWrapFlags = 3 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i32) -> !llvm.ptr
      %8 = "llvm.mlir.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
      "llvm.store"(%8, %7) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    %1 = "omp.new_cli"() : () -> !omp.cli
    "omp.canonical_loop"(%arg2, %1) ({
    ^bb0(%arg5: i32):
      %5 = "llvm.getelementptr"(%arg0, %arg5) <{elem_type = f32, noWrapFlags = 3 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i32) -> !llvm.ptr
      %6 = "llvm.mlir.constant"() <{value = 2.100000e+01 : f32}> : () -> f32
      "llvm.store"(%6, %5) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    %2 = "omp.new_cli"() : () -> !omp.cli
    "omp.canonical_loop"(%arg3, %2) ({
    ^bb0(%arg4: i32):
      %3 = "llvm.getelementptr"(%arg0, %arg4) <{elem_type = f32, noWrapFlags = 3 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i32) -> !llvm.ptr
      %4 = "llvm.mlir.constant"() <{value = 6.300000e+01 : f32}> : () -> f32
      "llvm.store"(%4, %3) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    "omp.fuse"(%0, %1, %2) <{count = 2 : i64, first = 1 : i64, operandSegmentSizes = array<i32: 0, 3>}> : (!omp.cli, !omp.cli, !omp.cli) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

