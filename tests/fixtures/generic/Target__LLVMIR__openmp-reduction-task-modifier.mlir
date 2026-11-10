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
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "parallel_task_reduction", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    "omp.parallel"(%arg0) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1>, reduction_byref = array<i1: false>, reduction_mod = #omp<reduction_modifier(task)>, reduction_syms = [@add_i32]}> ({
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
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "wsloop_task_reduction", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32
    %2 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    "omp.wsloop"(%arg0) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0>, reduction_byref = array<i1: false>, reduction_mod = #omp<reduction_modifier(task)>, reduction_syms = [@add_i32]}> ({
    ^bb0(%arg1: !llvm.ptr):
      "omp.loop_nest"(%0, %1, %2) <{loop_inclusive}> ({
      ^bb0(%arg2: i32):
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_i32", type = i32}> ({
  }, {
  ^bb0(%arg5: i32):
    %1 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    "omp.yield"(%1) : (i32) -> ()
  }, {
  ^bb0(%arg3: i32, %arg4: i32):
    %0 = "llvm.add"(%arg3, %arg4) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    "omp.yield"(%0) : (i32) -> ()
  }, {
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "sections_task_reduction", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    "omp.sections"(%arg0) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>, reduction_byref = array<i1: false>, reduction_mod = #omp<reduction_modifier(task)>, reduction_syms = [@add_i32]}> ({
    ^bb0(%arg1: !llvm.ptr):
      "omp.section"() ({
      ^bb0(%arg2: !llvm.ptr):
        "omp.terminator"() : () -> ()
      }) : () -> ()
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
    %1 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    "omp.yield"(%1) : (i32) -> ()
  }, {
  ^bb0(%arg4: i32, %arg5: i32):
    %0 = "llvm.add"(%arg4, %arg5) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    "omp.yield"(%0) : (i32) -> ()
  }, {
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "parallel_two_task_reductions", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    "omp.parallel"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 2>, reduction_byref = array<i1: false, false>, reduction_mod = #omp<reduction_modifier(task)>, reduction_syms = [@add_i32, @add_i32]}> ({
    ^bb0(%arg2: !llvm.ptr, %arg3: !llvm.ptr):
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
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
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "empty_sections_task_reduction", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    "omp.sections"(%arg0) <{operandSegmentSizes = array<i32: 0, 0, 0, 1>, reduction_byref = array<i1: false>, reduction_mod = #omp<reduction_modifier(task)>, reduction_syms = [@add_i32]}> ({
    ^bb0(%arg1: !llvm.ptr):
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "parallel_task_mod_no_reductions", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>, reduction_mod = #omp<reduction_modifier(task)>}> ({
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "wsloop_task_mod_no_reductions", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32
    %2 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, reduction_mod = #omp<reduction_modifier(task)>}> ({
      "omp.loop_nest"(%0, %1, %2) <{loop_inclusive}> ({
      ^bb0(%arg0: i32):
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "sections_task_mod_no_reductions", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "omp.sections"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>, reduction_mod = #omp<reduction_modifier(task)>}> ({
      "omp.section"() ({
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

