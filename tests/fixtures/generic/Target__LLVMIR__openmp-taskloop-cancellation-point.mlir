"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFtestEi_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "_QFtestEarg_firstprivate_i32", type = i32}> ({
  ^bb0(%arg11: !llvm.ptr, %arg12: !llvm.ptr):
    "llvm.call"(%arg11, %arg12) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_init, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>}> : (!llvm.ptr, !llvm.ptr) -> ()
    "omp.yield"(%arg12) : (!llvm.ptr) -> ()
  }, {
  ^bb0(%arg9: !llvm.ptr, %arg10: !llvm.ptr):
    "llvm.call"(%arg9, %arg10) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_copy, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>}> : (!llvm.ptr, !llvm.ptr) -> ()
    "omp.yield"(%arg10) : (!llvm.ptr) -> ()
  }, {
  ^bb0(%arg8: !llvm.ptr):
    "llvm.call"(%arg8) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_dealloc, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
    "omp.yield"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "arg", llvm.noalias, llvm.nocapture}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "_QPtest", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: !llvm.ptr):
    %4 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %5 = "llvm.mlir.constant"() <{value = 100 : i32}> : () -> i32
    %6 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %7 = "llvm.alloca"(%6) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr
    "omp.taskloop"(%arg4, %7) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 2, 0>, private_syms = [@_QFtestEarg_firstprivate_i32, @_QFtestEi_private_i32]}> ({
    ^bb0(%arg5: !llvm.ptr, %arg6: !llvm.ptr):
      "omp.loop_nest"(%4, %5, %4) <{loop_inclusive}> ({
      ^bb0(%arg7: i32):
        "llvm.store"(%arg7, %arg6) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
        "llvm.call"(%arg5) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_QPbefore, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
        "omp.cancellation_point"() <{cancel_directive = #omp<cancellationconstructtype taskgroup>}> : () -> ()
        "llvm.call"(%arg5) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_QPafter, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "arg", llvm.noalias, llvm.nocapture}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "_QPtest2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "llvm.mlir.constant"() <{value = 100 : i32}> : () -> i32
    %2 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %3 = "llvm.alloca"(%2) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr
    "omp.taskgroup"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> ({
      "omp.taskloop"(%arg0, %3) <{nogroup, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 2, 0>, private_syms = [@_QFtestEarg_firstprivate_i32, @_QFtestEi_private_i32]}> ({
      ^bb0(%arg1: !llvm.ptr, %arg2: !llvm.ptr):
        "omp.loop_nest"(%0, %1, %0) <{loop_inclusive}> ({
        ^bb0(%arg3: i32):
          "llvm.store"(%arg3, %arg2) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
          "llvm.call"(%arg1) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_QPbefore, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
          "omp.cancellation_point"() <{cancel_directive = #omp<cancellationconstructtype taskgroup>}> : () -> ()
          "llvm.call"(%arg1) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_QPafter, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
          "omp.yield"() : () -> ()
        }) : (i32, i32, i32) -> ()
      }) : (!llvm.ptr, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
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

