"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "privatizer", type = i32}> ({
  }, {
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "firstprivatizer", type = i32}> ({
  }, {
  ^bb0(%arg2: !llvm.ptr loc("<stdin>":8:8), %arg3: !llvm.ptr loc("<stdin>":8:26)):
    %5 = "llvm.load"(%arg2) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":9:10)
    "llvm.store"(%5, %arg3) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":10:5)
    "omp.yield"(%arg3) : (!llvm.ptr) -> () loc("<stdin>":11:5)
  }, {
  }) : () -> () loc("<stdin>":6:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "task_privatization_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":15:10)
    %1 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":16:10)
    %2 = "llvm.alloca"(%1) <{elem_type = i32}> : (i32) -> !llvm.ptr loc("<stdin>":17:10)
    %3 = "llvm.alloca"(%1) <{elem_type = i32}> : (i32) -> !llvm.ptr loc("<stdin>":18:10)
    "llvm.store"(%0, %2) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":19:5)
    "llvm.store"(%1, %3) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":20:5)
    "omp.task"(%2, %3) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0>, private_syms = [@privatizer, @firstprivatizer]}> ({
    ^bb0(%arg0: !llvm.ptr loc("<stdin>":22:10), %arg1: !llvm.ptr loc("<stdin>":22:28)):
      %4 = "llvm.load"(%arg1) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":23:12)
      "llvm.store"(%4, %arg0) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":24:7)
      "omp.terminator"() : () -> () loc("<stdin>":25:7)
    }) : (!llvm.ptr, !llvm.ptr) -> () loc("<stdin>":21:5)
    "llvm.return"() : () -> () loc("<stdin>":27:5)
  }) : () -> () loc("<stdin>":14:3)
}) : () -> () loc("<stdin>":1:1)
