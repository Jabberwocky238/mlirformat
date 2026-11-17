"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFtestEi_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFtestEt2_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> () loc("<stdin>":6:3)
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFtestEt1_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> () loc("<stdin>":10:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QPtest", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":15:10)
    %1 = "llvm.mlir.constant"() <{value = 20 : i32}> : () -> i32 loc("<stdin>":16:10)
    %2 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":17:10)
    %3 = "llvm.alloca"(%2) <{elem_type = i32}> {bindc_name = "t2"} : (i64) -> !llvm.ptr loc("<stdin>":18:10)
    %4 = "llvm.alloca"(%2) <{elem_type = i32}> {bindc_name = "t1"} : (i64) -> !llvm.ptr loc("<stdin>":19:10)
    %5 = "llvm.alloca"(%2) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr loc("<stdin>":20:10)
    "omp.taskloop.context"(%4, %3, %5) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 3, 0>, private_syms = [@_QFtestEt1_private_i32, @_QFtestEt2_private_i32, @_QFtestEi_private_i32]}> ({
    ^bb0(%arg0: !llvm.ptr loc("<stdin>":22:10), %arg1: !llvm.ptr loc("<stdin>":22:28), %arg2: !llvm.ptr loc("<stdin>":22:46)):
      "omp.taskloop.wrapper"() ({
        "omp.loop_nest"(%0, %1, %0) <{loop_inclusive}> ({
        ^bb0(%arg3: i32 loc("<stdin>":25:14)):
          "llvm.store"(%arg3, %arg2) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":26:11)
          "omp.yield"() : () -> () loc("<stdin>":27:11)
        }) : (i32, i32, i32) -> () loc("<stdin>":24:9)
      }) : () -> () loc("<stdin>":23:7)
      "omp.terminator"() : () -> () loc("<stdin>":30:7)
    }) {omp.combined} : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> () loc("<stdin>":21:5)
    "llvm.return"() : () -> () loc("<stdin>":32:5)
  }) : () -> () loc("<stdin>":14:3)
}) : () -> () loc("<stdin>":1:1)
