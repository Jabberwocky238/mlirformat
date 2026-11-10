"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "i_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "simd_ordered_linear", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i64
    %1 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %2 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %3 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32
    %4 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32
    %5 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32
    %6 = "llvm.mlir.constant"() <{value = 100 : i64}> : () -> i64
    %7 = "llvm.alloca"(%6) <{elem_type = i32}> : (i64) -> !llvm.ptr
    %8 = "llvm.alloca"(%6) <{elem_type = i32}> : (i64) -> !llvm.ptr
    %9 = "llvm.alloca"(%6) <{elem_type = i32}> : (i64) -> !llvm.ptr
    %10 = "llvm.alloca"(%1) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr
    "omp.simd"(%10, %2, %10) <{linear_modifiers = [unit], linear_var_types = [i32], operandSegmentSizes = array<i32: 0, 0, 1, 1, 0, 1, 0>, private_syms = [@i_private_i32]}> ({
    ^bb0(%arg0: !llvm.ptr):
      "omp.loop_nest"(%2, %3, %2) <{loop_inclusive}> ({
      ^bb0(%arg1: i32):
        "llvm.store"(%arg1, %arg0) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
        %11 = "llvm.load"(%arg0) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
        %12 = "llvm.sext"(%11) : (i32) -> i64
        %13 = "llvm.sub"(%12, %1) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
        %14 = "llvm.getelementptr"(%8, %13) <{elem_type = i32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
        %15 = "llvm.load"(%14) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
        %16 = "llvm.mul"(%15, %4) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        %17 = "llvm.getelementptr"(%7, %13) <{elem_type = i32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
        "llvm.store"(%16, %17) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
        "omp.ordered.region"() <{par_level_simd}> ({
          %25 = "llvm.load"(%arg0) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
          %26 = "llvm.sext"(%25) : (i32) -> i64
          %27 = "llvm.sub"(%26, %1) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
          %28 = "llvm.getelementptr"(%7, %27) <{elem_type = i32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
          %29 = "llvm.load"(%28) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
          "omp.terminator"() : () -> ()
        }) : () -> ()
        %18 = "llvm.load"(%arg0) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
        %19 = "llvm.sext"(%18) : (i32) -> i64
        %20 = "llvm.sub"(%19, %1) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64
        %21 = "llvm.getelementptr"(%7, %20) <{elem_type = i32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
        %22 = "llvm.load"(%21) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
        %23 = "llvm.mul"(%22, %5) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
        %24 = "llvm.getelementptr"(%9, %20) <{elem_type = i32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
        "llvm.store"(%23, %24) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : (!llvm.ptr, i32, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

