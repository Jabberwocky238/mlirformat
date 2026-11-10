"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "test_allocate_default", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    "omp.allocate_dir"(%arg0) <{operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
    "omp.allocate_free"(%arg0) <{operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "test_allocate_align_only", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    "omp.allocate_dir"(%arg0) <{align = 16 : i64, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
    "omp.allocate_free"(%arg0) <{operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "test_allocate_allocator_only", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    "omp.allocate_dir"(%arg0, %0) <{operandSegmentSizes = array<i32: 1, 1>}> : (!llvm.ptr, i32) -> ()
    "omp.allocate_free"(%arg0, %0) <{operandSegmentSizes = array<i32: 1, 1>}> : (!llvm.ptr, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "test_allocate_align_and_allocator", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 6 : i32}> : () -> i32
    "omp.allocate_dir"(%arg0, %0) <{align = 64 : i64, operandSegmentSizes = array<i32: 1, 1>}> : (!llvm.ptr, i32) -> ()
    "omp.allocate_free"(%arg0, %0) <{operandSegmentSizes = array<i32: 1, 1>}> : (!llvm.ptr, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "test_allocate_multiple_vars", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 3 : i32}> : () -> i32
    "omp.allocate_dir"(%arg0, %arg1, %arg2, %0) <{align = 32 : i64, operandSegmentSizes = array<i32: 3, 1>}> : (!llvm.ptr, !llvm.ptr, !llvm.ptr, i32) -> ()
    "omp.allocate_free"(%arg0, %arg1, %arg2, %0) <{operandSegmentSizes = array<i32: 3, 1>}> : (!llvm.ptr, !llvm.ptr, !llvm.ptr, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.array<10 x i32>, linkage = #llvm.linkage<internal>, sym_name = "arr_global", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %2 = "llvm.mlir.zero"() : () -> !llvm.array<10 x i32>
    "llvm.return"(%2) : (!llvm.array<10 x i32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_allocate_array_global", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.addressof"() <{global_name = @arr_global}> : () -> !llvm.ptr
    %1 = "llvm.mlir.constant"() <{value = 6 : i32}> : () -> i32
    "omp.allocate_dir"(%0, %1) <{align = 64 : i64, operandSegmentSizes = array<i32: 1, 1>}> : (!llvm.ptr, i32) -> ()
    "omp.allocate_free"(%0, %1) <{operandSegmentSizes = array<i32: 1, 1>}> : (!llvm.ptr, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

