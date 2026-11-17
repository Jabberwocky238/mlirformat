"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFtestEi_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "_QFtestEa_firstprivate_i32", type = i32}> ({
  }, {
  ^bb0(%arg3: !llvm.ptr loc("<stdin>":8:8), %arg4: !llvm.ptr loc("<stdin>":8:26)):
    %10 = "llvm.load"(%arg3) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":9:11)
    "llvm.store"(%10, %arg4) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":10:5)
    "omp.yield"(%arg4) : (!llvm.ptr) -> () loc("<stdin>":11:5)
  }, {
  }) : () -> () loc("<stdin>":6:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QPtest", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":15:10)
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr loc("<stdin>":16:10)
    %2 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "a"} : (i64) -> !llvm.ptr loc("<stdin>":17:10)
    %3 = "llvm.mlir.constant"() <{value = 20 : i32}> : () -> i32 loc("<stdin>":18:10)
    "llvm.store"(%3, %2) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":19:5)
    %4 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":20:10)
    %5 = "llvm.mlir.constant"() <{value = 5 : i32}> : () -> i32 loc("<stdin>":21:10)
    %6 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":22:10)
    "omp.taskloop.context"(%2, %1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 2, 0>, private_syms = [@_QFtestEa_firstprivate_i32, @_QFtestEi_private_i32]}> ({
    ^bb0(%arg0: !llvm.ptr loc("<stdin>":24:10), %arg1: !llvm.ptr loc("<stdin>":24:28)):
      "omp.taskloop.wrapper"() ({
        "omp.loop_nest"(%4, %5, %6) <{loop_inclusive}> ({
        ^bb0(%arg2: i32 loc("<stdin>":27:14)):
          "llvm.store"(%arg2, %arg1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":28:11)
          %7 = "llvm.load"(%arg0) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":29:16)
          %8 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":30:16)
          %9 = "llvm.add"(%7, %8) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32 loc("<stdin>":31:16)
          "llvm.store"(%9, %arg0) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":32:11)
          "omp.yield"() : () -> () loc("<stdin>":33:11)
        }) : (i32, i32, i32) -> () loc("<stdin>":26:9)
      }) : () -> () loc("<stdin>":25:7)
      "omp.terminator"() : () -> () loc("<stdin>":36:7)
    }) {omp.combined} : (!llvm.ptr, !llvm.ptr) -> () loc("<stdin>":23:5)
    "llvm.return"() : () -> () loc("<stdin>":38:5)
  }) : () -> () loc("<stdin>":14:3)
}) : () -> () loc("<stdin>":1:1)
