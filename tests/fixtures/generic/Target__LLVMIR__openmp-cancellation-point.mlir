"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "cancellation_point_parallel", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.cancellation_point"() <{cancel_directive = #omp<cancellationconstructtype parallel>}> : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "cancellation_point_sections", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "omp.sections"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
      "omp.section"() ({
        "omp.cancellation_point"() <{cancel_directive = #omp<cancellationconstructtype sections>}> : () -> ()
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "cancellation_point_wsloop", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i32):
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg0, %arg1, %arg2) ({
      ^bb0(%arg3: i32):
        "omp.cancellation_point"() <{cancel_directive = #omp<cancellationconstructtype loop>}> : () -> ()
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "cancellation_point_taskgroup", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "omp.taskgroup"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> ({
      "omp.task"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
        "omp.cancellation_point"() <{cancel_directive = #omp<cancellationconstructtype taskgroup>}> : () -> ()
        "omp.terminator"() : () -> ()
      }) : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

