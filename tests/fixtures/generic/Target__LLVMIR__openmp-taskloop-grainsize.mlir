"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFtestEi_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "_QFtestEa_firstprivate_i32", type = i32}> ({
  }, {
  ^bb0(%arg3: !llvm.ptr, %arg4: !llvm.ptr):
    %11 = "llvm.load"(%arg3) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    "llvm.store"(%11, %arg4) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    "omp.yield"(%arg4) : (!llvm.ptr) -> ()
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QPtest", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr
    %2 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "a"} : (i64) -> !llvm.ptr
    %3 = "llvm.mlir.constant"() <{value = 20 : i32}> : () -> i32
    "llvm.store"(%3, %2) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    %4 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %5 = "llvm.mlir.constant"() <{value = 5 : i32}> : () -> i32
    %6 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %7 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32
    "omp.taskloop"(%7, %2, %1) <{operandSegmentSizes = array<i32: 0, 0, 0, 1, 0, 0, 0, 0, 2, 0>, private_syms = [@_QFtestEa_firstprivate_i32, @_QFtestEi_private_i32]}> ({
    ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
      "omp.loop_nest"(%4, %5, %6) <{loop_inclusive}> ({
      ^bb0(%arg2: i32):
        "llvm.store"(%arg2, %arg1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
        %8 = "llvm.load"(%arg0) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
        %9 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
        %10 = "llvm.add"(%8, %9) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        "llvm.store"(%10, %arg0) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : (i32, !llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

