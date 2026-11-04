"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFtestEi_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "_QFtestEarg_firstprivate_i32", type = i32}> ({
  ^bb0(%arg15: !llvm.ptr, %arg16: !llvm.ptr):
    "llvm.call"(%arg15, %arg16) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_init, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>}> : (!llvm.ptr, !llvm.ptr) -> ()
    "omp.yield"(%arg16) : (!llvm.ptr) -> ()
  }, {
  ^bb0(%arg13: !llvm.ptr, %arg14: !llvm.ptr):
    "llvm.call"(%arg13, %arg14) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_copy, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>}> : (!llvm.ptr, !llvm.ptr) -> ()
    "omp.yield"(%arg14) : (!llvm.ptr) -> ()
  }, {
  ^bb0(%arg12: !llvm.ptr):
    "llvm.call"(%arg12) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_dealloc, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
    "omp.yield"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "arg", llvm.noalias, llvm.nocapture}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "_QPtest", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg8: !llvm.ptr):
    %9 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %10 = "llvm.mlir.constant"() <{value = 100 : i32}> : () -> i32
    %11 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %12 = "llvm.alloca"(%11) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr
    "omp.taskloop"(%arg8, %12) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 2, 0>, private_syms = [@_QFtestEarg_firstprivate_i32, @_QFtestEi_private_i32]}> ({
    ^bb0(%arg9: !llvm.ptr, %arg10: !llvm.ptr):
      "omp.loop_nest"(%9, %10, %9) <{loop_inclusive}> ({
      ^bb0(%arg11: i32):
        "llvm.store"(%arg11, %arg10) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
        "llvm.call"(%arg9) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_QPbefore, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
        "omp.cancel"() <{cancel_directive = #omp<cancellationconstructtype taskgroup>}> : () -> ()
        "llvm.call"(%arg9) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_QPafter, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "arg", llvm.noalias, llvm.nocapture}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "_QPtest2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: !llvm.ptr):
    %5 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %6 = "llvm.mlir.constant"() <{value = 100 : i32}> : () -> i32
    %7 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %8 = "llvm.alloca"(%7) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr
    "omp.taskgroup"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> ({
      "omp.taskloop"(%arg4, %8) <{nogroup, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 2, 0>, private_syms = [@_QFtestEarg_firstprivate_i32, @_QFtestEi_private_i32]}> ({
      ^bb0(%arg5: !llvm.ptr, %arg6: !llvm.ptr):
        "omp.loop_nest"(%5, %6, %5) <{loop_inclusive}> ({
        ^bb0(%arg7: i32):
          "llvm.store"(%arg7, %arg6) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
          "llvm.call"(%arg5) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_QPbefore, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
          "omp.cancel"() <{cancel_directive = #omp<cancellationconstructtype taskgroup>}> : () -> ()
          "llvm.call"(%arg5) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_QPafter, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
          "omp.yield"() : () -> ()
        }) : (i32, i32, i32) -> ()
      }) : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "arg", llvm.noalias, llvm.nocapture}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "_QPtest3", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "llvm.mlir.constant"() <{value = 100 : i32}> : () -> i32
    %2 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %3 = "llvm.alloca"(%2) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr
    "omp.taskloop"(%arg0, %3) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 2, 0>, private_syms = [@_QFtestEarg_firstprivate_i32, @_QFtestEi_private_i32]}> ({
    ^bb0(%arg1: !llvm.ptr, %arg2: !llvm.ptr):
      "omp.loop_nest"(%0, %1, %0) <{loop_inclusive}> ({
      ^bb0(%arg3: i32):
        "llvm.store"(%arg3, %arg2) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
        "llvm.call"(%arg1) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_QPbefore, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
        %4 = "llvm.mlir.constant"() <{value = true}> : () -> i1
        "omp.cancel"(%4) <{cancel_directive = #omp<cancellationconstructtype taskgroup>}> : (i1) -> ()
        "llvm.call"(%arg1) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_QPafter, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "_QPbefore", sym_visibility = "private", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "_QPafter", sym_visibility = "private", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "_init", sym_visibility = "private", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "_copy", sym_visibility = "private", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "_dealloc", sym_visibility = "private", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) : () -> ()

