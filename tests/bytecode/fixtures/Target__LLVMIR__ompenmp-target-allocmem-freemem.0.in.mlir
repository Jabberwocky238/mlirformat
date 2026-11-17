"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_alloc_free_i64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %4 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":3:10)
    %5 = "omp.target_allocmem"(%4) <{in_type = i64, operandSegmentSizes = array<i32: 1, 0, 0>}> : (i32) -> i64 loc("<stdin>":4:10)
    "omp.target_freemem"(%4, %5) : (i32, i64) -> () loc("<stdin>":5:5)
    "llvm.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_alloc_free_vector_1d_f32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %2 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":9:10)
    %3 = "omp.target_allocmem"(%2) <{in_type = vector<16xf32>, operandSegmentSizes = array<i32: 1, 0, 0>}> : (i32) -> i64 loc("<stdin>":10:10)
    "omp.target_freemem"(%2, %3) : (i32, i64) -> () loc("<stdin>":11:5)
    "llvm.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":8:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_alloc_free_vector_2d_f32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":15:10)
    %1 = "omp.target_allocmem"(%0) <{in_type = vector<16x16xf32>, operandSegmentSizes = array<i32: 1, 0, 0>}> : (i32) -> i64 loc("<stdin>":16:10)
    "omp.target_freemem"(%0, %1) : (i32, i64) -> () loc("<stdin>":17:5)
    "llvm.return"() : () -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":14:3)
}) : () -> () loc("<stdin>":1:1)
