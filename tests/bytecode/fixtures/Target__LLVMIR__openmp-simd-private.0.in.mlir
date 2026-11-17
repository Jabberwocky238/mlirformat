"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "i_privatizer", type = i32}> ({
  }, {
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_loop_var_privatization", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %9 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":7:10)
    %10 = "llvm.alloca"(%9) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr loc("<stdin>":8:11)
    %11 = "llvm.alloca"(%9) <{elem_type = f32}> {bindc_name = "dummy"} : (i64) -> !llvm.ptr loc("<stdin>":9:11)
    %12 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32 loc("<stdin>":10:11)
    %13 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":11:11)
    "omp.simd"(%10) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 0>, private_syms = [@i_privatizer]}> ({
    ^bb0(%arg3: !llvm.ptr loc("<stdin>":13:10)):
      "omp.loop_nest"(%13, %12, %13) <{loop_inclusive}> ({
      ^bb0(%arg4: i32 loc("<stdin>":15:12)):
        "llvm.store"(%arg4, %arg3) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":16:9)
        %14 = "llvm.load"(%11) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32 loc("<stdin>":17:15)
        %15 = "llvm.load"(%arg3) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":18:15)
        %16 = "llvm.sitofp"(%15) : (i32) -> f32 loc("<stdin>":19:15)
        %17 = "llvm.fadd"(%14, %16) <{fastmathFlags = #llvm.fastmath<contract>}> : (f32, f32) -> f32 loc("<stdin>":20:15)
        "llvm.store"(%17, %11) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> () loc("<stdin>":21:9)
        "omp.yield"() : () -> () loc("<stdin>":22:9)
      }) : (i32, i32, i32) -> () loc("<stdin>":14:7)
    }) : (!llvm.ptr) -> () loc("<stdin>":12:5)
    "llvm.return"() : () -> () loc("<stdin>":25:5)
  }) {fir.internal_name = "_QPtest_private_clause"} : () -> () loc("<stdin>":6:3)
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "dummy_privatizer", type = f32}> ({
  }, {
  }, {
  }) : () -> () loc("<stdin>":27:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_private_clause", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":32:10)
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr loc("<stdin>":33:10)
    %2 = "llvm.alloca"(%0) <{elem_type = f32}> {bindc_name = "dummy"} : (i64) -> !llvm.ptr loc("<stdin>":34:10)
    %3 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32 loc("<stdin>":35:10)
    %4 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":36:10)
    "omp.simd"(%2, %1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 2, 0>, private_syms = [@dummy_privatizer, @i_privatizer]}> ({
    ^bb0(%arg0: !llvm.ptr loc("<stdin>":38:10), %arg1: !llvm.ptr loc("<stdin>":38:28)):
      "omp.loop_nest"(%4, %3, %4) <{loop_inclusive}> ({
      ^bb0(%arg2: i32 loc("<stdin>":40:12)):
        "llvm.store"(%arg2, %arg1) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":41:9)
        %5 = "llvm.load"(%arg0) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32 loc("<stdin>":42:14)
        %6 = "llvm.load"(%arg1) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":43:14)
        %7 = "llvm.sitofp"(%6) : (i32) -> f32 loc("<stdin>":44:14)
        %8 = "llvm.fadd"(%5, %7) <{fastmathFlags = #llvm.fastmath<contract>}> : (f32, f32) -> f32 loc("<stdin>":45:14)
        "llvm.store"(%8, %arg0) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> () loc("<stdin>":46:9)
        "omp.yield"() : () -> () loc("<stdin>":47:9)
      }) : (i32, i32, i32) -> () loc("<stdin>":39:7)
    }) : (!llvm.ptr, !llvm.ptr) -> () loc("<stdin>":37:5)
    "llvm.return"() : () -> () loc("<stdin>":50:5)
  }) {fir.internal_name = "_QPtest_private_clause"} : () -> () loc("<stdin>":31:3)
}) : () -> () loc("<stdin>":1:1)
