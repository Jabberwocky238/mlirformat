"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "foo", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "critical_block_arg"}> ({
    "omp.critical"() ({
    ^bb0(%arg0: index, %arg1: index):
      "func.call"(%arg0, %arg1) <{callee = @foo}> : (index, index) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "omp.critical.declare"() <{hint = 10 : i64, sym_name = "mutex"}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "critical_declare"}> ({
    "omp.critical"() <{name = @mutex}> ({
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "master_block_arg"}> ({
    "omp.master"() ({
    ^bb0(%arg0: index, %arg1: index):
      "test.payload"(%arg0, %arg1) : (index, index) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "branch_loop"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "cf.br"(%0, %1)[^bb1] : (index, index) -> ()
    ^bb1(%2: index, %3: index):  // 2 preds: ^bb0, ^bb2
      %4 = "arith.cmpi"(%2, %3) <{predicate = 2 : i64}> : (index, index) -> i1
      "cf.cond_br"(%4, %1, %1)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 2, 0>}> : (i1, index, index) -> ()
    ^bb2(%5: index, %6: index):  // pred: ^bb1
      "cf.br"(%5, %6)[^bb1] : (index, index) -> ()
    ^bb3:  // pred: ^bb1
      "omp.flush"() : () -> ()
      "omp.barrier"() : () -> ()
      "omp.taskwait"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
      "omp.taskyield"() : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index, index, index) -> (), sym_name = "wsloop"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index):
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
        "omp.loop_nest"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5) ({
        ^bb0(%arg6: index, %arg7: index):
          "test.payload"(%arg6, %arg7) : (index, index) -> ()
          "omp.yield"() : () -> ()
        }) : (index, index, index, index, index, index) -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!llvm.ptr) -> (), sym_name = "atomic_write"}> ({
  ^bb0(%arg0: !llvm.ptr):
    %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    "omp.atomic.write"(%arg0, %0) <{hint = 0 : i64, memory_order = #omp<memoryorderkind relaxed>}> : (!llvm.ptr, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!llvm.ptr, !llvm.ptr) -> (), sym_name = "atomic_read"}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    "omp.atomic.read"(%arg0, %arg1) <{element_type = i32, hint = 2 : i64, memory_order = #omp<memoryorderkind acquire>}> : (!llvm.ptr, !llvm.ptr) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "atomic_update"}> ({
    %1 = "llvm.mlir.addressof"() <{global_name = @_QFsEc}> : () -> !llvm.ptr
    "omp.atomic.update"(%1) ({
    ^bb0(%arg0: i32):
      %2 = "arith.constant"() <{value = 1 : i32}> : () -> i32
      %3 = "arith.addi"(%arg0, %2) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "omp.yield"(%3) : (i32) -> ()
    }) : (!llvm.ptr) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<internal>, sym_name = "_QFsEc", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "arith.constant"() <{value = 10 : i32}> : () -> i32
    "llvm.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!llvm.ptr) -> (), sym_name = "threadprivate"}> ({
  ^bb0(%arg0: !llvm.ptr):
    %0 = "omp.threadprivate"(%arg0) : (!llvm.ptr) -> !llvm.ptr
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32, index) -> (), sym_name = "loop_nest_block_arg"}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: index):
    "omp.simd"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg0, %arg1, %arg0) <{loop_inclusive}> ({
      ^bb0(%arg3: i32):
        "cf.br"(%arg2)[^bb1] : (index) -> ()
      ^bb1(%0: index):  // 2 preds: ^bb0, ^bb2
        %1 = "arith.cmpi"(%0, %arg2) <{predicate = 2 : i64}> : (index, index) -> i1
        "cf.cond_br"(%1)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^bb2:  // pred: ^bb1
        %2 = "arith.addi"(%0, %arg2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        "cf.br"(%2)[^bb1] : (index) -> ()
      ^bb3:  // pred: ^bb1
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!llvm.ptr) -> (), sym_name = "task_depend"}> ({
  ^bb0(%arg0: !llvm.ptr):
    "omp.task"(%arg0) <{depend_iterated_kinds = [], depend_kinds = [#omp<clause_task_depend(taskdependin)>], operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr, ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "_QPomp_target_data", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: !llvm.ptr):
    %0 = "omp.map.info"(%arg0) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %1 = "omp.map.info"(%arg1) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %2 = "omp.map.info"(%arg2) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags storage|always>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target_enter_data"(%0, %1, %2) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 3, 0>}> : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    %3 = "omp.map.info"(%arg0) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %4 = "omp.map.info"(%arg1) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %5 = "omp.map.info"(%arg2) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags storage>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %6 = "omp.map.info"(%arg3) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags always|del>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target_exit_data"(%3, %4, %5, %6) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 4, 0>}> : (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "_QPomp_target_data_region", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = "omp.map.info"(%arg0) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = !llvm.array<1024 x i32>}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target_data"(%0) <{operandSegmentSizes = array<i32: 0, 0, 1, 0, 0, 0>}> ({
      %1 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32
      "llvm.store"(%1, %arg1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "_QPomp_target", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 64 : i32}> : () -> i32
    %1 = "omp.map.info"(%arg0) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = !llvm.array<1024 x i32>}> : (!llvm.ptr) -> !llvm.ptr
    %2 = "omp.map.info"(%arg1) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags storage|implicit>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%1, %2, %0) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 1>}> ({
    ^bb0(%arg2: !llvm.ptr, %arg3: !llvm.ptr):
      %3 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32
      "llvm.store"(%3, %arg3) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QPsb", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i64
    %1 = "llvm.mlir.constant"() <{value = 10 : i64}> : () -> i64
    %2 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    "omp.sections"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
      "omp.section"() ({
        "llvm.br"(%1)[^bb1] : (i64) -> ()
      ^bb1(%3: i64):  // 2 preds: ^bb0, ^bb2
        %4 = "llvm.icmp"(%3, %0) <{predicate = 4 : i64}> : (i64, i64) -> i1
        "llvm.cond_br"(%4)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
      ^bb2:  // pred: ^bb1
        %5 = "llvm.sub"(%3, %2) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
        "llvm.br"(%5)[^bb1] : (i64) -> ()
      ^bb3:  // pred: ^bb1
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "eqv_reduction", type = i32}> ({
  }, {
  ^bb0(%arg5: i32):
    %20 = "llvm.mlir.constant"() <{value = true}> : () -> i1
    %21 = "llvm.zext"(%20) : (i1) -> i32
    "omp.yield"(%21) : (i32) -> ()
  }, {
  ^bb0(%arg3: i32, %arg4: i32):
    %15 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i32
    %16 = "llvm.icmp"(%arg3, %15) <{predicate = 1 : i64}> : (i32, i32) -> i1
    %17 = "llvm.icmp"(%arg4, %15) <{predicate = 1 : i64}> : (i32, i32) -> i1
    %18 = "llvm.icmp"(%16, %17) <{predicate = 0 : i64}> : (i1, i1) -> i1
    %19 = "llvm.zext"(%18) : (i1) -> i32
    "omp.yield"(%19) : (i32) -> ()
  }, {
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "y"}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "_QPsimple_reduction", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 100 : i32}> : () -> i32
    %1 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %2 = "llvm.mlir.constant"() <{value = true}> : () -> i1
    %3 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %4 = "llvm.alloca"(%3) <{elem_type = i32}> {bindc_name = "x", uniq_name = "_QFsimple_reductionEx"} : (i64) -> !llvm.ptr
    %5 = "llvm.zext"(%2) : (i1) -> i32
    "llvm.store"(%5, %4) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      %6 = "llvm.alloca"(%3) <{elem_type = i32}> {adapt.valuebyref, in_type = i32, operandSegmentSizes = array<i32: 0, 0>, pinned} : (i64) -> !llvm.ptr
      "omp.wsloop"(%4) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0>, reduction_byref = array<i1: false>, reduction_syms = [@eqv_reduction]}> ({
      ^bb0(%arg1: !llvm.ptr):
        "omp.loop_nest"(%1, %0, %1) <{loop_inclusive}> ({
        ^bb0(%arg2: i32):
          "llvm.store"(%arg2, %6) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
          %7 = "llvm.load"(%6) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
          %8 = "llvm.sext"(%7) : (i32) -> i64
          %9 = "llvm.sub"(%8, %3) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
          %10 = "llvm.getelementptr"(%arg0, %9) <{elem_type = !llvm.array<100 x i32>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
          %11 = "llvm.load"(%10) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
          %12 = "llvm.load"(%arg1) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
          %13 = "llvm.icmp"(%11, %12) <{predicate = 0 : i64}> : (i32, i32) -> i1
          %14 = "llvm.zext"(%13) : (i1) -> i32
          "llvm.store"(%14, %arg1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
          "omp.yield"() : () -> ()
        }) : (i32, i32, i32) -> ()
      }) : (!llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QQmain", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
    %1 = "llvm.mlir.constant"() <{value = 5 : index}> : () -> i64
    %2 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %3 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %4 = "llvm.alloca"(%3) <{elem_type = i32}> : (i64) -> !llvm.ptr
    "omp.taskgroup"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> ({
      %5 = "llvm.trunc"(%2) <{overflowFlags = 0 : i32}> : (i64) -> i32
      "llvm.br"(%5, %1)[^bb1] : (i32, i64) -> ()
    ^bb1(%6: i32, %7: i64):  // 2 preds: ^bb0, ^bb2
      %8 = "llvm.icmp"(%7, %0) <{predicate = 4 : i64}> : (i64, i64) -> i1
      "llvm.cond_br"(%8)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
    ^bb2:  // pred: ^bb1
      "llvm.store"(%6, %4) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.task"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
        "llvm.call"(%4) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_QFPdo_work, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
        "omp.terminator"() : () -> ()
      }) : () -> ()
      %9 = "llvm.load"(%4) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
      %10 = "llvm.add"(%9, %5) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
      %11 = "llvm.sub"(%7, %2) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
      "llvm.br"(%10, %11)[^bb1] : (i32, i64) -> ()
    ^bb3:  // pred: ^bb1
      "llvm.store"(%6, %4) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "i"}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "_QFPdo_work", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "sub_", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i64
    %1 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %2 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %3 = "llvm.alloca"(%2) <{elem_type = i32}> {bindc_name = "i", in_type = i32, operandSegmentSizes = array<i32: 0, 0>, uniq_name = "_QFsubEi"} : (i64) -> !llvm.ptr
    "omp.ordered.region"() ({
      %4 = "llvm.trunc"(%1) <{overflowFlags = 0 : i32}> : (i64) -> i32
      "llvm.br"(%4, %1)[^bb1] : (i32, i64) -> ()
    ^bb1(%5: i32, %6: i64):  // 2 preds: ^bb0, ^bb2
      %7 = "llvm.icmp"(%6, %0) <{predicate = 4 : i64}> : (i64, i64) -> i1
      "llvm.cond_br"(%7)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
    ^bb2:  // pred: ^bb1
      "llvm.store"(%5, %3) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      %8 = "llvm.load"(%3) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
      %9 = "arith.addi"(%8, %4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %10 = "arith.subi"(%6, %1) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      "llvm.br"(%9, %10)[^bb1] : (i32, i64) -> ()
    ^bb3:  // pred: ^bb1
      "llvm.store"(%5, %3) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "_QPtarget_map_with_bounds", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 4 : index}> : () -> i64
    %1 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %2 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %3 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %4 = "omp.map.bounds"(%1, %0, %3, %3) <{operandSegmentSizes = array<i32: 1, 1, 0, 1, 1>, stride_in_bytes = false}> : (i64, i64, i64, i64) -> !omp.map_bounds_ty
    %5 = "omp.map.info"(%arg1, %4) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 1>, partial_map = false, var_ptr_type = !llvm.array<10 x i32>}> : (!llvm.ptr, !omp.map_bounds_ty) -> !llvm.ptr
    %6 = "llvm.mlir.constant"() <{value = 4 : index}> : () -> i64
    %7 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %8 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %9 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %10 = "omp.map.bounds"(%7, %6, %9, %9) <{operandSegmentSizes = array<i32: 1, 1, 0, 1, 1>, stride_in_bytes = false}> : (i64, i64, i64, i64) -> !omp.map_bounds_ty
    %11 = "omp.map.info"(%arg2, %10) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "", operandSegmentSizes = array<i32: 1, 0, 0, 1>, partial_map = false, var_ptr_type = !llvm.array<10 x i32>}> : (!llvm.ptr, !omp.map_bounds_ty) -> !llvm.ptr
    "omp.target"(%5, %11) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0>}> ({
    ^bb0(%arg3: !llvm.ptr, %arg4: !llvm.ptr):
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "x.privatizer", type = memref<?xf32>}> ({
  ^bb0(%arg0: memref<?xf32>, %arg1: memref<?xf32>):
    "omp.yield"(%arg0) : (memref<?xf32>) -> ()
  }, {
  }, {
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "y.privatizer", type = index}> ({
  }, {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    "omp.yield"(%arg0) : (!llvm.ptr) -> ()
  }, {
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "omp_cancel_cancellation_point"}> ({
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.cancel"() <{cancel_directive = #omp<cancellationconstructtype parallel>}> : () -> ()
      "omp.cancellation_point"() <{cancel_directive = #omp<cancellationconstructtype parallel>}> : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "omp_distribute"}> ({
  ^bb0(%arg0: index):
    "omp.distribute"(%arg0) <{dist_schedule_static, operandSegmentSizes = array<i32: 0, 0, 1, 0>}> ({
      "omp.loop_nest"(%arg0, %arg0, %arg0) ({
      ^bb0(%arg1: index):
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i32>) -> (), sym_name = "omp_teams"}> ({
  ^bb0(%arg0: memref<i32>):
    "omp.teams"(%arg0, %arg0) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (memref<i32>, memref<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "omp_ordered"}> ({
  ^bb0(%arg0: index):
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, ordered = 1 : i64}> ({
      "omp.loop_nest"(%arg0, %arg0, %arg0) ({
      ^bb0(%arg1: index):
        "omp.ordered"(%arg0) <{doacross_num_loops = 1 : i64}> : (index) -> ()
        "omp.yield"() : () -> ()
      }) : (index, index, index) -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<i32>) -> (), sym_name = "omp_taskloop"}> ({
  ^bb0(%arg0: index, %arg1: memref<i32>):
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.taskloop.context"(%arg1, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
        "omp.taskloop.wrapper"() ({
          "omp.loop_nest"(%arg0, %arg0, %arg0) ({
          ^bb0(%arg2: index):
            "test.payload"(%arg2) : (index) -> ()
            "omp.yield"() : () -> ()
          }) : (index, index, index) -> ()
        }) : () -> ()
        "omp.terminator"() : () -> ()
      }) {omp.combined} : (memref<i32>, memref<i32>) -> ()
      "omp.terminator"() : () -> ()
    }) {omp.combined} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "omp.declare_mapper"() <{sym_name = "my_mapper", type = !llvm.struct<"_QFdeclare_mapperTmy_type", (i32)>}> ({
  ^bb0(%arg2: !llvm.ptr):
    %4 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %5 = "llvm.getelementptr"(%arg2) <{elem_type = !llvm.struct<"_QFdeclare_mapperTmy_type", (i32)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr
    %6 = "omp.map.info"(%5) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, name = "var%data", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %7 = "omp.map.info"(%arg2, %6) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, members_index = [[0]], name = "var", operandSegmentSizes = array<i32: 1, 0, 1, 0>, partial_map = true, var_ptr_type = !llvm.struct<"_QFdeclare_mapperTmy_type", (i32)>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.ptr
    "omp.declare_mapper.info"(%7, %6) <{operandSegmentSizes = array<i32: 2, 0>}> : (!llvm.ptr, !llvm.ptr) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "omp_dist_schedule"}> ({
  ^bb0(%arg0: i32):
    %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 1024 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 16 : i32}> : () -> i32
    %3 = "arith.constant"() <{value = 8 : i32}> : () -> i32
    "omp.teams"(%3, %2) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 1>}> ({
      "omp.distribute"(%1) <{dist_schedule_static, operandSegmentSizes = array<i32: 0, 0, 1, 0>}> ({
        "omp.loop_nest"(%0, %arg0, %0) <{loop_inclusive}> ({
        ^bb0(%arg1: i32):
          "omp.terminator"() : () -> ()
        }) : (i32, i32, i32) -> ()
      }) : (i32) -> ()
      "omp.terminator"() : () -> ()
    }) : (i32, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

