"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_stand_alone_directives", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "omp.barrier"() : () -> ()
    "omp.taskwait"() : () -> ()
    "omp.taskyield"() : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "test_flush_construct", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: !llvm.ptr):
    "omp.flush"() : () -> ()
    "omp.flush"(%arg2) : (!llvm.ptr) -> ()
    "omp.flush"(%arg2, %arg2) : (!llvm.ptr, !llvm.ptr) -> ()
    %8 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %9 = "llvm.alloca"(%8) <{elem_type = i32}> {in_type = i32, name = "a"} : (i64) -> !llvm.ptr
    "omp.flush"() : () -> ()
    %10 = "llvm.load"(%9) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_omp_parallel_1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.barrier"() : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64)>, linkage = #llvm.linkage<external>, sym_name = "body", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_omp_parallel_2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      %5 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
      %6 = "llvm.mlir.constant"() <{value = 42 : index}> : () -> i64
      "llvm.call"(%5) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @body, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i64) -> ()
      "llvm.call"(%6) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @body, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i64) -> ()
      "llvm.br"()[^bb1] : () -> ()
    ^bb1:  // pred: ^bb0
      %7 = "llvm.add"(%5, %6) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
      "llvm.call"(%7) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @body, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i64) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32)>, linkage = #llvm.linkage<external>, sym_name = "test_omp_parallel_num_threads_1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg1: i32):
    "omp.parallel"(%arg1) <{operandSegmentSizes = array<i32: 0, 0, 0, 1, 0, 0>}> ({
      "omp.barrier"() : () -> ()
      "omp.terminator"() : () -> ()
    }) : (i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_omp_parallel_num_threads_2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %4 = "llvm.mlir.constant"() <{value = 4 : index}> : () -> i32
    "omp.parallel"(%4) <{operandSegmentSizes = array<i32: 0, 0, 0, 1, 0, 0>}> ({
      "omp.barrier"() : () -> ()
      "omp.terminator"() : () -> ()
    }) : (i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_omp_parallel_num_threads_3", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %2 = "llvm.mlir.constant"() <{value = 4 : index}> : () -> i32
    "omp.parallel"(%2) <{operandSegmentSizes = array<i32: 0, 0, 0, 1, 0, 0>}> ({
      "omp.barrier"() : () -> ()
      "omp.terminator"() : () -> ()
    }) : (i32) -> ()
    %3 = "llvm.mlir.constant"() <{value = 8 : index}> : () -> i32
    "omp.parallel"(%3) <{operandSegmentSizes = array<i32: 0, 0, 0, 1, 0, 0>}> ({
      "omp.barrier"() : () -> ()
      "omp.terminator"() : () -> ()
    }) : (i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32)>, linkage = #llvm.linkage<external>, sym_name = "test_omp_parallel_if_1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32):
    %0 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i32
    %1 = "llvm.icmp"(%arg0, %0) <{predicate = 2 : i64}> : (i32, i32) -> i1
    "omp.parallel"(%1) <{operandSegmentSizes = array<i32: 0, 0, 1, 0, 0, 0>}> ({
      "omp.barrier"() : () -> ()
      "omp.terminator"() : () -> ()
    }) : (i1) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_omp_parallel_attrs", target_cpu = "x86-64", target_features = #llvm.target_features<["+mmx", "+sse"]>, unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.barrier"() : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_omp_parallel_3", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>, proc_bind_kind = #omp<procbindkind master>}> ({
      "omp.barrier"() : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>, proc_bind_kind = #omp<procbindkind close>}> ({
      "omp.barrier"() : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>, proc_bind_kind = #omp<procbindkind spread>}> ({
      "omp.barrier"() : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_omp_parallel_4", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.barrier"() : () -> ()
      "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
        "omp.barrier"() : () -> ()
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.barrier"() : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_omp_parallel_5", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.barrier"() : () -> ()
      "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
        "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
          "omp.barrier"() : () -> ()
          "omp.terminator"() : () -> ()
        }) : () -> ()
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.barrier"() : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_omp_master", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.master"() ({
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
        "omp.master"() ({
          "omp.terminator"() : () -> ()
        }) : () -> ()
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32)>, linkage = #llvm.linkage<external>, sym_name = "test_omp_masked", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32):
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.masked"(%arg0) ({
        "omp.terminator"() : () -> ()
      }) : (i32) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, i32, ptr)>, linkage = #llvm.linkage<external>, sym_name = "wsloop_linear", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: !llvm.ptr):
    "omp.wsloop"(%arg3, %arg2) <{linear_var_types = [i32], operandSegmentSizes = array<i32: 0, 0, 1, 1, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg0, %arg1, %arg2) ({
      ^bb0(%arg4: i32):
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : (!llvm.ptr, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "wsloop_simple", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 42 : index}> : () -> i64
    %1 = "llvm.mlir.constant"() <{value = 10 : index}> : () -> i64
    %2 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
        "omp.loop_nest"(%1, %0, %2) ({
        ^bb0(%arg1: i64):
          %3 = "llvm.mlir.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
          %4 = "llvm.getelementptr"(%arg0, %arg1) <{elem_type = f32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
          "llvm.store"(%3, %4) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
          "omp.yield"() : () -> ()
        }) : (i64, i64, i64) -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "wsloop_inclusive_1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 42 : index}> : () -> i64
    %1 = "llvm.mlir.constant"() <{value = 10 : index}> : () -> i64
    %2 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%1, %0, %2) ({
      ^bb0(%arg1: i64):
        %3 = "llvm.mlir.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
        %4 = "llvm.getelementptr"(%arg0, %arg1) <{elem_type = f32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
        "llvm.store"(%3, %4) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
        "omp.yield"() : () -> ()
      }) : (i64, i64, i64) -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "wsloop_inclusive_2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 42 : index}> : () -> i64
    %1 = "llvm.mlir.constant"() <{value = 10 : index}> : () -> i64
    %2 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%1, %0, %2) <{loop_inclusive}> ({
      ^bb0(%arg1: i64):
        %3 = "llvm.mlir.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
        %4 = "llvm.getelementptr"(%arg0, %arg1) <{elem_type = f32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
        "llvm.store"(%3, %4) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
        "omp.yield"() : () -> ()
      }) : (i64, i64, i64) -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32)>, linkage = #llvm.linkage<external>, sym_name = "body", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "test_omp_wsloop_static_defchunk", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i32):
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, schedule_kind = #omp<schedulekind static>}> ({
      "omp.loop_nest"(%arg0, %arg1, %arg2) ({
      ^bb0(%arg3: i32):
        "llvm.call"(%arg3) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @body, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i32) -> ()
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32)>, linkage = #llvm.linkage<external>, sym_name = "body", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "test_omp_wsloop_static_1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i32):
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    "omp.wsloop"(%0) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 1>, schedule_kind = #omp<schedulekind static>}> ({
      "omp.loop_nest"(%arg0, %arg1, %arg2) ({
      ^bb0(%arg3: i32):
        "llvm.call"(%arg3) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @body, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i32) -> ()
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : (i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32)>, linkage = #llvm.linkage<external>, sym_name = "body", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "test_omp_wsloop_static_2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i32):
    %0 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32
    "omp.wsloop"(%0) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 1>, schedule_kind = #omp<schedulekind static>}> ({
      "omp.loop_nest"(%arg0, %arg1, %arg2) ({
      ^bb0(%arg3: i32):
        "llvm.call"(%arg3) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @body, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i32) -> ()
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : (i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64)>, linkage = #llvm.linkage<external>, sym_name = "body", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "test_omp_wsloop_dynamic", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, schedule_kind = #omp<schedulekind dynamic>}> ({
      "omp.loop_nest"(%arg0, %arg1, %arg2) ({
      ^bb0(%arg3: i64):
        "llvm.call"(%arg3) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @body, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i64) -> ()
        "omp.yield"() : () -> ()
      }) : (i64, i64, i64) -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64)>, linkage = #llvm.linkage<external>, sym_name = "body", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "test_omp_wsloop_dynamic_chunk_const", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    %0 = "llvm.mlir.constant"() <{value = 2 : i16}> : () -> i16
    "omp.wsloop"(%0) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 1>, schedule_kind = #omp<schedulekind dynamic>}> ({
      "omp.loop_nest"(%arg0, %arg1, %arg2) ({
      ^bb0(%arg3: i64):
        "llvm.call"(%arg3) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @body, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i64) -> ()
        "omp.yield"() : () -> ()
      }) : (i64, i64, i64) -> ()
    }) : (i16) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32)>, linkage = #llvm.linkage<external>, sym_name = "body", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "test_omp_wsloop_dynamic_chunk_var", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i32):
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = i16}> {bindc_name = "chunk_size", in_type = i16, uniq_name = "_QFsub1Echunk_size"} : (i64) -> !llvm.ptr
    %2 = "llvm.load"(%1) <{ordering = 0 : i64}> : (!llvm.ptr) -> i16
    "omp.wsloop"(%2) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 1>, schedule_kind = #omp<schedulekind dynamic>}> ({
      "omp.loop_nest"(%arg0, %arg1, %arg2) ({
      ^bb0(%arg3: i32):
        "llvm.call"(%arg3) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @body, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i32) -> ()
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : (i16) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32)>, linkage = #llvm.linkage<external>, sym_name = "body", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "test_omp_wsloop_dynamic_chunk_var2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i32):
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = i64}> {bindc_name = "chunk_size", in_type = i64, uniq_name = "_QFsub1Echunk_size"} : (i64) -> !llvm.ptr
    %2 = "llvm.load"(%1) <{ordering = 0 : i64}> : (!llvm.ptr) -> i64
    "omp.wsloop"(%2) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 1>, schedule_kind = #omp<schedulekind dynamic>}> ({
      "omp.loop_nest"(%arg0, %arg1, %arg2) ({
      ^bb0(%arg3: i32):
        "llvm.call"(%arg3) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @body, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i32) -> ()
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : (i64) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32)>, linkage = #llvm.linkage<external>, sym_name = "body", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "test_omp_wsloop_dynamic_chunk_var3", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32):
    "omp.wsloop"(%arg3) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 1>, schedule_kind = #omp<schedulekind dynamic>}> ({
      "omp.loop_nest"(%arg0, %arg1, %arg2) ({
      ^bb0(%arg4: i32):
        "llvm.call"(%arg4) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @body, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i32) -> ()
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : (i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64)>, linkage = #llvm.linkage<external>, sym_name = "body", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "test_omp_wsloop_auto", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, schedule_kind = #omp<schedulekind auto>}> ({
      "omp.loop_nest"(%arg0, %arg1, %arg2) ({
      ^bb0(%arg3: i64):
        "llvm.call"(%arg3) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @body, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i64) -> ()
        "omp.yield"() : () -> ()
      }) : (i64, i64, i64) -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64)>, linkage = #llvm.linkage<external>, sym_name = "body", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "test_omp_wsloop_runtime", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, schedule_kind = #omp<schedulekind runtime>}> ({
      "omp.loop_nest"(%arg0, %arg1, %arg2) ({
      ^bb0(%arg3: i64):
        "llvm.call"(%arg3) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @body, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i64) -> ()
        "omp.yield"() : () -> ()
      }) : (i64, i64, i64) -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64)>, linkage = #llvm.linkage<external>, sym_name = "body", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "test_omp_wsloop_guided", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, schedule_kind = #omp<schedulekind guided>}> ({
      "omp.loop_nest"(%arg0, %arg1, %arg2) ({
      ^bb0(%arg3: i64):
        "llvm.call"(%arg3) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @body, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i64) -> ()
        "omp.yield"() : () -> ()
      }) : (i64, i64, i64) -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64)>, linkage = #llvm.linkage<external>, sym_name = "body", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "test_omp_wsloop_dynamic_nonmonotonic", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, schedule_kind = #omp<schedulekind dynamic>, schedule_mod = #omp<sched_mod nonmonotonic>}> ({
      "omp.loop_nest"(%arg0, %arg1, %arg2) ({
      ^bb0(%arg3: i64):
        "llvm.call"(%arg3) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @body, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i64) -> ()
        "omp.yield"() : () -> ()
      }) : (i64, i64, i64) -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64)>, linkage = #llvm.linkage<external>, sym_name = "body", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "test_omp_wsloop_dynamic_monotonic", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, schedule_kind = #omp<schedulekind dynamic>, schedule_mod = #omp<sched_mod monotonic>}> ({
      "omp.loop_nest"(%arg0, %arg1, %arg2) ({
      ^bb0(%arg3: i64):
        "llvm.call"(%arg3) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @body, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i64) -> ()
        "omp.yield"() : () -> ()
      }) : (i64, i64, i64) -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64)>, linkage = #llvm.linkage<external>, sym_name = "body", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "test_omp_wsloop_runtime_simd", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, schedule_kind = #omp<schedulekind runtime>, schedule_mod = #omp<sched_mod none>, schedule_simd}> ({
      "omp.loop_nest"(%arg0, %arg1, %arg2) ({
      ^bb0(%arg3: i64):
        "llvm.call"(%arg3) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @body, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i64) -> ()
        "omp.yield"() : () -> ()
      }) : (i64, i64, i64) -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64)>, linkage = #llvm.linkage<external>, sym_name = "body", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "test_omp_wsloop_guided_simd", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, schedule_kind = #omp<schedulekind guided>, schedule_mod = #omp<sched_mod none>, schedule_simd}> ({
      "omp.loop_nest"(%arg0, %arg1, %arg2) ({
      ^bb0(%arg3: i64):
        "llvm.call"(%arg3) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @body, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i64) -> ()
        "omp.yield"() : () -> ()
      }) : (i64, i64, i64) -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64, i64, i64, ptr)>, linkage = #llvm.linkage<external>, sym_name = "simd_simple", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: !llvm.ptr):
    "omp.simd"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg0, %arg1, %arg2) ({
      ^bb0(%arg4: i64):
        %0 = "llvm.mlir.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
        %1 = "llvm.getelementptr"(%arg3, %arg4) <{elem_type = f32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
        "llvm.store"(%0, %1) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
        "omp.yield"() : () -> ()
      }) : (i64, i64, i64) -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, i32, ptr)>, linkage = #llvm.linkage<external>, sym_name = "simd_linear", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: !llvm.ptr):
    "omp.simd"(%arg3, %arg2) <{linear_var_types = [i32], operandSegmentSizes = array<i32: 0, 0, 1, 1, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg0, %arg1, %arg2) ({
      ^bb0(%arg4: i32):
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : (!llvm.ptr, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, ptr)>, linkage = #llvm.linkage<external>, sym_name = "simd_linear_i64_var_i32_step", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    "omp.simd"(%arg2, %0) <{linear_var_types = [i64], operandSegmentSizes = array<i32: 0, 0, 1, 1, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg0, %arg1, %0) ({
      ^bb0(%arg3: i32):
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : (!llvm.ptr, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, ptr)>, linkage = #llvm.linkage<external>, sym_name = "simd_linear_f64_var_i32_step", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    "omp.simd"(%arg2, %0) <{linear_var_types = [f64], operandSegmentSizes = array<i32: 0, 0, 1, 1, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg0, %arg1, %0) ({
      ^bb0(%arg3: i32):
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : (!llvm.ptr, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64, i64, i64, i64, i64, i64, ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "simd_simple_multiple", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: !llvm.ptr, %arg7: !llvm.ptr):
    "omp.simd"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg0, %arg3, %arg1, %arg4, %arg2, %arg5) <{collapse_num_loops = 2 : i64, loop_inclusive}> ({
      ^bb0(%arg8: i64, %arg9: i64):
        %0 = "llvm.mlir.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
        %1 = "llvm.getelementptr"(%arg6, %arg8) <{elem_type = f32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
        %2 = "llvm.getelementptr"(%arg7, %arg9) <{elem_type = f32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
        "llvm.store"(%0, %1) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
        "llvm.store"(%0, %2) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
        "omp.yield"() : () -> ()
      }) : (i64, i64, i64, i64, i64, i64) -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64, i64, i64, i64, i64, i64, ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "simd_simple_multiple_simdlen", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: !llvm.ptr, %arg7: !llvm.ptr):
    "omp.simd"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, simdlen = 2 : i64}> ({
      "omp.loop_nest"(%arg0, %arg3, %arg1, %arg4, %arg2, %arg5) <{collapse_num_loops = 2 : i64}> ({
      ^bb0(%arg8: i64, %arg9: i64):
        %0 = "llvm.mlir.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
        %1 = "llvm.getelementptr"(%arg6, %arg8) <{elem_type = f32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
        %2 = "llvm.getelementptr"(%arg7, %arg9) <{elem_type = f32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
        "llvm.store"(%0, %1) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
        "llvm.store"(%0, %2) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
        "omp.yield"() : () -> ()
      }) : (i64, i64, i64, i64, i64, i64) -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64, i64, i64, i64, i64, i64, ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "simd_simple_multiple_safelen", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: !llvm.ptr, %arg7: !llvm.ptr):
    "omp.simd"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, safelen = 2 : i64}> ({
      "omp.loop_nest"(%arg0, %arg3, %arg1, %arg4, %arg2, %arg5) <{collapse_num_loops = 2 : i64}> ({
      ^bb0(%arg8: i64, %arg9: i64):
        %0 = "llvm.mlir.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
        %1 = "llvm.getelementptr"(%arg6, %arg8) <{elem_type = f32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
        %2 = "llvm.getelementptr"(%arg7, %arg9) <{elem_type = f32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
        "llvm.store"(%0, %1) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
        "llvm.store"(%0, %2) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
        "omp.yield"() : () -> ()
      }) : (i64, i64, i64, i64, i64, i64) -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64, i64, i64, i64, i64, i64, ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "simd_simple_multiple_simdlen_safelen", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: !llvm.ptr, %arg7: !llvm.ptr):
    "omp.simd"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, safelen = 2 : i64, simdlen = 1 : i64}> ({
      "omp.loop_nest"(%arg0, %arg3, %arg1, %arg4, %arg2, %arg5) <{collapse_num_loops = 2 : i64}> ({
      ^bb0(%arg8: i64, %arg9: i64):
        %0 = "llvm.mlir.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
        %1 = "llvm.getelementptr"(%arg6, %arg8) <{elem_type = f32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
        %2 = "llvm.getelementptr"(%arg7, %arg9) <{elem_type = f32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
        "llvm.store"(%0, %1) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
        "llvm.store"(%0, %2) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
        "omp.yield"() : () -> ()
      }) : (i64, i64, i64, i64, i64, i64) -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "n"}, {fir.bindc_name = "threshold"}], function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "simd_if", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> {adapt.valuebyref, in_type = i32, operandSegmentSizes = array<i32: 0, 0>} : (i64) -> !llvm.ptr
    %2 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %3 = "llvm.alloca"(%2) <{elem_type = i32}> {bindc_name = "i", in_type = i32, operandSegmentSizes = array<i32: 0, 0>, uniq_name = "_QFtest_simdEi"} : (i64) -> !llvm.ptr
    %4 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %5 = "llvm.load"(%arg0) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    %6 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %7 = "llvm.load"(%arg0) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    %8 = "llvm.load"(%arg1) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    %9 = "llvm.icmp"(%7, %8) <{predicate = 5 : i64}> : (i32, i32) -> i1
    "omp.simd"(%9) <{operandSegmentSizes = array<i32: 0, 1, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%4, %5, %6) <{loop_inclusive}> ({
      ^bb0(%arg2: i32):
        "llvm.store"(%arg2, %1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : (i1) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "simd_order", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 10 : i64}> : () -> i64
    %1 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %2 = "llvm.alloca"(%1) <{elem_type = i64}> : (i64) -> !llvm.ptr
    "omp.simd"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, order = #omp<orderkind concurrent>, safelen = 2 : i64}> ({
      "omp.loop_nest"(%1, %0, %1) <{loop_inclusive}> ({
      ^bb0(%arg0: i64):
        "llvm.store"(%arg0, %2) <{ordering = 0 : i64}> : (i64, !llvm.ptr) -> ()
        "omp.yield"() : () -> ()
      }) : (i64, i64, i64) -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64)>, linkage = #llvm.linkage<external>, sym_name = "body", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "test_omp_wsloop_ordered", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, ordered = 0 : i64}> ({
      "omp.loop_nest"(%arg0, %arg1, %arg2) ({
      ^bb0(%arg3: i64):
        "llvm.call"(%arg3) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @body, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i64) -> ()
        "omp.yield"() : () -> ()
      }) : (i64, i64, i64) -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64)>, linkage = #llvm.linkage<external>, sym_name = "body", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "test_omp_wsloop_static_ordered", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, ordered = 0 : i64, schedule_kind = #omp<schedulekind static>}> ({
      "omp.loop_nest"(%arg0, %arg1, %arg2) ({
      ^bb0(%arg3: i64):
        "llvm.call"(%arg3) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @body, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i64) -> ()
        "omp.yield"() : () -> ()
      }) : (i64, i64, i64) -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32)>, linkage = #llvm.linkage<external>, sym_name = "body", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "test_omp_wsloop_static_chunk_ordered", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i32):
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    "omp.wsloop"(%0) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 1>, ordered = 0 : i64, schedule_kind = #omp<schedulekind static>}> ({
      "omp.loop_nest"(%arg0, %arg1, %arg2) ({
      ^bb0(%arg3: i32):
        "llvm.call"(%arg3) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @body, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i32) -> ()
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : (i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64)>, linkage = #llvm.linkage<external>, sym_name = "body", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "test_omp_wsloop_dynamic_ordered", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, ordered = 0 : i64, schedule_kind = #omp<schedulekind dynamic>}> ({
      "omp.loop_nest"(%arg0, %arg1, %arg2) ({
      ^bb0(%arg3: i64):
        "llvm.call"(%arg3) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @body, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i64) -> ()
        "omp.yield"() : () -> ()
      }) : (i64, i64, i64) -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64)>, linkage = #llvm.linkage<external>, sym_name = "body", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "test_omp_wsloop_auto_ordered", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, ordered = 0 : i64, schedule_kind = #omp<schedulekind auto>}> ({
      "omp.loop_nest"(%arg0, %arg1, %arg2) ({
      ^bb0(%arg3: i64):
        "llvm.call"(%arg3) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @body, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i64) -> ()
        "omp.yield"() : () -> ()
      }) : (i64, i64, i64) -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64)>, linkage = #llvm.linkage<external>, sym_name = "body", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "test_omp_wsloop_runtime_ordered", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, ordered = 0 : i64, schedule_kind = #omp<schedulekind runtime>}> ({
      "omp.loop_nest"(%arg0, %arg1, %arg2) ({
      ^bb0(%arg3: i64):
        "llvm.call"(%arg3) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @body, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i64) -> ()
        "omp.yield"() : () -> ()
      }) : (i64, i64, i64) -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64)>, linkage = #llvm.linkage<external>, sym_name = "body", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "test_omp_wsloop_guided_ordered", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, ordered = 0 : i64, schedule_kind = #omp<schedulekind guided>}> ({
      "omp.loop_nest"(%arg0, %arg1, %arg2) ({
      ^bb0(%arg3: i64):
        "llvm.call"(%arg3) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @body, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i64) -> ()
        "omp.yield"() : () -> ()
      }) : (i64, i64, i64) -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64)>, linkage = #llvm.linkage<external>, sym_name = "body", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "test_omp_wsloop_dynamic_nonmonotonic_ordered", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, ordered = 0 : i64, schedule_kind = #omp<schedulekind dynamic>, schedule_mod = #omp<sched_mod nonmonotonic>}> ({
      "omp.loop_nest"(%arg0, %arg1, %arg2) ({
      ^bb0(%arg3: i64):
        "llvm.call"(%arg3) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @body, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i64) -> ()
        "omp.yield"() : () -> ()
      }) : (i64, i64, i64) -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64)>, linkage = #llvm.linkage<external>, sym_name = "body", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "test_omp_wsloop_dynamic_monotonic_ordered", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64):
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, ordered = 0 : i64, schedule_kind = #omp<schedulekind dynamic>, schedule_mod = #omp<sched_mod monotonic>}> ({
      "omp.loop_nest"(%arg0, %arg1, %arg2) ({
      ^bb0(%arg3: i64):
        "llvm.call"(%arg3) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @body, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i64) -> ()
        "omp.yield"() : () -> ()
      }) : (i64, i64, i64) -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "omp.critical.declare"() <{hint = 0 : i64, sym_name = "mutex_none"}> : () -> ()
  "omp.critical.declare"() <{hint = 1 : i64, sym_name = "mutex_uncontended"}> : () -> ()
  "omp.critical.declare"() <{hint = 2 : i64, sym_name = "mutex_contended"}> : () -> ()
  "omp.critical.declare"() <{hint = 4 : i64, sym_name = "mutex_nonspeculative"}> : () -> ()
  "omp.critical.declare"() <{hint = 5 : i64, sym_name = "mutex_nonspeculative_uncontended"}> : () -> ()
  "omp.critical.declare"() <{hint = 6 : i64, sym_name = "mutex_nonspeculative_contended"}> : () -> ()
  "omp.critical.declare"() <{hint = 8 : i64, sym_name = "mutex_speculative"}> : () -> ()
  "omp.critical.declare"() <{hint = 9 : i64, sym_name = "mutex_speculative_uncontended"}> : () -> ()
  "omp.critical.declare"() <{hint = 10 : i64, sym_name = "mutex_speculative_contended"}> : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32)>, linkage = #llvm.linkage<external>, sym_name = "omp_critical", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: i32):
    "omp.critical"() ({
      "llvm.store"(%arg1, %arg0) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.critical"() <{name = @mutex_none}> ({
      "llvm.store"(%arg1, %arg0) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.critical"() <{name = @mutex_uncontended}> ({
      "llvm.store"(%arg1, %arg0) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.critical"() <{name = @mutex_contended}> ({
      "llvm.store"(%arg1, %arg0) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.critical"() <{name = @mutex_nonspeculative}> ({
      "llvm.store"(%arg1, %arg0) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.critical"() <{name = @mutex_nonspeculative_uncontended}> ({
      "llvm.store"(%arg1, %arg0) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.critical"() <{name = @mutex_nonspeculative_contended}> ({
      "llvm.store"(%arg1, %arg0) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.critical"() <{name = @mutex_speculative}> ({
      "llvm.store"(%arg1, %arg0) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.critical"() <{name = @mutex_speculative_uncontended}> ({
      "llvm.store"(%arg1, %arg0) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.critical"() <{name = @mutex_speculative_contended}> ({
      "llvm.store"(%arg1, %arg0) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, i32, i32, i32, i32, i32, i32, i32, ptr)>, linkage = #llvm.linkage<external>, sym_name = "collapse_wsloop", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32, %arg9: !llvm.ptr):
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
        "omp.loop_nest"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5, %arg6, %arg7, %arg8) <{collapse_num_loops = 3 : i64}> ({
        ^bb0(%arg10: i32, %arg11: i32, %arg12: i32):
          %0 = "llvm.load"(%arg9) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
          %1 = "llvm.add"(%0, %arg10) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
          %2 = "llvm.add"(%1, %arg11) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
          %3 = "llvm.add"(%2, %arg12) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
          "llvm.store"(%3, %arg9) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
          "omp.yield"() : () -> ()
        }) : (i32, i32, i32, i32, i32, i32, i32, i32, i32) -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, i32, i32, i32, i32, i32, i32, i32, ptr)>, linkage = #llvm.linkage<external>, sym_name = "collapse_wsloop_dynamic", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32, %arg9: !llvm.ptr):
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, schedule_kind = #omp<schedulekind dynamic>}> ({
        "omp.loop_nest"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5, %arg6, %arg7, %arg8) <{collapse_num_loops = 3 : i64}> ({
        ^bb0(%arg10: i32, %arg11: i32, %arg12: i32):
          %0 = "llvm.load"(%arg9) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
          %1 = "llvm.add"(%0, %arg10) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
          %2 = "llvm.add"(%1, %arg11) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
          %3 = "llvm.add"(%2, %arg12) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
          "llvm.store"(%3, %arg9) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
          "omp.yield"() : () -> ()
        }) : (i32, i32, i32, i32, i32, i32, i32, i32, i32) -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, i32, i64, i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "omp_ordered", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: i64):
    "omp.ordered.region"() ({
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, ordered = 0 : i64}> ({
      "omp.loop_nest"(%arg0, %arg1, %arg2) ({
      ^bb0(%arg9: i32):
        "omp.ordered.region"() ({
          "omp.terminator"() : () -> ()
        }) : () -> ()
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : () -> ()
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, ordered = 1 : i64}> ({
      "omp.loop_nest"(%arg0, %arg1, %arg2) ({
      ^bb0(%arg8: i32):
        "omp.ordered"(%arg3) <{doacross_depend_type = #omp<clause_depend(dependsink)>, doacross_num_loops = 1 : i64}> : (i64) -> ()
        "omp.ordered"(%arg3) <{doacross_depend_type = #omp<clause_depend(dependsource)>, doacross_num_loops = 1 : i64}> : (i64) -> ()
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : () -> ()
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, ordered = 2 : i64}> ({
      "omp.loop_nest"(%arg0, %arg1, %arg2) ({
      ^bb0(%arg7: i32):
        "omp.ordered"(%arg3, %arg4, %arg5, %arg6) <{doacross_depend_type = #omp<clause_depend(dependsink)>, doacross_num_loops = 2 : i64}> : (i64, i64, i64, i64) -> ()
        "omp.ordered"(%arg3, %arg4) <{doacross_depend_type = #omp<clause_depend(dependsource)>, doacross_num_loops = 2 : i64}> : (i64, i64) -> ()
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "omp_atomic_read", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    "omp.atomic.read"(%arg0, %arg1) <{element_type = i32}> : (!llvm.ptr, !llvm.ptr) -> ()
    "omp.atomic.read"(%arg0, %arg1) <{element_type = i32, memory_order = #omp<memoryorderkind seq_cst>}> : (!llvm.ptr, !llvm.ptr) -> ()
    "omp.atomic.read"(%arg0, %arg1) <{element_type = i32, memory_order = #omp<memoryorderkind acquire>}> : (!llvm.ptr, !llvm.ptr) -> ()
    "omp.atomic.read"(%arg0, %arg1) <{element_type = i32, memory_order = #omp<memoryorderkind relaxed>}> : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "omp_atomic_read_implicit_cast", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = f32}> {bindc_name = "z"} : (i64) -> !llvm.ptr
    %2 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %3 = "llvm.alloca"(%2) <{elem_type = f64}> {bindc_name = "y"} : (i64) -> !llvm.ptr
    %4 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %5 = "llvm.alloca"(%4) <{elem_type = !llvm.array<2 x struct<(f32, f32)>>}> {bindc_name = "x"} : (i64) -> !llvm.ptr
    %6 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %7 = "llvm.alloca"(%6) <{elem_type = i32}> {bindc_name = "w"} : (i64) -> !llvm.ptr
    %8 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %9 = "llvm.mlir.constant"() <{value = 2 : index}> : () -> i64
    %10 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %11 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i64
    %12 = "llvm.sub"(%8, %10) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
    %13 = "llvm.mul"(%12, %10) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
    %14 = "llvm.mul"(%13, %10) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
    %15 = "llvm.add"(%14, %11) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
    %16 = "llvm.mul"(%10, %9) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
    %17 = "llvm.getelementptr"(%5, %15) <{elem_type = !llvm.struct<(f32, f32)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
    "omp.atomic.read"(%17, %3) <{element_type = !llvm.struct<(f32, f32)>}> : (!llvm.ptr, !llvm.ptr) -> ()
    "omp.atomic.read"(%1, %3) <{element_type = f32}> : (!llvm.ptr, !llvm.ptr) -> ()
    "omp.atomic.read"(%7, %3) <{element_type = i32}> : (!llvm.ptr, !llvm.ptr) -> ()
    "omp.atomic.read"(%3, %1) <{element_type = f64}> : (!llvm.ptr, !llvm.ptr) -> ()
    "omp.atomic.read"(%7, %1) <{element_type = i32}> : (!llvm.ptr, !llvm.ptr) -> ()
    "omp.atomic.read"(%3, %7) <{element_type = f64}> : (!llvm.ptr, !llvm.ptr) -> ()
    "omp.atomic.read"(%1, %7) <{element_type = f32}> : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32)>, linkage = #llvm.linkage<external>, sym_name = "omp_atomic_write", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: i32):
    "omp.atomic.write"(%arg0, %arg1) : (!llvm.ptr, i32) -> ()
    "omp.atomic.write"(%arg0, %arg1) <{memory_order = #omp<memoryorderkind seq_cst>}> : (!llvm.ptr, i32) -> ()
    "omp.atomic.write"(%arg0, %arg1) <{memory_order = #omp<memoryorderkind release>}> : (!llvm.ptr, i32) -> ()
    "omp.atomic.write"(%arg0, %arg1) <{memory_order = #omp<memoryorderkind relaxed>}> : (!llvm.ptr, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32, ptr, i1)>, linkage = #llvm.linkage<external>, sym_name = "omp_atomic_update", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: i32, %arg2: !llvm.ptr, %arg3: i1):
    "omp.atomic.update"(%arg0) ({
    ^bb0(%arg5: i32):
      %1 = "llvm.mul"(%arg5, %arg1) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      "omp.yield"(%1) : (i32) -> ()
    }) : (!llvm.ptr) -> ()
    "omp.atomic.update"(%arg0) ({
    ^bb0(%arg4: i32):
      %0 = "llvm.add"(%arg4, %arg1) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      "omp.yield"(%0) : (i32) -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "omp_atomic_write", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = f32}> {bindc_name = "x"} : (i64) -> !llvm.ptr
    %2 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %3 = "llvm.alloca"(%2) <{elem_type = f32}> {bindc_name = "r1"} : (i64) -> !llvm.ptr
    %4 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %5 = "llvm.alloca"(%4) <{elem_type = !llvm.struct<(f32, f32)>}> {bindc_name = "c1"} : (i64) -> !llvm.ptr
    %6 = "llvm.mlir.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %7 = "llvm.mlir.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %8 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %9 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %10 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %11 = "llvm.load"(%3) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
    %12 = "llvm.mlir.undef"() : () -> !llvm.struct<(f32, f32)>
    %13 = "llvm.insertvalue"(%12, %11) <{position = array<i64: 0>}> : (!llvm.struct<(f32, f32)>, f32) -> !llvm.struct<(f32, f32)>
    %14 = "llvm.insertvalue"(%13, %7) <{position = array<i64: 1>}> : (!llvm.struct<(f32, f32)>, f32) -> !llvm.struct<(f32, f32)>
    "omp.atomic.write"(%5, %14) : (!llvm.ptr, !llvm.struct<(f32, f32)>) -> ()
    %15 = "llvm.mlir.undef"() : () -> !llvm.struct<(f32, f32)>
    %16 = "llvm.insertvalue"(%15, %6) <{position = array<i64: 0>}> : (!llvm.struct<(f32, f32)>, f32) -> !llvm.struct<(f32, f32)>
    %17 = "llvm.insertvalue"(%16, %6) <{position = array<i64: 1>}> : (!llvm.struct<(f32, f32)>, f32) -> !llvm.struct<(f32, f32)>
    "omp.atomic.write"(%5, %17) : (!llvm.ptr, !llvm.struct<(f32, f32)>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QPomp_atomic_update_complex", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = !llvm.struct<(f32, f32)>}> {bindc_name = "ib"} : (i64) -> !llvm.ptr
    %2 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %3 = "llvm.alloca"(%2) <{elem_type = !llvm.struct<(f32, f32)>}> {bindc_name = "ia"} : (i64) -> !llvm.ptr
    %4 = "llvm.mlir.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %5 = "llvm.mlir.undef"() : () -> !llvm.struct<(f32, f32)>
    %6 = "llvm.insertvalue"(%5, %4) <{position = array<i64: 0>}> : (!llvm.struct<(f32, f32)>, f32) -> !llvm.struct<(f32, f32)>
    %7 = "llvm.insertvalue"(%6, %4) <{position = array<i64: 1>}> : (!llvm.struct<(f32, f32)>, f32) -> !llvm.struct<(f32, f32)>
    "omp.atomic.update"(%3) ({
    ^bb0(%arg0: !llvm.struct<(f32, f32)>):
      %8 = "llvm.extractvalue"(%arg0) <{position = array<i64: 0>}> : (!llvm.struct<(f32, f32)>) -> f32
      %9 = "llvm.extractvalue"(%arg0) <{position = array<i64: 1>}> : (!llvm.struct<(f32, f32)>) -> f32
      %10 = "llvm.extractvalue"(%7) <{position = array<i64: 0>}> : (!llvm.struct<(f32, f32)>) -> f32
      %11 = "llvm.extractvalue"(%7) <{position = array<i64: 1>}> : (!llvm.struct<(f32, f32)>) -> f32
      %12 = "llvm.fadd"(%8, %10) <{fastmathFlags = #llvm.fastmath<contract>}> : (f32, f32) -> f32
      %13 = "llvm.fadd"(%9, %11) <{fastmathFlags = #llvm.fastmath<contract>}> : (f32, f32) -> f32
      %14 = "llvm.mlir.undef"() : () -> !llvm.struct<(f32, f32)>
      %15 = "llvm.insertvalue"(%14, %12) <{position = array<i64: 0>}> : (!llvm.struct<(f32, f32)>, f32) -> !llvm.struct<(f32, f32)>
      %16 = "llvm.insertvalue"(%15, %13) <{position = array<i64: 1>}> : (!llvm.struct<(f32, f32)>, f32) -> !llvm.struct<(f32, f32)>
      "omp.yield"(%16) : (!llvm.struct<(f32, f32)>) -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QPomp_atomic_capture_complex", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = !llvm.struct<(f32, f32)>}> {bindc_name = "ib"} : (i64) -> !llvm.ptr
    %2 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %3 = "llvm.alloca"(%2) <{elem_type = !llvm.struct<(f32, f32)>}> {bindc_name = "ia"} : (i64) -> !llvm.ptr
    %4 = "llvm.mlir.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %5 = "llvm.mlir.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %6 = "llvm.mlir.undef"() : () -> !llvm.struct<(f32, f32)>
    %7 = "llvm.insertvalue"(%6, %5) <{position = array<i64: 0>}> : (!llvm.struct<(f32, f32)>, f32) -> !llvm.struct<(f32, f32)>
    %8 = "llvm.insertvalue"(%7, %5) <{position = array<i64: 1>}> : (!llvm.struct<(f32, f32)>, f32) -> !llvm.struct<(f32, f32)>
    "llvm.store"(%8, %3) <{ordering = 0 : i64}> : (!llvm.struct<(f32, f32)>, !llvm.ptr) -> ()
    %9 = "llvm.mlir.undef"() : () -> !llvm.struct<(f32, f32)>
    %10 = "llvm.insertvalue"(%9, %4) <{position = array<i64: 0>}> : (!llvm.struct<(f32, f32)>, f32) -> !llvm.struct<(f32, f32)>
    %11 = "llvm.insertvalue"(%10, %4) <{position = array<i64: 1>}> : (!llvm.struct<(f32, f32)>, f32) -> !llvm.struct<(f32, f32)>
    "omp.atomic.capture"() ({
      "omp.atomic.update"(%3) ({
      ^bb0(%arg0: !llvm.struct<(f32, f32)>):
        %12 = "llvm.extractvalue"(%arg0) <{position = array<i64: 0>}> : (!llvm.struct<(f32, f32)>) -> f32
        %13 = "llvm.extractvalue"(%arg0) <{position = array<i64: 1>}> : (!llvm.struct<(f32, f32)>) -> f32
        %14 = "llvm.extractvalue"(%11) <{position = array<i64: 0>}> : (!llvm.struct<(f32, f32)>) -> f32
        %15 = "llvm.extractvalue"(%11) <{position = array<i64: 1>}> : (!llvm.struct<(f32, f32)>) -> f32
        %16 = "llvm.fadd"(%12, %14) <{fastmathFlags = #llvm.fastmath<contract>}> : (f32, f32) -> f32
        %17 = "llvm.fadd"(%13, %15) <{fastmathFlags = #llvm.fastmath<contract>}> : (f32, f32) -> f32
        %18 = "llvm.mlir.undef"() : () -> !llvm.struct<(f32, f32)>
        %19 = "llvm.insertvalue"(%18, %16) <{position = array<i64: 0>}> : (!llvm.struct<(f32, f32)>, f32) -> !llvm.struct<(f32, f32)>
        %20 = "llvm.insertvalue"(%19, %17) <{position = array<i64: 1>}> : (!llvm.struct<(f32, f32)>, f32) -> !llvm.struct<(f32, f32)>
        "omp.yield"(%20) : (!llvm.struct<(f32, f32)>) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.atomic.read"(%3, %1) <{element_type = !llvm.struct<(f32, f32)>}> : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "omp_atomic_read_complex", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = !llvm.struct<(f32, f32)>}> {bindc_name = "ib"} : (i64) -> !llvm.ptr
    %2 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %3 = "llvm.alloca"(%2) <{elem_type = !llvm.struct<(f32, f32)>}> {bindc_name = "ia"} : (i64) -> !llvm.ptr
    "omp.atomic.read"(%3, %1) <{element_type = !llvm.struct<(f32, f32)>}> : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32)>, linkage = #llvm.linkage<external>, sym_name = "omp_atomic_update_ordering", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: i32):
    "omp.atomic.update"(%arg0) ({
    ^bb0(%arg2: i32):
      %0 = "llvm.shl"(%arg1, %arg2) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      "omp.yield"(%0) : (i32) -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32)>, linkage = #llvm.linkage<external>, sym_name = "omp_atomic_update_ordering", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: i32):
    "omp.atomic.update"(%arg0) ({
    ^bb0(%arg2: i32):
      %0 = "llvm.shl"(%arg2, %arg1) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      "omp.yield"(%0) : (i32) -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32)>, linkage = #llvm.linkage<external>, sym_name = "omp_atomic_update_intrinsic", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: i32):
    "omp.atomic.update"(%arg0) ({
    ^bb0(%arg3: i32):
      %1 = "llvm.intr.smax"(%arg3, %arg1) : (i32, i32) -> i32
      "omp.yield"(%1) : (i32) -> ()
    }) : (!llvm.ptr) -> ()
    "omp.atomic.update"(%arg0) ({
    ^bb0(%arg2: i32):
      %0 = "llvm.intr.umax"(%arg2, %arg1) : (i32, i32) -> i32
      "omp.yield"(%0) : (i32) -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "atomic_update_cmpxchg", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = "llvm.load"(%arg1) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
    "omp.atomic.update"(%arg0) ({
    ^bb0(%arg2: i32):
      %1 = "llvm.sitofp"(%arg2) : (i32) -> f32
      %2 = "llvm.fadd"(%1, %0) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
      %3 = "llvm.fptosi"(%2) : (f32) -> i32
      "omp.yield"(%3) : (i32) -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr, i32, ptr, ptr, f32)>, linkage = #llvm.linkage<external>, sym_name = "omp_atomic_capture_prefix_update", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: i32, %arg3: !llvm.ptr, %arg4: !llvm.ptr, %arg5: f32):
    "omp.atomic.capture"() ({
      "omp.atomic.update"(%arg0) ({
      ^bb0(%arg22: i32):
        %16 = "llvm.add"(%arg22, %arg2) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        "omp.yield"(%16) : (i32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.atomic.read"(%arg0, %arg1) <{element_type = i32}> : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() ({
      "omp.atomic.update"(%arg0) ({
      ^bb0(%arg21: i32):
        %15 = "llvm.sub"(%arg21, %arg2) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        "omp.yield"(%15) : (i32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.atomic.read"(%arg0, %arg1) <{element_type = i32}> : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() ({
      "omp.atomic.update"(%arg0) ({
      ^bb0(%arg20: i32):
        %14 = "llvm.and"(%arg20, %arg2) : (i32, i32) -> i32
        "omp.yield"(%14) : (i32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.atomic.read"(%arg0, %arg1) <{element_type = i32}> : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() ({
      "omp.atomic.update"(%arg0) ({
      ^bb0(%arg19: i32):
        %13 = "llvm.or"(%arg19, %arg2) : (i32, i32) -> i32
        "omp.yield"(%13) : (i32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.atomic.read"(%arg0, %arg1) <{element_type = i32}> : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() ({
      "omp.atomic.update"(%arg0) ({
      ^bb0(%arg18: i32):
        %12 = "llvm.xor"(%arg18, %arg2) : (i32, i32) -> i32
        "omp.yield"(%12) : (i32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.atomic.read"(%arg0, %arg1) <{element_type = i32}> : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() ({
      "omp.atomic.update"(%arg0) ({
      ^bb0(%arg17: i32):
        %11 = "llvm.mul"(%arg17, %arg2) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        "omp.yield"(%11) : (i32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.atomic.read"(%arg0, %arg1) <{element_type = i32}> : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() ({
      "omp.atomic.update"(%arg0) ({
      ^bb0(%arg16: i32):
        %10 = "llvm.sdiv"(%arg16, %arg2) : (i32, i32) -> i32
        "omp.yield"(%10) : (i32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.atomic.read"(%arg0, %arg1) <{element_type = i32}> : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() ({
      "omp.atomic.update"(%arg0) ({
      ^bb0(%arg15: i32):
        %9 = "llvm.udiv"(%arg15, %arg2) : (i32, i32) -> i32
        "omp.yield"(%9) : (i32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.atomic.read"(%arg0, %arg1) <{element_type = i32}> : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() ({
      "omp.atomic.update"(%arg0) ({
      ^bb0(%arg14: i32):
        %8 = "llvm.shl"(%arg14, %arg2) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        "omp.yield"(%8) : (i32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.atomic.read"(%arg0, %arg1) <{element_type = i32}> : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() ({
      "omp.atomic.update"(%arg0) ({
      ^bb0(%arg13: i32):
        %7 = "llvm.lshr"(%arg13, %arg2) : (i32, i32) -> i32
        "omp.yield"(%7) : (i32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.atomic.read"(%arg0, %arg1) <{element_type = i32}> : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() ({
      "omp.atomic.update"(%arg0) ({
      ^bb0(%arg12: i32):
        %6 = "llvm.ashr"(%arg12, %arg2) : (i32, i32) -> i32
        "omp.yield"(%6) : (i32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.atomic.read"(%arg0, %arg1) <{element_type = i32}> : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() ({
      "omp.atomic.update"(%arg0) ({
      ^bb0(%arg11: i32):
        %5 = "llvm.intr.smax"(%arg11, %arg2) : (i32, i32) -> i32
        "omp.yield"(%5) : (i32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.atomic.read"(%arg0, %arg1) <{element_type = i32}> : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() ({
      "omp.atomic.update"(%arg0) ({
      ^bb0(%arg10: i32):
        %4 = "llvm.intr.smin"(%arg10, %arg2) : (i32, i32) -> i32
        "omp.yield"(%4) : (i32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.atomic.read"(%arg0, %arg1) <{element_type = i32}> : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() ({
      "omp.atomic.update"(%arg0) ({
      ^bb0(%arg9: i32):
        %3 = "llvm.intr.umax"(%arg9, %arg2) : (i32, i32) -> i32
        "omp.yield"(%3) : (i32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.atomic.read"(%arg0, %arg1) <{element_type = i32}> : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() ({
      "omp.atomic.update"(%arg0) ({
      ^bb0(%arg8: i32):
        %2 = "llvm.intr.umin"(%arg8, %arg2) : (i32, i32) -> i32
        "omp.yield"(%2) : (i32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.atomic.read"(%arg0, %arg1) <{element_type = i32}> : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() ({
      "omp.atomic.update"(%arg3) ({
      ^bb0(%arg7: f32):
        %1 = "llvm.fadd"(%arg7, %arg5) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
        "omp.yield"(%1) : (f32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.atomic.read"(%arg3, %arg4) <{element_type = f32}> : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() ({
      "omp.atomic.update"(%arg3) ({
      ^bb0(%arg6: f32):
        %0 = "llvm.fsub"(%arg6, %arg5) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
        "omp.yield"(%0) : (f32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.atomic.read"(%arg3, %arg4) <{element_type = f32}> : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr, i32, ptr, ptr, f32)>, linkage = #llvm.linkage<external>, sym_name = "omp_atomic_capture_postfix_update", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: i32, %arg3: !llvm.ptr, %arg4: !llvm.ptr, %arg5: f32):
    "omp.atomic.capture"() ({
      "omp.atomic.read"(%arg0, %arg1) <{element_type = i32}> : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.atomic.update"(%arg0) ({
      ^bb0(%arg22: i32):
        %16 = "llvm.add"(%arg22, %arg2) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        "omp.yield"(%16) : (i32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() ({
      "omp.atomic.read"(%arg0, %arg1) <{element_type = i32}> : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.atomic.update"(%arg0) ({
      ^bb0(%arg21: i32):
        %15 = "llvm.sub"(%arg21, %arg2) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        "omp.yield"(%15) : (i32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() ({
      "omp.atomic.read"(%arg0, %arg1) <{element_type = i32}> : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.atomic.update"(%arg0) ({
      ^bb0(%arg20: i32):
        %14 = "llvm.and"(%arg20, %arg2) : (i32, i32) -> i32
        "omp.yield"(%14) : (i32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() ({
      "omp.atomic.read"(%arg0, %arg1) <{element_type = i32}> : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.atomic.update"(%arg0) ({
      ^bb0(%arg19: i32):
        %13 = "llvm.or"(%arg19, %arg2) : (i32, i32) -> i32
        "omp.yield"(%13) : (i32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() ({
      "omp.atomic.read"(%arg0, %arg1) <{element_type = i32}> : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.atomic.update"(%arg0) ({
      ^bb0(%arg18: i32):
        %12 = "llvm.xor"(%arg18, %arg2) : (i32, i32) -> i32
        "omp.yield"(%12) : (i32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() ({
      "omp.atomic.read"(%arg0, %arg1) <{element_type = i32}> : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.atomic.update"(%arg0) ({
      ^bb0(%arg17: i32):
        %11 = "llvm.mul"(%arg17, %arg2) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        "omp.yield"(%11) : (i32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() ({
      "omp.atomic.read"(%arg0, %arg1) <{element_type = i32}> : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.atomic.update"(%arg0) ({
      ^bb0(%arg16: i32):
        %10 = "llvm.sdiv"(%arg16, %arg2) : (i32, i32) -> i32
        "omp.yield"(%10) : (i32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() ({
      "omp.atomic.read"(%arg0, %arg1) <{element_type = i32}> : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.atomic.update"(%arg0) ({
      ^bb0(%arg15: i32):
        %9 = "llvm.udiv"(%arg15, %arg2) : (i32, i32) -> i32
        "omp.yield"(%9) : (i32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() ({
      "omp.atomic.read"(%arg0, %arg1) <{element_type = i32}> : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.atomic.update"(%arg0) ({
      ^bb0(%arg14: i32):
        %8 = "llvm.shl"(%arg14, %arg2) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        "omp.yield"(%8) : (i32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() ({
      "omp.atomic.read"(%arg0, %arg1) <{element_type = i32}> : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.atomic.update"(%arg0) ({
      ^bb0(%arg13: i32):
        %7 = "llvm.lshr"(%arg13, %arg2) : (i32, i32) -> i32
        "omp.yield"(%7) : (i32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() ({
      "omp.atomic.read"(%arg0, %arg1) <{element_type = i32}> : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.atomic.update"(%arg0) ({
      ^bb0(%arg12: i32):
        %6 = "llvm.ashr"(%arg12, %arg2) : (i32, i32) -> i32
        "omp.yield"(%6) : (i32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() ({
      "omp.atomic.read"(%arg0, %arg1) <{element_type = i32}> : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.atomic.update"(%arg0) ({
      ^bb0(%arg11: i32):
        %5 = "llvm.intr.smax"(%arg11, %arg2) : (i32, i32) -> i32
        "omp.yield"(%5) : (i32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() ({
      "omp.atomic.read"(%arg0, %arg1) <{element_type = i32}> : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.atomic.update"(%arg0) ({
      ^bb0(%arg10: i32):
        %4 = "llvm.intr.smin"(%arg10, %arg2) : (i32, i32) -> i32
        "omp.yield"(%4) : (i32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() ({
      "omp.atomic.read"(%arg0, %arg1) <{element_type = i32}> : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.atomic.update"(%arg0) ({
      ^bb0(%arg9: i32):
        %3 = "llvm.intr.umax"(%arg9, %arg2) : (i32, i32) -> i32
        "omp.yield"(%3) : (i32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() ({
      "omp.atomic.read"(%arg0, %arg1) <{element_type = i32}> : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.atomic.update"(%arg0) ({
      ^bb0(%arg8: i32):
        %2 = "llvm.intr.umin"(%arg8, %arg2) : (i32, i32) -> i32
        "omp.yield"(%2) : (i32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() ({
      "omp.atomic.read"(%arg3, %arg4) <{element_type = f32}> : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.atomic.update"(%arg3) ({
      ^bb0(%arg7: f32):
        %1 = "llvm.fadd"(%arg7, %arg5) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
        "omp.yield"(%1) : (f32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() ({
      "omp.atomic.read"(%arg3, %arg4) <{element_type = f32}> : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.atomic.update"(%arg3) ({
      ^bb0(%arg6: f32):
        %0 = "llvm.fsub"(%arg6, %arg5) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
        "omp.yield"(%0) : (f32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr, i32, ptr, ptr, f32)>, linkage = #llvm.linkage<external>, sym_name = "omp_atomic_capture_misc", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: i32, %arg3: !llvm.ptr, %arg4: !llvm.ptr, %arg5: f32):
    "omp.atomic.capture"() ({
      "omp.atomic.read"(%arg0, %arg1) <{element_type = i32}> : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.atomic.write"(%arg0, %arg2) : (!llvm.ptr, i32) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() ({
      "omp.atomic.read"(%arg3, %arg4) <{element_type = f32}> : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.atomic.write"(%arg3, %arg5) : (!llvm.ptr, f32) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() <{memory_order = #omp<memoryorderkind seq_cst>}> ({
      "omp.atomic.read"(%arg0, %arg1) <{element_type = i32}> : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.atomic.update"(%arg0) ({
      ^bb0(%arg10: i32):
        %4 = "llvm.add"(%arg10, %arg2) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        "omp.yield"(%4) : (i32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() <{memory_order = #omp<memoryorderkind acquire>}> ({
      "omp.atomic.read"(%arg0, %arg1) <{element_type = i32}> : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.atomic.update"(%arg0) ({
      ^bb0(%arg9: i32):
        %3 = "llvm.add"(%arg9, %arg2) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        "omp.yield"(%3) : (i32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() <{memory_order = #omp<memoryorderkind release>}> ({
      "omp.atomic.read"(%arg0, %arg1) <{element_type = i32}> : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.atomic.update"(%arg0) ({
      ^bb0(%arg8: i32):
        %2 = "llvm.add"(%arg8, %arg2) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        "omp.yield"(%2) : (i32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() <{memory_order = #omp<memoryorderkind relaxed>}> ({
      "omp.atomic.read"(%arg0, %arg1) <{element_type = i32}> : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.atomic.update"(%arg0) ({
      ^bb0(%arg7: i32):
        %1 = "llvm.add"(%arg7, %arg2) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        "omp.yield"(%1) : (i32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "omp.atomic.capture"() <{memory_order = #omp<memoryorderkind acq_rel>}> ({
      "omp.atomic.read"(%arg0, %arg1) <{element_type = i32}> : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.atomic.update"(%arg0) ({
      ^bb0(%arg6: i32):
        %0 = "llvm.add"(%arg6, %arg2) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        "omp.yield"(%0) : (i32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "omp_sections_empty", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "omp.sections"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "omp_sections_trivial", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "omp.sections"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
      "omp.section"() ({
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.section"() ({
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "foo", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32)>, linkage = #llvm.linkage<external>, sym_name = "bar", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, ptr)>, linkage = #llvm.linkage<external>, sym_name = "omp_sections", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: !llvm.ptr):
    "omp.sections"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
      "omp.section"() ({
        "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.section"() ({
        "llvm.call"(%arg0) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @bar, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i32) -> ()
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.section"() ({
        %0 = "llvm.add"(%arg0, %arg1) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        "llvm.store"(%0, %arg2) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "foo", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "omp_sections_with_clauses", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "omp.sections"() <{nowait, operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
      "omp.section"() ({
        "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.section"() ({
        "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64, i64, i64, i1)>, linkage = #llvm.linkage<external>, sym_name = "repeated_successor", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i1):
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg0, %arg1, %arg2) ({
      ^bb0(%arg4: i64):
        "llvm.cond_br"(%arg3, %arg0, %arg1)[^bb1, ^bb1] <{operandSegmentSizes = array<i32: 1, 1, 1>}> : (i1, i64, i64) -> ()
      ^bb1(%0: i64):  // 2 preds: ^bb0, ^bb0
        "omp.yield"() : () -> ()
      }) : (i64, i64, i64) -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, ptr)>, linkage = #llvm.linkage<external>, sym_name = "single", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: !llvm.ptr):
    %0 = "llvm.sub"(%arg0, %arg1) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    "llvm.store"(%0, %arg2) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    "omp.single"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
      %2 = "llvm.add"(%arg0, %arg1) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      "llvm.store"(%2, %arg2) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    %1 = "llvm.mul"(%arg0, %arg1) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    "llvm.store"(%1, %arg2) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, ptr)>, linkage = #llvm.linkage<external>, sym_name = "single_nowait", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: !llvm.ptr):
    %0 = "llvm.sub"(%arg0, %arg1) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    "llvm.store"(%0, %arg2) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    "omp.single"() <{nowait, operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
      %2 = "llvm.add"(%arg0, %arg1) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      "llvm.store"(%2, %arg2) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    %1 = "llvm.mul"(%arg0, %arg1) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    "llvm.store"(%1, %arg2) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "copy_i32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "copy_f32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "single_copyprivate", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    "omp.single"(%arg0, %arg1) <{copyprivate_syms = [@copy_i32, @copy_f32], operandSegmentSizes = array<i32: 0, 0, 2, 0>}> ({
      %0 = "llvm.load"(%arg0) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
      %1 = "llvm.add"(%0, %0) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      "llvm.store"(%1, %arg0) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      %2 = "llvm.load"(%arg1) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
      %3 = "llvm.fadd"(%2, %2) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
      "llvm.store"(%3, %arg1) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "omp_threadprivate", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32
    %2 = "llvm.mlir.constant"() <{value = 3 : i32}> : () -> i32
    %3 = "llvm.mlir.addressof"() <{global_name = @_QFsubEx}> : () -> !llvm.ptr
    %4 = "omp.threadprivate"(%3) : (!llvm.ptr) -> !llvm.ptr
    "llvm.store"(%0, %4) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      %5 = "omp.threadprivate"(%3) : (!llvm.ptr) -> !llvm.ptr
      "llvm.store"(%1, %5) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.store"(%2, %4) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<internal>, sym_name = "_QFsubEx", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "omp_task_detach", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    "omp.task"(%arg0) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 1>}> ({
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, ptr)>, linkage = #llvm.linkage<external>, sym_name = "omp_task", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: !llvm.ptr):
    "omp.task"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
      %1 = "llvm.alloca"(%0) <{elem_type = i32}> : (i64) -> !llvm.ptr
      %2 = "llvm.load"(%1) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
      %3 = "llvm.add"(%2, %2) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      "llvm.store"(%3, %1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "omp_task_attrs", target_cpu = "x86-64", target_features = #llvm.target_features<["+mmx", "+sse"]>, unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "omp.task"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "omp_task_with_deps", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    "omp.task"(%arg0) <{depend_kinds = [#omp<clause_task_depend(taskdependin)>], operandSegmentSizes = array<i32: 0, 0, 1, 0, 0, 0, 0, 0, 0>}> ({
      %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
      %1 = "llvm.alloca"(%0) <{elem_type = i32}> : (i64) -> !llvm.ptr
      %2 = "llvm.load"(%1) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
      %3 = "llvm.add"(%2, %2) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      "llvm.store"(%3, %1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "omp.task"(%arg0) <{depend_kinds = [#omp<clause_task_depend(taskdependout)>], operandSegmentSizes = array<i32: 0, 0, 1, 0, 0, 0, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "omp.task"(%arg0) <{depend_kinds = [#omp<clause_task_depend(taskdependinout)>], operandSegmentSizes = array<i32: 0, 0, 1, 0, 0, 0, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "omp.task"(%arg0) <{depend_kinds = [#omp<clause_task_depend(taskdependmutexinoutset)>], operandSegmentSizes = array<i32: 0, 0, 1, 0, 0, 0, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "omp.task"(%arg0) <{depend_kinds = [#omp<clause_task_depend(taskdependinoutset)>], operandSegmentSizes = array<i32: 0, 0, 1, 0, 0, 0, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, ptr)>, linkage = #llvm.linkage<external>, sym_name = "omp_task", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: !llvm.ptr):
    %0 = "llvm.sub"(%arg0, %arg1) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    "llvm.store"(%0, %arg2) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    "omp.task"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      %2 = "llvm.add"(%arg0, %arg1) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      "llvm.store"(%2, %arg2) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    %1 = "llvm.mul"(%arg0, %arg1) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    "llvm.store"(%1, %arg2) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) {llvm.target_triple = "x86_64-unknown-linux-gnu"} : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "a"}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "par_task_", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    "omp.task"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
        "llvm.store"(%0, %arg0) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "foo", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "destroy", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "privatizer", type = i32}> ({
  }, {
  ^bb0(%arg3: !llvm.ptr, %arg4: !llvm.ptr):
    %0 = "llvm.load"(%arg3) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    "llvm.store"(%0, %arg4) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    "omp.yield"(%arg4) : (!llvm.ptr) -> ()
  }, {
  ^bb0(%arg2: !llvm.ptr):
    "llvm.call"(%arg2) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @destroy, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
    "omp.yield"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "task", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    "omp.task"(%arg0) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 1, 0>, private_syms = [@privatizer]}> ({
    ^bb0(%arg1: !llvm.ptr):
      "llvm.call"(%arg1) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "foo", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, ptr)>, linkage = #llvm.linkage<external>, sym_name = "omp_taskgroup", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: !llvm.ptr):
    "omp.taskgroup"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> ({
      "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "foo", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, ptr)>, linkage = #llvm.linkage<external>, sym_name = "bar", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, ptr)>, linkage = #llvm.linkage<external>, sym_name = "omp_taskgroup_task", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: !llvm.ptr):
    "omp.taskgroup"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> ({
      %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i32
      %1 = "llvm.alloca"(%0) <{elem_type = i8}> : (i32) -> !llvm.ptr
      "omp.task"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
        "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.task"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
        "llvm.call"(%arg0, %arg1, %arg2) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @bar, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 3, 0>}> : (i32, i32, !llvm.ptr) -> ()
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "llvm.br"()[^bb1] : () -> ()
    ^bb1:  // pred: ^bb0
      "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_01", sym_visibility = "private", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_02", sym_visibility = "private", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QPomp_task_priority", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "x"} : (i64) -> !llvm.ptr
    %2 = "llvm.mlir.constant"() <{value = 4 : i32}> : () -> i32
    %3 = "llvm.mlir.constant"() <{value = true}> : () -> i1
    %4 = "llvm.load"(%1) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    "omp.task"(%4) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 1, 0, 0>}> ({
      "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @test_01, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
      "omp.terminator"() : () -> ()
    }) : (i32) -> ()
    "omp.task"(%3, %2) <{operandSegmentSizes = array<i32: 0, 0, 0, 1, 0, 0, 1, 0, 0>}> ({
      "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @test_02, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
      "omp.terminator"() : () -> ()
    }) : (i1, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr, i32)>, linkage = #llvm.linkage<external>, sym_name = "omp_opaque_pointers", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: i32):
    "omp.atomic.read"(%arg0, %arg1) <{element_type = i32}> : (!llvm.ptr, !llvm.ptr) -> ()
    "omp.atomic.capture"() <{memory_order = #omp<memoryorderkind acq_rel>}> ({
      "omp.atomic.read"(%arg1, %arg0) <{element_type = i32}> : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.atomic.update"(%arg1) ({
      ^bb0(%arg3: i32):
        %0 = "llvm.add"(%arg3, %arg2) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        "omp.yield"(%0) : (i32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) {omp.flags = #omp.flags<debug_kind = 1, assume_teams_oversubscription = true, assume_threads_oversubscription = true, assume_no_thread_state = true, assume_no_nested_parallelism = true>} : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) {omp.flags = #omp.flags<>} : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) {omp.flags = #omp.flags<openmp_device_version = 51>} : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) {omp.flags = #omp.flags<>, omp.version = #omp.version<version = 50>} : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) {omp.version = #omp.version<version = 51>} : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) {omp.flags = #omp.flags<>} : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) {omp.flags = #omp.flags<assume_teams_oversubscription = true, assume_no_thread_state = true>} : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) {omp.flags = #omp.flags<assume_teams_oversubscription = true, assume_no_thread_state = true, no_gpu_lib = true>} : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "filter_nohost", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (nohost), capture_clause = (to)>} : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "filter_host", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (to)>} : () -> ()
}) {omp.is_target_device = false} : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "filter_nohost", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (nohost), capture_clause = (enter)>} : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "filter_host", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (enter)>} : () -> ()
}) {omp.is_target_device = false} : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "filter_nohost", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (nohost), capture_clause = (to)>} : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "filter_host", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (to)>} : () -> ()
}) {omp.is_target_device = true} : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "filter_nohost", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (nohost), capture_clause = (enter)>} : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "filter_host", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (enter)>} : () -> ()
}) {omp.is_target_device = true} : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "omp_task_untied", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "omp.task"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0>, untied}> ({
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "omp_task_mergeable", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "omp.task"() <{mergeable, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "foo_before", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "foo", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "foo_after", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i1)>, linkage = #llvm.linkage<external>, sym_name = "omp_task_final", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i1):
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo_before, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "omp.task"(%arg0) <{operandSegmentSizes = array<i32: 0, 0, 0, 1, 0, 0, 0, 0, 0>}> ({
      "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
      "omp.terminator"() : () -> ()
    }) : (i1) -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo_after, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "foo_before", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "foo", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "foo_after", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i1)>, linkage = #llvm.linkage<external>, sym_name = "omp_task_if", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i1):
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo_before, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "omp.task"(%arg0) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0, 0, 0, 0>}> ({
      "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
      "omp.terminator"() : () -> ()
    }) : (i1) -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo_after, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) {omp.requires = #omp<clause_requires reverse_offload|unified_shared_memory>} : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "distribute", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 42 : index}> : () -> i64
    %1 = "llvm.mlir.constant"() <{value = 10 : index}> : () -> i64
    %2 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    "omp.distribute"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%1, %0, %2) ({
      ^bb0(%arg0: i64):
        "omp.yield"() : () -> ()
      }) : (i64, i64, i64) -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "distribute_wsloop", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i32):
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.distribute"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
        "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
          "omp.loop_nest"(%arg0, %arg1, %arg2) ({
          ^bb0(%arg3: i32):
            "omp.yield"() : () -> ()
          }) : (i32, i32, i32) -> ()
        }) {omp.composite} : () -> ()
      }) {omp.composite} : () -> ()
      "omp.terminator"() : () -> ()
    }) {omp.composite} : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFEx_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "nested_task_with_deps", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "x"} : (i64) -> !llvm.ptr
    %2 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    "omp.parallel"(%1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0>, private_syms = [@_QFEx_private_i32]}> ({
    ^bb0(%arg0: !llvm.ptr):
      "omp.task"(%arg0) <{depend_kinds = [#omp<clause_task_depend(taskdependout)>], operandSegmentSizes = array<i32: 0, 0, 1, 0, 0, 0, 0, 0, 0>}> ({
        "omp.terminator"() : () -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

