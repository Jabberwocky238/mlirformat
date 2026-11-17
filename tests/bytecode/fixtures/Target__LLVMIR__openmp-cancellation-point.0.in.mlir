"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "cancellation_point_parallel", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "omp.cancellation_point"() <{cancel_directive = #omp<cancellationconstructtype parallel>}> : () -> () loc("<stdin>":4:7)
      "omp.terminator"() : () -> () loc("<stdin>":5:7)
    }) : () -> () loc("<stdin>":3:5)
    "llvm.return"() : () -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "cancellation_point_sections", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "omp.sections"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
      "omp.section"() ({
        "omp.cancellation_point"() <{cancel_directive = #omp<cancellationconstructtype sections>}> : () -> () loc("<stdin>":12:9)
        "omp.terminator"() : () -> () loc("<stdin>":13:9)
      }) : () -> () loc("<stdin>":11:7)
      "omp.terminator"() : () -> () loc("<stdin>":15:7)
    }) : () -> () loc("<stdin>":10:5)
    "llvm.return"() : () -> () loc("<stdin>":17:5)
  }) : () -> () loc("<stdin>":9:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "cancellation_point_wsloop", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32 loc("<stdin>":20:8), %arg1: i32 loc("<stdin>":20:20), %arg2: i32 loc("<stdin>":20:32)):
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg0, %arg1, %arg2) ({
      ^bb0(%arg3: i32 loc("<stdin>":23:12)):
        "omp.cancellation_point"() <{cancel_directive = #omp<cancellationconstructtype loop>}> : () -> () loc("<stdin>":24:9)
        "omp.yield"() : () -> () loc("<stdin>":25:9)
      }) : (i32, i32, i32) -> () loc("<stdin>":22:7)
    }) : () -> () loc("<stdin>":21:5)
    "llvm.return"() : () -> () loc("<stdin>":28:5)
  }) : () -> () loc("<stdin>":19:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "cancellation_point_taskgroup", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "omp.taskgroup"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> ({
      "omp.task"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
        "omp.cancellation_point"() <{cancel_directive = #omp<cancellationconstructtype taskgroup>}> : () -> () loc("<stdin>":33:9)
        "omp.terminator"() : () -> () loc("<stdin>":34:9)
      }) : () -> () loc("<stdin>":32:7)
      "omp.terminator"() : () -> () loc("<stdin>":36:7)
    }) : () -> () loc("<stdin>":31:5)
    "llvm.return"() : () -> () loc("<stdin>":38:5)
  }) : () -> () loc("<stdin>":30:3)
}) : () -> () loc("<stdin>":1:1)
