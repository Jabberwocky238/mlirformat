"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QPsimd_aligned_pointer", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %18 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %19 = "llvm.alloca"(%18) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> {bindc_name = "x"} : (i64) -> !llvm.ptr
    %20 = "llvm.alloca"(%18) <{elem_type = i32}> {bindc_name = "i", pinned} : (i64) -> !llvm.ptr
    %21 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %22 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32
    %23 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    "omp.simd"(%19) <{alignments = [256], operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%21, %22, %23) <{loop_inclusive}> ({
      ^bb0(%arg3: i32):
        "llvm.store"(%arg3, %20) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QPsimd_aligned_cptr", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %11 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %12 = "llvm.alloca"(%11) <{elem_type = !llvm.struct<"_QM__fortran_builtinsT__builtin_c_ptr", (i64)>}> {bindc_name = "a"} : (i64) -> !llvm.ptr
    %13 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %14 = "llvm.alloca"(%13) <{elem_type = i32}> {bindc_name = "i", pinned} : (i64) -> !llvm.ptr
    %15 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %16 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32
    %17 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    "omp.simd"(%12) <{alignments = [256], operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%15, %16, %17) <{loop_inclusive}> ({
      ^bb0(%arg2: i32):
        "llvm.store"(%arg2, %14) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QPsimd_aligned_allocatable", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %6 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %7 = "llvm.alloca"(%6) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> {bindc_name = "a"} : (i64) -> !llvm.ptr
    %8 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %9 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32
    %10 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    "omp.simd"(%7) <{alignments = [256], operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%8, %9, %10) <{loop_inclusive}> ({
      ^bb0(%arg1: i32):
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QPsimd_aligned_non_power_of_two", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> {bindc_name = "a"} : (i64) -> !llvm.ptr
    %2 = "llvm.alloca"(%0) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> {bindc_name = "b"} : (i64) -> !llvm.ptr
    %3 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %4 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32
    %5 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    "omp.simd"(%1, %2) <{alignments = [257, 64], operandSegmentSizes = array<i32: 2, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%3, %4, %5) <{loop_inclusive}> ({
      ^bb0(%arg0: i32):
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

