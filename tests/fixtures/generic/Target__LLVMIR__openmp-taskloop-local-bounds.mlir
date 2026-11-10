"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QPtest_taskloop_local_bounds_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QPtest_taskloop_local_constants", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %7 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %8 = "llvm.alloca"(%7) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr
    "omp.taskloop.context"(%8) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 1, 0>, private_syms = [@_QPtest_taskloop_local_bounds_private_i32]}> ({
    ^bb0(%arg2: !llvm.ptr):
      %9 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
      %10 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32
      %11 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
      "omp.taskloop.wrapper"() ({
        "omp.loop_nest"(%9, %10, %11) <{loop_inclusive}> ({
        ^bb0(%arg3: i32):
          "llvm.store"(%arg3, %arg2) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
          "omp.yield"() : () -> ()
        }) : (i32, i32, i32) -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QPtest_taskloop_local_derived_bound", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr
    "omp.taskloop.context"(%1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 1, 0>, private_syms = [@_QPtest_taskloop_local_bounds_private_i32]}> ({
    ^bb0(%arg0: !llvm.ptr):
      %2 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
      %3 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32
      %4 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32
      %5 = "llvm.add"(%3, %4) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      %6 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
      "omp.taskloop.wrapper"() ({
        "omp.loop_nest"(%2, %5, %6) <{loop_inclusive}> ({
        ^bb0(%arg1: i32):
          "llvm.store"(%arg1, %arg0) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
          "omp.yield"() : () -> ()
        }) : (i32, i32, i32) -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

