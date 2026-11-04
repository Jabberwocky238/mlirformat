"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "array", llvm.nocapture}, {fir.bindc_name = "t", llvm.nocapture}], function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "_QPfoo", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i32
    %1 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %2 = "llvm.mlir.constant"() <{value = 10 : i64}> : () -> i64
    %3 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %4 = "llvm.alloca"(%3) <{elem_type = i32}> {bindc_name = "i", pinned} : (i64) -> !llvm.ptr
    %5 = "llvm.load"(%arg1) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
    %6 = "llvm.icmp"(%5, %0) <{predicate = 1 : i64}> : (i32, i32) -> i1
    %7 = "llvm.trunc"(%2) <{overflowFlags = 0 : i32}> : (i64) -> i32
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
      "omp.simd"(%6) <{operandSegmentSizes = array<i32: 0, 1, 0, 0, 0, 0, 0>}> ({
        "omp.loop_nest"(%1, %7, %1) <{loop_inclusive}> ({
        ^bb0(%arg2: i32):
          "llvm.store"(%arg2, %4) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
          %8 = "llvm.load"(%4) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
          %9 = "llvm.sext"(%8) : (i32) -> i64
          %10 = "llvm.getelementptr"(%arg0, %9) <{elem_type = i32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
          "llvm.store"(%8, %10) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
          "omp.yield"() : () -> ()
        }) : (i32, i32, i32) -> ()
      }) {omp.composite} : (i1) -> ()
    }) {omp.composite} : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

