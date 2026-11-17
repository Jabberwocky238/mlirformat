"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_parallel_do_simd", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":3:10)
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr loc("<stdin>":4:10)
    %2 = "llvm.mlir.constant"() <{value = 1000 : i32}> : () -> i32 loc("<stdin>":5:10)
    %3 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":6:10)
    %4 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":7:10)
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      %5 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":9:12)
      %6 = "llvm.alloca"(%5) <{elem_type = i32}> {bindc_name = "i", pinned} : (i64) -> !llvm.ptr loc("<stdin>":10:12)
      %7 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":11:12)
      "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
        "omp.simd"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
          "omp.loop_nest"(%3, %2, %3) <{loop_inclusive}> ({
          ^bb0(%arg0: i32 loc("<stdin>":15:16)):
            "llvm.store"(%arg0, %6) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":16:13)
            "omp.yield"() : () -> () loc("<stdin>":17:13)
          }) : (i32, i32, i32) -> () loc("<stdin>":14:11)
        }) {omp.composite} : () -> () loc("<stdin>":13:9)
      }) {omp.composite} : () -> () loc("<stdin>":12:7)
      "omp.terminator"() : () -> () loc("<stdin>":21:7)
    }) : () -> () loc("<stdin>":8:5)
    "llvm.return"() : () -> () loc("<stdin>":23:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
