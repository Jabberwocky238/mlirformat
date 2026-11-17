"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "cancel_parallel", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.cancel"() <{cancel_directive = #omp<cancellationconstructtype parallel>}> : () -> () loc("<stdin>":4:7)
      "omp.terminator"() : () -> () loc("<stdin>":5:7)
    }) : () -> () loc("<stdin>":3:5)
    "llvm.return"() : () -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i1)>, linkage = #llvm.linkage<external>, sym_name = "cancel_parallel_if", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg10: i1 loc("<stdin>":10:8)):
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.cancel"(%arg10) <{cancel_directive = #omp<cancellationconstructtype parallel>}> : (i1) -> () loc("<stdin>":12:7)
      "omp.terminator"() : () -> () loc("<stdin>":13:7)
    }) : () -> () loc("<stdin>":11:5)
    "llvm.return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":9:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i1)>, linkage = #llvm.linkage<external>, sym_name = "cancel_sections_if", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg9: i1 loc("<stdin>":18:8)):
    "omp.sections"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
      "omp.section"() ({
        "omp.cancel"(%arg9) <{cancel_directive = #omp<cancellationconstructtype sections>}> : (i1) -> () loc("<stdin>":21:9)
        "omp.terminator"() : () -> () loc("<stdin>":22:9)
      }) : () -> () loc("<stdin>":20:7)
      "omp.terminator"() : () -> () loc("<stdin>":24:7)
    }) : () -> () loc("<stdin>":19:5)
    "llvm.return"() : () -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":17:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, i32, i1)>, linkage = #llvm.linkage<external>, sym_name = "cancel_wsloop_if", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: i32 loc("<stdin>":29:8), %arg5: i32 loc("<stdin>":29:20), %arg6: i32 loc("<stdin>":29:32), %arg7: i1 loc("<stdin>":29:44)):
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg4, %arg5, %arg6) ({
      ^bb0(%arg8: i32 loc("<stdin>":32:12)):
        "omp.cancel"(%arg7) <{cancel_directive = #omp<cancellationconstructtype loop>}> : (i1) -> () loc("<stdin>":33:9)
        "omp.yield"() : () -> () loc("<stdin>":34:9)
      }) : (i32, i32, i32) -> () loc("<stdin>":31:7)
    }) : () -> () loc("<stdin>":30:5)
    "llvm.return"() : () -> () loc("<stdin>":37:5)
  }) : () -> () loc("<stdin>":28:3)
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "i32_priv", type = i32}> ({
  }, {
  ^bb0(%arg2: !llvm.ptr loc("<stdin>":41:8), %arg3: !llvm.ptr loc("<stdin>":41:26)):
    %0 = "llvm.load"(%arg2) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":42:10)
    "llvm.store"(%0, %arg3) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":43:5)
    "omp.yield"(%arg3) : (!llvm.ptr) -> () loc("<stdin>":44:5)
  }, {
  }) : () -> () loc("<stdin>":39:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "do_something", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":47:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "cancel_taskgroup", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":50:8)):
    "omp.taskgroup"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> ({
      "omp.task"(%arg0) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0>, private_syms = [@i32_priv]}> ({
      ^bb0(%arg1: !llvm.ptr loc("<stdin>":53:12)):
        "omp.cancel"() <{cancel_directive = #omp<cancellationconstructtype taskgroup>}> : () -> () loc("<stdin>":54:9)
        "llvm.call"(%arg1) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @do_something, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> () loc("<stdin>":55:9)
        "omp.terminator"() : () -> () loc("<stdin>":56:9)
      }) : (!llvm.ptr) -> () loc("<stdin>":52:7)
      "omp.terminator"() : () -> () loc("<stdin>":58:7)
    }) : () -> () loc("<stdin>":51:5)
    "llvm.return"() : () -> () loc("<stdin>":60:5)
  }) : () -> () loc("<stdin>":49:3)
}) : () -> () loc("<stdin>":1:1)
