"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "cancel_distribute_parallel_do", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32 loc("<stdin>":3:8), %arg1: i32 loc("<stdin>":3:20), %arg2: i32 loc("<stdin>":3:32)):
    "omp.teams"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
        "omp.distribute"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
          "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
            "omp.loop_nest"(%arg0, %arg1, %arg2) ({
            ^bb0(%arg3: i32 loc("<stdin>":9:18)):
              "omp.cancel"() <{cancel_directive = #omp<cancellationconstructtype loop>}> : () -> () loc("<stdin>":10:15)
              "omp.yield"() : () -> () loc("<stdin>":11:15)
            }) : (i32, i32, i32) -> () loc("<stdin>":8:13)
          }) {omp.composite} : () -> () loc("<stdin>":7:11)
        }) {omp.composite} : () -> () loc("<stdin>":6:9)
        "omp.terminator"() : () -> () loc("<stdin>":15:9)
      }) {omp.composite} : () -> () loc("<stdin>":5:7)
      "omp.terminator"() : () -> () loc("<stdin>":17:7)
    }) : () -> () loc("<stdin>":4:5)
    "llvm.return"() : () -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
