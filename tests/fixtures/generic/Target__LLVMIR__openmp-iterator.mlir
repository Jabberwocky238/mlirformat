"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.nocapture}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "task_affinity_iterator_1d", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg16: !llvm.ptr):
    %23 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %24 = "llvm.mlir.constant"() <{value = 4 : i64}> : () -> i64
    %25 = "llvm.mlir.constant"() <{value = 6 : i64}> : () -> i64
    %26 = "llvm.mlir.constant"() <{value = 4 : i64}> : () -> i64
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.single"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
        %27 = "omp.iterator"(%23, %23, %24, %25, %23, %23) <{operandSegmentSizes = array<i32: 2, 2, 2>}> ({
        ^bb0(%arg17: i64, %arg18: i64):
          %28 = "omp.affinity_entry"(%arg16, %26) : (!llvm.ptr, i64) -> !omp.affinity_entry_ty<!llvm.ptr, i64>
          "omp.yield"(%28) : (!omp.affinity_entry_ty<!llvm.ptr, i64>) -> ()
        }) : (i64, i64, i64, i64, i64, i64) -> !omp.iterated<!omp.affinity_entry_ty<!llvm.ptr, i64>>
        "omp.task"(%27) <{operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
          "omp.terminator"() : () -> ()
        }) : (!omp.iterated<!omp.affinity_entry_ty<!llvm.ptr, i64>>) -> ()
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.nocapture}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "task_affinity_iterator_3d", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg12: !llvm.ptr):
    %16 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %17 = "llvm.mlir.constant"() <{value = 2 : i64}> : () -> i64
    %18 = "llvm.mlir.constant"() <{value = 4 : i64}> : () -> i64
    %19 = "llvm.mlir.constant"() <{value = 6 : i64}> : () -> i64
    %20 = "llvm.mlir.constant"() <{value = 4 : i64}> : () -> i64
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.single"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
        %21 = "omp.iterator"(%16, %16, %16, %18, %19, %17, %16, %16, %16) <{operandSegmentSizes = array<i32: 3, 3, 3>}> ({
        ^bb0(%arg13: i64, %arg14: i64, %arg15: i64):
          %22 = "omp.affinity_entry"(%arg12, %20) : (!llvm.ptr, i64) -> !omp.affinity_entry_ty<!llvm.ptr, i64>
          "omp.yield"(%22) : (!omp.affinity_entry_ty<!llvm.ptr, i64>) -> ()
        }) : (i64, i64, i64, i64, i64, i64, i64, i64, i64) -> !omp.iterated<!omp.affinity_entry_ty<!llvm.ptr, i64>>
        "omp.task"(%21) <{operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
          "omp.terminator"() : () -> ()
        }) : (!omp.iterated<!omp.affinity_entry_ty<!llvm.ptr, i64>>) -> ()
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.nocapture}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "task_affinity_iterator_multiple", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg8: !llvm.ptr):
    %7 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %8 = "llvm.mlir.constant"() <{value = 3 : i64}> : () -> i64
    %9 = "llvm.mlir.constant"() <{value = 4 : i64}> : () -> i64
    %10 = "llvm.mlir.constant"() <{value = 6 : i64}> : () -> i64
    %11 = "llvm.mlir.constant"() <{value = 4 : i64}> : () -> i64
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.single"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
        %12 = "omp.iterator"(%7, %7, %9, %10, %7, %7) <{operandSegmentSizes = array<i32: 2, 2, 2>}> ({
        ^bb0(%arg10: i64, %arg11: i64):
          %15 = "omp.affinity_entry"(%arg8, %11) : (!llvm.ptr, i64) -> !omp.affinity_entry_ty<!llvm.ptr, i64>
          "omp.yield"(%15) : (!omp.affinity_entry_ty<!llvm.ptr, i64>) -> ()
        }) : (i64, i64, i64, i64, i64, i64) -> !omp.iterated<!omp.affinity_entry_ty<!llvm.ptr, i64>>
        %13 = "omp.iterator"(%7, %8, %7) <{operandSegmentSizes = array<i32: 1, 1, 1>}> ({
        ^bb0(%arg9: i64):
          %14 = "omp.affinity_entry"(%arg8, %11) : (!llvm.ptr, i64) -> !omp.affinity_entry_ty<!llvm.ptr, i64>
          "omp.yield"(%14) : (!omp.affinity_entry_ty<!llvm.ptr, i64>) -> ()
        }) : (i64, i64, i64) -> !omp.iterated<!omp.affinity_entry_ty<!llvm.ptr, i64>>
        "omp.task"(%12, %13) <{operandSegmentSizes = array<i32: 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
          "omp.terminator"() : () -> ()
        }) : (!omp.iterated<!omp.affinity_entry_ty<!llvm.ptr, i64>>, !omp.iterated<!omp.affinity_entry_ty<!llvm.ptr, i64>>) -> ()
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.nocapture}, {}, {}, {}, {}], function_type = !llvm.func<void (ptr, i64, i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "task_affinity_iterator_dynamic_tripcount", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: !llvm.ptr, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: i64):
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.single"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
        %5 = "omp.iterator"(%arg3, %arg4, %arg5) <{operandSegmentSizes = array<i32: 1, 1, 1>}> ({
        ^bb0(%arg7: i64):
          %6 = "omp.affinity_entry"(%arg2, %arg6) : (!llvm.ptr, i64) -> !omp.affinity_entry_ty<!llvm.ptr, i64>
          "omp.yield"(%6) : (!omp.affinity_entry_ty<!llvm.ptr, i64>) -> ()
        }) : (i64, i64, i64) -> !omp.iterated<!omp.affinity_entry_ty<!llvm.ptr, i64>>
        "omp.task"(%5) <{operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
          "omp.terminator"() : () -> ()
        }) : (!omp.iterated<!omp.affinity_entry_ty<!llvm.ptr, i64>>) -> ()
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.nocapture}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "task_affinity_iterator_negative_step", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 4 : i64}> : () -> i64
    %1 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %2 = "llvm.mlir.constant"() <{value = -1 : i64}> : () -> i64
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.single"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
        %3 = "omp.iterator"(%0, %1, %2) <{operandSegmentSizes = array<i32: 1, 1, 1>}> ({
        ^bb0(%arg1: i64):
          %4 = "omp.affinity_entry"(%arg0, %arg1) : (!llvm.ptr, i64) -> !omp.affinity_entry_ty<!llvm.ptr, i64>
          "omp.yield"(%4) : (!omp.affinity_entry_ty<!llvm.ptr, i64>) -> ()
        }) : (i64, i64, i64) -> !omp.iterated<!omp.affinity_entry_ty<!llvm.ptr, i64>>
        "omp.task"(%3) <{operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
          "omp.terminator"() : () -> ()
        }) : (!omp.iterated<!omp.affinity_entry_ty<!llvm.ptr, i64>>) -> ()
        "omp.terminator"() : () -> ()
      }) : () -> ()
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
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "omp_task_depend_iterator_simple", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg14: !llvm.ptr):
    %6 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %7 = "llvm.mlir.constant"() <{value = 10 : i64}> : () -> i64
    %8 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %9 = "omp.iterator"(%6, %7, %8) <{operandSegmentSizes = array<i32: 1, 1, 1>}> ({
    ^bb0(%arg15: i64):
      "omp.yield"(%arg14) : (!llvm.ptr) -> ()
    }) : (i64, i64, i64) -> !omp.iterated<!llvm.ptr>
    "omp.task"(%9) <{depend_iterated_kinds = [#omp<clause_task_depend(taskdependin)>], depend_kinds = [], operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (!omp.iterated<!llvm.ptr>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "omp_task_depend_iterator_mixed", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg11: !llvm.ptr, %arg12: !llvm.ptr):
    %2 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %3 = "llvm.mlir.constant"() <{value = 10 : i64}> : () -> i64
    %4 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %5 = "omp.iterator"(%2, %3, %4) <{operandSegmentSizes = array<i32: 1, 1, 1>}> ({
    ^bb0(%arg13: i64):
      "omp.yield"(%arg11) : (!llvm.ptr) -> ()
    }) : (i64, i64, i64) -> !omp.iterated<!llvm.ptr>
    "omp.task"(%arg12, %5) <{depend_iterated_kinds = [#omp<clause_task_depend(taskdependin)>], depend_kinds = [#omp<clause_task_depend(taskdependout)>], operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !omp.iterated<!llvm.ptr>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "omp_task_depend_iterator_dynamic", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg6: !llvm.ptr, %arg7: i64, %arg8: i64, %arg9: i64):
    %1 = "omp.iterator"(%arg7, %arg8, %arg9) <{operandSegmentSizes = array<i32: 1, 1, 1>}> ({
    ^bb0(%arg10: i64):
      "omp.yield"(%arg6) : (!llvm.ptr) -> ()
    }) : (i64, i64, i64) -> !omp.iterated<!llvm.ptr>
    "omp.task"(%1) <{depend_iterated_kinds = [#omp<clause_task_depend(taskdependin)>], depend_kinds = [], operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (!omp.iterated<!llvm.ptr>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr, i64, i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "omp_task_depend_iterator_dynamic_mixed", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: i64, %arg3: i64, %arg4: i64):
    %0 = "omp.iterator"(%arg2, %arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 1, 1>}> ({
    ^bb0(%arg5: i64):
      "omp.yield"(%arg0) : (!llvm.ptr) -> ()
    }) : (i64, i64, i64) -> !omp.iterated<!llvm.ptr>
    "omp.task"(%arg1, %0) <{depend_iterated_kinds = [#omp<clause_task_depend(taskdependin)>], depend_kinds = [#omp<clause_task_depend(taskdependout)>], operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0>}> ({
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !omp.iterated<!llvm.ptr>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "omp_target_depend_iterator", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.mlir.constant"() <{value = 10 : i64}> : () -> i64
    %2 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %3 = "omp.iterator"(%0, %1, %2) <{operandSegmentSizes = array<i32: 1, 1, 1>}> ({
    ^bb0(%arg2: i64):
      "omp.yield"(%arg0) : (!llvm.ptr) -> ()
    }) : (i64, i64, i64) -> !omp.iterated<!llvm.ptr>
    %4 = "omp.map.info"(%arg0) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to>, name = "data", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%3, %4) <{depend_iterated_kinds = [#omp<clause_task_depend(taskdependin)>], depend_kinds = [], kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
    ^bb0(%arg1: !llvm.ptr):
      "omp.terminator"() : () -> ()
    }) : (!omp.iterated<!llvm.ptr>, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) {omp.is_target_device = false, omp.target_triples = ["amdgcn-amd-amdhsa"]} : () -> ()

