"builtin.module"() ({
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = private}>, sym_name = "_QFsimd_reductionEi_private_i32", type = i32}> ({
  }, {
  }, {
  }) : () -> ()
  "omp.declare_reduction"() <{sym_name = "add_reduction_f32", type = f32}> ({
  }, {
  ^bb0(%arg7: f32):
    %13 = "llvm.mlir.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "omp.yield"(%13) : (f32) -> ()
  }, {
  ^bb0(%arg5: f32, %arg6: f32):
    %12 = "llvm.fadd"(%arg5, %arg6) <{fastmathFlags = #llvm.fastmath<contract>}> : (f32, f32) -> f32
    "omp.yield"(%12) : (f32) -> ()
  }, {
  }, {
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "a", llvm.nocapture}, {fir.bindc_name = "sum", llvm.nocapture}], function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "_QPsimd_reduction", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %2 = "llvm.mlir.constant"() <{value = 1024 : i32}> : () -> i32
    %3 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %4 = "llvm.alloca"(%3) <{elem_type = i32}> {bindc_name = "i"} : (i64) -> !llvm.ptr
    "llvm.store"(%0, %arg1) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
    "omp.simd"(%4, %arg1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 1, 1>, private_syms = [@_QFsimd_reductionEi_private_i32], reduction_byref = array<i1: false>, reduction_syms = [@add_reduction_f32]}> ({
    ^bb0(%arg2: !llvm.ptr, %arg3: !llvm.ptr):
      "omp.loop_nest"(%1, %2, %1) <{loop_inclusive}> ({
      ^bb0(%arg4: i32):
        "llvm.store"(%arg4, %arg2) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
        %5 = "llvm.load"(%arg3) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
        %6 = "llvm.load"(%arg2) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
        %7 = "llvm.sext"(%6) : (i32) -> i64
        %8 = "llvm.sub"(%7, %3) <{overflowFlags = 1 : i32}> : (i64, i64) -> i64
        %9 = "llvm.getelementptr"(%arg0, %8) <{elem_type = f32, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i64) -> !llvm.ptr
        %10 = "llvm.load"(%9) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
        %11 = "llvm.fadd"(%5, %10) <{fastmathFlags = #llvm.fastmath<contract>}> : (f32, f32) -> f32
        "llvm.store"(%11, %arg3) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
        "omp.yield"() : () -> ()
      }) : (i32, i32, i32) -> ()
    }) : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

