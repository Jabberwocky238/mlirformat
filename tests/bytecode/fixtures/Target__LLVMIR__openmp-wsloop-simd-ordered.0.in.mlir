"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "i_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "wsloop_simd_ordered_linear", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i64 loc("<stdin>":7:10)
    %1 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":8:10)
    %2 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":9:10)
    %3 = "llvm.mlir.constant"() <{value = 100 : i32}> : () -> i32 loc("<stdin>":10:10)
    %4 = "llvm.mlir.constant"() <{value = 10 : i32}> : () -> i32 loc("<stdin>":11:10)
    %5 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32 loc("<stdin>":12:10)
    %6 = "llvm.mlir.constant"() <{value = 100 : i64}> : () -> i64 loc("<stdin>":13:10)
    %7 = "llvm.alloca"(%6) <{elem_type = i32}> : (i64) -> !llvm.ptr loc("<stdin>":14:10)
    %8 = "llvm.alloca"(%6) <{elem_type = i32}> : (i64) -> !llvm.ptr loc("<stdin>":15:10)
    %9 = "llvm.alloca"(%6) <{elem_type = i32}> : (i64) -> !llvm.ptr loc("<stdin>":16:10)
    %10 = "llvm.alloca"(%1) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr loc("<stdin>":17:11)
    "omp.wsloop"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0>, ordered = 0 : i64}> ({
      "omp.simd"(%10, %2, %10) <{linear_modifiers = [unit], linear_var_types = [i32], operandSegmentSizes = array<i32: 0, 0, 1, 1, 0, 1, 0>, private_syms = [@i_private_i32]}> ({
      ^bb0(%arg0: !llvm.ptr loc("<stdin>":20:12)):
        "omp.loop_nest"(%2, %3, %2) <{loop_inclusive}> ({
        ^bb0(%arg1: i32 loc("<stdin>":22:14)):
          "llvm.store"(%arg1, %arg0) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":23:11)
          %11 = "llvm.load"(%arg0) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":24:17)
          %12 = "llvm.sext"(%11) : (i32) -> i64 loc("<stdin>":25:17)
          %13 = "llvm.sub"(%12, %1) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64 loc("<stdin>":26:17)
          %14 = "llvm.getelementptr"(%8, %13) <{elem_type = i32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr loc("<stdin>":27:17)
          %15 = "llvm.load"(%14) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":28:17)
          %16 = "llvm.mul"(%15, %4) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32 loc("<stdin>":29:17)
          %17 = "llvm.getelementptr"(%7, %13) <{elem_type = i32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr loc("<stdin>":30:17)
          "llvm.store"(%16, %17) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":31:11)
          "omp.ordered.region"() <{par_level_simd}> ({
            %25 = "llvm.load"(%arg0) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":33:19)
            %26 = "llvm.sext"(%25) : (i32) -> i64 loc("<stdin>":34:19)
            %27 = "llvm.sub"(%26, %1) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64 loc("<stdin>":35:19)
            %28 = "llvm.getelementptr"(%7, %27) <{elem_type = i32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr loc("<stdin>":36:19)
            %29 = "llvm.load"(%28) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":37:19)
            "omp.terminator"() : () -> () loc("<stdin>":38:13)
          }) : () -> () loc("<stdin>":32:11)
          %18 = "llvm.load"(%arg0) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":40:17)
          %19 = "llvm.sext"(%18) : (i32) -> i64 loc("<stdin>":41:17)
          %20 = "llvm.sub"(%19, %1) <{overflowFlags = 0 : i32}> : (i64, i64) -> i64 loc("<stdin>":42:17)
          %21 = "llvm.getelementptr"(%7, %20) <{elem_type = i32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr loc("<stdin>":43:17)
          %22 = "llvm.load"(%21) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":44:17)
          %23 = "llvm.mul"(%22, %5) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32 loc("<stdin>":45:17)
          %24 = "llvm.getelementptr"(%9, %20) <{elem_type = i32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr loc("<stdin>":46:17)
          "llvm.store"(%23, %24) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":47:11)
          "omp.yield"() : () -> () loc("<stdin>":48:11)
        }) : (i32, i32, i32) -> () loc("<stdin>":21:9)
      }) {omp.composite} : (!llvm.ptr, i32, !llvm.ptr) -> () loc("<stdin>":19:7)
    }) {omp.composite} : () -> () loc("<stdin>":18:5)
    "llvm.return"() : () -> () loc("<stdin>":52:5)
  }) : () -> () loc("<stdin>":6:3)
}) : () -> () loc("<stdin>":1:1)
