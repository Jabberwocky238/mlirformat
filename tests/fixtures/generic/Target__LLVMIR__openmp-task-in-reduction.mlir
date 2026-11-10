"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_i32", type = i32}> ({
  }, {
  ^bb0(%arg4: i32):
    %4 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    "omp.yield"(%4) : (i32) -> ()
  }, {
  ^bb0(%arg2: i32, %arg3: i32):
    %3 = "llvm.add"(%arg2, %arg3) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    "omp.yield"(%3) : (i32) -> ()
  }, {
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "task_in_reduction_single", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    "omp.task"(%arg0) <{in_reduction_byref = array<i1: false>, in_reduction_syms = [@add_i32], operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
    ^bb0(%arg1: !llvm.ptr):
      %0 = "llvm.load"(%arg1) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
      %1 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
      %2 = "llvm.add"(%0, %1) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      "llvm.store"(%2, %arg1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_i32", type = i32}> ({
  }, {
  ^bb0(%arg6: i32):
    %7 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    "omp.yield"(%7) : (i32) -> ()
  }, {
  ^bb0(%arg4: i32, %arg5: i32):
    %6 = "llvm.add"(%arg4, %arg5) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    "omp.yield"(%6) : (i32) -> ()
  }, {
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "task_in_reduction_multi", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    "omp.task"(%arg0, %arg1) <{in_reduction_byref = array<i1: false, false>, in_reduction_syms = [@add_i32, @add_i32], operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0>}> ({
    ^bb0(%arg2: !llvm.ptr, %arg3: !llvm.ptr):
      %0 = "llvm.load"(%arg2) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
      %1 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
      %2 = "llvm.add"(%0, %1) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      "llvm.store"(%2, %arg2) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      %3 = "llvm.load"(%arg3) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
      %4 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32
      %5 = "llvm.add"(%3, %4) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      "llvm.store"(%5, %arg3) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "task_plain", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    "omp.task"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
      "llvm.store"(%0, %arg0) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_i32", type = i32}> ({
  }, {
  ^bb0(%arg5: i32):
    %4 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    "omp.yield"(%4) : (i32) -> ()
  }, {
  ^bb0(%arg3: i32, %arg4: i32):
    %3 = "llvm.add"(%arg3, %arg4) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    "omp.yield"(%3) : (i32) -> ()
  }, {
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "task_in_reduction_nested", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    "omp.taskgroup"(%arg0) <{operandSegmentSizes = array<i32: 0, 0, 1>, task_reduction_byref = array<i1: false>, task_reduction_syms = [@add_i32]}> ({
    ^bb0(%arg1: !llvm.ptr):
      "omp.task"(%arg0) <{in_reduction_byref = array<i1: false>, in_reduction_syms = [@add_i32], operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
      ^bb0(%arg2: !llvm.ptr):
        %0 = "llvm.load"(%arg2) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
        %1 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
        %2 = "llvm.add"(%0, %1) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        "llvm.store"(%2, %arg2) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
        "omp.terminator"() : () -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_i32_as1", type = i32}> ({
  }, {
  ^bb0(%arg4: i32):
    %4 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    "omp.yield"(%4) : (i32) -> ()
  }, {
  ^bb0(%arg2: i32, %arg3: i32):
    %3 = "llvm.add"(%arg2, %arg3) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    "omp.yield"(%3) : (i32) -> ()
  }, {
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>)>, linkage = #llvm.linkage<external>, sym_name = "task_in_reduction_as1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr<1>):
    "omp.task"(%arg0) <{in_reduction_byref = array<i1: false>, in_reduction_syms = [@add_i32_as1], operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
    ^bb0(%arg1: !llvm.ptr<1>):
      %0 = "llvm.load"(%arg1) <{ordering = 0 : i64}> : (!llvm.ptr<1>) -> i32
      %1 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
      %2 = "llvm.add"(%0, %1) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      "llvm.store"(%2, %arg1) <{ordering = 0 : i64}> : (i32, !llvm.ptr<1>) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr<1>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

