"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "i_privatizer", type = i32}> ({
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_loop_var_privatization", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %9 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %10 = "llvm.alloca"(%9) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr
    %11 = "llvm.alloca"(%9) <{elem_type = f32}> {bindc_name = "dummy"} : (i64) -> !llvm.ptr
    %12 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32
    %13 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    "omp.simd"(%10) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0>, private_syms = [@i_privatizer]}> ({
    ^bb0(%arg3: !llvm.ptr):
      "omp.loop_nest"(%13, %12, %13) <{loop_inclusive}> ({
      ^bb0(%arg4: i32):
        "llvm.store"(%arg4, %arg3) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
        %14 = "llvm.load"(%11) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
        %15 = "llvm.load"(%arg3) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
        %16 = "llvm.sitofp"(%15) : (i32) -> f32
        %17 = "llvm.fadd"(%14, %16) <{fastmathFlags = #llvm.fastmath<contract>}> : (f32, f32) -> f32
        "llvm.store"(%17, %11) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) {fir.internal_name = "_QPtest_private_clause"} : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "dummy_privatizer", type = f32}> ({
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_private_clause", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr
    %2 = "llvm.alloca"(%0) <{elem_type = f32}> {bindc_name = "dummy"} : (i64) -> !llvm.ptr
    %3 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32
    %4 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    "omp.simd"(%2, %1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 2, 0>, private_syms = [@dummy_privatizer, @i_privatizer]}> ({
    ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
      "omp.loop_nest"(%4, %3, %4) <{loop_inclusive}> ({
      ^bb0(%arg2: i32):
        "llvm.store"(%arg2, %arg1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
        %5 = "llvm.load"(%arg0) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
        %6 = "llvm.load"(%arg1) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
        %7 = "llvm.sitofp"(%6) : (i32) -> f32
        %8 = "llvm.fadd"(%5, %7) <{fastmathFlags = #llvm.fastmath<contract>}> : (f32, f32) -> f32
        "llvm.store"(%8, %arg0) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) {fir.internal_name = "_QPtest_private_clause"} : () -> ()
}) : () -> ()

