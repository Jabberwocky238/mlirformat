"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QPtest_taskloop_local_bounds_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QPtest_taskloop_local_constants", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %7 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":7:10)
    %8 = "llvm.alloca"(%7) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr loc("<stdin>":8:10)
    "omp.taskloop.context"(%8) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 1, 0>, private_syms = [@_QPtest_taskloop_local_bounds_private_i32]}> ({
    ^bb0(%arg2: !llvm.ptr loc("<stdin>":10:10)):
      %9 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":11:12)
      %10 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32 loc("<stdin>":12:13)
      %11 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":13:13)
      "omp.taskloop.wrapper"() ({
        "omp.loop_nest"(%9, %10, %11) <{loop_inclusive}> ({
        ^bb0(%arg3: i32 loc("<stdin>":16:14)):
          "llvm.store"(%arg3, %arg2) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":17:11)
          "omp.yield"() : () -> () loc("<stdin>":18:11)
        }) : (i32, i32, i32) -> () loc("<stdin>":15:9)
      }) : () -> () loc("<stdin>":14:7)
      "omp.terminator"() : () -> () loc("<stdin>":21:7)
    }) {omp.combined} : (!llvm.ptr) -> () loc("<stdin>":9:5)
    "llvm.return"() : () -> () loc("<stdin>":23:5)
  }) : () -> () loc("<stdin>":6:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QPtest_taskloop_local_derived_bound", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":26:10)
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr loc("<stdin>":27:10)
    "omp.taskloop.context"(%1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 1, 0>, private_syms = [@_QPtest_taskloop_local_bounds_private_i32]}> ({
    ^bb0(%arg0: !llvm.ptr loc("<stdin>":29:10)):
      %2 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":30:12)
      %3 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32 loc("<stdin>":31:12)
      %4 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32 loc("<stdin>":32:12)
      %5 = "llvm.add"(%3, %4) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32 loc("<stdin>":33:12)
      %6 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":34:12)
      "omp.taskloop.wrapper"() ({
        "omp.loop_nest"(%2, %5, %6) <{loop_inclusive}> ({
        ^bb0(%arg1: i32 loc("<stdin>":37:14)):
          "llvm.store"(%arg1, %arg0) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":38:11)
          "omp.yield"() : () -> () loc("<stdin>":39:11)
        }) : (i32, i32, i32) -> () loc("<stdin>":36:9)
      }) : () -> () loc("<stdin>":35:7)
      "omp.terminator"() : () -> () loc("<stdin>":42:7)
    }) {omp.combined} : (!llvm.ptr) -> () loc("<stdin>":28:5)
    "llvm.return"() : () -> () loc("<stdin>":44:5)
  }) : () -> () loc("<stdin>":25:3)
}) : () -> () loc("<stdin>":1:1)
