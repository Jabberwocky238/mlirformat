"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_block_structure", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i1
    %1 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    "llvm.br"(%1, %1)[^bb1] : (i64, i64) -> ()
  ^bb1(%2: i64, %3: i64):  // 3 preds: ^bb0, ^bb4, ^bb5
    "llvm.cond_br"(%0)[^bb2, ^bb6] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb2:  // pred: ^bb1
    "llvm.br"(%1, %1)[^bb3] : (i64, i64) -> ()
  ^bb3(%4: i64, %5: i64):  // pred: ^bb2
    "llvm.cond_br"(%0)[^bb4, ^bb5] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb4:  // pred: ^bb3
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%1, %1, %1) <{loop_inclusive}> ({
      ^bb0(%arg0: i64):
        "omp.yield"() : () -> ()
      }) : (i64, i64, i64) -> ()
    }) : () -> ()
    "llvm.br"(%1, %1)[^bb1] : (i64, i64) -> ()
  ^bb5:  // pred: ^bb3
    "llvm.br"(%1, %1)[^bb1] : (i64, i64) -> ()
  ^bb6:  // pred: ^bb1
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

