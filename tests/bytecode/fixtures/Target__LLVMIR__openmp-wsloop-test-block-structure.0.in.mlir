"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_block_structure", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i1 loc("<stdin>":3:10)
    %1 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64 loc("<stdin>":4:10)
    "llvm.br"(%1, %1)[^bb1] : (i64, i64) -> () loc("<stdin>":5:5)
  ^bb1(%2: i64 loc("<stdin>":6:8), %3: i64 loc("<stdin>":6:17)):  // 3 preds: ^bb0, ^bb4, ^bb5
    "llvm.cond_br"(%0)[^bb2, ^bb6] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":7:5)
  ^bb2:  // pred: ^bb1
    "llvm.br"(%1, %1)[^bb3] : (i64, i64) -> () loc("<stdin>":9:5)
  ^bb3(%4: i64 loc("<stdin>":10:8), %5: i64 loc("<stdin>":10:17)):  // pred: ^bb2
    "llvm.cond_br"(%0)[^bb4, ^bb5] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":11:5)
  ^bb4:  // pred: ^bb3
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%1, %1, %1) <{loop_inclusive}> ({
      ^bb0(%arg0: i64 loc("<stdin>":15:12)):
        "omp.yield"() : () -> () loc("<stdin>":16:9)
      }) : (i64, i64, i64) -> () loc("<stdin>":14:7)
    }) : () -> () loc("<stdin>":13:5)
    "llvm.br"(%1, %1)[^bb1] : (i64, i64) -> () loc("<stdin>":19:5)
  ^bb5:  // pred: ^bb3
    "llvm.br"(%1, %1)[^bb1] : (i64, i64) -> () loc("<stdin>":21:5)
  ^bb6:  // pred: ^bb1
    "llvm.return"() : () -> () loc("<stdin>":23:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
