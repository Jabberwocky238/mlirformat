"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32, i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "tile_composition", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":3:8), %arg1: i32 loc("<stdin>":3:26), %arg2: i32 loc("<stdin>":3:38), %arg3: i32 loc("<stdin>":3:50), %arg4: i32 loc("<stdin>":3:62)):
    %0 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":4:10)
    %1 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":5:10)
    %2 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":6:10)
    %3 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":7:10)
    %4 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":8:10)
    %5 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":9:10)
    %6 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":10:10)
    "omp.canonical_loop"(%arg1, %0) ({
    ^bb0(%arg5: i32 loc("<stdin>":12:10)):
      %7 = "llvm.getelementptr"(%arg0, %arg5) <{elem_type = f32, noWrapFlags = 3 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i32) -> !llvm.ptr loc("<stdin>":13:12)
      %8 = "llvm.mlir.constant"() <{value = 4.200000e+01 : f32}> : () -> f32 loc("<stdin>":14:12)
      "llvm.store"(%8, %7) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> () loc("<stdin>":15:7)
      "omp.terminator"() : () -> () loc("<stdin>":16:7)
    }) : (i32, !omp.cli) -> () loc("<stdin>":11:5)
    "omp.tile"(%1, %2, %0, %arg2) <{operandSegmentSizes = array<i32: 2, 1, 1>}> : (!omp.cli, !omp.cli, !omp.cli, i32) -> () loc("<stdin>":18:5)
    "omp.tile"(%4, %3, %1, %arg3) <{operandSegmentSizes = array<i32: 2, 1, 1>}> : (!omp.cli, !omp.cli, !omp.cli, i32) -> () loc("<stdin>":19:5)
    "omp.tile"(%5, %6, %2, %arg4) <{operandSegmentSizes = array<i32: 2, 1, 1>}> : (!omp.cli, !omp.cli, !omp.cli, i32) -> () loc("<stdin>":20:5)
    "llvm.return"() : () -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
