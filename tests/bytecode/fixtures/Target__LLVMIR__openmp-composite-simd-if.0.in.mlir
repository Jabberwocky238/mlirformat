"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "array", llvm.nocapture}, {fir.bindc_name = "t", llvm.nocapture}], function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "_QPfoo", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":3:8), %arg1: !llvm.ptr loc("<stdin>":3:26)):
    %0 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i32 loc("<stdin>":4:10)
    %1 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":5:10)
    %2 = "llvm.mlir.constant"() <{value = 10 : i64}> : () -> i64 loc("<stdin>":6:10)
    %3 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":7:10)
    %4 = "llvm.alloca"(%3) <{elem_type = i32}> {bindc_name = "i", pinned} : (i64) -> !llvm.ptr loc("<stdin>":8:10)
    %5 = "llvm.load"(%arg1) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":9:10)
    %6 = "llvm.icmp"(%5, %0) <{predicate = 1 : i64}> : (i32, i32) -> i1 loc("<stdin>":10:10)
    %7 = "llvm.trunc"(%2) <{overflowFlags = 0 : i32}> : (i64) -> i32 loc("<stdin>":11:10)
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.simd"(%6) <{operandSegmentSizes = array<i32: 0, 1, 0, 0, 0, 0, 0>}> ({
        "omp.loop_nest"(%1, %7, %1) <{loop_inclusive}> ({
        ^bb0(%arg2: i32 loc("<stdin>":15:14)):
          "llvm.store"(%arg2, %4) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":16:11)
          %8 = "llvm.load"(%4) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":17:16)
          %9 = "llvm.sext"(%8) : (i32) -> i64 loc("<stdin>":18:16)
          %10 = "llvm.getelementptr"(%arg0, %9) <{elem_type = i32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr loc("<stdin>":19:17)
          "llvm.store"(%8, %10) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":20:11)
          "omp.yield"() : () -> () loc("<stdin>":21:11)
        }) : (i32, i32, i32) -> () loc("<stdin>":14:9)
      }) {omp.composite} : (i1) -> () loc("<stdin>":13:7)
    }) {omp.composite} : () -> () loc("<stdin>":12:5)
    "llvm.return"() : () -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
