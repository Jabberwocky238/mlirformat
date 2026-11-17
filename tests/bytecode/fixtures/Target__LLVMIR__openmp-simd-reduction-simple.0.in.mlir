"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFsimd_reductionEi_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> () loc("<stdin>":2:3)
  "omp.declare_reduction"() <{sym_name = "add_reduction_f32", type = f32}> ({
  }, {
  ^bb0(%arg7: f32 loc("<stdin>":8:8)):
    %13 = "llvm.mlir.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":9:11)
    "omp.yield"(%13) : (f32) -> () loc("<stdin>":10:5)
  }, {
  ^bb0(%arg5: f32 loc("<stdin>":12:8), %arg6: f32 loc("<stdin>":12:20)):
    %12 = "llvm.fadd"(%arg5, %arg6) <{fastmathFlags = #llvm.fastmath<contract>}> : (f32, f32) -> f32 loc("<stdin>":13:11)
    "omp.yield"(%12) : (f32) -> () loc("<stdin>":14:5)
  }, {
  }, {
  }, {
  }) : () -> () loc("<stdin>":6:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "a", llvm.nocapture}, {fir.bindc_name = "sum", llvm.nocapture}], function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "_QPsimd_reduction", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":20:8), %arg1: !llvm.ptr loc("<stdin>":20:26)):
    %0 = "llvm.mlir.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":21:10)
    %1 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":22:10)
    %2 = "llvm.mlir.constant"() <{value = 1024 : i32}> : () -> i32 loc("<stdin>":23:10)
    %3 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":24:10)
    %4 = "llvm.alloca"(%3) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr loc("<stdin>":25:10)
    "llvm.store"(%0, %arg1) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> () loc("<stdin>":26:5)
    "omp.simd"(%4, %arg1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 1>, private_syms = [@_QFsimd_reductionEi_private_i32], reduction_byref = array<i1: false>, reduction_syms = [@add_reduction_f32]}> ({
    ^bb0(%arg2: !llvm.ptr loc("<stdin>":28:10), %arg3: !llvm.ptr loc("<stdin>":28:28)):
      "omp.loop_nest"(%1, %2, %1) <{loop_inclusive}> ({
      ^bb0(%arg4: i32 loc("<stdin>":30:12)):
        "llvm.store"(%arg4, %arg2) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":31:9)
        %5 = "llvm.load"(%arg3) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32 loc("<stdin>":32:14)
        %6 = "llvm.load"(%arg2) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":33:14)
        %7 = "llvm.sext"(%6) : (i32) -> i64 loc("<stdin>":34:14)
        %8 = "llvm.sub"(%7, %3) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64 loc("<stdin>":35:14)
        %9 = "llvm.getelementptr"(%arg0, %8) <{elem_type = f32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr loc("<stdin>":36:14)
        %10 = "llvm.load"(%9) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32 loc("<stdin>":37:15)
        %11 = "llvm.fadd"(%5, %10) <{fastmathFlags = #llvm.fastmath<contract>}> : (f32, f32) -> f32 loc("<stdin>":38:15)
        "llvm.store"(%11, %arg3) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> () loc("<stdin>":39:9)
        "omp.yield"() : () -> () loc("<stdin>":40:9)
      }) : (i32, i32, i32) -> () loc("<stdin>":29:7)
    }) : (!llvm.ptr, !llvm.ptr) -> () loc("<stdin>":27:5)
    "llvm.return"() : () -> () loc("<stdin>":43:5)
  }) : () -> () loc("<stdin>":19:3)
}) : () -> () loc("<stdin>":1:1)
