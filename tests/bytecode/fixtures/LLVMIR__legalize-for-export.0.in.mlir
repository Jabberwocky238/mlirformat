"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i1, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "repeated_successor_different_args", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg6: i1 loc("<stdin>":3:8), %arg7: i32 loc("<stdin>":3:19), %arg8: i32 loc("<stdin>":3:31)):
    "llvm.cond_br"(%arg6, %arg7, %arg8)[^bb1, ^bb1] <{operandSegmentSizes = array<i32: 1, 1, 1>}> : (i1, i32, i32) -> () loc("<stdin>":4:5)
  ^bb1(%1: i32 loc("<stdin>":5:8)):  // 2 preds: ^bb0, ^bb0
    "llvm.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i1)>, linkage = #llvm.linkage<external>, sym_name = "repeated_successor_no_args", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg5: i1 loc("<stdin>":9:8)):
    "llvm.cond_br"(%arg5)[^bb1, ^bb1] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":10:5)
  ^bb1:  // 2 preds: ^bb0, ^bb0
    "llvm.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":8:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64, i64, i64, i1)>, linkage = #llvm.linkage<external>, sym_name = "repeated_successor_openmp", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64 loc("<stdin>":15:8), %arg1: i64 loc("<stdin>":15:20), %arg2: i64 loc("<stdin>":15:32), %arg3: i1 loc("<stdin>":15:44)):
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg0, %arg1, %arg2) ({
      ^bb0(%arg4: i64 loc("<stdin>":18:12)):
        "llvm.cond_br"(%arg3, %arg0, %arg1)[^bb1, ^bb1] <{operandSegmentSizes = array<i32: 1, 1, 1>}> : (i1, i64, i64) -> () loc("<stdin>":19:9)
      ^bb1(%0: i64 loc("<stdin>":20:12)):  // 2 preds: ^bb0, ^bb0
        "omp.yield"() : () -> () loc("<stdin>":21:9)
      }) : (i64, i64, i64) -> () loc("<stdin>":17:7)
    }) : () -> () loc("<stdin>":16:5)
    "llvm.return"() : () -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":14:3)
}) : () -> () loc("<stdin>":1:1)
