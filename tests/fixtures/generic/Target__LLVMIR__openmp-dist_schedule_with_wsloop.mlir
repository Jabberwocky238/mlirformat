"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "distribute_wsloop_dist_schedule_chunked_schedule_chunked", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32):
    %5 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %6 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %7 = "llvm.mlir.constant"() <{value = 64 : i32}> : () -> i32
    "omp.teams"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 1>}> ({
      "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
        "omp.distribute"(%arg7) <{dist_schedule_static, operandSegmentSizes = array<i32: 0, 0, 1, 0>}> ({
          "omp.wsloop"(%7) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 1>, schedule_kind = #omp<schedulekind static>}> ({
            "omp.loop_nest"(%5, %arg4, %6) ({
            ^bb0(%arg8: i32):
              "omp.yield"() : () -> ()
            }) : (i32, i32, i32) -> ()
          }) {omp.composite} : (i32) -> ()
        }) {omp.composite} : (i32) -> ()
        "omp.terminator"() : () -> ()
      }) {omp.composite} : () -> ()
      "omp.terminator"() : () -> ()
    }) : (i32, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "distribute_wsloop_dist_schedule_chunked_schedule_chunked_i64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i32):
    %0 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i64
    %1 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %2 = "llvm.mlir.constant"() <{value = 1024 : i64}> : () -> i64
    %3 = "llvm.mlir.constant"() <{value = 64 : i64}> : () -> i64
    %4 = "llvm.zext"(%arg0) : (i32) -> i64
    "omp.teams"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 1>}> ({
      "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
        "omp.distribute"(%2) <{dist_schedule_static, operandSegmentSizes = array<i32: 0, 0, 1, 0>}> ({
          "omp.wsloop"(%3) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 1>, schedule_kind = #omp<schedulekind static>}> ({
            "omp.loop_nest"(%0, %4, %1) ({
            ^bb0(%arg3: i64):
              "omp.yield"() : () -> ()
            }) : (i64, i64, i64) -> ()
          }) {omp.composite} : (i64) -> ()
        }) {omp.composite} : (i64) -> ()
        "omp.terminator"() : () -> ()
      }) {omp.composite} : () -> ()
      "omp.terminator"() : () -> ()
    }) : (i32, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "distribute_wsloop_dist_schedule_chunked", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: i32, %arg5: i32, %arg6: i32):
    %4 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %5 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %6 = "llvm.mlir.constant"() <{value = 1024 : i32}> : () -> i32
    "omp.teams"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 1>}> ({
      "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
        "omp.distribute"(%6) <{dist_schedule_static, operandSegmentSizes = array<i32: 0, 0, 1, 0>}> ({
          "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, schedule_kind = #omp<schedulekind static>}> ({
            "omp.loop_nest"(%4, %arg4, %5) ({
            ^bb0(%arg7: i32):
              "omp.yield"() : () -> ()
            }) : (i32, i32, i32) -> ()
          }) {omp.composite} : () -> ()
        }) {omp.composite} : (i32) -> ()
        "omp.terminator"() : () -> ()
      }) {omp.composite} : () -> ()
      "omp.terminator"() : () -> ()
    }) : (i32, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "distribute_wsloop_dist_schedule_chunked_i64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i32):
    %0 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i64
    %1 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %2 = "llvm.mlir.constant"() <{value = 1024 : i64}> : () -> i64
    %3 = "llvm.zext"(%arg0) : (i32) -> i64
    "omp.teams"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 1>}> ({
      "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
        "omp.distribute"(%2) <{dist_schedule_static, operandSegmentSizes = array<i32: 0, 0, 1, 0>}> ({
          "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, schedule_kind = #omp<schedulekind static>}> ({
            "omp.loop_nest"(%0, %3, %1) ({
            ^bb0(%arg3: i64):
              "omp.yield"() : () -> ()
            }) : (i64, i64, i64) -> ()
          }) {omp.composite} : () -> ()
        }) {omp.composite} : (i64) -> ()
        "omp.terminator"() : () -> ()
      }) {omp.composite} : () -> ()
      "omp.terminator"() : () -> ()
    }) : (i32, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "distribute_wsloop_schedule_chunked", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: i32, %arg5: i32, %arg6: i32):
    %4 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %5 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %6 = "llvm.mlir.constant"() <{value = 64 : i32}> : () -> i32
    "omp.teams"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 1>}> ({
      "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
        "omp.distribute"() <{dist_schedule_static, operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
          "omp.wsloop"(%6) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 1>, schedule_kind = #omp<schedulekind static>}> ({
            "omp.loop_nest"(%4, %arg4, %5) ({
            ^bb0(%arg7: i32):
              "omp.yield"() : () -> ()
            }) : (i32, i32, i32) -> ()
          }) {omp.composite} : (i32) -> ()
        }) {omp.composite} : () -> ()
        "omp.terminator"() : () -> ()
      }) {omp.composite} : () -> ()
      "omp.terminator"() : () -> ()
    }) : (i32, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "distribute_wsloop_schedule_chunked_i64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i32):
    %0 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i64
    %1 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %2 = "llvm.mlir.constant"() <{value = 64 : i64}> : () -> i64
    %3 = "llvm.zext"(%arg0) : (i32) -> i64
    "omp.teams"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 1>}> ({
      "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
        "omp.distribute"() <{dist_schedule_static, operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
          "omp.wsloop"(%2) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 1>, schedule_kind = #omp<schedulekind static>}> ({
            "omp.loop_nest"(%0, %3, %1) ({
            ^bb0(%arg3: i64):
              "omp.yield"() : () -> ()
            }) : (i64, i64, i64) -> ()
          }) {omp.composite} : (i64) -> ()
        }) {omp.composite} : () -> ()
        "omp.terminator"() : () -> ()
      }) {omp.composite} : () -> ()
      "omp.terminator"() : () -> ()
    }) : (i32, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "distribute_wsloop_no_chunks", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: i32, %arg5: i32, %arg6: i32):
    %3 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %4 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    "omp.teams"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 1>}> ({
      "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
        "omp.distribute"() <{dist_schedule_static, operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
          "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, schedule_kind = #omp<schedulekind static>}> ({
            "omp.loop_nest"(%3, %arg4, %4) ({
            ^bb0(%arg7: i32):
              "omp.yield"() : () -> ()
            }) : (i32, i32, i32) -> ()
          }) {omp.composite} : () -> ()
        }) {omp.composite} : () -> ()
        "omp.terminator"() : () -> ()
      }) {omp.composite} : () -> ()
      "omp.terminator"() : () -> ()
    }) : (i32, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "distribute_wsloop_no_chunks_i64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i32):
    %0 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i64
    %1 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %2 = "llvm.zext"(%arg0) : (i32) -> i64
    "omp.teams"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0, 0, 1>}> ({
      "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
        "omp.distribute"() <{dist_schedule_static, operandSegmentSizes = array<i32: 0, 0, 0, 0>}> ({
          "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, schedule_kind = #omp<schedulekind static>}> ({
            "omp.loop_nest"(%0, %2, %1) ({
            ^bb0(%arg3: i64):
              "omp.yield"() : () -> ()
            }) : (i64, i64, i64) -> ()
          }) {omp.composite} : () -> ()
        }) {omp.composite} : () -> ()
        "omp.terminator"() : () -> ()
      }) {omp.composite} : () -> ()
      "omp.terminator"() : () -> ()
    }) : (i32, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

