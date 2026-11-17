"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "distribute_dist_schedule_chunk_size", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32 loc("<stdin>":3:8), %arg1: i32 loc("<stdin>":3:20), %arg2: i32 loc("<stdin>":3:32), %arg3: i32 loc("<stdin>":3:44)):
    %0 = "llvm.mlir.constant"() <{value = 1024 : i32}> : () -> i32 loc("<stdin>":4:10)
    "omp.distribute"(%0) <{dist_schedule_static, operandSegmentSizes = array<i32: 0, 0, 1, 0>}> ({
      "omp.loop_nest"(%arg0, %arg1, %arg2) ({
      ^bb0(%arg4: i32 loc("<stdin>":7:12)):
        "omp.yield"() : () -> () loc("<stdin>":8:9)
      }) : (i32, i32, i32) -> () loc("<stdin>":6:7)
    }) : (i32) -> () loc("<stdin>":5:5)
    "llvm.return"() : () -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
