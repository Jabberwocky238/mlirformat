"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i1, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "repeated_successor_different_args", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg6: i1, %arg7: i32, %arg8: i32):
    "llvm.cond_br"(%arg6, %arg7, %arg8)[^bb1, ^bb1] <{operandSegmentSizes = array<i32: 1, 1, 1>}> : (i1, i32, i32) -> ()
  ^bb1(%1: i32):  // 2 preds: ^bb0, ^bb0
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i1)>, linkage = #llvm.linkage<external>, sym_name = "repeated_successor_no_args", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg5: i1):
    "llvm.cond_br"(%arg5)[^bb1, ^bb1] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // 2 preds: ^bb0, ^bb0
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i64, i64, i64, i1)>, linkage = #llvm.linkage<external>, sym_name = "repeated_successor_openmp", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i1):
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%arg0, %arg1, %arg2) ({
      ^bb0(%arg4: i64):
        "llvm.cond_br"(%arg3, %arg0, %arg1)[^bb1, ^bb1] <{operandSegmentSizes = array<i32: 1, 1, 1>}> : (i1, i64, i64) -> ()
      ^bb1(%0: i64):  // 2 preds: ^bb0, ^bb0
        "omp.yield"() : () -> ()
      }) : (i64, i64, i64) -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1, i1) -> (), sym_name = "func1"}> ({
  ^bb0(%arg0: i1, %arg1: i1):
    "cf.cond_br"(%arg0, %arg0, %arg1)[^bb1, ^bb1] <{operandSegmentSizes = array<i32: 1, 1, 1>}> : (i1, i1, i1) -> ()
  ^bb1(%0: i1):  // 2 preds: ^bb0, ^bb0
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

