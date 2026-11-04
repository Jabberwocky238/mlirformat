"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32, i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "tile_2d_loop", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32):
    %0 = "omp.new_cli"() : () -> !omp.cli
    %1 = "omp.new_cli"() : () -> !omp.cli
    "omp.canonical_loop"(%arg1, %0) ({
    ^bb0(%arg5: i32):
      "omp.canonical_loop"(%arg2, %1) ({
      ^bb0(%arg6: i32):
        %2 = "llvm.add"(%arg5, %arg6) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        %3 = "llvm.getelementptr"(%arg0, %2) <{elem_type = f32, noWrapFlags = 3 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i32) -> !llvm.ptr
        %4 = "llvm.mlir.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
        "llvm.store"(%4, %3) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
        "omp.terminator"() : () -> ()
      }) : (i32, !omp.cli) -> ()
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    "omp.tile"(%0, %1, %arg3, %arg4) <{operandSegmentSizes = array<i32: 0, 2, 2>}> : (!omp.cli, !omp.cli, i32, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

