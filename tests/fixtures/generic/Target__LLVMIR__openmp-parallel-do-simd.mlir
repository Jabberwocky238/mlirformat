"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_parallel_do_simd", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr
    %2 = "llvm.mlir.constant"() <{value = 1000 : i32}> : () -> i32
    %3 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %4 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      %5 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
      %6 = "llvm.alloca"(%5) <{elem_type = i32}> {bindc_name = "i", pinned} : (i64) -> !llvm.ptr
      %7 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
      "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
        "omp.simd"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>}> ({
          "omp.loop_nest"(%3, %2, %3) <{loop_inclusive}> ({
          ^bb0(%arg0: i32):
            "llvm.store"(%arg0, %6) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
            "omp.yield"() : () -> ()
          }) : (i32, i32, i32) -> ()
        }) {omp.composite} : () -> ()
      }) {omp.composite} : () -> ()
      "omp.terminator"() : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

