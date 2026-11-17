"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "distribute_wsloop_dist_schedule_chunked_schedule_chunked", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: i32 loc("<stdin>":3:8), %arg5: i32 loc("<stdin>":3:20), %arg6: i32 loc("<stdin>":3:32), %arg7: i32 loc("<stdin>":3:44)):
    %5 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":4:10)
    %6 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":5:10)
    %7 = "llvm.mlir.constant"() <{value = 64 : i32}> : () -> i32 loc("<stdin>":6:10)
    "omp.teams"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 1>}> ({
      "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
        "omp.distribute"(%arg7) <{dist_schedule_static, operandSegmentSizes = array<i32: 0, 0, 1, 0>}> ({
          "omp.wsloop"(%7) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 1>, schedule_kind = #omp<schedulekind static>}> ({
            "omp.loop_nest"(%5, %arg4, %6) ({
            ^bb0(%arg8: i32 loc("<stdin>":12:18)):
              "omp.yield"() : () -> () loc("<stdin>":13:15)
            }) : (i32, i32, i32) -> () loc("<stdin>":11:13)
          }) {omp.composite} : (i32) -> () loc("<stdin>":10:11)
        }) {omp.composite} : (i32) -> () loc("<stdin>":9:9)
        "omp.terminator"() : () -> () loc("<stdin>":17:9)
      }) {omp.composite} : () -> () loc("<stdin>":8:7)
      "omp.terminator"() : () -> () loc("<stdin>":19:7)
    }) : (i32, i32) -> () loc("<stdin>":7:5)
    "llvm.return"() : () -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "distribute_wsloop_dist_schedule_chunked_schedule_chunked_i64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32 loc("<stdin>":24:8), %arg1: i32 loc("<stdin>":24:20), %arg2: i32 loc("<stdin>":24:32)):
    %0 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i64 loc("<stdin>":25:10)
    %1 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":26:10)
    %2 = "llvm.mlir.constant"() <{value = 1024 : i64}> : () -> i64 loc("<stdin>":27:10)
    %3 = "llvm.mlir.constant"() <{value = 64 : i64}> : () -> i64 loc("<stdin>":28:10)
    %4 = "llvm.zext"(%arg0) : (i32) -> i64 loc("<stdin>":29:10)
    "omp.teams"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 1>}> ({
      "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
        "omp.distribute"(%2) <{dist_schedule_static, operandSegmentSizes = array<i32: 0, 0, 1, 0>}> ({
          "omp.wsloop"(%3) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 1>, schedule_kind = #omp<schedulekind static>}> ({
            "omp.loop_nest"(%0, %4, %1) ({
            ^bb0(%arg3: i64 loc("<stdin>":35:18)):
              "omp.yield"() : () -> () loc("<stdin>":36:15)
            }) : (i64, i64, i64) -> () loc("<stdin>":34:13)
          }) {omp.composite} : (i64) -> () loc("<stdin>":33:11)
        }) {omp.composite} : (i64) -> () loc("<stdin>":32:9)
        "omp.terminator"() : () -> () loc("<stdin>":40:9)
      }) {omp.composite} : () -> () loc("<stdin>":31:7)
      "omp.terminator"() : () -> () loc("<stdin>":42:7)
    }) : (i32, i32) -> () loc("<stdin>":30:5)
    "llvm.return"() : () -> () loc("<stdin>":44:5)
  }) : () -> () loc("<stdin>":23:3)
}) : () -> () loc("<stdin>":1:1)
