"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "privatizer", type = i32}> ({
  }, {
  }, {
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "firstprivatizer", type = i32}> ({
  }, {
  ^bb0(%arg2: !llvm.ptr, %arg3: !llvm.ptr):
    %5 = "llvm.load"(%arg2) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    "llvm.store"(%5, %arg3) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    "omp.yield"(%arg3) : (!llvm.ptr) -> ()
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "task_privatization_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %2 = "llvm.alloca"(%1) <{elem_type = i32}> : (i32) -> !llvm.ptr
    %3 = "llvm.alloca"(%1) <{elem_type = i32}> : (i32) -> !llvm.ptr
    "llvm.store"(%0, %2) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    "llvm.store"(%1, %3) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    "omp.task"(%2, %3) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0>, private_syms = [@privatizer, @firstprivatizer]}> ({
    ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
      %4 = "llvm.load"(%arg1) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
      "llvm.store"(%4, %arg0) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

