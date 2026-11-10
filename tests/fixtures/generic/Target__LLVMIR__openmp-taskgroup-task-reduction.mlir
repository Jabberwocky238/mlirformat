"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_i32", type = i32}> ({
  }, {
  ^bb0(%arg4: i32):
    %1 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    "omp.yield"(%1) : (i32) -> ()
  }, {
  ^bb0(%arg2: i32, %arg3: i32):
    %0 = "llvm.add"(%arg2, %arg3) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    "omp.yield"(%0) : (i32) -> ()
  }, {
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "taskgroup_task_reduction_single", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    "omp.taskgroup"(%arg0) <{operandSegmentSizes = array<i32: 0, 0, 1>, task_reduction_byref = array<i1: false>, task_reduction_syms = [@add_i32]}> ({
    ^bb0(%arg1: !llvm.ptr):
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
    %1 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    "omp.yield"(%1) : (i32) -> ()
  }, {
  ^bb0(%arg2: i32, %arg3: i32):
    %0 = "llvm.add"(%arg2, %arg3) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    "omp.yield"(%0) : (i32) -> ()
  }, {
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>)>, linkage = #llvm.linkage<external>, sym_name = "taskgroup_task_reduction_single_as1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr<1>):
    "omp.taskgroup"(%arg0) <{operandSegmentSizes = array<i32: 0, 0, 1>, task_reduction_byref = array<i1: false>, task_reduction_syms = [@add_i32_as1]}> ({
    ^bb0(%arg1: !llvm.ptr<1>):
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr<1>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "keep_ptr", type = !llvm.ptr}> ({
  }, {
  ^bb0(%arg4: !llvm.ptr):
    "omp.yield"(%arg4) : (!llvm.ptr) -> ()
  }, {
  ^bb0(%arg2: !llvm.ptr, %arg3: !llvm.ptr):
    "omp.yield"(%arg2) : (!llvm.ptr) -> ()
  }, {
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "taskgroup_task_reduction_ptr", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    "omp.taskgroup"(%arg0) <{operandSegmentSizes = array<i32: 0, 0, 1>, task_reduction_byref = array<i1: false>, task_reduction_syms = [@keep_ptr]}> ({
    ^bb0(%arg1: !llvm.ptr):
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_i32", type = i32}> ({
  }, {
  ^bb0(%arg9: i32):
    %3 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    "omp.yield"(%3) : (i32) -> ()
  }, {
  ^bb0(%arg7: i32, %arg8: i32):
    %2 = "llvm.add"(%arg7, %arg8) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    "omp.yield"(%2) : (i32) -> ()
  }, {
  }, {
  }, {
  }) : () -> ()
  "omp.declare_reduction"() <{sym_name = "mul_i64", type = i64}> ({
  }, {
  ^bb0(%arg6: i64):
    %1 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    "omp.yield"(%1) : (i64) -> ()
  }, {
  ^bb0(%arg4: i64, %arg5: i64):
    %0 = "llvm.mul"(%arg4, %arg5) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
    "omp.yield"(%0) : (i64) -> ()
  }, {
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "taskgroup_task_reduction_multi", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    "omp.taskgroup"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 0, 0, 2>, task_reduction_byref = array<i1: false, false>, task_reduction_syms = [@add_i32, @mul_i64]}> ({
    ^bb0(%arg2: !llvm.ptr, %arg3: !llvm.ptr):
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "taskgroup_plain", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "omp.taskgroup"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

