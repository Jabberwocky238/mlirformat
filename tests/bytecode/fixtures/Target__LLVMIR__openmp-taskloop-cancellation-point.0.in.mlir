"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFtestEi_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "_QFtestEarg_firstprivate_i32", type = i32}> ({
  ^bb0(%arg11: !llvm.ptr loc("<stdin>":7:8), %arg12: !llvm.ptr loc("<stdin>":7:27)):
    "llvm.call"(%arg11, %arg12) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_init, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>}> : (!llvm.ptr, !llvm.ptr) -> () loc("<stdin>":8:5)
    "omp.yield"(%arg12) : (!llvm.ptr) -> () loc("<stdin>":9:5)
  }, {
  ^bb0(%arg9: !llvm.ptr loc("<stdin>":11:8), %arg10: !llvm.ptr loc("<stdin>":11:26)):
    "llvm.call"(%arg9, %arg10) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_copy, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>}> : (!llvm.ptr, !llvm.ptr) -> () loc("<stdin>":12:5)
    "omp.yield"(%arg10) : (!llvm.ptr) -> () loc("<stdin>":13:5)
  }, {
  ^bb0(%arg8: !llvm.ptr loc("<stdin>":15:8)):
    "llvm.call"(%arg8) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_dealloc, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> () loc("<stdin>":16:5)
    "omp.yield"() : () -> () loc("<stdin>":17:5)
  }) : () -> () loc("<stdin>":6:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "arg", llvm.noalias, llvm.nocapture}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "_QPtest", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: !llvm.ptr loc("<stdin>":20:8)):
    %4 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":21:10)
    %5 = "llvm.mlir.constant"() <{value = 100 : i32}> : () -> i32 loc("<stdin>":22:10)
    %6 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":23:10)
    %7 = "llvm.alloca"(%6) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr loc("<stdin>":24:10)
    "omp.taskloop.context"(%arg4, %7) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 2, 0>, private_syms = [@_QFtestEarg_firstprivate_i32, @_QFtestEi_private_i32]}> ({
    ^bb0(%arg5: !llvm.ptr loc("<stdin>":26:10), %arg6: !llvm.ptr loc("<stdin>":26:28)):
      "omp.taskloop.wrapper"() ({
        "omp.loop_nest"(%4, %5, %4) <{loop_inclusive}> ({
        ^bb0(%arg7: i32 loc("<stdin>":29:14)):
          "llvm.store"(%arg7, %arg6) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":30:11)
          "llvm.call"(%arg5) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_QPbefore, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> () loc("<stdin>":31:11)
          "omp.cancellation_point"() <{cancel_directive = #omp<cancellationconstructtype taskgroup>}> : () -> () loc("<stdin>":32:11)
          "llvm.call"(%arg5) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_QPafter, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> () loc("<stdin>":33:11)
          "omp.yield"() : () -> () loc("<stdin>":34:11)
        }) : (i32, i32, i32) -> () loc("<stdin>":28:9)
      }) : () -> () loc("<stdin>":27:7)
      "omp.terminator"() : () -> () loc("<stdin>":37:7)
    }) {omp.combined} : (!llvm.ptr, !llvm.ptr) -> () loc("<stdin>":25:5)
    "llvm.return"() : () -> () loc("<stdin>":39:5)
  }) : () -> () loc("<stdin>":19:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "arg", llvm.noalias, llvm.nocapture}], function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "_QPtest2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":42:8)):
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":43:10)
    %1 = "llvm.mlir.constant"() <{value = 100 : i32}> : () -> i32 loc("<stdin>":44:10)
    %2 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":45:10)
    %3 = "llvm.alloca"(%2) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr loc("<stdin>":46:10)
    "omp.taskgroup"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> ({
      "omp.taskloop.context"(%arg0, %3) <{nogroup, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 2, 0>, private_syms = [@_QFtestEarg_firstprivate_i32, @_QFtestEi_private_i32]}> ({
      ^bb0(%arg1: !llvm.ptr loc("<stdin>":49:12), %arg2: !llvm.ptr loc("<stdin>":49:30)):
        "omp.taskloop.wrapper"() ({
          "omp.loop_nest"(%0, %1, %0) <{loop_inclusive}> ({
          ^bb0(%arg3: i32 loc("<stdin>":52:16)):
            "llvm.store"(%arg3, %arg2) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":53:13)
            "llvm.call"(%arg1) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_QPbefore, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> () loc("<stdin>":54:13)
            "omp.cancellation_point"() <{cancel_directive = #omp<cancellationconstructtype taskgroup>}> : () -> () loc("<stdin>":55:13)
            "llvm.call"(%arg1) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_QPafter, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> () loc("<stdin>":56:13)
            "omp.yield"() : () -> () loc("<stdin>":57:13)
          }) : (i32, i32, i32) -> () loc("<stdin>":51:11)
        }) : () -> () loc("<stdin>":50:9)
        "omp.terminator"() : () -> () loc("<stdin>":60:9)
      }) {omp.combined} : (!llvm.ptr, !llvm.ptr) -> () loc("<stdin>":48:7)
      "omp.terminator"() : () -> () loc("<stdin>":62:7)
    }) : () -> () loc("<stdin>":47:5)
    "llvm.return"() : () -> () loc("<stdin>":64:5)
  }) : () -> () loc("<stdin>":41:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "_QPbefore", sym_visibility = "private", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":66:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "_QPafter", sym_visibility = "private", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":68:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "_init", sym_visibility = "private", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":70:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "_copy", sym_visibility = "private", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":72:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "_dealloc", sym_visibility = "private", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":74:3)
}) : () -> () loc("<stdin>":1:1)
