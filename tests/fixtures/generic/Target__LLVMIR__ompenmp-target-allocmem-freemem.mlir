"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_alloc_free_i64", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %4 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %5 = "omp.target_allocmem"(%4) <{in_type = i64, operandSegmentSizes = array<i32: 1, 0, 0>}> : (i32) -> i64
    "omp.target_freemem"(%4, %5) : (i32, i64) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_alloc_free_vector_1d_f32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %2 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %3 = "omp.target_allocmem"(%2) <{in_type = vector<16xf32>, operandSegmentSizes = array<i32: 1, 0, 0>}> : (i32) -> i64
    "omp.target_freemem"(%2, %3) : (i32, i64) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_alloc_free_vector_2d_f32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "omp.target_allocmem"(%0) <{in_type = vector<16x16xf32>, operandSegmentSizes = array<i32: 1, 0, 0>}> : (i32) -> i64
    "omp.target_freemem"(%0, %1) : (i32, i64) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

