"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32, i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "tile_composition", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32):
    %0 = "omp.new_cli"() : () -> !omp.cli
    %1 = "omp.new_cli"() : () -> !omp.cli
    %2 = "omp.new_cli"() : () -> !omp.cli
    %3 = "omp.new_cli"() : () -> !omp.cli
    %4 = "omp.new_cli"() : () -> !omp.cli
    %5 = "omp.new_cli"() : () -> !omp.cli
    %6 = "omp.new_cli"() : () -> !omp.cli
    "omp.canonical_loop"(%arg1, %0) ({
    ^bb0(%arg5: i32):
      %7 = "llvm.getelementptr"(%arg0, %arg5) <{elem_type = f32, noWrapFlags = 3 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i32) -> !llvm.ptr
      %8 = "llvm.mlir.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
      "llvm.store"(%8, %7) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    "omp.tile"(%1, %2, %0, %arg2) <{operandSegmentSizes = array<i32: 2, 1, 1>}> : (!omp.cli, !omp.cli, !omp.cli, i32) -> ()
    "omp.tile"(%4, %3, %1, %arg3) <{operandSegmentSizes = array<i32: 2, 1, 1>}> : (!omp.cli, !omp.cli, !omp.cli, i32) -> ()
    "omp.tile"(%5, %6, %2, %arg4) <{operandSegmentSizes = array<i32: 2, 1, 1>}> : (!omp.cli, !omp.cli, !omp.cli, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

