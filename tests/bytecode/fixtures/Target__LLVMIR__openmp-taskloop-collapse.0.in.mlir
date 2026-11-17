"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFtestEi_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "_QFtestEa_firstprivate_i32", type = i32}> ({
  }, {
  ^bb0(%arg4: !llvm.ptr loc("<stdin>":8:8), %arg5: !llvm.ptr loc("<stdin>":8:26)):
    %11 = "llvm.load"(%arg4) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":9:11)
    "llvm.store"(%11, %arg5) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":10:5)
    "omp.yield"(%arg5) : (!llvm.ptr) -> () loc("<stdin>":11:5)
  }, {
  }) : () -> () loc("<stdin>":6:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QPtest", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":15:10)
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr loc("<stdin>":16:10)
    %2 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "j"} : (i64) -> !llvm.ptr loc("<stdin>":17:10)
    %3 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "a"} : (i64) -> !llvm.ptr loc("<stdin>":18:10)
    %4 = "llvm.mlir.constant"() <{value = 20 : i32}> : () -> i32 loc("<stdin>":19:10)
    "llvm.store"(%4, %3) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":20:5)
    %5 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":21:10)
    %6 = "llvm.mlir.constant"() <{value = 5 : i32}> : () -> i32 loc("<stdin>":22:10)
    %7 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32 loc("<stdin>":23:10)
    "omp.taskloop.context"(%3, %1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 2, 0>, private_syms = [@_QFtestEa_firstprivate_i32, @_QFtestEi_private_i32]}> ({
    ^bb0(%arg0: !llvm.ptr loc("<stdin>":25:10), %arg1: !llvm.ptr loc("<stdin>":25:28)):
      "omp.taskloop.wrapper"() ({
        "omp.loop_nest"(%5, %5, %7, %6, %5, %5) <{collapse_num_loops = 2 : i64, loop_inclusive}> ({
        ^bb0(%arg2: i32 loc("<stdin>":28:14), %arg3: i32 loc("<stdin>":28:26)):
          "llvm.store"(%arg2, %arg1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":29:11)
          %8 = "llvm.load"(%arg0) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":30:16)
          %9 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":31:16)
          %10 = "llvm.add"(%8, %9) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32 loc("<stdin>":32:17)
          "llvm.store"(%10, %arg0) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":33:11)
          "omp.yield"() : () -> () loc("<stdin>":34:11)
        }) : (i32, i32, i32, i32, i32, i32) -> () loc("<stdin>":27:9)
      }) : () -> () loc("<stdin>":26:7)
      "omp.terminator"() : () -> () loc("<stdin>":37:7)
    }) {omp.combined} : (!llvm.ptr, !llvm.ptr) -> () loc("<stdin>":24:5)
    "llvm.return"() : () -> () loc("<stdin>":39:5)
  }) : () -> () loc("<stdin>":14:3)
}) : () -> () loc("<stdin>":1:1)
