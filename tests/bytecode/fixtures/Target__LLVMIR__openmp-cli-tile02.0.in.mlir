"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32, i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "tile_2d_loop", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":3:8), %arg1: i32 loc("<stdin>":3:26), %arg2: i32 loc("<stdin>":3:38), %arg3: i32 loc("<stdin>":3:50), %arg4: i32 loc("<stdin>":3:62)):
    %0 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":4:10)
    %1 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":5:10)
    "omp.canonical_loop"(%arg1, %0) ({
    ^bb0(%arg5: i32 loc("<stdin>":7:10)):
      "omp.canonical_loop"(%arg2, %1) ({
      ^bb0(%arg6: i32 loc("<stdin>":9:12)):
        %2 = "llvm.add"(%arg5, %arg6) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32 loc("<stdin>":10:14)
        %3 = "llvm.getelementptr"(%arg0, %2) <{elem_type = f32, noWrapFlags = 3 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i32) -> !llvm.ptr loc("<stdin>":11:14)
        %4 = "llvm.mlir.constant"() <{value = 4.200000e+01 : f32}> : () -> f32 loc("<stdin>":12:14)
        "llvm.store"(%4, %3) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> () loc("<stdin>":13:9)
        "omp.terminator"() : () -> () loc("<stdin>":14:9)
      }) : (i32, !omp.cli) -> () loc("<stdin>":8:7)
      "omp.terminator"() : () -> () loc("<stdin>":16:7)
    }) : (i32, !omp.cli) -> () loc("<stdin>":6:5)
    "omp.tile"(%0, %1, %arg3, %arg4) <{operandSegmentSizes = array<i32: 0, 2, 2>}> : (!omp.cli, !omp.cli, i32, i32) -> () loc("<stdin>":18:5)
    "llvm.return"() : () -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
