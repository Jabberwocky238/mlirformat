"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFtestEi_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QPtest", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":7:10)
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr loc("<stdin>":8:10)
    %2 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "lb"} : (i64) -> !llvm.ptr loc("<stdin>":9:10)
    %3 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "ub"} : (i64) -> !llvm.ptr loc("<stdin>":10:10)
    %4 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "step"} : (i64) -> !llvm.ptr loc("<stdin>":11:10)
    %5 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":12:10)
    %6 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32 loc("<stdin>":13:10)
    %7 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32 loc("<stdin>":14:10)
    "llvm.store"(%5, %2) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":15:5)
    "llvm.store"(%6, %3) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":16:5)
    "llvm.store"(%7, %4) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":17:5)
    %8 = "llvm.load"(%2) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":18:10)
    %9 = "llvm.load"(%3) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":19:10)
    %10 = "llvm.load"(%4) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":20:11)
    "omp.taskloop.context"(%1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 1, 0>, private_syms = [@_QFtestEi_private_i32]}> ({
    ^bb0(%arg0: !llvm.ptr loc("<stdin>":22:10)):
      "omp.taskloop.wrapper"() ({
        "omp.loop_nest"(%8, %9, %10) <{loop_inclusive}> ({
        ^bb0(%arg1: i32 loc("<stdin>":25:14)):
          "llvm.store"(%arg1, %arg0) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":26:11)
          "omp.yield"() : () -> () loc("<stdin>":27:11)
        }) : (i32, i32, i32) -> () loc("<stdin>":24:9)
      }) : () -> () loc("<stdin>":23:7)
      "omp.terminator"() : () -> () loc("<stdin>":30:7)
    }) {omp.combined} : (!llvm.ptr) -> () loc("<stdin>":21:5)
    "llvm.return"() : () -> () loc("<stdin>":32:5)
  }) : () -> () loc("<stdin>":6:3)
}) : () -> () loc("<stdin>":1:1)
