"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_stand_alone_directives", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "omp.barrier"() : () -> () loc("<stdin>":3:5)
    "omp.taskwait"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> () loc("<stdin>":4:5)
    "omp.taskyield"() : () -> () loc("<stdin>":5:5)
    "llvm.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "test_flush_construct", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: !llvm.ptr loc("<stdin>":9:8)):
    "omp.flush"() : () -> () loc("<stdin>":10:5)
    "omp.flush"(%arg2) : (!llvm.ptr) -> () loc("<stdin>":11:5)
    "omp.flush"(%arg2, %arg2) : (!llvm.ptr, !llvm.ptr) -> () loc("<stdin>":12:5)
    %8 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":13:10)
    %9 = "llvm.alloca"(%8) <{elem_type = i32}> {in_type = i32, name = "a"} : (i64) -> !llvm.ptr loc("<stdin>":14:10)
    "omp.flush"() : () -> () loc("<stdin>":15:5)
    %10 = "llvm.load"(%9) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":16:11)
    "llvm.return"() : () -> () loc("<stdin>":17:5)
  }) : () -> () loc("<stdin>":8:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_omp_parallel_1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.barrier"() : () -> () loc("<stdin>":21:7)
      "omp.terminator"() : () -> () loc("<stdin>":22:7)
    }) : () -> () loc("<stdin>":20:5)
    "llvm.return"() : () -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":19:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64)>, linkage = #llvm.linkage<external>, sym_name = "body", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":26:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_omp_parallel_2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      %5 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64 loc("<stdin>":30:12)
      %6 = "llvm.mlir.constant"() <{value = 42 : index}> : () -> i64 loc("<stdin>":31:12)
      "llvm.call"(%5) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @body, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i64) -> () loc("<stdin>":32:7)
      "llvm.call"(%6) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @body, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i64) -> () loc("<stdin>":33:7)
      "llvm.br"()[^bb1] : () -> () loc("<stdin>":34:7)
    ^bb1:  // pred: ^bb0
      %7 = "llvm.add"(%5, %6) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64 loc("<stdin>":36:12)
      "llvm.call"(%7) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @body, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i64) -> () loc("<stdin>":37:7)
      "omp.terminator"() : () -> () loc("<stdin>":38:7)
    }) : () -> () loc("<stdin>":29:5)
    "llvm.return"() : () -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":28:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32)>, linkage = #llvm.linkage<external>, sym_name = "test_omp_parallel_num_threads_1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg1: i32 loc("<stdin>":43:8)):
    "omp.parallel"(%arg1) <{operandSegmentSizes = array<i32: 0, 0, 0, 1, 0, 0>}> ({
      "omp.barrier"() : () -> () loc("<stdin>":45:7)
      "omp.terminator"() : () -> () loc("<stdin>":46:7)
    }) : (i32) -> () loc("<stdin>":44:5)
    "llvm.return"() : () -> () loc("<stdin>":48:5)
  }) : () -> () loc("<stdin>":42:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_omp_parallel_num_threads_2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %4 = "llvm.mlir.constant"() <{value = 4 : index}> : () -> i32 loc("<stdin>":51:10)
    "omp.parallel"(%4) <{operandSegmentSizes = array<i32: 0, 0, 0, 1, 0, 0>}> ({
      "omp.barrier"() : () -> () loc("<stdin>":53:7)
      "omp.terminator"() : () -> () loc("<stdin>":54:7)
    }) : (i32) -> () loc("<stdin>":52:5)
    "llvm.return"() : () -> () loc("<stdin>":56:5)
  }) : () -> () loc("<stdin>":50:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_omp_parallel_num_threads_3", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %2 = "llvm.mlir.constant"() <{value = 4 : index}> : () -> i32 loc("<stdin>":59:10)
    "omp.parallel"(%2) <{operandSegmentSizes = array<i32: 0, 0, 0, 1, 0, 0>}> ({
      "omp.barrier"() : () -> () loc("<stdin>":61:7)
      "omp.terminator"() : () -> () loc("<stdin>":62:7)
    }) : (i32) -> () loc("<stdin>":60:5)
    %3 = "llvm.mlir.constant"() <{value = 8 : index}> : () -> i32 loc("<stdin>":64:10)
    "omp.parallel"(%3) <{operandSegmentSizes = array<i32: 0, 0, 0, 1, 0, 0>}> ({
      "omp.barrier"() : () -> () loc("<stdin>":66:7)
      "omp.terminator"() : () -> () loc("<stdin>":67:7)
    }) : (i32) -> () loc("<stdin>":65:5)
    "llvm.return"() : () -> () loc("<stdin>":69:5)
  }) : () -> () loc("<stdin>":58:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32)>, linkage = #llvm.linkage<external>, sym_name = "test_omp_parallel_if_1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32 loc("<stdin>":72:8)):
    %0 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i32 loc("<stdin>":73:10)
    %1 = "llvm.icmp"(%arg0, %0) <{predicate = 2 : i64}> : (i32, i32) -> i1 loc("<stdin>":74:10)
    "omp.parallel"(%1) <{operandSegmentSizes = array<i32: 0, 0, 1, 0, 0, 0>}> ({
      "omp.barrier"() : () -> () loc("<stdin>":76:7)
      "omp.terminator"() : () -> () loc("<stdin>":77:7)
    }) : (i1) -> () loc("<stdin>":75:5)
    "llvm.return"() : () -> () loc("<stdin>":79:5)
  }) : () -> () loc("<stdin>":71:3)
}) : () -> () loc("<stdin>":1:1)
