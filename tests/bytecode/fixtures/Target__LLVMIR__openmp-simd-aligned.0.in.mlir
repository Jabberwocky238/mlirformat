"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QPsimd_aligned_pointer", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %18 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":3:11)
    %19 = "llvm.alloca"(%18) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>}> {bindc_name = "x"} : (i64) -> !llvm.ptr loc("<stdin>":4:11)
    %20 = "llvm.alloca"(%18) <{elem_type = i32}> {bindc_name = "i", pinned} : (i64) -> !llvm.ptr loc("<stdin>":5:11)
    %21 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":6:11)
    %22 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32 loc("<stdin>":7:11)
    %23 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":8:11)
    "omp.simd"(%19) <{alignments = [256], operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%21, %22, %23) <{loop_inclusive}> ({
      ^bb0(%arg3: i32 loc("<stdin>":11:12)):
        "llvm.store"(%arg3, %20) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":12:9)
        "omp.yield"() : () -> () loc("<stdin>":13:9)
      }) : (i32, i32, i32) -> () loc("<stdin>":10:7)
    }) : (!llvm.ptr) -> () loc("<stdin>":9:5)
    "llvm.return"() : () -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QPsimd_aligned_cptr", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %11 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":19:11)
    %12 = "llvm.alloca"(%11) <{elem_type = !llvm.struct<"_QM__fortran_builtinsT__builtin_c_ptr", (i64)>}> {bindc_name = "a"} : (i64) -> !llvm.ptr loc("<stdin>":20:11)
    %13 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":21:11)
    %14 = "llvm.alloca"(%13) <{elem_type = i32}> {bindc_name = "i", pinned} : (i64) -> !llvm.ptr loc("<stdin>":22:11)
    %15 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":23:11)
    %16 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32 loc("<stdin>":24:11)
    %17 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":25:11)
    "omp.simd"(%12) <{alignments = [256], operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%15, %16, %17) <{loop_inclusive}> ({
      ^bb0(%arg2: i32 loc("<stdin>":28:12)):
        "llvm.store"(%arg2, %14) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":29:9)
        "omp.yield"() : () -> () loc("<stdin>":30:9)
      }) : (i32, i32, i32) -> () loc("<stdin>":27:7)
    }) : (!llvm.ptr) -> () loc("<stdin>":26:5)
    "llvm.return"() : () -> () loc("<stdin>":33:5)
  }) : () -> () loc("<stdin>":18:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QPsimd_aligned_allocatable", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %6 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":36:10)
    %7 = "llvm.alloca"(%6) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> {bindc_name = "a"} : (i64) -> !llvm.ptr loc("<stdin>":37:10)
    %8 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":38:10)
    %9 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32 loc("<stdin>":39:10)
    %10 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":40:11)
    "omp.simd"(%7) <{alignments = [256], operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%8, %9, %10) <{loop_inclusive}> ({
      ^bb0(%arg1: i32 loc("<stdin>":43:12)):
        "omp.yield"() : () -> () loc("<stdin>":44:9)
      }) : (i32, i32, i32) -> () loc("<stdin>":42:7)
    }) : (!llvm.ptr) -> () loc("<stdin>":41:5)
    "llvm.return"() : () -> () loc("<stdin>":47:5)
  }) : () -> () loc("<stdin>":35:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QPsimd_aligned_non_power_of_two", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":50:10)
    %1 = "llvm.alloca"(%0) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> {bindc_name = "a"} : (i64) -> !llvm.ptr loc("<stdin>":51:10)
    %2 = "llvm.alloca"(%0) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> {bindc_name = "b"} : (i64) -> !llvm.ptr loc("<stdin>":52:10)
    %3 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":53:10)
    %4 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32 loc("<stdin>":54:10)
    %5 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":55:10)
    "omp.simd"(%1, %2) <{alignments = [257, 64], operandSegmentSizes = array<i32: 2, 0, 0, 0, 0, 0, 0>}> ({
      "omp.loop_nest"(%3, %4, %5) <{loop_inclusive}> ({
      ^bb0(%arg0: i32 loc("<stdin>":58:12)):
        "omp.yield"() : () -> () loc("<stdin>":59:9)
      }) : (i32, i32, i32) -> () loc("<stdin>":57:7)
    }) : (!llvm.ptr, !llvm.ptr) -> () loc("<stdin>":56:5)
    "llvm.return"() : () -> () loc("<stdin>":62:5)
  }) : () -> () loc("<stdin>":49:3)
}) : () -> () loc("<stdin>":1:1)
