"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "distribute_dist_schedule_chunk_size", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32):
    %0 = "llvm.mlir.constant"() <{value = 1024 : i32}> : () -> i32
    "omp.distribute"(%0) <{dist_schedule_static, operandSegmentSizes = array<i32: 0, 0, 1, 0>}> ({
      "omp.loop_nest"(%arg0, %arg1, %arg2) ({
      ^bb0(%arg4: i32):
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : (i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "distribute_dist_schedule", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32):
    "omp.distribute"() <{dist_schedule_static, operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg0, %arg1, %arg2) ({
      ^bb0(%arg4: i32):
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

