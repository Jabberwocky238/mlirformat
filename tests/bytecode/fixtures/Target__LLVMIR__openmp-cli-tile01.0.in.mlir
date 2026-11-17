"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "tile_trivial_loop", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":3:8), %arg1: i32 loc("<stdin>":3:26), %arg2: i32 loc("<stdin>":3:38)):
    %0 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":4:10)
    "omp.canonical_loop"(%arg1, %0) ({
    ^bb0(%arg3: i32 loc("<stdin>":6:10)):
      %1 = "llvm.getelementptr"(%arg0, %arg3) <{elem_type = f32, noWrapFlags = 3 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i32) -> !llvm.ptr loc("<stdin>":7:12)
      %2 = "llvm.mlir.constant"() <{value = 4.200000e+01 : f32}> : () -> f32 loc("<stdin>":8:12)
      "llvm.store"(%2, %1) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> () loc("<stdin>":9:7)
      "omp.terminator"() : () -> () loc("<stdin>":10:7)
    }) : (i32, !omp.cli) -> () loc("<stdin>":5:5)
    "omp.tile"(%0, %arg2) <{operandSegmentSizes = array<i32: 0, 1, 1>}> : (!omp.cli, i32) -> () loc("<stdin>":12:5)
    "llvm.return"() : () -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
