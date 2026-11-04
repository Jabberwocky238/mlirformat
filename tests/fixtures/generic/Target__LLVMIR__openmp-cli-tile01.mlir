"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "tile_trivial_loop", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: i32, %arg2: i32):
    %0 = "omp.new_cli"() : () -> !omp.cli
    "omp.canonical_loop"(%arg1, %0) ({
    ^bb0(%arg3: i32):
      %1 = "llvm.getelementptr"(%arg0, %arg3) <{elem_type = f32, noWrapFlags = 3 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i32) -> !llvm.ptr
      %2 = "llvm.mlir.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
      "llvm.store"(%2, %1) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (i32, !omp.cli) -> ()
    "omp.tile"(%0, %arg2) <{operandSegmentSizes = array<i32: 0, 1, 1>}> : (!omp.cli, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

