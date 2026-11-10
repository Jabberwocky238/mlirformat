"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "n"}, {fir.bindc_name = "r"}], function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "foo_", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: !llvm.ptr, %arg3: !llvm.ptr):
    %1 = "llvm.mlir.constant"() <{value = false}> : () -> i1
    "omp.task"(%arg2, %1) <{depend_iterated_kinds = [], depend_kinds = [#omp<clause_task_depend(taskdependin)>], operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0>}> ({
      %2 = "llvm.load"(%arg2) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
      "llvm.store"(%2, %arg3) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, i1) -> ()
    "llvm.return"() : () -> ()
  }) {fir.internal_name = "_QPfoo"} : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "n"}, {fir.bindc_name = "ev"}], function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "foo_detach_if_false", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = false}> : () -> i1
    "omp.task"(%arg0, %0, %arg1) <{depend_iterated_kinds = [], depend_kinds = [#omp<clause_task_depend(taskdependin)>], operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1>}> ({
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, i1, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

